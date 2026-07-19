import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../core/theme/app_design_tokens.dart';
import '../../helper/currency_formatter.dart';
import '../../models/invoice_model.dart';
import '../../providers/auth_provider.dart';
import '../../providers/billing_provider.dart';
import '../../shared/widgets/imsh_app_bar.dart';
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
      body: RefreshIndicator(
        onRefresh: () async => pagingController.refresh(),
        child: PagedListView<int, InvoiceSummary>(
          padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
          pagingController: pagingController,
          builderDelegate: PagedChildBuilderDelegate<InvoiceSummary>(
            itemBuilder: (context, invoice, index) => Padding(
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
            firstPageErrorIndicatorBuilder: (context) => _ListError(
              message: authFlowErrorMessage(
                pagingController.error ?? 'Unable to load bills',
              ),
              onRetry: pagingController.refresh,
            ),
            newPageErrorIndicatorBuilder: (context) => _ListError(
              message: authFlowErrorMessage(
                pagingController.error ?? 'Unable to load more',
              ),
              onRetry: () => pagingController.retryLastFailedRequest(),
            ),
            firstPageProgressIndicatorBuilder: (context) => const Center(
              child: Padding(
                padding: EdgeInsets.all(AppDesignTokens.spacing2xl),
                child: CircularProgressIndicator(),
              ),
            ),
            noItemsFoundIndicatorBuilder: (context) => const Center(
              child: Padding(
                padding: EdgeInsets.all(AppDesignTokens.spacing2xl),
                child: Text('No unpaid bills.'),
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
        error: (error, _) => _ListError(
          message: authFlowErrorMessage(error),
          onRetry: () => ref.invalidate(invoiceDetailProvider(id)),
        ),
        data: (detail) => SingleChildScrollView(
          padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
          child: BillDetailBody(detail: detail),
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
        error: (error, _) => _ListError(
          message: authFlowErrorMessage(error),
          onRetry: () => ref.invalidate(receiptProvider(id)),
        ),
        data: (receipt) {
          final theme = Theme.of(context);

          return Padding(
            padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Invoice #${receipt.invoiceNumber}',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(AppDesignTokens.spacingMd),
                Text(
                  CurrencyFormatter.formatAmount(receipt.amount),
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(AppDesignTokens.spacingSm),
                Text(
                  receipt.methodLabel,
                  style: theme.textTheme.bodyLarge,
                ),
                const Gap(AppDesignTokens.spacingSm),
                if (receipt.url == null)
                  Text(
                    'A downloadable PDF receipt will be available here soon. '
                    'Please contact billing if you need a printed copy.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ListError extends StatelessWidget {
  const _ListError({
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDesignTokens.spacing2xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, textAlign: TextAlign.center),
            const Gap(AppDesignTokens.spacingMd),
            FilledButton(onPressed: onRetry, child: const Text('Try again')),
          ],
        ),
      ),
    );
  }
}
