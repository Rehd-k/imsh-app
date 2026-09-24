import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/medication_model.dart';
import 'family_provider.dart';
import 'service_providers.dart';

const medicationsHistoryPageSize = 20;
const _medicationsViewModeKey = 'medications_view_mode';

final medicationsViewModeProvider =
    StateNotifierProvider<MedicationsViewModeNotifier, MedicationsViewMode>(
  (ref) => MedicationsViewModeNotifier(),
);

class MedicationsViewModeNotifier extends StateNotifier<MedicationsViewMode> {
  MedicationsViewModeNotifier() : super(MedicationsViewMode.calendar) {
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_medicationsViewModeKey);
    if (raw == 'byDrug') {
      state = MedicationsViewMode.byDrug;
    } else if (raw == 'calendar') {
      state = MedicationsViewMode.calendar;
    }
  }

  Future<void> setMode(MedicationsViewMode mode) async {
    state = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _medicationsViewModeKey,
      mode == MedicationsViewMode.byDrug ? 'byDrug' : 'calendar',
    );
  }
}

final medicationsDashboardProvider =
    FutureProvider.autoDispose<MedicationDashboardResponse>((ref) async {
  final service = ref.watch(medicationServiceProvider);
  final forPatientId = watchForPatientId(ref);
  return service.getDashboard(forPatientId: forPatientId);
});

final medicationCalendarProvider = FutureProvider.autoDispose
    .family<MedicationCalendarResponse, ({DateTime from, DateTime to})>(
  (ref, range) async {
    final service = ref.watch(medicationServiceProvider);
    final forPatientId = watchForPatientId(ref);
    return service.getCalendar(
      from: range.from,
      to: range.to,
      forPatientId: forPatientId,
    );
  },
);

final prescriptionDosesProvider = FutureProvider.autoDispose
    .family<PrescriptionDosesResponse, String>((ref, prescriptionId) async {
  final service = ref.watch(medicationServiceProvider);
  final forPatientId = watchForPatientId(ref);
  return service.getPrescriptionDoses(
    prescriptionId,
    forPatientId: forPatientId,
  );
});

final markDoseTakenProvider =
    AsyncNotifierProvider.autoDispose<MarkDoseTakenNotifier, Set<String>>(
  MarkDoseTakenNotifier.new,
);

class MarkDoseTakenNotifier extends AsyncNotifier<Set<String>> {
  @override
  Future<Set<String>> build() async => {};

  Future<void> markTaken(String doseId) async {
    final inFlight = {...?state.value};
    if (inFlight.contains(doseId)) return;

    inFlight.add(doseId);
    state = AsyncData(inFlight);

    try {
      final service = ref.read(medicationServiceProvider);
      final forPatientId = ref.read(familyViewProvider).forPatientId;
      await service.markDoseTaken(doseId, forPatientId: forPatientId);
      ref.invalidate(medicationsDashboardProvider);
      ref.invalidate(medicationCalendarProvider);
      ref.invalidate(prescriptionDosesProvider);
    } catch (error) {
      rethrow;
    } finally {
      final updated = {...?state.value}..remove(doseId);
      state = AsyncData(updated);
    }
  }

  bool isMarking(String doseId) => state.value?.contains(doseId) ?? false;
}

final scheduleConfirmProvider =
    AsyncNotifierProvider.autoDispose<ScheduleConfirmNotifier, Set<String>>(
  ScheduleConfirmNotifier.new,
);

class ScheduleConfirmNotifier extends AsyncNotifier<Set<String>> {
  @override
  Future<Set<String>> build() async => {};

  Future<void> confirm(String prescriptionId) async {
    final inFlight = {...?state.value};
    if (inFlight.contains(prescriptionId)) return;
    inFlight.add(prescriptionId);
    state = AsyncData(inFlight);
    try {
      final service = ref.read(medicationServiceProvider);
      final forPatientId = ref.read(familyViewProvider).forPatientId;
      await service.confirmSchedule(
        prescriptionId,
        forPatientId: forPatientId,
      );
      ref.invalidate(medicationsDashboardProvider);
      ref.invalidate(medicationCalendarProvider);
      ref.invalidate(prescriptionDosesProvider);
    } finally {
      final updated = {...?state.value}..remove(prescriptionId);
      state = AsyncData(updated);
    }
  }

  Future<void> setStart(String prescriptionId, DateTime startAt) async {
    final inFlight = {...?state.value};
    if (inFlight.contains(prescriptionId)) return;
    inFlight.add(prescriptionId);
    state = AsyncData(inFlight);
    try {
      final service = ref.read(medicationServiceProvider);
      final forPatientId = ref.read(familyViewProvider).forPatientId;
      await service.setScheduleStart(
        prescriptionId,
        startAt: startAt,
        forPatientId: forPatientId,
      );
      ref.invalidate(medicationsDashboardProvider);
      ref.invalidate(medicationCalendarProvider);
      ref.invalidate(prescriptionDosesProvider);
    } finally {
      final updated = {...?state.value}..remove(prescriptionId);
      state = AsyncData(updated);
    }
  }
}

final requestRefillProvider =
    AsyncNotifierProvider.autoDispose<RequestRefillNotifier, Set<String>>(
  RequestRefillNotifier.new,
);

class RequestRefillNotifier extends AsyncNotifier<Set<String>> {
  @override
  Future<Set<String>> build() async => {};

  Future<void> requestRefill(String prescriptionId) async {
    final inFlight = {...?state.value};
    if (inFlight.contains(prescriptionId)) return;

    inFlight.add(prescriptionId);
    state = AsyncData(inFlight);

    try {
      final service = ref.read(medicationServiceProvider);
      final forPatientId = ref.read(familyViewProvider).forPatientId;
      await service.requestRefill(
        prescriptionId,
        forPatientId: forPatientId,
      );
      ref.invalidate(medicationsDashboardProvider);
    } finally {
      final updated = {...?state.value}..remove(prescriptionId);
      state = AsyncData(updated);
    }
  }

  bool isRequesting(String prescriptionId) =>
      state.value?.contains(prescriptionId) ?? false;
}

final medicationsHistoryPagingControllerProvider = Provider.autoDispose((ref) {
  final service = ref.watch(medicationServiceProvider);
  final forPatientId = watchForPatientId(ref);
  final controller = PagingController<int, PrescriptionHistorySummary>(
    getNextPageKey: (state) {
      final pages = state.pages;
      if (pages != null && pages.last.length < medicationsHistoryPageSize) {
        return null;
      }
      return state.nextIntPageKey;
    },
    fetchPage: (pageKey) async {
      final response = await service.listPrescriptionHistory(
        page: pageKey,
        limit: medicationsHistoryPageSize,
        forPatientId: forPatientId,
      );
      return response.data;
    },
  );

  ref.onDispose(controller.dispose);
  return controller;
});
