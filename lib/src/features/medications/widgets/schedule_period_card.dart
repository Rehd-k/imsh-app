import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../helper/app_timezone.dart';
import '../../../models/medication_model.dart';

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
    final displayName = '${entry.drugName} ${entry.dosage}';

    return Container(
      margin: const EdgeInsets.only(bottom: AppDesignTokens.spacingSm),
      padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
        border: Border.all(
          color: isHighlighted
              ? colorScheme.primary
              : colorScheme.outlineVariant,
        ),
        boxShadow: isHighlighted ? null : context.cardShadow,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isHighlighted)
            Container(
              width: 4,
              height: 48,
              margin: const EdgeInsets.only(right: AppDesignTokens.spacingMd),
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      entry.timeOfDay.icon,
                      size: 18,
                      color: isHighlighted
                          ? colorScheme.primary
                          : colorScheme.onSurfaceVariant,
                    ),
                    const Gap(AppDesignTokens.spacingSm),
                    Text(
                      entry.timeOfDay.label,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isHighlighted
                            ? colorScheme.primary
                            : colorScheme.onSurface,
                      ),
                    ),
                    const Spacer(),
                    if (isTaken)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDesignTokens.spacingSm,
                          vertical: AppDesignTokens.spacingXs,
                        ),
                        decoration: BoxDecoration(
                          color: context.imshTheme.primaryHighlight
                              .withValues(alpha: 0.15),
                          borderRadius:
                              BorderRadius.circular(AppDesignTokens.radiusSm),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.check,
                              size: 14,
                              color: colorScheme.primary,
                            ),
                            const Gap(4),
                            Text(
                              'Taken',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      )
                    else if (entry.status == MedicationDoseStatus.upcoming &&
                        isHighlighted)
                      Text(
                        'Upcoming',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ],
                ),
                const Gap(AppDesignTokens.spacingSm),
                Text(
                  displayName,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight:
                        isHighlighted ? FontWeight.w700 : FontWeight.w500,
                    color: isHighlighted
                        ? colorScheme.primary
                        : colorScheme.onSurface,
                    decoration: isTaken ? TextDecoration.lineThrough : null,
                    decorationColor: colorScheme.onSurfaceVariant,
                  ),
                ),
                const Gap(AppDesignTokens.spacingXs),
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
    );
  }
}
