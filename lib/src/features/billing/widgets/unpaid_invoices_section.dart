import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../models/invoice_model.dart';
import 'unpaid_invoice_card.dart';

class UnpaidInvoicesSection extends StatelessWidget {
  const UnpaidInvoicesSection({
    super.key,
    required this.invoices,
    required this.totalCount,
    required this.onViewAll,
  });

  final List<InvoiceSummary> invoices;
  final int totalCount;
  final VoidCallback onViewAll;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (invoices.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Unpaid Consultations',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const Gap(AppDesignTokens.spacingMd),
          Container(
            padding: const EdgeInsets.all(AppDesignTokens.spacingLg),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
            ),
            child: Text(
              'You have no outstanding bills.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Unpaid Consultations',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            if (totalCount > invoices.length)
              TextButton(
                onPressed: onViewAll,
                child: const Text('View all →'),
              ),
          ],
        ),
        const Gap(AppDesignTokens.spacingSm),
        ...invoices.map(
          (invoice) => Padding(
            padding: const EdgeInsets.only(bottom: AppDesignTokens.spacingMd),
            child: UnpaidInvoiceCard(
              invoice: invoice,
              onTap: () => context.router.push(
                BillDetailRoute(id: invoice.id),
              ),
              onReceiptTap: () => context.router.push(
                BillDetailRoute(id: invoice.id),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
