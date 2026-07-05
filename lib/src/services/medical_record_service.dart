import 'package:dio/dio.dart';

import '../models/medical_records_dashboard_model.dart';
import '../models/medical_record_model.dart';
import 'api_service.dart';

class MedicalRecordService {
  MedicalRecordService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  Future<EncounterListResponse> listMedicalRecords({
    int page = 1,
    int limit = 20,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/medical-records',
      queryParameters: {'page': page, 'limit': limit},
    );
    return EncounterListResponse.fromJson(resp.data ?? {});
  }

  Future<EncounterDetail> getEncounter(String id) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/medical-records/$id',
    );
    return EncounterDetail.fromJson(resp.data ?? {});
  }

  Future<MedicalRecordsDashboardResponse> getDashboard() async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/medical-records/dashboard',
    );
    return MedicalRecordsDashboardResponse.fromJson(resp.data ?? {});
  }
}
