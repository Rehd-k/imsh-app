import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../models/lab_result_model.dart';
import 'auth_provider.dart';
import 'family_provider.dart';
import 'service_providers.dart';

const labResultsPageSize = 20;

enum LabResultFilterChip {
  all,
  pending,
  bloodWork,
}

extension LabResultFilterChipDisplay on LabResultFilterChip {
  String get label => switch (this) {
        LabResultFilterChip.all => 'All Tests',
        LabResultFilterChip.pending => 'Pending',
        LabResultFilterChip.bloodWork => 'Blood Work',
      };

  bool get isActive => this != LabResultFilterChip.all;
}

const _bloodWorkKeywords = [
  'blood',
  'cbc',
  'lipid',
  'thyroid',
  'hemoglobin',
  'haemoglobin',
  'glucose',
  'cholesterol',
  'ferritin',
  'electrolyte',
  'urinalysis',
  'tft',
  'hba1c',
  'creatinine',
  'platelet',
];

bool isLabOrderPending(LabResultSummary result) {
  return isLabStatusPending(result.summaryStatus, result.status);
}

bool isLabStatusPending(
  LabSummaryStatus summaryStatus,
  LabOrderStatus orderStatus,
) {
  return summaryStatus == LabSummaryStatus.pending ||
      orderStatus == LabOrderStatus.pending ||
      orderStatus == LabOrderStatus.sampleCollected ||
      orderStatus == LabOrderStatus.processing;
}

bool isBloodWorkTest(LabResultSummary result) {
  final names = result.testNames.map((n) => n.toLowerCase()).join(' ');
  return _bloodWorkKeywords.any(names.contains);
}

bool matchesLabFilter(LabResultSummary result, LabResultFilterChip filter) {
  return switch (filter) {
    LabResultFilterChip.all => true,
    LabResultFilterChip.pending => isLabOrderPending(result),
    LabResultFilterChip.bloodWork => isBloodWorkTest(result),
  };
}

LabResultSummary? pickLatestLabResult(List<LabResultSummary> results) {
  if (results.isEmpty) return null;
  final completed = results
      .where(
        (r) =>
            r.status == LabOrderStatus.completed ||
            r.status == LabOrderStatus.verified,
      )
      .toList();
  if (completed.isNotEmpty) return completed.first;
  return results.first;
}

List<LabResultSummary> filterLabHistory(
  List<LabResultSummary> results,
  LabResultFilterChip filter, {
  LabResultSummary? latest,
}) {
  final latestId = latest?.id;
  return results
      .where((r) => r.id != latestId)
      .where((r) => matchesLabFilter(r, filter))
      .toList();
}

final labResultFilterProvider = StateProvider<LabResultFilterChip>((ref) {
  return LabResultFilterChip.all;
});

final labResultDetailProvider = FutureProvider.autoDispose
    .family<LabResultDetail, String>((ref, id) async {
  final service = ref.watch(labServiceProvider);
  final forPatientId = watchForPatientId(ref);
  return service.getLabReport(id, forPatientId: forPatientId);
});

final labResultsPagingControllerProvider = Provider.autoDispose((ref) {
  final service = ref.watch(labServiceProvider);
  final forPatientId = watchForPatientId(ref);
  final controller = PagingController<int, LabResultSummary>(
    firstPageKey: 1,
  );

  controller.addPageRequestListener((pageKey) async {
    try {
      final response = await service.listLabReports(
        page: pageKey,
        limit: labResultsPageSize,
        forPatientId: forPatientId,
      );
      final isLastPage =
          response.data.length < labResultsPageSize ||
          pageKey * labResultsPageSize >= response.total;
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
