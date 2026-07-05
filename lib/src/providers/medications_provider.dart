import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../models/medication_model.dart';
import 'auth_provider.dart';
import 'service_providers.dart';

const medicationsHistoryPageSize = 20;

final medicationsDashboardProvider =
    FutureProvider.autoDispose<MedicationDashboardResponse>((ref) async {
  final service = ref.watch(medicationServiceProvider);
  return service.getDashboard();
});

final markDoseTakenProvider =
    AsyncNotifierProvider.autoDispose<MarkDoseTakenNotifier, Set<String>>(
  MarkDoseTakenNotifier.new,
);

class MarkDoseTakenNotifier extends AutoDisposeAsyncNotifier<Set<String>> {
  @override
  Future<Set<String>> build() async => {};

  Future<void> markTaken(String doseId) async {
    final inFlight = {...?state.valueOrNull};
    if (inFlight.contains(doseId)) return;

    inFlight.add(doseId);
    state = AsyncData(inFlight);

    try {
      final service = ref.read(medicationServiceProvider);
      await service.markDoseTaken(doseId);
      ref.invalidate(medicationsDashboardProvider);
    } catch (error) {
      rethrow;
    } finally {
      final updated = {...?state.valueOrNull}..remove(doseId);
      state = AsyncData(updated);
    }
  }

  bool isMarking(String doseId) => state.valueOrNull?.contains(doseId) ?? false;
}

final requestRefillProvider =
    AsyncNotifierProvider.autoDispose<RequestRefillNotifier, Set<String>>(
  RequestRefillNotifier.new,
);

class RequestRefillNotifier extends AutoDisposeAsyncNotifier<Set<String>> {
  @override
  Future<Set<String>> build() async => {};

  Future<void> requestRefill(String prescriptionId) async {
    final inFlight = {...?state.valueOrNull};
    if (inFlight.contains(prescriptionId)) return;

    inFlight.add(prescriptionId);
    state = AsyncData(inFlight);

    try {
      final service = ref.read(medicationServiceProvider);
      await service.requestRefill(prescriptionId);
      ref.invalidate(medicationsDashboardProvider);
    } finally {
      final updated = {...?state.valueOrNull}..remove(prescriptionId);
      state = AsyncData(updated);
    }
  }

  bool isRequesting(String prescriptionId) =>
      state.valueOrNull?.contains(prescriptionId) ?? false;
}

final medicationsHistoryPagingControllerProvider = Provider.autoDispose((ref) {
  final service = ref.watch(medicationServiceProvider);
  final controller = PagingController<int, PrescriptionHistorySummary>(
    firstPageKey: 1,
  );

  controller.addPageRequestListener((pageKey) async {
    try {
      final response = await service.listPrescriptionHistory(
        page: pageKey,
        limit: medicationsHistoryPageSize,
      );
      final isLastPage =
          response.data.length < medicationsHistoryPageSize ||
          pageKey * medicationsHistoryPageSize >= response.total;
      if (isLastPage) {
        controller.appendLastPage(response.data);
      } else {
        controller.appendPage(response.data, pageKey + 1);
      }
    } catch (error) {
      controller.error = authFlowErrorMessage(error);
    }
  });

  ref.onDispose(controller.dispose);
  return controller;
});
