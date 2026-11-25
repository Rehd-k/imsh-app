import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../models/invoice_model.dart';
import 'family_provider.dart';
import 'service_providers.dart';

const billingPaymentsPageSize = 5;
const billingInvoicesPageSize = 20;

final billingDashboardProvider = FutureProvider.autoDispose<BillingDashboard>((
  ref,
) async {
  final service = ref.watch(billingServiceProvider);
  final forPatientId = watchForPatientId(ref);
  final summary = await service.getBillingSummary(forPatientId: forPatientId);
  final unpaid = await service.listInvoices(
    page: 1,
    limit: 5,
    status: 'UNPAID',
    forPatientId: forPatientId,
  );
  final payments = await service.listPayments(
    page: 1,
    limit: billingPaymentsPageSize,
    forPatientId: forPatientId,
  );

  final paymentsTotal = payments.total > 0
      ? payments.total
      : payments.data.length;

  return BillingDashboard(
    summary: summary,
    unpaidInvoices: unpaid.data,
    unpaidTotal: unpaid.total,
    recentPayments: payments.data,
    paymentsTotal: paymentsTotal,
  );
});

final invoiceDetailProvider = FutureProvider.autoDispose
    .family<InvoiceDetail, String>((ref, id) async {
  final service = ref.watch(billingServiceProvider);
  final forPatientId = watchForPatientId(ref);
  return service.getInvoice(id, forPatientId: forPatientId);
});

final receiptProvider = FutureProvider.autoDispose.family<ReceiptResponse, String>(
  (ref, paymentId) async {
    final service = ref.watch(billingServiceProvider);
    final forPatientId = watchForPatientId(ref);
    return service.getReceipt(paymentId, forPatientId: forPatientId);
  },
);

final billingPaymentsPagingControllerProvider = Provider.autoDispose((ref) {
  final service = ref.watch(billingServiceProvider);
  final forPatientId = watchForPatientId(ref);
  final controller = PagingController<int, PaymentHistoryItem>(
    getNextPageKey: (state) {
      final pages = state.pages;
      if (pages != null && pages.last.length < billingPaymentsPageSize) {
        return null;
      }
      return state.nextIntPageKey;
    },
    fetchPage: (pageKey) async {
      final response = await service.listPayments(
        page: pageKey,
        limit: billingPaymentsPageSize,
        forPatientId: forPatientId,
      );
      return response.data;
    },
  );

  ref.onDispose(controller.dispose);
  return controller;
});

final unpaidInvoicesPagingControllerProvider = Provider.autoDispose((ref) {
  final service = ref.watch(billingServiceProvider);
  final forPatientId = watchForPatientId(ref);
  final controller = PagingController<int, InvoiceSummary>(
    getNextPageKey: (state) {
      final pages = state.pages;
      if (pages != null && pages.last.length < billingInvoicesPageSize) {
        return null;
      }
      return state.nextIntPageKey;
    },
    fetchPage: (pageKey) async {
      final response = await service.listInvoices(
        page: pageKey,
        limit: billingInvoicesPageSize,
        status: 'UNPAID',
        forPatientId: forPatientId,
      );
      return response.data;
    },
  );

  ref.onDispose(controller.dispose);
  return controller;
});
