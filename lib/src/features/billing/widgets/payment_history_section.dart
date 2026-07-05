import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../models/invoice_model.dart';
import 'payment_history_row.dart';

class PaymentHistorySection extends StatelessWidget {
  const PaymentHistorySection({
    super.key,
    required this.payments,
    required this.hasMore,
    required this.isLoadingMore,
    required this.onLoadMore,
  });

  final List<PaymentHistoryItem> payments;
  final bool hasMore;
  final bool isLoadingMore;
  final VoidCallback onLoadMore;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Payment History',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.filter_list, size: 18),
              label: const Text('Filter'),
              style: OutlinedButton.styleFrom(
                visualDensity: VisualDensity.compact,
                padding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
          ],
        ),
        const Gap(AppDesignTokens.spacingSm),
        if (payments.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDesignTokens.spacingLg,
            ),
            child: Text(
              'No payments recorded yet.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          )
        else ...[
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Date',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  'Service',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'Amount',
                  textAlign: TextAlign.end,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 24),
          ...payments.map(
            (payment) => PaymentHistoryRow(
              payment: payment,
              onTap: () => context.router.push(
                ReceiptViewerRoute(id: payment.id),
              ),
            ),
          ),
        ],
        if (hasMore) ...[
          const Gap(AppDesignTokens.spacingSm),
          Center(
            child: isLoadingMore
                ? const Padding(
                    padding: EdgeInsets.all(AppDesignTokens.spacingMd),
                    child: CircularProgressIndicator(),
                  )
                : TextButton(
                    onPressed: onLoadMore,
                    child: const Text('Load More Transactions'),
                  ),
          ),
        ],
      ],
    );
  }
}
