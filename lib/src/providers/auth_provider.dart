import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/errors/app_exception.dart';
import '../models/patient_model.dart';
import '../services/patient_auth_service.dart';

String authFlowErrorMessage(Object e) {
  if (e is DioException) {
    final inner = e.error;
    if (inner is AppException) return inner.message;
  }
  if (e is AppException) return e.message;
  return e.toString();
}

final patientAuthServiceProvider = Provider<PatientAuthService>((ref) {
  return PatientAuthService();
});

class PatientAuthState {
  const PatientAuthState({
    this.patient,
    this.isLoading = false,
    this.error,
  });

  final Patient? patient;
  final bool isLoading;
  final String? error;

  bool get isAuthenticated => patient != null;

  PatientAuthState copyWith({
    Patient? patient,
    bool clearPatient = false,
    bool? isLoading,
    String? error,
    bool clearError = false,
  }) => PatientAuthState(
    patient: clearPatient ? null : patient ?? this.patient,
    isLoading: isLoading ?? this.isLoading,
    error: clearError ? null : error ?? this.error,
  );
}

class PatientAuthNotifier extends StateNotifier<PatientAuthState> {
  PatientAuthNotifier(this._authService) : super(const PatientAuthState());

  final PatientAuthService _authService;

  Future<bool> login({
    required String patientId,
    required DateTime dob,
  }) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final response = await _authService.login(
        patientId: patientId,
        dob: dob,
      );
      state = state.copyWith(patient: response.patient, isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: authFlowErrorMessage(e),
      );
      return false;
    }
  }

  Future<void> restoreSession() async {
    final hasToken = await _authService.isAuthenticated();
    if (!hasToken) return;
    try {
      final patient = await _authService.getMe();
      state = state.copyWith(patient: patient);
    } catch (_) {
      await _authService.logout();
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    state = const PatientAuthState();
  }

  void clearError() => state = state.copyWith(clearError: true);
}

final patientAuthProvider =
    StateNotifierProvider<PatientAuthNotifier, PatientAuthState>((ref) {
  final service = ref.watch(patientAuthServiceProvider);
  return PatientAuthNotifier(service);
});

final currentPatientProvider = Provider<Patient?>((ref) {
  return ref.watch(patientAuthProvider).patient;
});
