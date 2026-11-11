import 'package:dio/dio.dart';

import '../config/api_config.dart';
import '../models/emergency_request_model.dart';
import 'api_service.dart';

class EmergencyService {
  EmergencyService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  static final Options _mediaUploadOptions = Options(
    contentType: Headers.multipartFormDataContentType,
    connectTimeout: kApiUploadConnectTimeout,
    sendTimeout: kApiUploadSendTimeout,
    receiveTimeout: kApiUploadReceiveTimeout,
  );

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
    CreateEmergencyRequestPayload payload, {
    ProgressCallback? onSendProgress,
  }) async {
    final formData = await _buildFormData(payload, includeGuest: false);
    final resp = await _dio.post<Map<String, dynamic>>(
      '/patient/emergency-requests',
      data: formData,
      options: _mediaUploadOptions,
      onSendProgress: onSendProgress,
    );
    return EmergencyRequest.fromJson(resp.data ?? {});
  }

  Future<EmergencyRequest> createGuestRequest(
    CreateEmergencyRequestPayload payload, {
    ProgressCallback? onSendProgress,
  }) async {
    final formData = await _buildFormData(payload, includeGuest: true);
    final resp = await _dio.post<Map<String, dynamic>>(
      '/public/emergency-requests',
      data: formData,
      options: _mediaUploadOptions,
      onSendProgress: onSendProgress,
    );
    return EmergencyRequest.fromJson(resp.data ?? {});
  }

  Future<FormData> _buildFormData(
    CreateEmergencyRequestPayload payload, {
    required bool includeGuest,
  }) async {
    final map = <String, dynamic>{
      'latitude': payload.latitude,
      'longitude': payload.longitude,
      if (payload.accuracyMeters != null)
        'accuracyMeters': payload.accuracyMeters,
      if (payload.addressText != null && payload.addressText!.trim().isNotEmpty)
        'addressText': payload.addressText!.trim(),
      if (payload.description != null && payload.description!.trim().isNotEmpty)
        'description': payload.description!.trim(),
      if (includeGuest &&
          payload.guestName != null &&
          payload.guestName!.trim().isNotEmpty)
        'guestName': payload.guestName!.trim(),
      if (includeGuest &&
          payload.guestPhone != null &&
          payload.guestPhone!.trim().isNotEmpty)
        'guestPhone': payload.guestPhone!.trim(),
    };

    if (payload.voicePath != null && payload.voicePath!.isNotEmpty) {
      map['voice'] = await _multipartFromPath(
        payload.voicePath!,
        fallbackName: 'voice.m4a',
        fallbackMime: DioMediaType('audio', 'mp4'),
      );
    }
    if (payload.videoPath != null && payload.videoPath!.isNotEmpty) {
      map['video'] = await _multipartFromPath(
        payload.videoPath!,
        fallbackName: 'video.mp4',
        fallbackMime: DioMediaType('video', 'mp4'),
      );
    }

    return FormData.fromMap(map);
  }

  /// Prefer the on-disk extension so Android/iOS camera output (mp4/mov/3gp)
  /// keeps a MIME the backend whitelist accepts — never bare octet-stream.
  Future<MultipartFile> _multipartFromPath(
    String path, {
    required String fallbackName,
    required DioMediaType fallbackMime,
  }) async {
    final ext = _extensionOf(path);
    final filename = ext.isEmpty ? fallbackName : 'media$ext';
    final mime = _mimeForExtension(ext) ?? fallbackMime;
    return MultipartFile.fromFile(
      path,
      filename: filename,
      contentType: mime,
    );
  }

  String _extensionOf(String path) {
    final name = path.replaceAll('\\', '/').split('/').last;
    final dot = name.lastIndexOf('.');
    if (dot <= 0 || dot == name.length - 1) return '';
    return name.substring(dot).toLowerCase();
  }

  DioMediaType? _mimeForExtension(String ext) {
    return switch (ext) {
      '.m4a' || '.aac' => DioMediaType('audio', 'mp4'),
      '.mp3' => DioMediaType('audio', 'mpeg'),
      '.wav' => DioMediaType('audio', 'wav'),
      '.webm' => DioMediaType('video', 'webm'),
      '.mp4' => DioMediaType('video', 'mp4'),
      '.mov' => DioMediaType('video', 'quicktime'),
      '.3gp' || '.3gpp' => DioMediaType('video', '3gpp'),
      _ => null,
    };
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
