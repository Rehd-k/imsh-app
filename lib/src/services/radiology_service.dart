import 'package:dio/dio.dart';

import '../models/radiology_report_model.dart';
import 'api_service.dart';

class RadiologyService {
  RadiologyService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  Future<RadiologyReportListResponse> listRadiologyReports({
    int page = 1,
    int limit = 20,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/radiology-reports',
      queryParameters: {'page': page, 'limit': limit},
    );
    return RadiologyReportListResponse.fromJson(resp.data ?? {});
  }

  Future<RadiologyReportDetail> getRadiologyReport(String id) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/radiology-reports/$id',
    );
    return RadiologyReportDetail.fromJson(resp.data ?? {});
  }
}
