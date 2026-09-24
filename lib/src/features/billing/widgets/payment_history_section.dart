import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';

import '../../../core/theme/imsh_accent_colors.dart';
import '../../../models/invoice_model.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_empty_state.dart';
import '../../../shared/widgets/imsh_filter_row.dart';
import '../../../shared/widgets/imsh_surface_card.dart';
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
    final cs = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const ImshSectionHeader(
          title: 'Payment history',
          icon: Icons.history,
          iconColor: ImshAccentColors.indigo,
        ),
        const Gap(10),
        ImshFilterRow(
          overflowTooltip: 'Payment filters',
          overflowItems: [
            PopupMenuItem(
              enabled: false,
              child: Text(
                'Filters coming soon',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: cs.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
        const Gap(10),
        if (payments.isEmpty)
          const ImshEmptyState(
            message: 'No payments recorded yet.',
            icon: Icons.payments_outlined,
            iconColor: ImshAccentColors.indigo,
          )
        else
          ImshSurfaceCard(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 4),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Date',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: cs.onSurfaceVariant,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        'Service',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: cs.onSurfaceVariant,
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
                          color: cs.onSurfaceVariant,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(height: 16),
                ...payments.map(
                  (payment) => PaymentHistoryRow(
                    payment: payment,
                    onTap: () => context.router.push(
                      ReceiptViewerRoute(id: payment.id),
                    ),
                  ),
                ),
              ],
            ),
          ),
        if (hasMore) ...[
          const Gap(8),
          Center(
            child: isLoadingMore
                ? const Padding(
                    padding: EdgeInsets.all(12),
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : TextButton(
                    onPressed: onLoadMore,
                    child: const Text('Load more'),
                  ),
          ),
        ],
      ],
    );
  }
}
