import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../models/medical_records_dashboard_model.dart';
import '../models/medical_record_model.dart';
import 'auth_provider.dart';
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
  final controller = PagingController<int, EncounterSummary>(firstPageKey: 1);

  controller.addPageRequestListener((pageKey) async {
    try {
      final response = await service.listMedicalRecords(
        page: pageKey,
        limit: medicalRecordsPageSize,
        forPatientId: forPatientId,
      );
      final isLastPage =
          response.data.length < medicalRecordsPageSize ||
          pageKey * medicalRecordsPageSize >= response.total;
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
