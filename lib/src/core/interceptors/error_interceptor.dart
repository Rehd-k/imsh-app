import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:imsh/app_router.gr.dart';

import '../auth/remembered_phone.dart';
import '../auth/session_refresh.dart';
import '../errors/app_exception.dart';
import '../storage/token_storage.dart';
import '../../services/navigation_service.dart';

/// Optional hooks for Riverpod / UI to sync when session is forced to login or pending.
class AuthSessionHooks {
  AuthSessionHooks._();

  /// Called when the session is cleared due to an invalid/expired token or
  /// revoked device (401). Clears Riverpod auth state.
  static void Function()? onDeviceRevoked;
  static void Function()? onDevicePendingApproval;
}

class ErrorInterceptor extends Interceptor {
  ErrorInterceptor(this._dio);

  final Dio _dio;
  static bool _handlingUnauthorized = false;

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    try {
      final recovered = await _retryWithRefresh(err);
      if (recovered != null) {
        handler.resolve(recovered);
        return;
      }
    } on DioException catch (retryError) {
      final retryEx = _mapError(retryError);
      handler.reject(
        DioException(
          requestOptions: retryError.requestOptions,
          response: retryError.response,
          type: retryError.type,
          error: retryEx,
          message: retryEx.message,
        ),
      );
      return;
    }

    final appEx = _mapError(err);
    _handleSessionCodes(appEx, path: err.requestOptions.path);
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: appEx,
        message: appEx.message,
      ),
    );
  }

  Future<Response<dynamic>?> _retryWithRefresh(DioException err) async {
    final options = err.requestOptions;
    final attempt = shouldAttemptTokenRefresh(
      statusCode: err.response?.statusCode,
      path: options.path,
      alreadyRetried: options.extra[authRetriedExtra] == true,
      skipAuthRefresh: options.extra[skipAuthRefreshExtra] == true,
      errorCode: _extractCode(err.response?.data),
    );
    if (!attempt) return null;

    final outcome = await SessionRefresh.tryRefresh();
    if (outcome == RefreshOutcome.revoked) {
      _handleSessionCodes(
        const UnauthorizedException.withCode(
          'This phone is no longer verified. Request a new code.',
          code: 'DEVICE_REVOKED',
        ),
        path: options.path,
      );
      return null;
    }
    if (outcome != RefreshOutcome.refreshed) return null;

    final access = await TokenStorage.getAccessToken();
    if (access == null || access.isEmpty) return null;
    final next = options.copyWith(
      extra: {...options.extra, authRetriedExtra: true},
      headers: {...options.headers, 'Authorization': 'Bearer $access'},
    );
    try {
      return await _dio.fetch<dynamic>(next);
    } on DioException catch (retryError) {
      if (retryError.response?.statusCode == 401) return null;
      rethrow;
    }
  }

  void _handleSessionCodes(AppException appEx, {String? path}) {
    if (appEx is UnauthorizedException) {
      // Credential and refresh failures are 401 — do not treat them as a dead session
      // while the app is still deciding how to sign in.
      if (path != null && isCredentialAuthPath(path)) {
        return;
      }
      if (_handlingUnauthorized) return;
      _handlingUnauthorized = true;
      // Fire-and-forget; do not block the error path.
      Future<void>(() async {
        try {
          await TokenStorage.clearAll();
          final revoked = appEx.isDeviceRevoked;
          if (revoked) DeviceBinding.clear();
          AuthSessionHooks.onDeviceRevoked?.call();
          if (!NavigationService.isConfigured) return;
          // Always return to login; verification is reached by choice from there.
          NavigationService.router.replaceAll([const LoginRoute()]);
        } catch (e, st) {
          debugPrint('Unauthorized session handling failed: $e\n$st');
        } finally {
          _handlingUnauthorized = false;
        }
      });
      return;
    }
    if (appEx is ForbiddenException && appEx.isDevicePendingApproval) {
      Future<void>(() async {
        try {
          AuthSessionHooks.onDevicePendingApproval?.call();
          if (!NavigationService.isConfigured) return;
          NavigationService.router.replaceAll([const LoginRoute()]);
        } catch (e, st) {
          debugPrint('DEVICE_PENDING_APPROVAL handling failed: $e\n$st');
        }
      });
    }
  }

  AppException _mapError(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        if (err.error is AppException) return err.error as AppException;
        return const NetworkException();

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.transformTimeout:
        return const TimeoutException();

      case DioExceptionType.badResponse:
        return _mapResponse(err.response);

      case DioExceptionType.cancel:
        return const UnknownException('Request was cancelled.');

      case DioExceptionType.badCertificate:
        return const NetworkException('SSL certificate error.');
    }
  }

  AppException _mapResponse(Response? response) {
    if (response == null) return const UnknownException();

    final statusCode = response.statusCode ?? 0;
    final data = response.data;
    final message = _extractMessage(data) ?? _defaultMessage(statusCode);
    final code = _extractCode(data);

    switch (statusCode) {
      case 400:
        final errors = _extractValidationErrors(data);
        return ValidationException(
          message,
          errors: errors,
          code: code,
          statusCode: statusCode,
        );
      case 401:
        return code != null
            ? UnauthorizedException.withCode(message, code: code)
            : UnauthorizedException(message);
      case 403:
        return code != null
            ? ForbiddenException.withCode(message, code: code)
            : ForbiddenException(message);
      case 404:
        return NotFoundException(message);
      case 409:
        return ConflictException(message);
      case 422:
        return ValidationException(message, statusCode: statusCode);
      default:
        return ServerException(message, statusCode: statusCode);
    }
  }

  String? _extractMessage(dynamic data) {
    if (data == null) return null;
    if (data is Map) {
      final msg = data['message'];
      if (msg is String) return msg;
      if (msg is List) return msg.join(', ');
    }
    return null;
  }

  String? _extractCode(dynamic data) {
    if (data is Map) {
      final code = data['code'];
      if (code is String && code.isNotEmpty) return code;
    }
    return null;
  }

  String _defaultMessage(int statusCode) {
    if (statusCode >= 500) return 'Server error. Please try again later.';
    if (statusCode >= 400) return 'Request failed ($statusCode).';
    return 'Unexpected response ($statusCode).';
  }

  Map<String, List<String>>? _extractValidationErrors(dynamic data) {
    if (data is Map && data['message'] is List) {
      final msgs = (data['message'] as List).cast<String>();
      final map = <String, List<String>>{};
      for (final m in msgs) {
        final parts = m.split(' ');
        final field = parts.isNotEmpty ? parts.first : 'general';
        map.putIfAbsent(field, () => []).add(m);
      }
      return map.isNotEmpty ? map : null;
    }
    return null;
  }
}
