import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../helper/currency_formatter.dart';

class OutstandingBalanceCard extends StatelessWidget {
  const OutstandingBalanceCard({
    super.key,
    required this.totalOutstanding,
    required this.onPayNow,
    required this.onViewBreakdown,
  });

  final String totalOutstanding;
  final VoidCallback onPayNow;
  final VoidCallback onViewBreakdown;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDesignTokens.spacingLg),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primaryContainer,
            colorScheme.primary,
          ],
        ),
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
        boxShadow: context.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TOTAL OUTSTANDING BALANCE',
            style: theme.textTheme.labelSmall?.copyWith(
              color: colorScheme.onPrimary.withValues(alpha: 0.85),
              letterSpacing: 0.8,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(AppDesignTokens.spacingSm),
          Text(
            CurrencyFormatter.formatAmount(totalOutstanding),
            style: theme.textTheme.headlineMedium?.copyWith(
              color: colorScheme.onPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Gap(AppDesignTokens.spacingLg),
          Row(
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: onPayNow,
                  style: FilledButton.styleFrom(
                    backgroundColor: colorScheme.onPrimary,
                    foregroundColor: colorScheme.primary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppDesignTokens.radiusMd,
                      ),
                    ),
                  ),
                  child: const Text('Pay Now'),
                ),
              ),
              const Gap(AppDesignTokens.spacingMd),
              Expanded(
                child: OutlinedButton(
                  onPressed: onViewBreakdown,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: colorScheme.onPrimary,
                    side: BorderSide(
                      color: colorScheme.onPrimary.withValues(alpha: 0.7),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppDesignTokens.radiusMd,
                      ),
                    ),
                  ),
                  child: const Text('View Breakdown'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
