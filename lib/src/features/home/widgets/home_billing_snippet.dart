import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../helper/currency_formatter.dart';
import '../../../models/invoice_model.dart';

class HomeBillingSnippet extends StatelessWidget {
  const HomeBillingSnippet({
    super.key,
    required this.summary,
    required this.onPayBill,
  });

  final BillingSummaryResponse summary;
  final VoidCallback onPayBill;

  @override
  Widget build(BuildContext context) {
    final amount = double.tryParse(summary.totalOutstanding) ?? 0;
    if (amount <= 0) {
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
          Text(
            'Billing',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const Gap(AppDesignTokens.spacingMd),
          Container(
            padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
            decoration: BoxDecoration(
              color: colorScheme.errorContainer.withValues(alpha: 0.35),
              borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
              border: Border.all(color: colorScheme.outlineVariant),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.receipt_long_outlined,
                  color: colorScheme.error,
                ),
                const Gap(AppDesignTokens.spacingMd),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Outstanding balance',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        CurrencyFormatter.formatAmount(summary.totalOutstanding),
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                FilledButton(
                  onPressed: onPayBill,
                  child: const Text('Pay'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
