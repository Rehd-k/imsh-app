import 'package:dio/dio.dart';

import '../models/health_content_model.dart';
import 'api_service.dart';

class HealthContentService {
  HealthContentService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  Future<HealthContentListResponse> listCampaigns({
    int skip = 0,
    int take = 20,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/health/campaigns',
      queryParameters: {'skip': skip, 'take': take},
    );
    return HealthContentListResponse.fromJson(resp.data ?? {});
  }

  Future<HealthContentListResponse> listNews({
    int skip = 0,
    int take = 20,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/health/news',
      queryParameters: {'skip': skip, 'take': take},
    );
    return HealthContentListResponse.fromJson(resp.data ?? {});
  }
}
