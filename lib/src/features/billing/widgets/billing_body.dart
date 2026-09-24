import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/responsive.dart';
import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/app_timezone.dart';
import '../../../helper/currency_formatter.dart';
import '../../../models/invoice_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/billing_provider.dart';
import '../../../providers/service_providers.dart';
import '../../../shared/widgets/imsh_error_panel.dart';
import '../../../shared/widgets/imsh_kpi_tile.dart';
import '../../../shared/widgets/imsh_sliver_app_bar.dart';
import 'billing_page_header.dart';
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
  static const _sectionGap = 12.0;

  List<PaymentHistoryItem>? _payments;
  int _paymentsPage = 1;
  int _paymentsTotal = 0;
  bool _loadingMorePayments = false;

  @override
  Widget build(BuildContext context) {
    final dashboardAsync = ref.watch(billingDashboardProvider);

    return dashboardAsync.when(
      loading: () => const _BillingSkeleton(),
      error: (error, _) => CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          const ImshSliverAppBar(),
          SliverFillRemaining(
            hasScrollBody: false,
            child: ImshErrorPanel(
              message: authFlowErrorMessage(error),
              onRetry: () => ref.invalidate(billingDashboardProvider),
            ),
          ),
        ],
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
              SliverFillRemaining(
                hasScrollBody: true,
                child: ResponsiveBody(
                  expand: false,
                  center: false,
                  bottomPadding: 24,
                  builder: (context, bp) {
                    final useSnap = bp.maxWidth < 520;
                    return SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const BillingPageHeader(),
                          const Gap(_sectionGap),
                          ImshKpiStrip(
                            useSnapStrip: useSnap,
                            items: _kpiItems(dashboard),
                          ),
                          const Gap(10),
                          OutstandingBalanceCard(
                            totalOutstanding:
                                dashboard.summary.totalOutstanding,
                            onPayNow: () => _onPayNow(context),
                            onViewBreakdown: () => _onViewBreakdown(
                              context,
                              dashboard.unpaidInvoices,
                            ),
                          ),
                          if (dashboard.summary.nextDueDate != null) ...[
                            const Gap(10),
                            NextDueDateCard(
                              nextDueDate: dashboard.summary.nextDueDate,
                              daysUntilDue: dashboard.summary.daysUntilDue,
                            ),
                          ],
                          const Gap(_sectionGap),
                          UnpaidInvoicesSection(
                            invoices: dashboard.unpaidInvoices,
                            totalCount: dashboard.unpaidTotal,
                            onViewAll: () =>
                                context.router.push(const BillsRoute()),
                          ),
                          const Gap(_sectionGap),
                          PaymentHistorySection(
                            payments: payments,
                            hasMore: payments.length < paymentsTotal,
                            isLoadingMore: _loadingMorePayments,
                            onLoadMore: () => _loadMorePayments(
                              payments,
                              paymentsTotal,
                            ),
                          ),
                          const Gap(_sectionGap),
                          const BillingSupportCard(),
                          const Gap(_sectionGap),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<ImshKpiItem> _kpiItems(BillingDashboard dashboard) {
    final summary = dashboard.summary;
    final outstanding =
        CurrencyFormatter.formatAmount(summary.totalOutstanding);
    final unpaid = dashboard.unpaidTotal;
    final nextDue = summary.nextDueDate;
    final nextDueLabel = nextDue == null
        ? '—'
        : DateFormat('MMM d').format(AppTimezone.toLocal(nextDue));
    final nextDueCaption = nextDue == null
        ? 'No due date'
        : summary.daysUntilDue <= 0
            ? 'Due now'
            : '${summary.daysUntilDue} day${summary.daysUntilDue == 1 ? '' : 's'} left';

    return [
      ImshKpiItem(
        label: 'Outstanding',
        value: outstanding,
        caption: unpaid > 0
            ? '$unpaid unpaid bill${unpaid == 1 ? '' : 's'}'
            : 'All clear',
        icon: Icons.account_balance_wallet_outlined,
        accent: ImshAccentColors.amber,
      ),
      ImshKpiItem(
        label: 'Next due',
        value: nextDueLabel,
        caption: nextDueCaption,
        icon: Icons.event_outlined,
        accent: ImshAccentColors.blue,
      ),
      ImshKpiItem(
        label: 'Unpaid',
        value: unpaid > 0 ? '$unpaid' : '—',
        caption: unpaid > 0 ? 'Open invoices' : 'None open',
        icon: Icons.receipt_long_outlined,
        accent: ImshAccentColors.pink,
      ),
    ];
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
    final target =
        inpatient.isNotEmpty ? inpatient.first : unpaidInvoices.first;
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
          SliverFillRemaining(
            hasScrollBody: true,
            child: ResponsiveBody(
              expand: false,
              center: false,
              builder: (context, bp) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const BillingPageHeader(),
                  const Gap(12),
                  Container(
                    height: 72,
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainer,
                      borderRadius:
                          BorderRadius.circular(AppDesignTokens.radiusLg),
                    ),
                  ),
                  const Gap(10),
                  Container(
                    height: 56,
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
