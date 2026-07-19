import 'package:dio/dio.dart';

import '../models/appointment_model.dart';
import 'api_service.dart';

class AppointmentService {
  AppointmentService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  Future<AppointmentsDashboardResponse> getDashboard(
    AppointmentFilterTab status, {
    String? forPatientId,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/appointments/dashboard',
      queryParameters: {
        'status': status.apiValue,
        if (forPatientId != null) 'forPatientId': forPatientId,
      },
    );
    return AppointmentsDashboardResponse.fromJson(resp.data ?? {});
  }

  Future<AppointmentListResponse> listAppointments({
    required AppointmentFilterTab status,
    int page = 1,
    int limit = 20,
    String? forPatientId,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/appointments',
      queryParameters: {
        'status': status.apiValue,
        'page': page,
        'limit': limit,
        if (forPatientId != null) 'forPatientId': forPatientId,
      },
    );
    return AppointmentListResponse.fromJson(resp.data ?? {});
  }

  Future<AppointmentDetail> getAppointment(
    String id, {
    String? forPatientId,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/appointments/$id',
      queryParameters: {
        if (forPatientId != null) 'forPatientId': forPatientId,
      },
    );
    return AppointmentDetail.fromJson(resp.data ?? {});
  }

  Future<AppointmentDetail> createAppointment(
    CreateAppointmentRequest request,
  ) async {
    final resp = await _dio.post<Map<String, dynamic>>(
      '/patient/appointments',
      data: {
        'doctorId': request.doctorId,
        'scheduledAt': request.scheduledAt.toUtc().toIso8601String(),
        if (request.reason != null) 'reason': request.reason,
      },
    );
    return AppointmentDetail.fromJson(resp.data ?? {});
  }

  Future<AppointmentDetail> updateAppointment(
    String id,
    UpdateAppointmentRequest request,
  ) async {
    final resp = await _dio.patch<Map<String, dynamic>>(
      '/patient/appointments/$id',
      data: {
        if (request.scheduledAt != null)
          'scheduledAt': request.scheduledAt!.toUtc().toIso8601String(),
        if (request.reason != null) 'reason': request.reason,
      },
    );
    return AppointmentDetail.fromJson(resp.data ?? {});
  }

  Future<CancelAppointmentResponse> cancelAppointment(String id) async {
    final resp = await _dio.delete<Map<String, dynamic>>(
      '/patient/appointments/$id',
    );
    return CancelAppointmentResponse.fromJson(resp.data ?? {});
  }

  Future<AppointmentSpecialtyListResponse> listSpecialties() async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/appointments/specialties',
    );
    return AppointmentSpecialtyListResponse.fromJson(resp.data ?? {});
  }

  Future<BookableDoctorListResponse> listDoctors({
    required String specialtyId,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/appointments/doctors',
      queryParameters: {'specialtyId': specialtyId},
    );
    return BookableDoctorListResponse.fromJson(resp.data ?? {});
  }

  Future<AvailabilityResponse> listAvailability({
    required String doctorId,
    required String date,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/appointments/availability',
      queryParameters: {
        'doctorId': doctorId,
        'date': date,
      },
    );
    return AvailabilityResponse.fromJson(resp.data ?? {});
  }
}
