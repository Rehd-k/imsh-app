import 'package:dio/dio.dart';

import '../models/theatre_schedule_model.dart';
import 'api_service.dart';

class TheatreService {
  TheatreService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  Future<TheatreSchedulesResponse> listSchedules({
    String? forPatientId,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/theatre/schedules',
      queryParameters: {
        if (forPatientId != null) 'forPatientId': forPatientId,
      },
    );
    return TheatreSchedulesResponse.fromJson(resp.data ?? {});
  }
}
