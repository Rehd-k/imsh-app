import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../core/responsive.dart';
import '../../core/theme/app_design_tokens.dart';
import '../../core/theme/imsh_accent_colors.dart';
import '../../helper/currency_formatter.dart';
import '../../models/invoice_model.dart';
import '../../providers/auth_provider.dart';
import '../../providers/billing_provider.dart';
import '../../shared/widgets/imsh_app_bar.dart';
import '../../shared/widgets/imsh_empty_state.dart';
import '../../shared/widgets/imsh_error_panel.dart';
import '../../shared/widgets/imsh_page_header.dart';
import '../../shared/widgets/imsh_solid_icon.dart';
import '../../shared/widgets/imsh_surface_card.dart';
import 'widgets/bill_detail_body.dart';
import 'widgets/unpaid_invoice_card.dart';

@RoutePage()
class BillsScreen extends ConsumerWidget {
  const BillsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingController = ref.watch(unpaidInvoicesPagingControllerProvider);

    return Scaffold(
      appBar: ImshAppBar(title: const Text('Unpaid bills')),
      body: ResponsiveBody(
        expand: false,
        builder: (context, bp) => RefreshIndicator(
          onRefresh: () async => pagingController.refresh(),
          child: PagingListener<int, InvoiceSummary>(
            controller: pagingController,
            builder: (context, state, fetchNextPage) =>
                PagedListView<int, InvoiceSummary>(
              padding: EdgeInsets.zero,
              state: state,
              fetchNextPage: fetchNextPage,
              builderDelegate: PagedChildBuilderDelegate<InvoiceSummary>(
                itemBuilder: (context, invoice, index) => Padding(
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
                firstPageErrorIndicatorBuilder: (context) => ImshErrorPanel(
                  message: authFlowErrorMessage(
                    state.error ?? 'Unable to load bills',
                  ),
                  onRetry: pagingController.refresh,
                ),
                newPageErrorIndicatorBuilder: (context) => ImshErrorPanel(
                  message: authFlowErrorMessage(
                    state.error ?? 'Unable to load more',
                  ),
                  onRetry: fetchNextPage,
                ),
                firstPageProgressIndicatorBuilder: (context) => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(AppDesignTokens.spacing2xl),
                    child: CircularProgressIndicator(),
                  ),
                ),
                noItemsFoundIndicatorBuilder: (context) => const ImshEmptyState(
                  title: 'No unpaid bills',
                  message: 'You have no outstanding invoices.',
                  icon: Icons.check_circle_outline,
                  iconColor: ImshAccentColors.green,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

@RoutePage()
class BillDetailScreen extends ConsumerWidget {
  const BillDetailScreen({
    super.key,
    @PathParam('id') required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(invoiceDetailProvider(id));

    return Scaffold(
      appBar: ImshAppBar(title: const Text('Bill breakdown')),
      body: detailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => ImshErrorPanel(
          message: authFlowErrorMessage(error),
          onRetry: () => ref.invalidate(invoiceDetailProvider(id)),
        ),
        data: (detail) => ResponsiveBody(
          expand: false,
          builder: (context, bp) => SingleChildScrollView(
            child: BillDetailBody(detail: detail),
          ),
        ),
      ),
    );
  }
}

@RoutePage()
class ReceiptViewerScreen extends ConsumerWidget {
  const ReceiptViewerScreen({
    super.key,
    @PathParam('id') required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receiptAsync = ref.watch(receiptProvider(id));

    return Scaffold(
      appBar: ImshAppBar(title: const Text('Receipt')),
      body: receiptAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => ImshErrorPanel(
          message: authFlowErrorMessage(error),
          onRetry: () => ref.invalidate(receiptProvider(id)),
        ),
        data: (receipt) {
          final theme = Theme.of(context);
          final cs = theme.colorScheme;

          return ResponsiveBody(
            expand: false,
            builder: (context, bp) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ImshPageHeader(
                  title: 'Invoice #${receipt.invoiceNumber}',
                  subtitle: receipt.methodLabel.trim().isEmpty
                      ? '—'
                      : receipt.methodLabel,
                  icon: Icons.receipt_long_outlined,
                  iconColor: ImshAccentColors.amber,
                ),
                const Gap(12),
                ImshSurfaceCard(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      const ImshSolidIcon(
                        icon: Icons.payments_outlined,
                        color: ImshAccentColors.green,
                        size: 36,
                        iconSize: 18,
                        radius: AppDesignTokens.radiusMd,
                      ),
                      const Gap(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Amount paid',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: cs.onSurfaceVariant,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              CurrencyFormatter.formatAmount(receipt.amount),
                              style: theme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (receipt.url == null) ...[
                  const Gap(12),
                  Text(
                    'A downloadable PDF receipt will be available here soon. '
                    'Please contact billing if you need a printed copy.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
