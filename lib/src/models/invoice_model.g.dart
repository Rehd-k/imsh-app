// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BillingSummaryResponse _$BillingSummaryResponseFromJson(
  Map<String, dynamic> json,
) => _BillingSummaryResponse(
  totalOutstanding: json['totalOutstanding'] as String,
  unpaidInvoiceCount: (json['unpaidInvoiceCount'] as num).toInt(),
  nextDueDate: json['nextDueDate'] == null
      ? null
      : DateTime.parse(json['nextDueDate'] as String),
  daysUntilDue: (json['daysUntilDue'] as num?)?.toInt() ?? 0,
  currency: json['currency'] as String? ?? 'NGN',
);

Map<String, dynamic> _$BillingSummaryResponseToJson(
  _BillingSummaryResponse instance,
) => <String, dynamic>{
  'totalOutstanding': instance.totalOutstanding,
  'unpaidInvoiceCount': instance.unpaidInvoiceCount,
  'nextDueDate': instance.nextDueDate?.toIso8601String(),
  'daysUntilDue': instance.daysUntilDue,
  'currency': instance.currency,
};

_InvoiceSummary _$InvoiceSummaryFromJson(Map<String, dynamic> json) =>
    _InvoiceSummary(
      id: json['id'] as String,
      invoiceNumber: json['invoiceNumber'] as String,
      title: json['title'] as String,
      billType: $enumDecode(_$BillTypeEnumMap, json['billType']),
      status: $enumDecode(_$InvoiceStatusEnumMap, json['status']),
      issuedAt: DateTime.parse(json['issuedAt'] as String),
      totalAmount: json['totalAmount'] as String,
      amountPaid: json['amountPaid'] as String,
      balance: json['balance'] as String,
    );

Map<String, dynamic> _$InvoiceSummaryToJson(_InvoiceSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceNumber': instance.invoiceNumber,
      'title': instance.title,
      'billType': _$BillTypeEnumMap[instance.billType]!,
      'status': _$InvoiceStatusEnumMap[instance.status]!,
      'issuedAt': instance.issuedAt.toIso8601String(),
      'totalAmount': instance.totalAmount,
      'amountPaid': instance.amountPaid,
      'balance': instance.balance,
    };

const _$BillTypeEnumMap = {
  BillType.inpatient: 'INPATIENT',
  BillType.outpatient: 'OUTPATIENT',
};

const _$InvoiceStatusEnumMap = {
  InvoiceStatus.pending: 'PENDING',
  InvoiceStatus.partiallyPaid: 'PARTIALLY_PAID',
  InvoiceStatus.paid: 'PAID',
};

_InvoiceListResponse _$InvoiceListResponseFromJson(Map<String, dynamic> json) =>
    _InvoiceListResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => InvoiceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$InvoiceListResponseToJson(
  _InvoiceListResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'total': instance.total,
  'page': instance.page,
  'limit': instance.limit,
};

_PatientAdmissionSummary _$PatientAdmissionSummaryFromJson(
  Map<String, dynamic> json,
) => _PatientAdmissionSummary(
  id: json['id'] as String,
  wardName: json['wardName'] as String,
  admittedAt: DateTime.parse(json['admittedAt'] as String),
  dischargedAt: json['dischargedAt'] == null
      ? null
      : DateTime.parse(json['dischargedAt'] as String),
  status: json['status'] as String,
);

Map<String, dynamic> _$PatientAdmissionSummaryToJson(
  _PatientAdmissionSummary instance,
) => <String, dynamic>{
  'id': instance.id,
  'wardName': instance.wardName,
  'admittedAt': instance.admittedAt.toIso8601String(),
  'dischargedAt': instance.dischargedAt?.toIso8601String(),
  'status': instance.status,
};

_BreakdownLineItem _$BreakdownLineItemFromJson(Map<String, dynamic> json) =>
    _BreakdownLineItem(
      id: json['id'] as String,
      description: json['description'] as String,
      unitPrice: json['unitPrice'] as String,
      quantity: (json['quantity'] as num).toInt(),
      lineTotal: json['lineTotal'] as String,
      amountPaid: json['amountPaid'] as String,
      balance: json['balance'] as String,
      isRecurringDaily: json['isRecurringDaily'] as bool? ?? false,
      billableDays: (json['billableDays'] as num?)?.toInt(),
      usageSummary: json['usageSummary'] as String?,
    );

Map<String, dynamic> _$BreakdownLineItemToJson(_BreakdownLineItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'unitPrice': instance.unitPrice,
      'quantity': instance.quantity,
      'lineTotal': instance.lineTotal,
      'amountPaid': instance.amountPaid,
      'balance': instance.balance,
      'isRecurringDaily': instance.isRecurringDaily,
      'billableDays': instance.billableDays,
      'usageSummary': instance.usageSummary,
    };

_BreakdownCategory _$BreakdownCategoryFromJson(Map<String, dynamic> json) =>
    _BreakdownCategory(
      category: $enumDecode(_$ChargeCategoryEnumMap, json['category']),
      label: json['label'] as String,
      subtotal: json['subtotal'] as String,
      amountPaid: json['amountPaid'] as String,
      balance: json['balance'] as String,
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) => BreakdownLineItem.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BreakdownCategoryToJson(_BreakdownCategory instance) =>
    <String, dynamic>{
      'category': _$ChargeCategoryEnumMap[instance.category]!,
      'label': instance.label,
      'subtotal': instance.subtotal,
      'amountPaid': instance.amountPaid,
      'balance': instance.balance,
      'items': instance.items,
    };

