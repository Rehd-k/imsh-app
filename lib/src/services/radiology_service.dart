import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../models/radiology_report_model.dart';
import 'api_service.dart';

class RadiologyService {
  RadiologyService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  static final _imageFileBytesOptions = Options(
    responseType: ResponseType.bytes,
    headers: {'Accept': '*/*'},
  );

  Future<RadiologyReportListResponse> listRadiologyReports({
    int page = 1,
    int limit = 20,
    String? forPatientId,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/radiology-reports',
      queryParameters: {
        'page': page,
        'limit': limit,
        if (forPatientId != null) 'forPatientId': forPatientId,
      },
    );
    return RadiologyReportListResponse.fromJson(resp.data ?? {});
  }

  Future<RadiologyReportDetail> getRadiologyReport(
    String id, {
    String? forPatientId,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/radiology-reports/$id',
      queryParameters: {
        if (forPatientId != null) 'forPatientId': forPatientId,
      },
    );
    return RadiologyReportDetail.fromJson(resp.data ?? {});
  }

  Future<Uint8List> getRadiologyImageBytes(
    String reportId,
    String imageId,
  ) async {
    final resp = await _dio.get<List<int>>(
      '/patient/radiology-reports/$reportId/images/$imageId/file',
      options: _imageFileBytesOptions,
    );
    return Uint8List.fromList(resp.data ?? const []);
  }
}
