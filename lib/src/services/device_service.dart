import 'package:dio/dio.dart';

import '../models/device_model.dart';
import 'api_service.dart';

class DeviceService {
  DeviceService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  Future<PatientDevice> getStatus() async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/devices/status',
    );
    final data = resp.data ?? {};
    if (data['device'] is Map) {
      return PatientDevice.fromJson(
        Map<String, dynamic>.from(data['device'] as Map),
      );
    }
    return PatientDevice.fromJson(data);
  }

  Future<List<PatientDevice>> listDevices() async {
    final resp = await _dio.get<dynamic>('/patient/devices');
    final raw = resp.data;
    final list = _extractList(raw);
    return list
        .map((e) => PatientDevice.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  Future<void> updateFcmToken({
    required String token,
    String? platform,
  }) async {
    await _dio.patch<void>(
      '/patient/devices/current/fcm-token',
      data: {
        'token': token,
        if (platform != null) 'platform': platform,
      },
    );
  }

  Future<void> deleteDevice(String id) async {
    await _dio.delete<void>('/patient/devices/$id');
  }

  List<dynamic> _extractList(dynamic raw) {
    if (raw is List) return raw;
    if (raw is Map) {
      final data = raw['data'] ?? raw['devices'];
      if (data is List) return data;
    }
    return const [];
  }
}
