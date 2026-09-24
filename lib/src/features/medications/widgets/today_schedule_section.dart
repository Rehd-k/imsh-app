import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/imsh_accent_colors.dart';
import '../../../models/medication_model.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import 'schedule_period_card.dart';

class TodayScheduleSection extends StatelessWidget {
  const TodayScheduleSection({
    super.key,
    required this.schedule,
  });

  final List<MedicationScheduleEntry> schedule;

  @override
  Widget build(BuildContext context) {
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
        const ImshSectionHeader(
          title: "Today's schedule",
          icon: Icons.today_outlined,
          iconColor: ImshAccentColors.teal,
        ),
        const Gap(10),
        for (final entry in sorted)
          SchedulePeriodCard(
            entry: entry,
            isHighlighted: entry.id == highlightedId,
          ),
      ],
    );
  }
}
