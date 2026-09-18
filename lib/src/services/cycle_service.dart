import 'package:dio/dio.dart';

import '../models/cycle_model.dart';
import 'api_service.dart';

class CycleService {
  CycleService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  Future<CycleSummaryResponse> getSummary() async {
    final resp = await _dio.get<Map<String, dynamic>>('/patient/cycle/summary');
    return CycleSummaryResponse.fromJson(resp.data ?? {});
  }

  Future<CycleCalendarResponse> getCalendar({
    required int year,
    required int month,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/cycle/calendar',
      queryParameters: {'year': year, 'month': month},
    );
    return CycleCalendarResponse.fromJson(resp.data ?? {});
  }

  Future<CycleSettings> updateSettings({
    required int cycleLengthDays,
    required int periodLengthDays,
  }) async {
    final resp = await _dio.put<Map<String, dynamic>>(
      '/patient/cycle/settings',
      data: {
        'cycleLengthDays': cycleLengthDays,
        'periodLengthDays': periodLengthDays,
      },
    );
    return CycleSettings.fromJson(resp.data ?? {});
  }

  Future<CyclePeriod> createPeriod({
    required String startDate,
    String? endDate,
    PatientCycleFlow? flow,
    String? notes,
  }) async {
    final resp = await _dio.post<Map<String, dynamic>>(
      '/patient/cycle/periods',
      data: {
        'startDate': startDate,
        if (endDate != null) 'endDate': endDate,
        if (flow != null) 'flow': flow.apiValue,
        if (notes != null && notes.isNotEmpty) 'notes': notes,
      },
    );
    return CyclePeriod.fromJson(resp.data ?? {});
  }

  Future<CyclePeriod> updatePeriod({
    required String id,
    String? startDate,
    String? endDate,
    bool clearEndDate = false,
    PatientCycleFlow? flow,
    bool clearFlow = false,
    String? notes,
    bool clearNotes = false,
  }) async {
    final resp = await _dio.patch<Map<String, dynamic>>(
      '/patient/cycle/periods/$id',
      data: {
        if (startDate != null) 'startDate': startDate,
        if (clearEndDate) 'endDate': null,
        if (!clearEndDate && endDate != null) 'endDate': endDate,
        if (clearFlow) 'flow': null,
        if (!clearFlow && flow != null) 'flow': flow.apiValue,
        if (clearNotes) 'notes': null,
        if (!clearNotes && notes != null) 'notes': notes,
      },
    );
    return CyclePeriod.fromJson(resp.data ?? {});
  }

  Future<void> deletePeriod(String id) async {
    await _dio.delete<Map<String, dynamic>>('/patient/cycle/periods/$id');
  }
}
