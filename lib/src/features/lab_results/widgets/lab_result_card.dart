import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/lab_result_model.dart';
import 'lab_result_status_badge.dart';

class LabResultCard extends StatelessWidget {
  const LabResultCard({
    super.key,
    required this.result,
    required this.onTap,
  });

  final LabResultSummary result;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppDesignTokens.spacingMd),
      child: Material(
        color: colorScheme.surfaceContainerLowest,
        elevation: 0,
        shadowColor: Colors.black.withValues(alpha: 0.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
          side: BorderSide(color: colorScheme.outlineVariant),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
              boxShadow: context.cardShadow,
            ),
            padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            result.displayTitle,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface,
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
                            DateFormatter.medicalDate(result.orderedAt),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    LabResultStatusBadge(
                      status: result.summaryStatus,
                      orderStatus: result.status,
                    ),
                  ],
                ),
                const Gap(AppDesignTokens.spacingSm),
                Text(
                  result.doctorName,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (result.status != LabOrderStatus.pending &&
                    result.status != LabOrderStatus.sampleCollected &&
                    result.status != LabOrderStatus.processing) ...[
                  const Gap(AppDesignTokens.spacingXs),
                  Text(
                    result.status.label,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
