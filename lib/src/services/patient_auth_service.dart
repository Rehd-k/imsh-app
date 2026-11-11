import 'package:dio/dio.dart';

import '../core/errors/app_exception.dart';
import '../core/storage/token_storage.dart';
import '../core/utils/device_platform.dart';
import '../models/patient_model.dart';
import 'api_service.dart';

class OtpRequestResult {
  const OtpRequestResult({
    required this.delivery,
    required this.expiresInSeconds,
    this.hasPassword = false,
  });

  final String delivery;
  final int expiresInSeconds;
  final bool hasPassword;

  String get instructions {
    switch (delivery) {
      case 'phone':
        return 'Enter the code sent to your phone.';
      case 'both':
        return 'Enter the code sent to your phone, or collect it from front desk or medical records.';
      default:
        return 'Collect your code from front desk or medical records.';
    }
  }
}

class DeviceVerifyResult {
  const DeviceVerifyResult({
    required this.hasPassword,
    this.setupToken,
    this.deviceProof,
  });

  final bool hasPassword;
  final String? setupToken;
  final String? deviceProof;
}

class DeviceBindingResult {
  const DeviceBindingResult({required this.verified, this.phoneNumber});

  final bool verified;
  final String? phoneNumber;
}

class PatientAuthService {
  PatientAuthService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  static const loginPath = '/patient-auth/login';
  static const mePath = '/patient-auth/me';
  static const logoutPath = '/patient-auth/logout';
  static const refreshPath = '/patient-auth/refresh';
  static const deviceLookupPath = '/patient-auth/device-lookup';
  static const releaseDevicePath = '/patient-auth/release-device';
  static const activateRequestPath = '/patient-auth/activate/request';
  static const activateVerifyPath = '/patient-auth/activate/verify';
  static const activatePasswordPath = '/patient-auth/activate/password';
  static const forgotRequestPath = '/patient-auth/forgot-password/request';
  static const forgotResetPath = '/patient-auth/forgot-password/reset';

  Future<DeviceBindingResult> lookupDevice() async {
    final deviceKey = await TokenStorage.getOrCreateDeviceKey();
    final resp = await _dio.post<Map<String, dynamic>>(
      deviceLookupPath,
      data: {'deviceKey': deviceKey},
    );
    final data = resp.data;
    if (data == null) {
      return const DeviceBindingResult(verified: false);
    }
    final phone = data['phoneNumber']?.toString().trim();
    final verified = data['verified'] == true && phone != null && phone.isNotEmpty;
    return DeviceBindingResult(
      verified: verified,
      phoneNumber: verified ? phone : null,
    );
  }

  Future<void> releaseDevice() async {
    final deviceKey = await TokenStorage.getOrCreateDeviceKey();
    await _dio.post<void>(
      releaseDevicePath,
      data: {'deviceKey': deviceKey},
    );
  }

  Future<PatientLoginResponse> login({
    required String phoneNumber,
    required String password,
    String? fcmToken,
    String? deviceProof,
  }) async {
    final proof = deviceProof?.trim();
    final resp = await _dio.post<Map<String, dynamic>>(
      loginPath,
      data: {
        'phoneNumber': phoneNumber.trim(),
        'password': password,
        if (proof != null && proof.isNotEmpty) 'deviceProof': proof,
        ...await _deviceFields(fcmToken),
      },
    );
    return _storeSession(resp.data);
  }

  Future<OtpRequestResult> requestActivation({
    required String phoneNumber,
    required DateTime dob,
  }) {
    return _requestCode(
      activateRequestPath,
      phoneNumber: phoneNumber,
      dob: dob,
    );
  }

  Future<DeviceVerifyResult> verifyActivation({
    required String phoneNumber,
    required String code,
    String? fcmToken,
  }) async {
    final resp = await _dio.post<Map<String, dynamic>>(
      activateVerifyPath,
      data: {
        'phoneNumber': phoneNumber.trim(),
        'code': code.trim(),
        ...await _deviceFields(fcmToken),
      },
    );
    final data = resp.data;
    if (data == null) {
      throw const UnknownException('Activation response was empty.');
    }
    final hasPassword = data['hasPassword'] == true;
    final token = data['setupToken'];
    final proof = data['deviceProof'];
    if (!hasPassword && (token is! String || token.isEmpty)) {
      throw const UnknownException('Activation response was empty.');
    }
    if (hasPassword && (proof is! String || proof.isEmpty)) {
      throw const UnknownException('Activation response was empty.');
    }
    return DeviceVerifyResult(
      hasPassword: hasPassword,
      setupToken: token is String ? token : null,
      deviceProof: proof is String ? proof : null,
    );
  }

