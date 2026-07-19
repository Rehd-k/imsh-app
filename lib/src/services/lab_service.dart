import 'package:dio/dio.dart';

import '../models/lab_result_model.dart';
import 'api_service.dart';

class LabService {
  LabService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  Future<LabResultListResponse> listLabReports({
    int page = 1,
    int limit = 20,
    String? forPatientId,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/lab-reports',
      queryParameters: {
        'page': page,
        'limit': limit,
        if (forPatientId != null) 'forPatientId': forPatientId,
      },
    );
    return LabResultListResponse.fromJson(resp.data ?? {});
  }

  Future<LabResultDetail> getLabReport(
    String id, {
    String? forPatientId,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/lab-reports/$id',
      queryParameters: {
        if (forPatientId != null) 'forPatientId': forPatientId,
      },
    );
    return LabResultDetail.fromJson(resp.data ?? {});
  }
}
