import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';

import '../../../core/theme/imsh_accent_colors.dart';
import '../../../models/invoice_model.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_empty_state.dart';
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
    if (invoices.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ImshSectionHeader(
            title: 'Unpaid bills',
            icon: Icons.receipt_long_outlined,
            iconColor: ImshAccentColors.amber,
          ),
          const Gap(10),
          const ImshEmptyState(
            title: 'No outstanding bills',
            message: 'You have no unpaid invoices right now.',
            icon: Icons.check_circle_outline,
            iconColor: ImshAccentColors.green,
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ImshSectionHeader(
          title: 'Unpaid bills',
          icon: Icons.receipt_long_outlined,
          iconColor: ImshAccentColors.amber,
          trailing: totalCount > invoices.length
              ? TextButton(
                  onPressed: onViewAll,
                  child: const Text('View all'),
                )
              : null,
        ),
        const Gap(10),
        ...invoices.map(
          (invoice) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
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
