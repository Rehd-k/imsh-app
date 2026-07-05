import 'package:dio/dio.dart';

import '../core/errors/app_exception.dart';
import '../core/storage/token_storage.dart';
import '../models/patient_model.dart';
import 'api_service.dart';

class PatientAuthService {
  PatientAuthService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  static const loginPath = '/patient-auth/login';
  static const mePath = '/patient-auth/me';
  static const logoutPath = '/patient-auth/logout';

  Future<PatientLoginResponse> login({
    required String patientId,
    required DateTime dob,
  }) async {
    final resp = await _dio.post<Map<String, dynamic>>(
      loginPath,
      data: {
        'patientId': patientId.trim(),
        'dob': dob.toIso8601String().split('T').first,
      },
    );
    final data = resp.data;
    if (data == null) {
      throw const UnknownException('Login response was empty.');
    }
    final response = PatientLoginResponse.fromJson(data);
    await TokenStorage.saveAccessToken(response.accessToken);
    return response;
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

  Future<bool> isAuthenticated() => TokenStorage.hasToken();
}
