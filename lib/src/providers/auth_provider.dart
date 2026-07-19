import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/storage/token_storage.dart';
import '../core/utils/user_error_message.dart';
import '../models/device_model.dart';
import '../models/patient_model.dart';
import '../services/device_service.dart';
import '../services/fcm_push_service.dart';
import '../services/patient_auth_service.dart';
import 'service_providers.dart';

String authFlowErrorMessage(Object e) => userFacingErrorMessage(e);

final patientAuthServiceProvider = Provider<PatientAuthService>((ref) {
  return PatientAuthService();
});

final fcmPushServiceProvider = Provider<FcmPushService>((ref) {
  return FcmPushService();
});

class PatientAuthState {
  const PatientAuthState({
    this.patient,
    this.device,
    this.isLoading = false,
    this.error,
  });

  final Patient? patient;
  final PatientDevice? device;
  final bool isLoading;
  final String? error;

  bool get isAuthenticated => patient != null;

  bool get isDeviceApproved =>
      device?.status == PatientDeviceStatus.approved;

  bool get isDevicePending =>
      device?.status == PatientDeviceStatus.pending;

  /// Token present and device approved — full app access.
  bool get canAccessApp => isAuthenticated && isDeviceApproved;

  PatientAuthState copyWith({
    Patient? patient,
    bool clearPatient = false,
    PatientDevice? device,
    bool clearDevice = false,
    bool? isLoading,
    String? error,
    bool clearError = false,
  }) =>
      PatientAuthState(
        patient: clearPatient ? null : patient ?? this.patient,
        device: clearDevice ? null : device ?? this.device,
        isLoading: isLoading ?? this.isLoading,
        error: clearError ? null : error ?? this.error,
      );
}

class PatientAuthNotifier extends StateNotifier<PatientAuthState> {
  PatientAuthNotifier(
    this._authService,
    this._deviceService,
    this._fcmPushService,
  ) : super(const PatientAuthState());

  final PatientAuthService _authService;
  final DeviceService _deviceService;
  final FcmPushService _fcmPushService;

  Future<bool> login({
    required String patientId,
    required DateTime dob,
  }) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final fcmToken = await TokenStorage.getFcmToken();
      final response = await _authService.login(
        patientId: patientId,
        dob: dob,
        fcmToken: fcmToken,
      );
      state = state.copyWith(
        patient: response.patient,
        device: response.device,
        isLoading: false,
      );
      await _fcmPushService.registerAfterAuth();
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
      final device = await _deviceService.getStatus();
      state = state.copyWith(patient: patient, device: device);
      await _fcmPushService.registerAfterAuth();
    } catch (_) {
      await _fcmPushService.unregisterOnLogout();
      await _authService.logout();
      state = const PatientAuthState();
    }
  }

  Future<void> refreshDeviceStatus() async {
    final device = await _deviceService.getStatus();
    state = state.copyWith(device: device);
  }

  void markDeviceApproved([PatientDevice? device]) {
    final next = device ??
        state.device?.copyWith(status: PatientDeviceStatus.approved);
    if (next == null) return;
    state = state.copyWith(device: next);
  }

  void updateDevice(PatientDevice device) {
    state = state.copyWith(device: device);
  }

  Future<void> logout() async {
    await _fcmPushService.unregisterOnLogout();
    await _authService.logout();
    state = const PatientAuthState();
  }

  /// Local clear when server reports DEVICE_REVOKED (no logout API call).
  Future<void> handleDeviceRevoked() async {
    await TokenStorage.deleteFcmToken();
    await _authService.clearLocalSession();
    state = const PatientAuthState();
  }

  void setPatient(Patient patient) {
    state = state.copyWith(patient: patient);
  }

  void clearError() => state = state.copyWith(clearError: true);
}

final patientAuthProvider =
    StateNotifierProvider<PatientAuthNotifier, PatientAuthState>((ref) {
  final service = ref.watch(patientAuthServiceProvider);
  final devices = ref.watch(deviceServiceProvider);
  final fcm = ref.watch(fcmPushServiceProvider);
  return PatientAuthNotifier(service, devices, fcm);
});

final currentPatientProvider = Provider<Patient?>((ref) {
  return ref.watch(patientAuthProvider).patient;
});
