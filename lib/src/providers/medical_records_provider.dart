import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../models/medical_records_dashboard_model.dart';
import '../models/medical_record_model.dart';
import 'family_provider.dart';
import 'service_providers.dart';

const medicalRecordsPageSize = 20;

final medicalRecordsDashboardProvider =
    FutureProvider.autoDispose<MedicalRecordsDashboardResponse>((ref) async {
  final medicalService = ref.watch(medicalRecordServiceProvider);
  final forPatientId = watchForPatientId(ref);
  return medicalService.getDashboard(forPatientId: forPatientId);
});

final encounterDetailProvider = FutureProvider.autoDispose
    .family<EncounterDetail, String>((ref, id) async {
  final service = ref.watch(medicalRecordServiceProvider);
  final forPatientId = watchForPatientId(ref);
  return service.getEncounter(id, forPatientId: forPatientId);
});

final medicalRecordsPagingControllerProvider = Provider.autoDispose((ref) {
  final service = ref.watch(medicalRecordServiceProvider);
  final forPatientId = watchForPatientId(ref);
  final controller = PagingController<int, EncounterSummary>(
    getNextPageKey: (state) {
      final pages = state.pages;
      if (pages != null && pages.last.length < medicalRecordsPageSize) {
        return null;
      }
      return state.nextIntPageKey;
    },
    fetchPage: (pageKey) async {
      final response = await service.listMedicalRecords(
        page: pageKey,
        limit: medicalRecordsPageSize,
        forPatientId: forPatientId,
      );
      return response.data;
    },
  );

  ref.onDispose(controller.dispose);
  return controller;
});
