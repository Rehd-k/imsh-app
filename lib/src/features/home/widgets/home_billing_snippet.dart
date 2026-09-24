import 'package:flutter/material.dart';

import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/currency_formatter.dart';
import '../../../models/invoice_model.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';

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
    if (amount <= 0) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const ImshSolidIcon(
              icon: Icons.receipt_long_outlined,
              color: ImshAccentColors.amber,
              size: 26,
              iconSize: 14,
              radius: 7,
            ),
            const SizedBox(width: 8),
            Text(
              'Billing',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ImshSurfaceCard(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              const ImshSolidIcon(
                icon: Icons.payments_outlined,
                color: ImshAccentColors.amber,
                size: 30,
                iconSize: 16,
                radius: 8,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Outstanding balance',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: cs.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ImshEllipsisText(
                      text: CurrencyFormatter.formatAmount(
                        summary.totalOutstanding,
                      ),
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w800,
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
    );
  }
}
