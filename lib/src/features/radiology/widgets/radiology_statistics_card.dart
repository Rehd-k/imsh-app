import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../models/radiology_report_model.dart';

class RadiologyStatisticsCard extends StatelessWidget {
  const RadiologyStatisticsCard({super.key, required this.statistics});

  final RadiologyStatistics statistics;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;
    final completeness = statistics.profileCompleteness.clamp(0, 100);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Scan Statistics',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(AppDesignTokens.spacingMd),
          _StatRow(
            icon: Icons.image_search_outlined,
            label: 'Total Scans',
            value: '${statistics.totalScans}',
          ),
          const Gap(AppDesignTokens.spacingSm),
          _StatRow(
            icon: Icons.hourglass_empty_outlined,
            label: 'Pending Reviews',
            value: '${statistics.pendingReviews}',
          ),
          const Gap(AppDesignTokens.spacingMd),
          Text(
            'Health Record Completeness: $completeness%',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Gap(AppDesignTokens.spacingSm),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDesignTokens.radiusSm),
            child: LinearProgressIndicator(
              value: completeness / 100,
              minHeight: 8,
              backgroundColor: colorScheme.surfaceContainerHighest,
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return Row(
      children: [
        Icon(icon, size: 20, color: colorScheme.onSurfaceVariant),
        const Gap(AppDesignTokens.spacingSm),
        Expanded(
          child: Text(
            label,
            style: theme.textTheme.bodyMedium,
          ),
        ),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
