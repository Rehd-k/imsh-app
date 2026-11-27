import 'package:dio/dio.dart';

import '../errors/app_exception.dart';
import '../storage/token_storage.dart';

const authRetriedExtra = 'authRetried';
const skipAuthRefreshExtra = 'skipAuthRefresh';

const _refreshPath = '/patient-auth/refresh';

enum RefreshOutcome { refreshed, revoked, failed }

/// One in-flight refresh shared by startup restore and expired-token retries.
class SessionRefresh {
  SessionRefresh._();

  static Dio? _dio;
  static Future<RefreshOutcome>? _ongoing;

  static void bind(Dio dio) => _dio = dio;

  static Future<RefreshOutcome> tryRefresh() {
    final current = _ongoing;
    if (current != null) return current;
    final run = _refresh();
    _ongoing = run;
    return run.whenComplete(() {
      if (identical(_ongoing, run)) _ongoing = null;
    });
  }

  static Future<RefreshOutcome> _refresh() async {
    final dio = _dio;
    if (dio == null) return RefreshOutcome.failed;
    final refreshToken = await TokenStorage.getRefreshToken();
    if (refreshToken == null || refreshToken.isEmpty) {
      return RefreshOutcome.failed;
    }
    try {
      final deviceKey = await TokenStorage.getOrCreateDeviceKey();
      final resp = await dio.post<Map<String, dynamic>>(
        _refreshPath,
        data: {
          'refreshToken': refreshToken,
          'deviceKey': deviceKey,
        },
        options: Options(extra: {skipAuthRefreshExtra: true}),
      );
      final data = resp.data;
      if (data == null) return RefreshOutcome.failed;
      final access = data['accessToken'];
      final refresh = data['refreshToken'];
      if (access is! String ||
          access.isEmpty ||
          refresh is! String ||
          refresh.isEmpty) {
        return RefreshOutcome.failed;
      }
      await TokenStorage.saveRefreshToken(refresh);
      await TokenStorage.saveAccessToken(access);
      return RefreshOutcome.refreshed;
    } on DioException catch (e) {
      if (_isDeviceRevoked(e)) return RefreshOutcome.revoked;
      return RefreshOutcome.failed;
    } catch (_) {
      return RefreshOutcome.failed;
    }
  }

  static bool _isDeviceRevoked(DioException error) {
    final data = error.response?.data;
    if (data is Map && data['code'] == 'DEVICE_REVOKED') return true;
    final inner = error.error;
    return inner is UnauthorizedException && inner.isDeviceRevoked;
  }
}

/// Login, refresh, and activation failures must not start another refresh.
bool isCredentialAuthPath(String path) {
  return path.contains('/patient-auth/login') ||
      path.contains('/patient-auth/refresh') ||
      path.contains('/patient-auth/activate') ||
      path.contains('/patient-auth/forgot-password') ||
      path.contains('/patient-auth/device-lookup') ||
      path.contains('/patient-auth/release-device');
}

bool shouldAttemptTokenRefresh({
  required int? statusCode,
  required String path,
  required bool alreadyRetried,
  required bool skipAuthRefresh,
  String? errorCode,
}) {
  if (statusCode != 401) return false;
  if (alreadyRetried || skipAuthRefresh) return false;
  if (errorCode == 'DEVICE_REVOKED') return false;
  return !isCredentialAuthPath(path);
}
