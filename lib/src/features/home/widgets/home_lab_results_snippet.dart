import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../models/medical_records_dashboard_model.dart';

class HomeLabResultsSnippet extends StatelessWidget {
  const HomeLabResultsSnippet({
    super.key,
    required this.results,
    this.onViewTrends,
  });

  final List<DashboardLabResult> results;
  final VoidCallback? onViewTrends;

  @override
  Widget build(BuildContext context) {
    if (results.isEmpty) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDesignTokens.containerPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                'Recent Lab Results',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              if (onViewTrends != null)
                TextButton(
                  onPressed: onViewTrends,
                  child: const Text('Trends'),
                ),
            ],
          ),
          const Gap(AppDesignTokens.spacingMd),
          for (final result in results) ...[
            Material(
              color: colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
              child: InkWell(
                borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
                onTap: () {
                  if (result.testName.trim().isNotEmpty) {
                    context.router.push(
                      LabTrendRoute(analyte: result.testName),
                    );
                  } else {
                    onViewTrends?.call();
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppDesignTokens.radiusMd),
                    border: Border.all(color: colorScheme.outlineVariant),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              result.testName,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            if (result.result != null) ...[
                              const Gap(2),
                              Text(
                                result.result!,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      if (result.status != null && result.status!.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDesignTokens.spacingSm,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: context.imshTheme.successContainer,
                            borderRadius: BorderRadius.circular(
                              AppDesignTokens.radiusSm,
                            ),
                          ),
                          child: Text(
                            result.status!,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: context.imshTheme.onSuccessContainer,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            if (result != results.last) const Gap(AppDesignTokens.spacingSm),
          ],
        ],
      ),
    );
  }
}
