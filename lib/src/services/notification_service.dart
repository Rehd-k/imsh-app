import 'package:dio/dio.dart';

import 'api_service.dart';

class NotificationService {
  NotificationService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  Future<List<Map<String, dynamic>>> listNotifications({
    int page = 1,
    int limit = 20,
  }) async {
    final resp = await _dio.get<List<dynamic>>(
      '/patient/notifications',
      queryParameters: {'page': page, 'limit': limit},
    );
    return (resp.data ?? [])
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
  }

  Future<void> markAsRead(String id) async {
    await _dio.patch<void>('/patient/notifications/$id/read');
  }
}
