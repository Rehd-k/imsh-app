import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../helper/app_timezone.dart';

class NextDueDateCard extends StatelessWidget {
  const NextDueDateCard({
    super.key,
    required this.nextDueDate,
    required this.daysUntilDue,
  });

  final DateTime? nextDueDate;
  final int daysUntilDue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (nextDueDate == null) {
      return const SizedBox.shrink();
    }

    final localDate = AppTimezone.toLocal(nextDueDate!);
    final formattedDate = DateFormat('MMM d, yyyy').format(localDate);
    final isUrgent = daysUntilDue <= 7;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Next Due Date',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const Gap(AppDesignTokens.spacingXs),
                Text(
                  formattedDate,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          if (isUrgent)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  size: 18,
                  color: colorScheme.error,
                ),
                const Gap(AppDesignTokens.spacingXs),
                Text(
                  '$daysUntilDue day${daysUntilDue == 1 ? '' : 's'} remaining',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
