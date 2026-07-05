import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../models/medication_model.dart';
import 'schedule_period_card.dart';

class TodayScheduleSection extends StatelessWidget {
  const TodayScheduleSection({
    super.key,
    required this.schedule,
  });

  final List<MedicationScheduleEntry> schedule;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (schedule.isEmpty) {
      return const SizedBox.shrink();
    }

    final sorted = [...schedule]
      ..sort((a, b) => a.scheduledAt.compareTo(b.scheduledAt));

    final highlightedId = sorted
        .where((e) => e.status == MedicationDoseStatus.upcoming)
        .map((e) => e.id)
        .firstOrNull;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today's Schedule",
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const Gap(AppDesignTokens.spacingMd),
        for (final entry in sorted)
          SchedulePeriodCard(
            entry: entry,
            isHighlighted: entry.id == highlightedId,
          ),
      ],
    );
  }
}
