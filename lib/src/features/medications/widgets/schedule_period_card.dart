import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/app_timezone.dart';
import '../../../models/medication_model.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_semantic_badge.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';

class SchedulePeriodCard extends StatelessWidget {
  const SchedulePeriodCard({
    super.key,
    required this.entry,
    required this.isHighlighted,
  });

  final MedicationScheduleEntry entry;
  final bool isHighlighted;

  String _formatTime(DateTime date) {
    return DateFormat('h:mm a').format(AppTimezone.toLocal(date));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isTaken = entry.status == MedicationDoseStatus.taken;
    final isMissed = entry.status == MedicationDoseStatus.missed;
    final displayName = '${entry.drugName} ${entry.dosage}';
    final accent = isMissed
        ? ImshAccentColors.amber
        : isTaken
            ? ImshAccentColors.green
            : isHighlighted
                ? ImshAccentColors.teal
                : ImshAccentColors.blue;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ImshSurfaceCard(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImshSolidIcon(
              icon: entry.timeOfDay.icon,
              color: accent,
              size: 34,
              iconSize: 18,
              radius: 10,
            ),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          entry.timeOfDay.label,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      if (isTaken)
                        const ImshEllipsisChip(
                          label: 'Taken',
                          tone: ImshSemanticTone.success,
                          maxWidth: 80,
                        )
                      else if (isMissed)
                        const ImshEllipsisChip(
                          label: 'Missed',
                          tone: ImshSemanticTone.error,
                          maxWidth: 80,
                        )
                      else if (isHighlighted)
                        const ImshEllipsisChip(
                          label: 'Upcoming',
                          tone: ImshSemanticTone.info,
                          maxWidth: 90,
                        ),
                    ],
                  ),
                  const Gap(6),
                  ImshEllipsisText(
                    text: displayName,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight:
                          isHighlighted ? FontWeight.w700 : FontWeight.w500,
                      decoration: isTaken ? TextDecoration.lineThrough : null,
                      decorationColor: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const Gap(2),
                  Text(
                    _formatTime(entry.scheduledAt),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
