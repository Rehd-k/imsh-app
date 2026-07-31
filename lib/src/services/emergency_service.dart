import 'package:dio/dio.dart';

import '../models/emergency_request_model.dart';
import 'api_service.dart';

class EmergencyService {
  EmergencyService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  Future<EmergencyRequestListResponse> listRequests({
    EmergencyRequestStatus? status,
    int page = 1,
    int limit = 20,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/emergency-requests',
      queryParameters: {
        if (status != null) 'status': status.apiValue,
        'page': page,
        'limit': limit,
      },
    );
    return EmergencyRequestListResponse.fromJson(resp.data ?? {});
  }

  Future<EmergencyRequest> getRequest(String id) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/emergency-requests/$id',
    );
    return EmergencyRequest.fromJson(resp.data ?? {});
  }

  Future<EmergencyRequest> createRequest(
    CreateEmergencyRequestPayload payload,
  ) async {
    final map = <String, dynamic>{
      'latitude': payload.latitude,
      'longitude': payload.longitude,
      if (payload.accuracyMeters != null)
        'accuracyMeters': payload.accuracyMeters,
      if (payload.addressText != null && payload.addressText!.trim().isNotEmpty)
        'addressText': payload.addressText!.trim(),
      if (payload.description != null && payload.description!.trim().isNotEmpty)
        'description': payload.description!.trim(),
    };

    if (payload.voicePath != null && payload.voicePath!.isNotEmpty) {
      map['voice'] = await MultipartFile.fromFile(
        payload.voicePath!,
        filename: 'voice.m4a',
      );
    }
    if (payload.videoPath != null && payload.videoPath!.isNotEmpty) {
      map['video'] = await MultipartFile.fromFile(
        payload.videoPath!,
        filename: 'video.mp4',
      );
    }

    final formData = FormData.fromMap(map);
    final resp = await _dio.post<Map<String, dynamic>>(
      '/patient/emergency-requests',
      data: formData,
    );
    return EmergencyRequest.fromJson(resp.data ?? {});
  }

  Future<EmergencyRequest> cancelRequest(String id) async {
    final resp = await _dio.patch<Map<String, dynamic>>(
      '/patient/emergency-requests/$id/cancel',
    );
    return EmergencyRequest.fromJson(resp.data ?? {});
  }

  /// Authenticated media path for streaming voice/video.
  String mediaPath(String id, String kind) =>
      '/patient/emergency-requests/$id/media/$kind';
}
