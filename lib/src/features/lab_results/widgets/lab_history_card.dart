import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/lab_result_model.dart';
import '../../../providers/lab_results_provider.dart';
import 'lab_result_status_badge.dart';

class LabHistoryCard extends StatelessWidget {
  const LabHistoryCard({
    super.key,
    required this.result,
  });

  final LabResultSummary result;

  IconData _iconForTest() {
    final name = result.testNames.join(' ').toLowerCase();
    if (name.contains('x-ray') ||
        name.contains('xray') ||
        name.contains('chest') ||
        name.contains('radiograph')) {
      return Icons.monitor_heart_outlined;
    }
    if (name.contains('thyroid') ||
        name.contains('tft') ||
        name.contains('micro')) {
      return Icons.biotech_outlined;
    }
    if (name.contains('blood') ||
        name.contains('cbc') ||
        name.contains('lipid') ||
        name.contains('hemoglobin')) {
      return Icons.water_drop_outlined;
    }
    return Icons.science_outlined;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;
    final pending = isLabOrderPending(result);
    final showChevron = !pending && result.isOrderComplete;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppDesignTokens.spacingSm),
      child: Material(
        color: colorScheme.surfaceContainerLowest,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
          side: BorderSide(color: colorScheme.outlineVariant),
        ),
        child: InkWell(
          onTap: () => context.router.push(LabResultDetailRoute(id: result.id)),
          borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
              boxShadow: context.cardShadow,
            ),
            padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: pending
                        ? colorScheme.surfaceContainer
                        : theme.colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius:
                        BorderRadius.circular(AppDesignTokens.radiusSm),
                  ),
                  child: Icon(
                    _iconForTest(),
                    color: pending
                        ? colorScheme.onSurfaceVariant
                        : theme.colorScheme.primary,
                    size: 22,
                  ),
                ),
                const Gap(AppDesignTokens.spacingMd),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        result.displayTitle,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (result.additionalTestsLabel != null) ...[
                        const Gap(AppDesignTokens.spacingXs),
                        Text(
                          result.additionalTestsLabel!,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.primaryContainer,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                      const Gap(AppDesignTokens.spacingXs),
                      Text(
                        '${DateFormatter.medicalDate(result.orderedAt)} • Ref: ${result.referenceDisplay}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    LabResultStatusBadge(
                      status: result.summaryStatus,
                      orderStatus: result.status,
                    ),
                    if (showChevron) ...[
                      const Gap(AppDesignTokens.spacingSm),
                      Icon(
                        Icons.expand_more,
                        size: 20,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
