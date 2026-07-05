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

class LabLatestCard extends StatelessWidget {
  const LabLatestCard({
    super.key,
    required this.result,
  });

  final LabResultSummary result;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;
    final pending = isLabOrderPending(result);

    return Material(
      color: colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.router.push(LabResultDetailRoute(id: result.id)),
        child: Padding(
          padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'LATEST RESULT',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onPrimaryContainer
                          .withValues(alpha: 0.75),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.6,
                    ),
                  ),
                  const Spacer(),
                  LabResultStatusBadge(
                    status: result.summaryStatus,
                    orderStatus: result.status,
                    onPrimary: true,
                  ),
                ],
              ),
              const Gap(AppDesignTokens.spacingMd),
              Text(
                result.displayTitle,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
              const Gap(AppDesignTokens.spacingSm),
              Text(
                'Requested: ${DateFormatter.medicalDate(result.orderedAt)}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
                ),
              ),
              const Gap(AppDesignTokens.spacingSm),
              Text(
                'Summary: ${result.summaryMessage}',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
              const Gap(AppDesignTokens.spacingMd),
              Align(
                alignment: Alignment.centerRight,
                child: Material(
                  color: colorScheme.onPrimaryContainer.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(AppDesignTokens.radiusSm),
                  child: InkWell(
                    onTap: () => context.router.push(
                      LabResultDetailRoute(id: result.id),
                    ),
                    borderRadius:
                        BorderRadius.circular(AppDesignTokens.radiusSm),
                    child: Padding(
                      padding: const EdgeInsets.all(AppDesignTokens.spacingSm),
                      child: Icon(
                        pending ? Icons.hourglass_empty : Icons.arrow_forward,
                        color: colorScheme.onPrimaryContainer,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
