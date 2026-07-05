import 'package:dio/dio.dart';

import 'api_service.dart';

class FamilyService {
  FamilyService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  Future<List<Map<String, dynamic>>> listFamilyMembers() async {
    final resp = await _dio.get<List<dynamic>>('/patient/family-members');
    return (resp.data ?? [])
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
  }

  Future<Map<String, dynamic>> addFamilyMember({
    required String patientId,
    required DateTime dob,
    required String relationship,
  }) async {
    final resp = await _dio.post<Map<String, dynamic>>(
      '/patient/family-members',
      data: {
        'patientId': patientId,
        'dob': dob.toIso8601String().split('T').first,
        'relationship': relationship,
      },
    );
    return resp.data ?? {};
  }

  Future<void> removeFamilyMember(String linkId) async {
    await _dio.delete<void>('/patient/family-members/$linkId');
  }
}
