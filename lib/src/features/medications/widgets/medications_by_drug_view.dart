import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/imsh_accent_colors.dart';
import '../../../models/medication_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/medications_provider.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_empty_state.dart';
import '../../../shared/widgets/imsh_semantic_badge.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';
import 'dose_actions.dart';

class MedicationsByDrugView extends StatelessWidget {
  const MedicationsByDrugView({
    super.key,
    required this.prescriptions,
  });

  final List<ActivePrescriptionSummary> prescriptions;

  @override
  Widget build(BuildContext context) {
    if (prescriptions.isEmpty) {
      return const ImshEmptyState(
        title: 'No active medications',
        message: 'You have no active prescriptions right now.',
        icon: Icons.medication_outlined,
        iconColor: ImshAccentColors.teal,
      );
    }

    return Column(
      children: [
        for (final rx in prescriptions)
          _ExpandablePrescriptionCard(prescription: rx),
      ],
    );
  }
}

class _ExpandablePrescriptionCard extends ConsumerStatefulWidget {
  const _ExpandablePrescriptionCard({required this.prescription});

  final ActivePrescriptionSummary prescription;

  @override
  ConsumerState<_ExpandablePrescriptionCard> createState() =>
      _ExpandablePrescriptionCardState();
}

class _ExpandablePrescriptionCardState
    extends ConsumerState<_ExpandablePrescriptionCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final rx = widget.prescription;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ImshSurfaceCard(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => setState(() => _expanded = !_expanded),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const ImshSolidIcon(
                      icon: Icons.medication_outlined,
                      color: ImshAccentColors.teal,
                      size: 34,
                      iconSize: 18,
                      radius: 10,
                    ),
                    const Gap(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImshEllipsisText(
                            text: rx.displayName,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          ImshEllipsisText(
                            text:
                                '${rx.frequencyLabel} · ${rx.daysRemaining} days left',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      _expanded ? Icons.expand_less : Icons.expand_more,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
            ),
            if (_expanded) _PrescriptionDoseList(prescriptionId: rx.id),
          ],
        ),
      ),
    );
  }
}

class _PrescriptionDoseList extends ConsumerWidget {
  const _PrescriptionDoseList({required this.prescriptionId});

  final String prescriptionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final dosesAsync = ref.watch(prescriptionDosesProvider(prescriptionId));

    return dosesAsync.when(
      loading: () => const Padding(
        padding: EdgeInsets.all(12),
        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      ),
      error: (error, _) => Padding(
        padding: const EdgeInsets.all(10),
        child: Text(authFlowErrorMessage(error)),
      ),
      data: (response) {
        if (response.doses.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'No doses generated yet.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Column(
            children: [
              for (final dose in response.doses)
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              formatDoseDateTime(dose.scheduledAt),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                decoration:
                                    dose.status == MedicationDoseStatus.taken
                                        ? TextDecoration.lineThrough
                                        : null,
                              ),
                            ),
                            ImshEllipsisChip(
                              label: dose.status.label,
                              tone: dose.status == MedicationDoseStatus.missed
                                  ? ImshSemanticTone.error
                                  : dose.status == MedicationDoseStatus.taken
                                      ? ImshSemanticTone.success
                                      : ImshSemanticTone.neutral,
                              maxWidth: 100,
                            ),
                          ],
                        ),
                      ),
                      DoseTakenButton(
                        doseId: dose.id,
                        status: dose.status,
                        scheduledAt: dose.scheduledAt,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
