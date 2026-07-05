import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../helper/app_timezone.dart';
import '../../../models/medication_model.dart';

class HomeMedicationsSection extends StatelessWidget {
  const HomeMedicationsSection({
    super.key,
    required this.nextDoses,
    required this.todaySchedule,
  });

  final List<MedicationDoseSummary> nextDoses;
  final List<MedicationScheduleEntry> todaySchedule;

  bool get _hasContent => nextDoses.isNotEmpty || todaySchedule.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    if (!_hasContent) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final previewDose = nextDoses.isNotEmpty ? nextDoses.first : null;
    final previewSchedule = todaySchedule.take(2).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDesignTokens.containerPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                'Medications',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => context.router.push(const MedicationsRoute()),
                child: const Text('View All'),
              ),
            ],
          ),
          if (previewDose != null) ...[
            _NextDosePreview(dose: previewDose),
            const Gap(AppDesignTokens.spacingMd),
          ],
          for (final entry in previewSchedule) ...[
            _SchedulePreviewRow(entry: entry),
            if (entry != previewSchedule.last)
              const Gap(AppDesignTokens.spacingSm),
          ],
        ],
      ),
    );
  }
}

class _NextDosePreview extends StatelessWidget {
  const _NextDosePreview({required this.dose});

  final MedicationDoseSummary dose;

  String _formatTime(DateTime date) {
    return DateFormat('h:mm a').format(AppTimezone.toLocal(date));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return Container(
      padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
        boxShadow: context.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'NEXT DOSE',
            style: theme.textTheme.labelSmall?.copyWith(
              color: colorScheme.onPrimary.withValues(alpha: 0.85),
              fontWeight: FontWeight.w600,
              letterSpacing: 0.6,
            ),
          ),
          const Gap(AppDesignTokens.spacingSm),
          Text(
            '${dose.drugName} ${dose.dosage}',
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.onPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Gap(4),
          Text(
            '${_formatTime(dose.scheduledAt)} · ${dose.instructions}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onPrimary.withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
    );
  }
}

class _SchedulePreviewRow extends StatelessWidget {
  const _SchedulePreviewRow({required this.entry});

  final MedicationScheduleEntry entry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;
    final isTaken = entry.status == MedicationDoseStatus.taken;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDesignTokens.spacingMd,
        vertical: AppDesignTokens.spacingSm,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Row(
        children: [
          Icon(
            isTaken ? Icons.check_circle : Icons.schedule_outlined,
            size: 18,
            color: isTaken
                ? context.imshTheme.onSuccessContainer
                : colorScheme.primary,
          ),
          const Gap(AppDesignTokens.spacingSm),
          Expanded(
            child: Text(
              '${entry.drugName} ${entry.dosage}',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            entry.timeOfDay.label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
