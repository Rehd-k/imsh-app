import 'package:dio/dio.dart';

import '../models/invoice_model.dart';
import 'api_service.dart';

class BillingService {
  BillingService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  Future<BillingSummaryResponse> getBillingSummary() async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/billing/summary',
    );
    return BillingSummaryResponse.fromJson(resp.data ?? {});
  }

  Future<InvoiceListResponse> listInvoices({
    int page = 1,
    int limit = 20,
    String? status,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/invoices',
      queryParameters: {
        'page': page,
        'limit': limit,
        if (status != null) 'status': status,
      },
    );
    return InvoiceListResponse.fromJson(resp.data ?? {});
  }

  Future<InvoiceDetail> getInvoice(String id) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/invoices/$id',
    );
    return InvoiceDetail.fromJson(resp.data ?? {});
  }

  Future<PaymentListResponse> listPayments({
    int page = 1,
    int limit = 20,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/payments',
      queryParameters: {'page': page, 'limit': limit},
    );
    return PaymentListResponse.fromJson(resp.data ?? {});
  }

  Future<ReceiptResponse> getReceipt(String paymentId) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/receipts/$paymentId',
    );
    return ReceiptResponse.fromJson(resp.data ?? {});
  }
}
