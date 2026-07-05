import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../helper/currency_formatter.dart';
import '../../../models/invoice_model.dart';

class BreakdownCategorySection extends StatelessWidget {
  const BreakdownCategorySection({
    super.key,
    required this.category,
  });

  final BreakdownCategory category;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: AppDesignTokens.spacingMd),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Theme(
        data: theme.copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: true,
          tilePadding: const EdgeInsets.symmetric(
            horizontal: AppDesignTokens.spacingMd,
            vertical: AppDesignTokens.spacingXs,
          ),
          childrenPadding: const EdgeInsets.fromLTRB(
            AppDesignTokens.spacingMd,
            0,
            AppDesignTokens.spacingMd,
            AppDesignTokens.spacingMd,
          ),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  category.label,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                CurrencyFormatter.formatAmount(category.balance),
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: category.balance != '0.00'
                      ? colorScheme.error
                      : colorScheme.onSurface,
                ),
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              'Paid ${CurrencyFormatter.formatAmount(category.amountPaid)} of ${CurrencyFormatter.formatAmount(category.subtotal)}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          children: category.items
              .map((item) => _BreakdownLineRow(item: item))
              .toList(),
        ),
      ),
    );
  }
}

class _BreakdownLineRow extends StatelessWidget {
  const _BreakdownLineRow({required this.item});

  final BreakdownLineItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppDesignTokens.spacingMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  item.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                CurrencyFormatter.formatAmount(item.lineTotal),
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          if (item.usageSummary != null) ...[
            const Gap(2),
            Text(
              item.usageSummary!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ] else if (!item.isRecurringDaily && item.quantity > 1) ...[
            const Gap(2),
            Text(
              '${item.quantity} × ${CurrencyFormatter.formatAmount(item.unitPrice)}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
          if (item.balance != '0.00' && item.amountPaid != '0.00') ...[
            const Gap(2),
            Text(
              'Paid ${CurrencyFormatter.formatAmount(item.amountPaid)} • Balance ${CurrencyFormatter.formatAmount(item.balance)}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.primary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
