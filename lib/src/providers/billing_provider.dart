import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../models/invoice_model.dart';
import 'auth_provider.dart';
import 'service_providers.dart';

const billingPaymentsPageSize = 5;
const billingInvoicesPageSize = 20;

final billingDashboardProvider = FutureProvider.autoDispose<BillingDashboard>((
  ref,
) async {
  final service = ref.watch(billingServiceProvider);
  final summary = await service.getBillingSummary();
  final unpaid = await service.listInvoices(
    page: 1,
    limit: 5,
    status: 'UNPAID',
  );
  final payments = await service.listPayments(
    page: 1,
    limit: billingPaymentsPageSize,
  );

  return BillingDashboard(
    summary: summary,
    unpaidInvoices: unpaid.data,
    unpaidTotal: unpaid.total,
    recentPayments: payments.data,
    paymentsTotal: payments.total,
  );
});

final invoiceDetailProvider = FutureProvider.autoDispose
    .family<InvoiceDetail, String>((ref, id) async {
  final service = ref.watch(billingServiceProvider);
  return service.getInvoice(id);
});

final receiptProvider = FutureProvider.autoDispose.family<ReceiptResponse, String>(
  (ref, paymentId) async {
    final service = ref.watch(billingServiceProvider);
    return service.getReceipt(paymentId);
  },
);

final billingPaymentsPagingControllerProvider = Provider.autoDispose((ref) {
  final service = ref.watch(billingServiceProvider);
  final controller = PagingController<int, PaymentHistoryItem>(
    firstPageKey: 1,
  );

  controller.addPageRequestListener((pageKey) async {
    try {
      final response = await service.listPayments(
        page: pageKey,
        limit: billingPaymentsPageSize,
      );
      final isLastPage =
          response.data.length < billingPaymentsPageSize ||
          pageKey * billingPaymentsPageSize >= response.total;
      if (isLastPage) {
        controller.appendLastPage(response.data);
      } else {
        controller.appendPage(response.data, pageKey + 1);
      }
    } catch (error) {
      controller.error = authFlowErrorMessage(error);
    }
  });

  ref.onDispose(controller.dispose);
  return controller;
});

final unpaidInvoicesPagingControllerProvider = Provider.autoDispose((ref) {
  final service = ref.watch(billingServiceProvider);
  final controller = PagingController<int, InvoiceSummary>(
    firstPageKey: 1,
  );

  controller.addPageRequestListener((pageKey) async {
    try {
      final response = await service.listInvoices(
        page: pageKey,
        limit: billingInvoicesPageSize,
        status: 'UNPAID',
      );
      final isLastPage =
          response.data.length < billingInvoicesPageSize ||
          pageKey * billingInvoicesPageSize >= response.total;
      if (isLastPage) {
        controller.appendLastPage(response.data);
      } else {
        controller.appendPage(response.data, pageKey + 1);
      }
    } catch (error) {
      controller.error = authFlowErrorMessage(error);
    }
  });

  ref.onDispose(controller.dispose);
  return controller;
});
