import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/app_timezone.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_semantic_badge.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';

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
    final cs = theme.colorScheme;

    if (nextDueDate == null) {
      return const SizedBox.shrink();
    }

    final localDate = AppTimezone.toLocal(nextDueDate!);
    final formattedDate = DateFormat('MMM d, yyyy').format(localDate);
    final isUrgent = daysUntilDue <= 7;

    return ImshSurfaceCard(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          ImshSolidIcon(
            icon: Icons.event_outlined,
            color: isUrgent ? ImshAccentColors.amber : ImshAccentColors.blue,
            size: 30,
            iconSize: 16,
            radius: 8,
          ),
          const Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Next due date',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: cs.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  formattedDate,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          if (isUrgent)
            ImshEllipsisChip(
              label:
                  '$daysUntilDue day${daysUntilDue == 1 ? '' : 's'} left',
              tone: ImshSemanticTone.warning,
              maxWidth: 120,
            ),
        ],
      ),
    );
  }
}