const _$ChargeCategoryEnumMap = {
  ChargeCategory.daily: 'DAILY',
  ChargeCategory.pharmacy: 'PHARMACY',
  ChargeCategory.lab: 'LAB',
  ChargeCategory.supplies: 'SUPPLIES',
  ChargeCategory.other: 'OTHER',
};

_InvoicePaymentSummary _$InvoicePaymentSummaryFromJson(
  Map<String, dynamic> json,
) => _InvoicePaymentSummary(
  id: json['id'] as String,
  amount: json['amount'] as String,
  method: $enumDecodeNullable(_$PaymentMethodEnumMap, json['method']),
  methodLabel: json['methodLabel'] as String,
  paidAt: DateTime.parse(json['paidAt'] as String),
  reference: json['reference'] as String?,
);

Map<String, dynamic> _$InvoicePaymentSummaryToJson(
  _InvoicePaymentSummary instance,
) => <String, dynamic>{
  'id': instance.id,
  'amount': instance.amount,
  'method': _$PaymentMethodEnumMap[instance.method],
  'methodLabel': instance.methodLabel,
  'paidAt': instance.paidAt.toIso8601String(),
  'reference': instance.reference,
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'CASH',
  PaymentMethod.card: 'CARD',
  PaymentMethod.transfer: 'TRANSFER',
  PaymentMethod.insurance: 'INSURANCE',
  PaymentMethod.waiver: 'WAIVER',
};

_InvoiceDetail _$InvoiceDetailFromJson(Map<String, dynamic> json) =>
    _InvoiceDetail(
      id: json['id'] as String,
      invoiceNumber: json['invoiceNumber'] as String,
      billType: $enumDecode(_$BillTypeEnumMap, json['billType']),
      status: $enumDecode(_$InvoiceStatusEnumMap, json['status']),
      issuedAt: DateTime.parse(json['issuedAt'] as String),
      totalAmount: json['totalAmount'] as String,
      amountPaid: json['amountPaid'] as String,
      balance: json['balance'] as String,
      admission: json['admission'] == null
          ? null
          : PatientAdmissionSummary.fromJson(
              json['admission'] as Map<String, dynamic>,
            ),
      breakdown:
          (json['breakdown'] as List<dynamic>?)
              ?.map(
                (e) => BreakdownCategory.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      payments:
          (json['payments'] as List<dynamic>?)
              ?.map(
                (e) =>
                    InvoicePaymentSummary.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$InvoiceDetailToJson(_InvoiceDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceNumber': instance.invoiceNumber,
      'billType': _$BillTypeEnumMap[instance.billType]!,
      'status': _$InvoiceStatusEnumMap[instance.status]!,
      'issuedAt': instance.issuedAt.toIso8601String(),
      'totalAmount': instance.totalAmount,
      'amountPaid': instance.amountPaid,
      'balance': instance.balance,
      'admission': instance.admission,
      'breakdown': instance.breakdown,
      'payments': instance.payments,
    };

_PaymentHistoryItem _$PaymentHistoryItemFromJson(Map<String, dynamic> json) =>
    _PaymentHistoryItem(
      id: json['id'] as String,
      invoiceId: json['invoiceId'] as String,
      invoiceNumber: json['invoiceNumber'] as String,
      description: json['description'] as String,
      amount: json['amount'] as String,
      method: $enumDecodeNullable(_$PaymentMethodEnumMap, json['method']),
      methodLabel: json['methodLabel'] as String,
      methodDetail: json['methodDetail'] as String,
      paidAt: DateTime.parse(json['paidAt'] as String),
      status: json['status'] as String? ?? 'SUCCESS',
    );

Map<String, dynamic> _$PaymentHistoryItemToJson(_PaymentHistoryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceId': instance.invoiceId,
      'invoiceNumber': instance.invoiceNumber,
      'description': instance.description,
      'amount': instance.amount,
      'method': _$PaymentMethodEnumMap[instance.method],
      'methodLabel': instance.methodLabel,
      'methodDetail': instance.methodDetail,
      'paidAt': instance.paidAt.toIso8601String(),
      'status': instance.status,
    };

_PaymentListResponse _$PaymentListResponseFromJson(Map<String, dynamic> json) =>
    _PaymentListResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => PaymentHistoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$PaymentListResponseToJson(
  _PaymentListResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'total': instance.total,
  'page': instance.page,
  'limit': instance.limit,
};

_ReceiptResponse _$ReceiptResponseFromJson(Map<String, dynamic> json) =>
    _ReceiptResponse(
      id: json['id'] as String,
      invoiceNumber: json['invoiceNumber'] as String,
      amount: json['amount'] as String,
      paidAt: DateTime.parse(json['paidAt'] as String),
      method: $enumDecodeNullable(_$PaymentMethodEnumMap, json['method']),
      methodLabel: json['methodLabel'] as String,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ReceiptResponseToJson(_ReceiptResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceNumber': instance.invoiceNumber,
      'amount': instance.amount,
      'paidAt': instance.paidAt.toIso8601String(),
      'method': _$PaymentMethodEnumMap[instance.method],
      'methodLabel': instance.methodLabel,
      'url': instance.url,
    };
