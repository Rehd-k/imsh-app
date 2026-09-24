import 'package:dio/dio.dart';

import '../models/medication_model.dart';
import 'api_service.dart';

class MedicationService {
  MedicationService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  Map<String, dynamic> _subjectParams(String? forPatientId) => {
        if (forPatientId != null && forPatientId.isNotEmpty)
          'forPatientId': forPatientId,
      };

  Future<MedicationDashboardResponse> getDashboard({
    String? forPatientId,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/medications/dashboard',
      queryParameters: _subjectParams(forPatientId),
    );
    return MedicationDashboardResponse.fromJson(resp.data ?? {});
  }

  Future<MedicationCalendarResponse> getCalendar({
    required DateTime from,
    required DateTime to,
    String? forPatientId,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/medications/calendar',
      queryParameters: {
        'from': from.toUtc().toIso8601String(),
        'to': to.toUtc().toIso8601String(),
        ..._subjectParams(forPatientId),
      },
    );
    return MedicationCalendarResponse.fromJson(resp.data ?? {});
  }

  Future<PrescriptionDosesResponse> getPrescriptionDoses(
    String prescriptionId, {
    String? forPatientId,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/medications/prescriptions/$prescriptionId/doses',
      queryParameters: _subjectParams(forPatientId),
    );
    return PrescriptionDosesResponse.fromJson(resp.data ?? {});
  }

  Future<MarkDoseTakenResponse> markDoseTaken(
    String doseId, {
    DateTime? takenAt,
    String? forPatientId,
  }) async {
    final resp = await _dio.post<Map<String, dynamic>>(
      '/patient/medications/doses/$doseId/taken',
      queryParameters: _subjectParams(forPatientId),
      data: takenAt != null
          ? {'takenAt': takenAt.toUtc().toIso8601String()}
          : null,
    );
    return MarkDoseTakenResponse.fromJson(resp.data ?? {});
  }

  Future<ScheduleUpdateResponse> setScheduleStart(
    String prescriptionId, {
    required DateTime startAt,
    String? forPatientId,
  }) async {
    final resp = await _dio.patch<Map<String, dynamic>>(
      '/patient/medications/prescriptions/$prescriptionId/schedule-start',
      queryParameters: _subjectParams(forPatientId),
      data: {'startAt': startAt.toUtc().toIso8601String()},
    );
    return ScheduleUpdateResponse.fromJson(resp.data ?? {});
  }

  Future<ScheduleUpdateResponse> confirmSchedule(
    String prescriptionId, {
    String? forPatientId,
  }) async {
    final resp = await _dio.post<Map<String, dynamic>>(
      '/patient/medications/prescriptions/$prescriptionId/confirm-schedule',
      queryParameters: _subjectParams(forPatientId),
    );
    return ScheduleUpdateResponse.fromJson(resp.data ?? {});
  }

  Future<PrescriptionHistoryListResponse> listPrescriptionHistory({
    int page = 1,
    int limit = 20,
    List<PrescriptionHistoryStatus>? statuses,
    String? forPatientId,
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
        'status': ?statusParam,
        ..._subjectParams(forPatientId),
      },
    );
    return PrescriptionHistoryListResponse.fromJson(resp.data ?? {});
  }

  Future<RefillRequestResponse> requestRefill(
    String prescriptionId, {
    String? notes,
    String? forPatientId,
  }) async {
    final resp = await _dio.post<Map<String, dynamic>>(
      '/patient/medications/prescriptions/$prescriptionId/refill-request',
      queryParameters: _subjectParams(forPatientId),
      data: notes != null ? {'notes': notes} : null,
    );
    return RefillRequestResponse.fromJson(resp.data ?? {});
  }
}
