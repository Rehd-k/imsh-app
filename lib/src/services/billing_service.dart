import 'package:dio/dio.dart';

import '../models/invoice_model.dart';
import 'api_service.dart';

class BillingService {
  BillingService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  Map<String, dynamic> _subjectParams(String? forPatientId) => {
        if (forPatientId != null && forPatientId.isNotEmpty)
          'forPatientId': forPatientId,
      };

  Future<BillingSummaryResponse> getBillingSummary({
    String? forPatientId,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/billing/summary',
      queryParameters: _subjectParams(forPatientId),
    );
    return BillingSummaryResponse.fromJson(resp.data ?? {});
  }

  Future<InvoiceListResponse> listInvoices({
    int page = 1,
    int limit = 20,
    String? status,
    String? forPatientId,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/invoices',
      queryParameters: {
        'page': page,
        'limit': limit,
        'status': ?status,
        ..._subjectParams(forPatientId),
      },
    );
    return InvoiceListResponse.fromJson(resp.data ?? {});
  }

  Future<InvoiceDetail> getInvoice(String id, {String? forPatientId}) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/invoices/$id',
      queryParameters: _subjectParams(forPatientId),
    );
    return InvoiceDetail.fromJson(resp.data ?? {});
  }

  Future<PaymentListResponse> listPayments({
    int page = 1,
    int limit = 20,
    String? forPatientId,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/payments',
      queryParameters: {
        'page': page,
        'limit': limit,
        ..._subjectParams(forPatientId),
      },
    );
    return PaymentListResponse.fromJson(resp.data ?? {});
  }

  Future<ReceiptResponse> getReceipt(
    String paymentId, {
    String? forPatientId,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/patient/receipts/$paymentId',
      queryParameters: _subjectParams(forPatientId),
    );
    return ReceiptResponse.fromJson(resp.data ?? {});
  }
}
