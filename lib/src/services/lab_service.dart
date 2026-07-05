import 'package:dio/dio.dart';

import '../models/lab_result_model.dart';
import 'api_service.dart';

class LabService {
  LabService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  Future<LabResultListResponse> listLabReports({
    int page = 1,
    int limit = 20,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/lab-reports',
      queryParameters: {'page': page, 'limit': limit},
    );
    return LabResultListResponse.fromJson(resp.data ?? {});
  }

  Future<LabResultDetail> getLabReport(String id) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/lab-reports/$id',
    );
    return LabResultDetail.fromJson(resp.data ?? {});
  }
}
