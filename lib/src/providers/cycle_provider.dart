import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/cycle_model.dart';
import 'auth_provider.dart';
import 'service_providers.dart';

final cycleSummaryProvider = FutureProvider.autoDispose<CycleSummaryResponse>((
  ref,
) async {
  final service = ref.watch(cycleServiceProvider);
  return service.getSummary();
});

final cycleCalendarProvider = FutureProvider.autoDispose
    .family<CycleCalendarResponse, CycleMonthKey>((ref, month) {
      final service = ref.watch(cycleServiceProvider);
      return service.getCalendar(year: month.year, month: month.month);
    });

void invalidateCycle(WidgetRef ref) {
  ref.invalidate(cycleSummaryProvider);
  ref.invalidate(cycleCalendarProvider);
}

String cycleErrorMessage(Object error) => authFlowErrorMessage(error);
