import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/utils/api_amount_converter.dart';

part 'invoice_model.freezed.dart';
part 'invoice_model.g.dart';

@JsonEnum(alwaysCreate: true)
enum InvoiceStatus {
  @JsonValue('PENDING')
  pending,
  @JsonValue('PARTIALLY_PAID')
  partiallyPaid,
  @JsonValue('PAID')
  paid,
}

@JsonEnum(alwaysCreate: true)
enum BillType {
  @JsonValue('INPATIENT')
  inpatient,
  @JsonValue('OUTPATIENT')
  outpatient,
}

@JsonEnum(alwaysCreate: true)
enum ChargeCategory {
  @JsonValue('DAILY')
  daily,
  @JsonValue('PHARMACY')
  pharmacy,
  @JsonValue('LAB')
  lab,
  @JsonValue('SUPPLIES')
  supplies,
  @JsonValue('OTHER')
  other,
}

@JsonEnum(alwaysCreate: true)
enum PaymentMethod {
  @JsonValue('CASH')
  cash,
  @JsonValue('CARD')
  card,
  @JsonValue('TRANSFER')
  transfer,
  @JsonValue('INSURANCE')
  insurance,
  @JsonValue('WAIVER')
  waiver,
}

extension InvoiceStatusDisplay on InvoiceStatus {
  String get label => switch (this) {
        InvoiceStatus.pending => 'Unpaid',
        InvoiceStatus.partiallyPaid => 'Partially paid',
        InvoiceStatus.paid => 'Paid',
      };

  bool get isUnpaid =>
      this == InvoiceStatus.pending || this == InvoiceStatus.partiallyPaid;
}

extension ChargeCategoryDisplay on ChargeCategory {
  String get iconName => switch (this) {
        ChargeCategory.daily => 'hotel',
        ChargeCategory.pharmacy => 'medication',
        ChargeCategory.lab => 'science',
        ChargeCategory.supplies => 'inventory',
        ChargeCategory.other => 'receipt',
      };
}

@freezed
abstract class BillingSummaryResponse with _$BillingSummaryResponse {
  const factory BillingSummaryResponse({
    @ApiAmountConverter() @Default('0') String totalOutstanding,
    @Default(0) int unpaidInvoiceCount,
    DateTime? nextDueDate,
    @Default(0) int daysUntilDue,
    @Default('NGN') String currency,
  }) = _BillingSummaryResponse;

  factory BillingSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$BillingSummaryResponseFromJson(json);
}

@freezed
abstract class InvoiceSummary with _$InvoiceSummary {
  const factory InvoiceSummary({
    required String id,
    required String invoiceNumber,
    required String title,
    required BillType billType,
    required InvoiceStatus status,
    required DateTime issuedAt,
    @ApiAmountConverter() required String totalAmount,
    @ApiAmountConverter() required String amountPaid,
    @ApiAmountConverter() required String balance,
  }) = _InvoiceSummary;

  factory InvoiceSummary.fromJson(Map<String, dynamic> json) =>
      _$InvoiceSummaryFromJson(json);
}

@freezed
abstract class InvoiceListResponse with _$InvoiceListResponse {
  const factory InvoiceListResponse({
    required List<InvoiceSummary> data,
    @Default(0) int total,
    @Default(1) int page,
    @Default(20) int limit,
  }) = _InvoiceListResponse;

  factory InvoiceListResponse.fromJson(Map<String, dynamic> json) =>
      _$InvoiceListResponseFromJson(json);
}

@freezed
abstract class PatientAdmissionSummary with _$PatientAdmissionSummary {
  const factory PatientAdmissionSummary({
    required String id,
    required String wardName,
    required DateTime admittedAt,
    DateTime? dischargedAt,
    required String status,
  }) = _PatientAdmissionSummary;

  factory PatientAdmissionSummary.fromJson(Map<String, dynamic> json) =>
      _$PatientAdmissionSummaryFromJson(json);
}

