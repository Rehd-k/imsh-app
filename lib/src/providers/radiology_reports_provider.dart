import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../models/radiology_report_model.dart';
import 'auth_provider.dart';
import 'family_provider.dart';
import 'service_providers.dart';

const radiologyReportsPageSize = 20;

class RadiologyReportFilter {
  const RadiologyReportFilter({
    this.status,
    this.dateFrom,
    this.dateTo,
  });

  final RadiologyReportStatus? status;
  final DateTime? dateFrom;
  final DateTime? dateTo;

  bool get isActive =>
      status != null || dateFrom != null || dateTo != null;

  RadiologyReportFilter copyWith({
    RadiologyReportStatus? status,
    DateTime? dateFrom,
    DateTime? dateTo,
    bool clearStatus = false,
    bool clearDateFrom = false,
    bool clearDateTo = false,
  }) {
    return RadiologyReportFilter(
      status: clearStatus ? null : (status ?? this.status),
      dateFrom: clearDateFrom ? null : (dateFrom ?? this.dateFrom),
      dateTo: clearDateTo ? null : (dateTo ?? this.dateTo),
    );
  }
}

bool matchesRadiologyFilter(
  RadiologyReportSummary report,
  RadiologyReportFilter filter,
) {
  if (filter.status != null && report.status != filter.status) {
    return false;
  }
  if (filter.dateFrom != null) {
    final from = DateTime(
      filter.dateFrom!.year,
      filter.dateFrom!.month,
      filter.dateFrom!.day,
    );
    if (report.performedAt.isBefore(from)) return false;
  }
  if (filter.dateTo != null) {
    final to = DateTime(
      filter.dateTo!.year,
      filter.dateTo!.month,
      filter.dateTo!.day,
      23,
      59,
      59,
      999,
    );
    if (report.performedAt.isAfter(to)) return false;
  }
  return true;
}

RadiologyReportSummary? pickLatestRadiologyReport(
  List<RadiologyReportSummary> reports,
) {
  if (reports.isEmpty) return null;
  final completed = reports.where((r) => r.status.isComplete).toList();
  if (completed.isNotEmpty) return completed.first;
  return reports.first;
}

List<RadiologyReportSummary> filterRadiologyHistory(
  List<RadiologyReportSummary> reports,
  RadiologyReportFilter filter, {
  RadiologyReportSummary? latest,
}) {
  final latestId = latest?.id;
  return reports
      .where((r) => r.id != latestId)
      .where((r) => matchesRadiologyFilter(r, filter))
      .toList();
}

final radiologyReportFilterProvider =
    StateProvider<RadiologyReportFilter>((ref) {
  return const RadiologyReportFilter();
});

final radiologyReportDetailProvider = FutureProvider.autoDispose
    .family<RadiologyReportDetail, String>((ref, id) async {
  final service = ref.watch(radiologyServiceProvider);
  final forPatientId = watchForPatientId(ref);
  return service.getRadiologyReport(id, forPatientId: forPatientId);
});

final radiologyStatisticsProvider =
    StateProvider<RadiologyStatistics?>((ref) => null);

final radiologyReportsPagingControllerProvider = Provider.autoDispose((ref) {
  final service = ref.watch(radiologyServiceProvider);
  final forPatientId = watchForPatientId(ref);
  final controller = PagingController<int, RadiologyReportSummary>(
    firstPageKey: 1,
  );

  controller.addPageRequestListener((pageKey) async {
    try {
      final response = await service.listRadiologyReports(
        page: pageKey,
        limit: radiologyReportsPageSize,
        forPatientId: forPatientId,
      );
      ref.read(radiologyStatisticsProvider.notifier).state =
          response.statistics;
      final isLastPage =
          response.data.length < radiologyReportsPageSize ||
          pageKey * radiologyReportsPageSize >= response.total;
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
