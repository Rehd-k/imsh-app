import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/appointment_model.dart';
import 'auth_provider.dart';
import 'family_provider.dart';
import 'service_providers.dart';

final appointmentFilterProvider = StateProvider<AppointmentFilterTab>((ref) {
  return AppointmentFilterTab.upcoming;
});

final appointmentsDashboardProvider = FutureProvider.autoDispose
    .family<AppointmentsDashboardResponse, AppointmentFilterTab>(
  (ref, filter) async {
    final service = ref.watch(appointmentServiceProvider);
    final forPatientId = watchForPatientId(ref);
    return service.getDashboard(filter, forPatientId: forPatientId);
  },
);

final appointmentDetailProvider =
    FutureProvider.autoDispose.family<AppointmentDetail, String>(
  (ref, id) async {
    final service = ref.watch(appointmentServiceProvider);
    final forPatientId = watchForPatientId(ref);
    return service.getAppointment(id, forPatientId: forPatientId);
  },
);

final appointmentSpecialtiesProvider =
    FutureProvider.autoDispose<AppointmentSpecialtyListResponse>((ref) async {
  final service = ref.watch(appointmentServiceProvider);
  return service.listSpecialties();
});

final bookableDoctorsProvider = FutureProvider.autoDispose
    .family<BookableDoctorListResponse, String>((ref, specialtyId) async {
  final service = ref.watch(appointmentServiceProvider);
  return service.listDoctors(specialtyId: specialtyId);
});

typedef AvailabilityParams = ({String doctorId, String date});

final appointmentAvailabilityProvider = FutureProvider.autoDispose
    .family<AvailabilityResponse, AvailabilityParams>((ref, params) async {
  final service = ref.watch(appointmentServiceProvider);
  return service.listAvailability(
    doctorId: params.doctorId,
    date: params.date,
  );
});

final cancelAppointmentProvider =
    AsyncNotifierProvider.autoDispose<CancelAppointmentNotifier, Set<String>>(
  CancelAppointmentNotifier.new,
);

class CancelAppointmentNotifier extends AutoDisposeAsyncNotifier<Set<String>> {
  @override
  Future<Set<String>> build() async => {};

  Future<void> cancel(String appointmentId) async {
    final inFlight = {...?state.valueOrNull};
    if (inFlight.contains(appointmentId)) return;

    inFlight.add(appointmentId);
    state = AsyncData(inFlight);

    try {
      final service = ref.read(appointmentServiceProvider);
      await service.cancelAppointment(appointmentId);
      for (final filter in AppointmentFilterTab.values) {
        ref.invalidate(appointmentsDashboardProvider(filter));
      }
    } finally {
      final updated = {...?state.valueOrNull}..remove(appointmentId);
      state = AsyncData(updated);
    }
  }

  bool isCancelling(String appointmentId) =>
      state.valueOrNull?.contains(appointmentId) ?? false;
}

final bookAppointmentProvider =
    AsyncNotifierProvider.autoDispose<BookAppointmentNotifier, bool>(
  BookAppointmentNotifier.new,
);

class BookAppointmentNotifier extends AutoDisposeAsyncNotifier<bool> {
  @override
  Future<bool> build() async => false;

  Future<AppointmentDetail> submit({
    required CreateAppointmentRequest request,
    String? appointmentId,
  }) async {
    state = const AsyncLoading();

    try {
      final service = ref.read(appointmentServiceProvider);
      final result = appointmentId == null
          ? await service.createAppointment(request)
          : await service.updateAppointment(
              appointmentId,
              UpdateAppointmentRequest(
                scheduledAt: request.scheduledAt,
                reason: request.reason,
              ),
            );
      _invalidateAppointmentDashboards(ref);
      if (appointmentId != null) {
        ref.invalidate(appointmentDetailProvider(appointmentId));
      }
      state = const AsyncData(false);
      return result;
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      rethrow;
    }
  }
}

