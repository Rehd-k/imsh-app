import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../core/auth/biometric_auth.dart';
import '../core/auth/pending_login.dart';
import '../core/auth/remembered_phone.dart';
import '../core/constants/test_accounts.dart';
import '../core/errors/app_exception.dart';
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
    this.needsDeviceCode = false,
    this.needsActivation = false,
    this.error,
  });

  final Patient? patient;
  final PatientDevice? device;
  final bool isLoading;
  final bool needsDeviceCode;
  final bool needsActivation;
  final String? error;

  bool get isAuthenticated => patient != null;

  bool get isDeviceApproved =>
      isDeviceVerificationExempt(patient?.patientId) ||
      device?.status == PatientDeviceStatus.approved;

  bool get isDevicePending =>
      !isDeviceVerificationExempt(patient?.patientId) &&
      device?.status == PatientDeviceStatus.pending;

  /// Token present and device approved — full app access.
  bool get canAccessApp => isAuthenticated && isDeviceApproved;

  PatientAuthState copyWith({
    Patient? patient,
    bool clearPatient = false,
    PatientDevice? device,
    bool clearDevice = false,
    bool? isLoading,
    bool? needsDeviceCode,
    bool? needsActivation,
    String? error,
    bool clearError = false,
  }) =>
      PatientAuthState(
        patient: clearPatient ? null : patient ?? this.patient,
        device: clearDevice ? null : device ?? this.device,
        isLoading: isLoading ?? this.isLoading,
        needsDeviceCode: needsDeviceCode ?? this.needsDeviceCode,
        needsActivation: needsActivation ?? this.needsActivation,
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
  var _biometricAttempted = false;

  Future<bool> login({
    required String phoneNumber,
    required String password,
  }) async {
    state = state.copyWith(
      isLoading: true,
      clearError: true,
      needsDeviceCode: false,
      needsActivation: false,
    );
    try {
      final response = await _authService.login(
        phoneNumber: phoneNumber,
        password: password,
        fcmToken: await TokenStorage.getFcmToken(),
      );
      PendingLogin.clear();
      await _adopt(response);
      DeviceBinding.lockPhone(phoneNumber);
      return true;
    } catch (e) {
      final needsCode = _isDeviceVerificationRequired(e);
      final needsActivation = _isAccountNotActivated(e);
      if (needsCode) {
        DeviceBinding.clear();
        PendingLogin.remember(phone: phoneNumber, password: password);
      } else if (needsActivation) {
        PendingLogin.remember(phone: phoneNumber, activateOnly: true);
      }
      state = state.copyWith(
        isLoading: false,
        needsDeviceCode: needsCode,
        needsActivation: needsActivation,
        error: authFlowErrorMessage(e),
      );
      return false;
    }
  }

  Future<void> adoptSession(PatientLoginResponse response) => _adopt(response);

  Future<void> _adopt(PatientLoginResponse response) async {
    state = state.copyWith(
      patient: response.patient,
      device: response.device,
      isLoading: false,
      clearError: true,
    );
    final phone = response.patient.phoneNumber;
    if (phone != null && phone.trim().isNotEmpty) {
      DeviceBinding.lockPhone(phone);
    }
    await _fcmPushService.registerAfterAuth();
  }

  Future<void> restoreSession() async {
    if (state.canAccessApp) return;

    final refresh = await TokenStorage.getRefreshToken();
    final biometric = await TokenStorage.isBiometricEnabled();
    if (biometric && refresh != null && refresh.isNotEmpty) {
      if (_biometricAttempted && state.patient == null) return;
      _biometricAttempted = true;
      final unlocked = await BiometricAuth.authenticate();
      if (!unlocked) return;
    }

    if (await _authService.isAuthenticated()) {
      try {
        final patient = await _authService.getMe();
        final device = await _deviceService.getStatus();
        state = state.copyWith(patient: patient, device: device);
        final phone = patient.phoneNumber;
        if (phone != null && phone.trim().isNotEmpty) {
          DeviceBinding.lockPhone(phone);
        }
        await _fcmPushService.registerAfterAuth();
        return;
      } catch (e) {
        if (_isDeviceRevokedError(e)) DeviceBinding.clear();
        // Access token may have expired. Try the refresh token next.
      }
    }

    if (refresh == null || refresh.isEmpty) return;
    try {
      await _authService.refresh();
      final patient = await _authService.getMe();
      final device = await _deviceService.getStatus();
      state = state.copyWith(patient: patient, device: device);
      final phone = patient.phoneNumber;
      if (phone != null && phone.trim().isNotEmpty) {
        DeviceBinding.lockPhone(phone);
      }
      await _fcmPushService.registerAfterAuth();
    } catch (e) {
      if (_isDeviceRevokedError(e)) DeviceBinding.clear();
      await _fcmPushService.unregisterOnLogout();
      await _authService.clearLocalSession();
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
    try {
      await _authService.logout();
    } finally {
      DeviceBinding.clear();
      state = const PatientAuthState();
    }
  }

  /// Log out of the phone number on this device without a session token.
  Future<void> releasePhoneNumber() async {
    await _authService.releaseDevice();
    DeviceBinding.clear();
    state = const PatientAuthState();
  }

  /// Local clear when the session is invalid (expired token / DEVICE_REVOKED).
  /// Skips the logout API call since the token is already unusable.
  Future<void> handleDeviceRevoked() async {
    await TokenStorage.deleteFcmToken();
    DeviceBinding.clear();
    await _authService.clearLocalSession();
    state = const PatientAuthState();
  }

  void setPatient(Patient patient) {
    state = state.copyWith(patient: patient);
  }

  void clearError() => state = state.copyWith(
        clearError: true,
        needsDeviceCode: false,
        needsActivation: false,
      );
}

bool _isDeviceVerificationRequired(Object error) {
  final resolved = error is DioException ? error.error : error;
  return resolved is ForbiddenException &&
      resolved.code == 'DEVICE_VERIFICATION_REQUIRED';
}

bool _isAccountNotActivated(Object error) {
  final resolved = error is DioException ? error.error : error;
  return resolved is ValidationException && resolved.isAccountNotActivated;
}

bool _isDeviceRevokedError(Object error) {
  final resolved = error is DioException ? error.error : error;
  return resolved is UnauthorizedException && resolved.isDeviceRevoked;
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
