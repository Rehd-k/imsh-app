import 'package:dio/dio.dart';

import '../models/feedback_model.dart';
import 'api_service.dart';

class FeedbackService {
  FeedbackService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  Future<PatientFeedbackListResponse> listFeedback({
    PatientFeedbackKind? kind,
    PatientFeedbackStatus? status,
    int page = 1,
    int limit = 20,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/feedback',
      queryParameters: {
        if (kind != null) 'kind': kind.apiValue,
        if (status != null) 'status': status.apiValue,
        'page': page,
        'limit': limit,
      },
    );
    return PatientFeedbackListResponse.fromJson(resp.data ?? {});
  }

  Future<PatientFeedback> getFeedback(String id) async {
    final resp = await _dio.get<Map<String, dynamic>>('/patient/feedback/$id');
    return PatientFeedback.fromJson(resp.data ?? {});
  }

  Future<PatientFeedback> createFeedback(CreateFeedbackRequest request) async {
    final resp = await _dio.post<Map<String, dynamic>>(
      '/patient/feedback',
      data: {
        'kind': request.kind.apiValue,
        'subject': request.subject,
        'message': request.message,
        if (request.departmentId != null) 'departmentId': request.departmentId,
      },
    );
    return PatientFeedback.fromJson(resp.data ?? {});
  }

  Future<PatientFeedback> updateFeedback(
    String id,
    UpdateFeedbackRequest request,
  ) async {
    final resp = await _dio.patch<Map<String, dynamic>>(
      '/patient/feedback/$id',
      data: {
        if (request.kind != null) 'kind': request.kind!.apiValue,
        if (request.subject != null) 'subject': request.subject,
        if (request.message != null) 'message': request.message,
        if (request.departmentId != null) 'departmentId': request.departmentId,
      },
    );
    return PatientFeedback.fromJson(resp.data ?? {});
  }

  Future<CloseFeedbackResponse> closeFeedback(String id) async {
    final resp = await _dio.delete<Map<String, dynamic>>(
      '/patient/feedback/$id',
    );
    return CloseFeedbackResponse.fromJson(resp.data ?? {});
  }
}
