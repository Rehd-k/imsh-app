import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../core/theme/status_badge_colors.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/appointment_model.dart';

class ConsultationResultBadge extends StatelessWidget {
  const ConsultationResultBadge({super.key, required this.status});

  final ConsultationResultStatus status;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final (background, foreground) =
        status.consultationBadgeColors(colorScheme, context.imshTheme);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDesignTokens.spacingSm + 4,
        vertical: AppDesignTokens.spacingXs,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        status.label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: foreground,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}

class ConsultationHistoryTile extends StatelessWidget {
  const ConsultationHistoryTile({
    super.key,
    required this.item,
    required this.onTap,
  });

  final ConsultationHistoryItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;
    final subtitle = item.subtitleLine;
    final dateLabel = DateFormatter.medicalDate(item.visitedAt);

    return Padding(
      padding: const EdgeInsets.only(bottom: AppDesignTokens.spacingSm),
      child: Material(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
          child: Padding(
            padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius:
                        BorderRadius.circular(AppDesignTokens.radiusSm),
                  ),
                  child: Icon(
                    _iconForTitle(item.title),
                    size: 20,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const Gap(AppDesignTokens.spacingMd),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      if (subtitle.isNotEmpty) ...[
                        const Gap(2),
                        Text(
                          '$subtitle • $dateLabel',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ] else ...[
                        const Gap(2),
                        Text(
                          dateLabel,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                ConsultationResultBadge(status: item.resultStatus),
                const Gap(AppDesignTokens.spacingXs),
                Icon(
                  Icons.chevron_right,
                  color: colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _iconForTitle(String title) {
    final lower = title.toLowerCase();
    if (lower.contains('lab')) return Icons.biotech_outlined;
    if (lower.contains('checkup') || lower.contains('general')) {
      return Icons.medical_information_outlined;
    }
    return Icons.assignment_outlined;
  }
}
