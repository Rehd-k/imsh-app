import 'package:dio/dio.dart';

import '../models/patient_model.dart';
import 'api_service.dart';

class ProfileService {
  ProfileService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  Future<Patient> getProfile() async {
    final resp = await _dio.get<Map<String, dynamic>>('/patient/profile');
    final data = resp.data;
    if (data == null) {
      throw UnimplementedError('Patient profile API not yet available.');
    }
    return Patient.fromJson(data);
  }

  Future<Patient> updateProfile(Map<String, dynamic> payload) async {
    final resp = await _dio.put<Map<String, dynamic>>(
      '/patient/profile',
      data: payload,
    );
    final data = resp.data;
    if (data == null) {
      throw UnimplementedError('Patient profile API not yet available.');
    }
    return Patient.fromJson(data);
  }

  Future<Patient> uploadProfilePhoto(String filePath) async {
    final formData = FormData.fromMap({
      'photo': await MultipartFile.fromFile(
        filePath,
        filename: 'profile-photo.jpg',
      ),
    });
    final resp = await _dio.post<Map<String, dynamic>>(
      '/patient/profile/photo',
      data: formData,
    );
    final data = resp.data;
    if (data == null) {
      throw UnimplementedError('Patient profile photo API not yet available.');
    }
    return Patient.fromJson(data);
  }

  Future<Patient> deleteProfilePhoto() async {
    final resp = await _dio.delete<Map<String, dynamic>>(
      '/patient/profile/photo',
    );
    final data = resp.data;
    if (data == null) {
      throw UnimplementedError('Patient profile photo API not yet available.');
    }
    return Patient.fromJson(data);
  }
}
