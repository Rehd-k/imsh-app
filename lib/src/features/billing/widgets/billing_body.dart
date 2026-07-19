import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../models/invoice_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/billing_provider.dart';
import '../../../providers/service_providers.dart';
import '../../../shared/widgets/imsh_sliver_app_bar.dart';
import '../../../shared/widgets/imsh_page_header.dart';
import 'billing_support_card.dart';
import 'next_due_date_card.dart';
import 'outstanding_balance_card.dart';
import 'payment_history_section.dart';
import 'unpaid_invoices_section.dart';

class BillingBody extends ConsumerStatefulWidget {
  const BillingBody({super.key});

  @override
  ConsumerState<BillingBody> createState() => _BillingBodyState();
}

class _BillingBodyState extends ConsumerState<BillingBody> {
  List<PaymentHistoryItem>? _payments;
  int _paymentsPage = 1;
  int _paymentsTotal = 0;
  bool _loadingMorePayments = false;

  @override
  Widget build(BuildContext context) {
    final dashboardAsync = ref.watch(billingDashboardProvider);

    return dashboardAsync.when(
      loading: () => const _BillingSkeleton(),
      error: (error, _) => _BillingError(
        message: authFlowErrorMessage(error),
        onRetry: () => ref.invalidate(billingDashboardProvider),
      ),
      data: (dashboard) {
        final payments = _payments ?? dashboard.recentPayments;
        final paymentsTotal =
            _paymentsTotal > 0 ? _paymentsTotal : dashboard.paymentsTotal;

        return RefreshIndicator(
          onRefresh: () async {
            setState(() {
              _payments = null;
              _paymentsPage = 1;
              _paymentsTotal = 0;
            });
            ref.invalidate(billingDashboardProvider);
            await ref.read(billingDashboardProvider.future);
          },
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              const ImshSliverAppBar(),
              SliverPadding(
                padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const ImshPageHeader(
                        title: 'Billing & Receipts',
                        subtitle:
                            'Manage your medical expenses and download digital receipts.',
                      ),
                      const Gap(AppDesignTokens.spacingLg),
                      OutstandingBalanceCard(
                        totalOutstanding: dashboard.summary.totalOutstanding,
                        onPayNow: () => _onPayNow(context),
                        onViewBreakdown: () => _onViewBreakdown(
                          context,
                          dashboard.unpaidInvoices,
                        ),
                      ),
                      const Gap(AppDesignTokens.spacingMd),
                      NextDueDateCard(
                        nextDueDate: dashboard.summary.nextDueDate,
                        daysUntilDue: dashboard.summary.daysUntilDue,
                      ),
                      const Gap(AppDesignTokens.spacingLg),
                      UnpaidInvoicesSection(
                        invoices: dashboard.unpaidInvoices,
                        totalCount: dashboard.unpaidTotal,
                        onViewAll: () => context.router.push(const BillsRoute()),
                      ),
                      const Gap(AppDesignTokens.spacingLg),
                      PaymentHistorySection(
                        payments: payments,
                        hasMore: payments.length < paymentsTotal,
                        isLoadingMore: _loadingMorePayments,
                        onLoadMore: () => _loadMorePayments(
                          payments,
                          paymentsTotal,
                        ),
                      ),
                      const Gap(AppDesignTokens.spacingLg),
                      const BillingSupportCard(),
                      const Gap(AppDesignTokens.spacingLg),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onPayNow(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Online payment is coming soon. Please visit the hospital billing desk or call 0800-IBOM-BILL.',
        ),
      ),
    );
  }

  void _onViewBreakdown(
    BuildContext context,
    List<InvoiceSummary> unpaidInvoices,
  ) {
    if (unpaidInvoices.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You have no outstanding bills.')),
      );
      return;
    }

    final inpatient = unpaidInvoices.where(
      (invoice) => invoice.billType == BillType.inpatient,
    );
    final target = inpatient.isNotEmpty ? inpatient.first : unpaidInvoices.first;
    context.router.push(BillDetailRoute(id: target.id));
  }

  Future<void> _loadMorePayments(
    List<PaymentHistoryItem> current,
    int total,
  ) async {
    if (_loadingMorePayments || current.length >= total) return;
    setState(() {
      _loadingMorePayments = true;
      _payments ??= List.of(current);
    });

    try {
      final service = ref.read(billingServiceProvider);
      final nextPage = _paymentsPage + 1;
      final response = await service.listPayments(
        page: nextPage,
        limit: billingPaymentsPageSize,
      );
      if (!mounted) return;
      setState(() {
        _paymentsPage = nextPage;
        _paymentsTotal = response.total > 0
            ? response.total
            : (_payments ?? current).length + response.data.length;
        _payments = [...(_payments ?? current), ...response.data];
        _loadingMorePayments = false;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() => _loadingMorePayments = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(authFlowErrorMessage(error))),
      );
    }
  }
}

class _BillingSkeleton extends StatelessWidget {
  const _BillingSkeleton();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Skeletonizer(
      child: CustomScrollView(
        slivers: [
          const ImshSliverAppBar(),
          SliverPadding(
            padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ImshPageHeader(
                    title: 'Billing & Receipts',
                    subtitle:
                        'Manage your medical expenses and download digital receipts.',
                  ),
                  const Gap(AppDesignTokens.spacingLg),
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainer,
                      borderRadius:
                          BorderRadius.circular(AppDesignTokens.radiusLg),
                    ),
                  ),
                  const Gap(AppDesignTokens.spacingMd),
                  Container(
                    height: 72,
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainer,
                      borderRadius:
                          BorderRadius.circular(AppDesignTokens.radiusMd),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BillingError extends StatelessWidget {
  const _BillingError({
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        const ImshSliverAppBar(),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(AppDesignTokens.spacing2xl),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error_outline, size: 48, color: theme.colorScheme.error),
                  const Gap(AppDesignTokens.spacingMd),
                  Text(message, textAlign: TextAlign.center),
                  const Gap(AppDesignTokens.spacingMd),
                  FilledButton(onPressed: onRetry, child: const Text('Try again')),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