@freezed
abstract class BreakdownLineItem with _$BreakdownLineItem {
  const factory BreakdownLineItem({
    required String id,
    required String description,
    @ApiAmountConverter() required String unitPrice,
    required int quantity,
    @ApiAmountConverter() required String lineTotal,
    @ApiAmountConverter() required String amountPaid,
    @ApiAmountConverter() required String balance,
    @Default(false) bool isRecurringDaily,
    int? billableDays,
    String? usageSummary,
  }) = _BreakdownLineItem;

  factory BreakdownLineItem.fromJson(Map<String, dynamic> json) =>
      _$BreakdownLineItemFromJson(json);
}

@freezed
abstract class BreakdownCategory with _$BreakdownCategory {
  const factory BreakdownCategory({
    required ChargeCategory category,
    required String label,
    @ApiAmountConverter() required String subtotal,
    @ApiAmountConverter() required String amountPaid,
    @ApiAmountConverter() required String balance,
    @Default([]) List<BreakdownLineItem> items,
  }) = _BreakdownCategory;

  factory BreakdownCategory.fromJson(Map<String, dynamic> json) =>
      _$BreakdownCategoryFromJson(json);
}

@freezed
abstract class InvoicePaymentSummary with _$InvoicePaymentSummary {
  const factory InvoicePaymentSummary({
    required String id,
    @ApiAmountConverter() required String amount,
    @JsonKey(unknownEnumValue: PaymentMethod.cash) PaymentMethod? method,
    @Default('') String methodLabel,
    required DateTime paidAt,
    String? reference,
  }) = _InvoicePaymentSummary;

  factory InvoicePaymentSummary.fromJson(Map<String, dynamic> json) =>
      _$InvoicePaymentSummaryFromJson(json);
}

@freezed
abstract class InvoiceDetail with _$InvoiceDetail {
  const factory InvoiceDetail({
    required String id,
    required String invoiceNumber,
    required BillType billType,
    required InvoiceStatus status,
    required DateTime issuedAt,
    @ApiAmountConverter() required String totalAmount,
    @ApiAmountConverter() required String amountPaid,
    @ApiAmountConverter() required String balance,
    PatientAdmissionSummary? admission,
    @Default([]) List<BreakdownCategory> breakdown,
    @Default([]) List<InvoicePaymentSummary> payments,
  }) = _InvoiceDetail;

  factory InvoiceDetail.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDetailFromJson(json);
}

@freezed
abstract class PaymentHistoryItem with _$PaymentHistoryItem {
  const factory PaymentHistoryItem({
    required String id,
    @Default('') String invoiceId,
    @Default('') String invoiceNumber,
    @Default('') String description,
    @ApiAmountConverter() @Default('0') String amount,
    @JsonKey(unknownEnumValue: PaymentMethod.cash) PaymentMethod? method,
    @Default('') String methodLabel,
    @Default('') String methodDetail,
    required DateTime paidAt,
    @Default('SUCCESS') String status,
  }) = _PaymentHistoryItem;

  factory PaymentHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$PaymentHistoryItemFromJson(json);
}

@freezed
abstract class PaymentListResponse with _$PaymentListResponse {
  const factory PaymentListResponse({
    required List<PaymentHistoryItem> data,
    @Default(0) int total,
    @Default(1) int page,
    @Default(20) int limit,
  }) = _PaymentListResponse;

  factory PaymentListResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentListResponseFromJson(json);
}

@freezed
abstract class ReceiptResponse with _$ReceiptResponse {
  const factory ReceiptResponse({
    required String id,
    required String invoiceNumber,
    @ApiAmountConverter() required String amount,
    required DateTime paidAt,
    @JsonKey(unknownEnumValue: PaymentMethod.cash) PaymentMethod? method,
    @Default('') String methodLabel,
    String? url,
  }) = _ReceiptResponse;

  factory ReceiptResponse.fromJson(Map<String, dynamic> json) =>
      _$ReceiptResponseFromJson(json);
}

@freezed
abstract class BillingDashboard with _$BillingDashboard {
  const factory BillingDashboard({
    required BillingSummaryResponse summary,
    required List<InvoiceSummary> unpaidInvoices,
    required int unpaidTotal,
    required List<PaymentHistoryItem> recentPayments,
    required int paymentsTotal,
  }) = _BillingDashboard;
}
