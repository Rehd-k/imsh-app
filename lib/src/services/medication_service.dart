import 'package:dio/dio.dart';

import '../models/medication_model.dart';
import 'api_service.dart';

class MedicationService {
  MedicationService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  Future<MedicationDashboardResponse> getDashboard() async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/medications/dashboard',
    );
    return MedicationDashboardResponse.fromJson(resp.data ?? {});
  }

  Future<MarkDoseTakenResponse> markDoseTaken(
    String doseId, {
    DateTime? takenAt,
  }) async {
    final resp = await _dio.post<Map<String, dynamic>>(
      '/patient/medications/doses/$doseId/taken',
      data: takenAt != null
          ? {'takenAt': takenAt.toUtc().toIso8601String()}
          : null,
    );
    return MarkDoseTakenResponse.fromJson(resp.data ?? {});
  }

  Future<PrescriptionHistoryListResponse> listPrescriptionHistory({
    int page = 1,
    int limit = 20,
    List<PrescriptionHistoryStatus>? statuses,
  }) async {
    final statusParam = statuses
        ?.map(
          (s) => switch (s) {
            PrescriptionHistoryStatus.completed => 'COMPLETED',
            PrescriptionHistoryStatus.cancelled => 'CANCELLED',
          },
        )
        .join(',');
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/medications/prescriptions',
      queryParameters: {
        'page': page,
        'limit': limit,
        if (statusParam != null) 'status': statusParam,
      },
    );
    return PrescriptionHistoryListResponse.fromJson(resp.data ?? {});
  }

  Future<RefillRequestResponse> requestRefill(
    String prescriptionId, {
    String? notes,
  }) async {
    final resp = await _dio.post<Map<String, dynamic>>(
      '/patient/medications/prescriptions/$prescriptionId/refill-request',
      data: notes != null ? {'notes': notes} : null,
    );
    return RefillRequestResponse.fromJson(resp.data ?? {});
  }
}