void _invalidateAppointmentDashboards(Ref ref) {
  for (final filter in AppointmentFilterTab.values) {
    ref.invalidate(appointmentsDashboardProvider(filter));
  }
}

class BookingWizardState {
  const BookingWizardState({
    this.step = 0,
    this.specialty,
    this.doctor,
    this.selectedDate,
    this.selectedSlot,
    this.reason = '',
    this.rescheduleAppointmentId,
    this.prefilledDoctor,
  });

  final int step;
  final AppointmentSpecialty? specialty;
  final BookableDoctor? doctor;
  final DateTime? selectedDate;
  final AvailabilitySlot? selectedSlot;
  final String reason;
  final String? rescheduleAppointmentId;
  final BookableDoctor? prefilledDoctor;

  bool get isReschedule => rescheduleAppointmentId != null;

  BookingWizardState copyWith({
    int? step,
    AppointmentSpecialty? specialty,
    BookableDoctor? doctor,
    DateTime? selectedDate,
    AvailabilitySlot? selectedSlot,
    String? reason,
    String? rescheduleAppointmentId,
    BookableDoctor? prefilledDoctor,
    bool clearSpecialty = false,
    bool clearDoctor = false,
    bool clearDate = false,
    bool clearSlot = false,
  }) {
    return BookingWizardState(
      step: step ?? this.step,
      specialty: clearSpecialty ? null : (specialty ?? this.specialty),
      doctor: clearDoctor ? null : (doctor ?? this.doctor),
      selectedDate: clearDate ? null : (selectedDate ?? this.selectedDate),
      selectedSlot: clearSlot ? null : (selectedSlot ?? this.selectedSlot),
      reason: reason ?? this.reason,
      rescheduleAppointmentId:
          rescheduleAppointmentId ?? this.rescheduleAppointmentId,
      prefilledDoctor: prefilledDoctor ?? this.prefilledDoctor,
    );
  }
}

class BookingWizardNotifier extends AutoDisposeNotifier<BookingWizardState> {
  @override
  BookingWizardState build() => const BookingWizardState();

  void startReschedule({
    required String appointmentId,
    required BookableDoctor doctor,
  }) {
    state = BookingWizardState(
      step: 2,
      doctor: doctor,
      prefilledDoctor: doctor,
      rescheduleAppointmentId: appointmentId,
      selectedDate: DateTime.now(),
    );
  }

  void reset() {
    state = const BookingWizardState();
  }

  void selectSpecialty(AppointmentSpecialty specialty) {
    state = state.copyWith(
      specialty: specialty,
      clearDoctor: true,
      clearDate: true,
      clearSlot: true,
      step: 1,
    );
  }

  void selectDoctor(BookableDoctor doctor) {
    state = state.copyWith(
      doctor: doctor,
      clearDate: true,
      clearSlot: true,
      selectedDate: DateTime.now(),
      step: 2,
    );
  }

  void selectDate(DateTime date) {
    state = state.copyWith(
      selectedDate: date,
      clearSlot: true,
    );
  }

  void selectSlot(AvailabilitySlot slot) {
    state = state.copyWith(selectedSlot: slot);
  }

  void setReason(String reason) {
    state = state.copyWith(reason: reason);
  }

  void nextStep() {
    state = state.copyWith(step: state.step + 1);
  }

  void previousStep() {
    if (state.step > 0) {
      state = state.copyWith(step: state.step - 1);
    }
  }

  void goToStep(int step) {
    state = state.copyWith(step: step);
  }
}

final bookingWizardProvider =
    NotifierProvider.autoDispose<BookingWizardNotifier, BookingWizardState>(
  BookingWizardNotifier.new,
);

void invalidateAppointmentDashboards(WidgetRef ref) {
  for (final filter in AppointmentFilterTab.values) {
    ref.invalidate(appointmentsDashboardProvider(filter));
  }
}

String appointmentErrorMessage(Object error) => authFlowErrorMessage(error);
