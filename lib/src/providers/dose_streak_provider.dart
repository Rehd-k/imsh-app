import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/medication_model.dart';
import 'medications_provider.dart';

/// Streak from the medications dashboard (server is source of truth).
final doseStreakProvider = Provider.autoDispose<MedicationStreak>((ref) {
  final dashboard = ref.watch(medicationsDashboardProvider).asData?.value;
  return dashboard?.streak ??
      const MedicationStreak(
        currentStreak: 0,
        longestStreak: 0,
        shieldsRemaining: 1,
        todayCompleted: false,
      );
});
