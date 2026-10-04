import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/medication_model.dart';
import 'auth_provider.dart';
import 'family_provider.dart';
import 'medications_provider.dart';
import 'service_providers.dart';

/// Client undo snackbar duration (server allows a longer grace window).
const doseMarkUndoGrace = Duration(seconds: 5);

/// Optimistic dose ids shown as taken while undo is available / request in flight.
final pendingDoseMarkProvider =
    NotifierProvider<PendingDoseMarkNotifier, Set<String>>(
  PendingDoseMarkNotifier.new,
);

/// Fires when a mark response reports dayCompleted (streak celebration).
final doseDayCompletedTickProvider =
    NotifierProvider<DoseDayCompletedTick, int>(DoseDayCompletedTick.new);

final doseMarkCommitErrorProvider =
    NotifierProvider<DoseMarkCommitErrorNotifier, String?>(
  DoseMarkCommitErrorNotifier.new,
);

class DoseDayCompletedTick extends Notifier<int> {
  @override
  int build() => 0;

  void bump() => state = state + 1;
}

class DoseMarkCommitErrorNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  void setError(String message) => state = message;

  void clear() => state = null;
}

class PendingDoseMarkNotifier extends Notifier<Set<String>> {
  /// Dose ids already POSTed that can still be unmarked via Undo.
  final Set<String> _committedPendingUndo = {};

  @override
  Set<String> build() => {};

  bool isPending(String doseId) => state.contains(doseId);

  /// Optimistic UI + immediate POST. Callers show Undo SnackBar.
  Future<void> scheduleMarkTaken(String doseId) async {
    if (state.contains(doseId)) return;

    state = {...state, doseId};

    try {
      final service = ref.read(medicationServiceProvider);
      final forPatientId = ref.read(familyViewProvider).forPatientId;
      final result = await service.markDoseTaken(
        doseId,
        forPatientId: forPatientId,
      );

      _committedPendingUndo.add(doseId);

      if (result.dayCompleted) {
        ref.read(doseDayCompletedTickProvider.notifier).bump();
      }

      ref.invalidate(medicationsDashboardProvider);
      ref.invalidate(medicationCalendarProvider);
      ref.invalidate(prescriptionDosesProvider);
    } catch (error) {
      state = {...state}..remove(doseId);
      ref
          .read(doseMarkCommitErrorProvider.notifier)
          .setError(authFlowErrorMessage(error));
    }
  }

  /// Undo: unmark on server if already committed; otherwise drop optimistic id.
  Future<void> cancelPendingMark(String doseId) async {
    final wasCommitted = _committedPendingUndo.remove(doseId);

    if (!wasCommitted) {
      if (state.contains(doseId)) {
        state = {...state}..remove(doseId);
      }
      return;
    }

    try {
      final service = ref.read(medicationServiceProvider);
      final forPatientId = ref.read(familyViewProvider).forPatientId;
      await service.unmarkDoseTaken(doseId, forPatientId: forPatientId);
      if (state.contains(doseId)) {
        state = {...state}..remove(doseId);
      }
      ref.invalidate(medicationsDashboardProvider);
      ref.invalidate(medicationCalendarProvider);
      ref.invalidate(prescriptionDosesProvider);
    } catch (error) {
      // Keep optimistic taken — server still has TAKEN.
      _committedPendingUndo.add(doseId);
      ref
          .read(doseMarkCommitErrorProvider.notifier)
          .setError(authFlowErrorMessage(error));
    }
  }

  /// Clears optimistic id after undo snackbar expires (dose stays taken on server).
  void acknowledgeCommitted(String doseId) {
    _committedPendingUndo.remove(doseId);
    if (state.contains(doseId)) {
      state = {...state}..remove(doseId);
    }
  }
}

/// Progress of today's doses including optimistic pending marks.
({int taken, int total, double fraction}) todayDoseProgress({
  required List<MedicationScheduleEntry> schedule,
  required Set<String> pendingIds,
}) {
  final actionable = schedule
      .where((e) => e.status != MedicationDoseStatus.skipped)
      .toList();
  if (actionable.isEmpty) {
    return (taken: 0, total: 0, fraction: 0.0);
  }

  final taken = actionable.where((e) {
    if (pendingIds.contains(e.id)) return true;
    return e.status == MedicationDoseStatus.taken;
  }).length;

  return (
    taken: taken,
    total: actionable.length,
    fraction: taken / actionable.length,
  );
}

void showDoseTakenUndoSnackBar({
  required BuildContext context,
  required WidgetRef ref,
  required String doseId,
}) {
  final messenger = ScaffoldMessenger.of(context);
  messenger.clearSnackBars();
  messenger
      .showSnackBar(
        SnackBar(
          content: const Text('Marked as taken'),
          duration: doseMarkUndoGrace,
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              ref
                  .read(pendingDoseMarkProvider.notifier)
                  .cancelPendingMark(doseId);
            },
          ),
        ),
      )
      .closed
      .then((reason) {
    if (reason != SnackBarClosedReason.action) {
      ref.read(pendingDoseMarkProvider.notifier).acknowledgeCommitted(doseId);
    }
  });
}

void scheduleDoseTakenWithUndo({
  required BuildContext context,
  required WidgetRef ref,
  required String doseId,
}) {
  ref.read(pendingDoseMarkProvider.notifier).scheduleMarkTaken(doseId);
  if (!context.mounted) return;
  showDoseTakenUndoSnackBar(context: context, ref: ref, doseId: doseId);
}
