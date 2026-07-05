import 'package:dio/dio.dart';

import 'api_service.dart';

class HealthCardService {
  HealthCardService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  Future<Map<String, dynamic>> getHealthCard() async {
    final resp = await _dio.get<Map<String, dynamic>>('/patient/health-card');
    return resp.data ?? {};
  }
}
