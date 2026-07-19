import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:imsh/app_router.gr.dart';

import '../errors/app_exception.dart';
import '../storage/token_storage.dart';
import '../../services/navigation_service.dart';

/// Optional hooks for Riverpod / UI to sync when session is forced to login or pending.
class AuthSessionHooks {
  AuthSessionHooks._();

  static void Function()? onDeviceRevoked;
  static void Function()? onDevicePendingApproval;
}

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final appEx = _mapError(err);
    _handleSessionCodes(appEx);
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

  void _handleSessionCodes(AppException appEx) {
    if (appEx is UnauthorizedException && appEx.isDeviceRevoked) {
      // Fire-and-forget; do not block the error path.
      Future<void>(() async {
        try {
          await TokenStorage.clearAll();
          AuthSessionHooks.onDeviceRevoked?.call();
          NavigationService.router.replaceAll([const LoginRoute()]);
        } catch (e, st) {
          debugPrint('DEVICE_REVOKED handling failed: $e\n$st');
        }
      });
      return;
    }
    if (appEx is ForbiddenException && appEx.isDevicePendingApproval) {
      Future<void>(() async {
        try {
          AuthSessionHooks.onDevicePendingApproval?.call();
          NavigationService.router.replaceAll([const DevicePendingRoute()]);
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
