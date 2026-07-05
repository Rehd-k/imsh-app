import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../models/medication_model.dart';
import '../../../providers/medications_provider.dart';

class PrescriptionCard extends ConsumerWidget {
  const PrescriptionCard({
    super.key,
    required this.prescription,
  });

  final ActivePrescriptionSummary prescription;

  static const _lowSupplyThreshold = 7;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isLow = prescription.supplyStatus == PrescriptionSupplyStatus.low ||
        prescription.daysRemaining <= _lowSupplyThreshold;
    final refillNotifier = ref.watch(requestRefillProvider.notifier);
    final isRequesting = ref.watch(requestRefillProvider).maybeWhen(
          data: (inFlight) => inFlight.contains(prescription.id),
          orElse: () => false,
        );

    return Container(
      margin: const EdgeInsets.only(bottom: AppDesignTokens.spacingSm),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
        border: Border.all(color: colorScheme.outlineVariant),
        boxShadow: context.cardShadow,
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLow)
              Container(
                width: 4,
                decoration: BoxDecoration(
                  color: colorScheme.error,
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(AppDesignTokens.radiusMd),
                  ),
                ),
              ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: isLow
                            ? colorScheme.errorContainer.withValues(alpha: 0.5)
                            : colorScheme.surfaceContainer,
                        borderRadius:
                            BorderRadius.circular(AppDesignTokens.radiusSm),
                      ),
                      child: Icon(
                        Icons.medication_outlined,
                        color: isLow
                            ? colorScheme.error
                            : colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const Gap(AppDesignTokens.spacingMd),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            prescription.displayName,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Gap(AppDesignTokens.spacingXs),
                          Text.rich(
                            TextSpan(
                              text: '${prescription.frequencyLabel} • ',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                              children: [
                                TextSpan(
                                  text: isLow
                                      ? '${prescription.daysRemaining} days left'
                                      : '${prescription.daysRemaining} days left',
                                  style: TextStyle(
                                    color: isLow
                                        ? colorScheme.error
                                        : colorScheme.onSurfaceVariant,
                                    fontWeight: isLow
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Gap(AppDesignTokens.spacingSm),
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(AppDesignTokens.radiusSm),
                            child: LinearProgressIndicator(
                              value: prescription.supplyProgress.clamp(0.0, 1.0),
                              minHeight: 6,
                              backgroundColor: colorScheme.surfaceContainer,
                              color: colorScheme.primary,
                            ),
                          ),
                          const Gap(AppDesignTokens.spacingXs),
                          Text(
                            '${prescription.refillsRemaining} refills remaining',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          if (isLow) ...[
                            const Gap(AppDesignTokens.spacingSm),
                            OutlinedButton.icon(
                              onPressed: isRequesting
                                  ? null
                                  : () => refillNotifier
                                      .requestRefill(prescription.id),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: colorScheme.primary,
                                side: BorderSide(
                                  color: colorScheme.primary
                                      .withValues(alpha: 0.4),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppDesignTokens.spacingMd,
                                  vertical: AppDesignTokens.spacingSm,
                                ),
                              ),
                              icon: isRequesting
                                  ? SizedBox(
                                      width: 16,
                                      height: 16,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: colorScheme.primary,
                                      ),
                                    )
                                  : const Icon(Icons.refresh, size: 16),
                              label: Text(
                                isRequesting
                                    ? 'Requesting...'
                                    : 'Request Refill',
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