  Future<PatientLoginResponse> completeActivation({
    required String setupToken,
    required String password,
    String? fcmToken,
  }) async {
    final resp = await _dio.post<Map<String, dynamic>>(
      activatePasswordPath,
      data: {
        'setupToken': setupToken,
        'password': password,
        ...await _deviceFields(fcmToken),
      },
    );
    return _storeSession(resp.data);
  }

  Future<OtpRequestResult> requestPasswordReset({
    required String phoneNumber,
    required DateTime dob,
  }) {
    return _requestCode(
      forgotRequestPath,
      phoneNumber: phoneNumber,
      dob: dob,
    );
  }

  Future<PatientLoginResponse> resetPassword({
    required String phoneNumber,
    required String code,
    required String newPassword,
    String? fcmToken,
  }) async {
    final resp = await _dio.post<Map<String, dynamic>>(
      forgotResetPath,
      data: {
        'phoneNumber': phoneNumber.trim(),
        'code': code.trim(),
        'newPassword': newPassword,
        ...await _deviceFields(fcmToken),
      },
    );
    return _storeSession(resp.data);
  }

  Future<void> refresh() async {
    final refreshToken = await TokenStorage.getRefreshToken();
    if (refreshToken == null || refreshToken.isEmpty) {
      throw const UnauthorizedException('Session expired. Please sign in again.');
    }
    final deviceKey = await TokenStorage.getOrCreateDeviceKey();
    final resp = await _dio.post<Map<String, dynamic>>(
      refreshPath,
      data: {
        'refreshToken': refreshToken,
        'deviceKey': deviceKey,
      },
    );
    await _storeSession(resp.data);
  }

  Future<Patient> getMe() async {
    final resp = await _dio.get<Map<String, dynamic>>(mePath);
    final data = resp.data;
    if (data == null) {
      throw const UnknownException('Profile response was empty.');
    }
    final patientJson = data['patient'] ?? data;
    return Patient.fromJson(Map<String, dynamic>.from(patientJson as Map));
  }

  Future<void> logout() async {
    try {
      await _dio.post<void>(logoutPath);
    } finally {
      await TokenStorage.clearAll();
    }
  }

  /// Clears JWT locally without calling logout (e.g. device revoked).
  Future<void> clearLocalSession() => TokenStorage.clearAll();

  Future<bool> isAuthenticated() => TokenStorage.hasToken();

  Future<OtpRequestResult> _requestCode(
    String path, {
    required String phoneNumber,
    required DateTime dob,
  }) async {
    final resp = await _dio.post<Map<String, dynamic>>(
      path,
      data: {
        'phoneNumber': phoneNumber.trim(),
        'dob': _dob(dob),
      },
    );
    final data = resp.data;
    if (data == null) {
      throw const UnknownException('Code request response was empty.');
    }
    return OtpRequestResult(
      delivery: data['delivery'] as String? ?? 'staff',
      expiresInSeconds: (data['expiresInSeconds'] as num?)?.toInt() ?? 600,
      hasPassword: data['hasPassword'] == true,
    );
  }

  Future<Map<String, dynamic>> _deviceFields(String? fcmToken) async {
    return {
      'deviceKey': await TokenStorage.getOrCreateDeviceKey(),
      'platform': patientApiPlatform(),
      'deviceLabel': patientDeviceLabel(),
      if (fcmToken != null && fcmToken.isNotEmpty) 'fcmToken': fcmToken,
    };
  }

  Future<PatientLoginResponse> _storeSession(Map<String, dynamic>? data) async {
    if (data == null) {
      throw const UnknownException('Login response was empty.');
    }
    final response = PatientLoginResponse.fromJson(data);
    await TokenStorage.saveAccessToken(response.accessToken);
    final refresh = data['refreshToken'];
    if (refresh is String && refresh.isNotEmpty) {
      await TokenStorage.saveRefreshToken(refresh);
    }
    return response;
  }

  String _dob(DateTime dob) {
    final month = dob.month.toString().padLeft(2, '0');
    final day = dob.day.toString().padLeft(2, '0');
    return '${dob.year}-$month-$day';
  }
}
