import 'package:dio/dio.dart';

import '../models/health_content_model.dart';
import 'api_service.dart';

class HealthContentService {
  HealthContentService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  Future<HealthContentListResponse> listCampaigns() {
    return _listAll('/patient/health/campaigns');
  }

  Future<HealthContentListResponse> listNews() {
    return _listAll('/patient/health/news');
  }

  Future<HealthContentListResponse> _listAll(String path) async {
    const pageSize = 100;
    final first = await _fetchPage(path, 0, pageSize);
    if (first.data.length >= first.total || first.data.isEmpty) return first;

    final items = [...first.data];
    var skip = first.data.length;
    while (items.length < first.total && items.length < 500) {
      final page = await _fetchPage(path, skip, pageSize);
      if (page.data.isEmpty) break;
      items.addAll(page.data);
      skip += page.data.length;
      if (page.data.length < pageSize) break;
    }
    return first.copyWith(data: items, skip: 0, take: items.length);
  }

  Future<HealthContentListResponse> _fetchPage(
    String path,
    int skip,
    int take,
  ) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      path,
      queryParameters: {'skip': skip, 'take': take},
    );
    return HealthContentListResponse.fromJson(resp.data ?? {});
  }
}
