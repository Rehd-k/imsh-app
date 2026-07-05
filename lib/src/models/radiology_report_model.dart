import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'radiology_report_model.freezed.dart';
part 'radiology_report_model.g.dart';

@JsonEnum(alwaysCreate: true)
enum RadiologyReportStatus {
  @JsonValue('PENDING')
  pending,
  @JsonValue('IN_PROGRESS')
  inProgress,
  @JsonValue('FINALIZED')
  finalized,
  @JsonValue('VERIFIED')
  verified,
}

@JsonEnum(alwaysCreate: true)
enum RadiologyModality {
  @JsonValue('MRI')
  mri,
  @JsonValue('XRAY')
  xray,
  @JsonValue('CT')
  ct,
  @JsonValue('ULTRASOUND')
  ultrasound,
  @JsonValue('ECHO')
  echo,
  @JsonValue('OTHER')
  other,
}

extension RadiologyReportStatusDisplay on RadiologyReportStatus {
  String get label => switch (this) {
        RadiologyReportStatus.pending => 'Pending',
        RadiologyReportStatus.inProgress => 'In progress',
        RadiologyReportStatus.finalized => 'Finalized',
        RadiologyReportStatus.verified => 'Finalized & Verified',
      };

  bool get isComplete =>
      this == RadiologyReportStatus.finalized ||
      this == RadiologyReportStatus.verified;
}

extension RadiologyModalityDisplay on RadiologyModality {
  String get label => switch (this) {
        RadiologyModality.mri => 'MRI',
        RadiologyModality.xray => 'X-Ray',
        RadiologyModality.ct => 'CT',
        RadiologyModality.ultrasound => 'Ultrasound',
        RadiologyModality.echo => 'Echo',
        RadiologyModality.other => 'Other',
      };

  IconData get icon => switch (this) {
        RadiologyModality.mri => Icons.psychology_outlined,
        RadiologyModality.xray => Icons.check_box_outlined,
        RadiologyModality.ct => Icons.view_in_ar_outlined,
        RadiologyModality.ultrasound => Icons.waves_outlined,
        RadiologyModality.echo => Icons.monitor_heart_outlined,
        RadiologyModality.other => Icons.medical_information_outlined,
      };
}

@freezed
abstract class RadiologyReportSummary with _$RadiologyReportSummary {
  const factory RadiologyReportSummary({
    required String id,
    required String scanType,
    required RadiologyModality modality,
    required DateTime performedAt,
    required String radiologistName,
    required String referringDoctorName,
    required RadiologyReportStatus status,
    String? pdfUrl,
    String? dicomUrl,
    String? thumbnailUrl,
  }) = _RadiologyReportSummary;

  factory RadiologyReportSummary.fromJson(Map<String, dynamic> json) =>
      _$RadiologyReportSummaryFromJson(json);
}

extension RadiologyReportSummaryDisplay on RadiologyReportSummary {
  String get displayTitle => scanType.trim().isEmpty ? 'Imaging scan' : scanType;
}

@freezed
abstract class RadiologyStatistics with _$RadiologyStatistics {
  const factory RadiologyStatistics({
    @Default(0) int totalScans,
    @Default(0) int pendingReviews,
    @Default(0) int profileCompleteness,
  }) = _RadiologyStatistics;

  factory RadiologyStatistics.fromJson(Map<String, dynamic> json) =>
      _$RadiologyStatisticsFromJson(json);
}

@freezed
abstract class RadiologyReportListResponse with _$RadiologyReportListResponse {
  const factory RadiologyReportListResponse({
    required List<RadiologyReportSummary> data,
    required int total,
    required int page,
    required int limit,
    required RadiologyStatistics statistics,
  }) = _RadiologyReportListResponse;

  factory RadiologyReportListResponse.fromJson(Map<String, dynamic> json) =>
      _$RadiologyReportListResponseFromJson(json);
}

@freezed
abstract class RadiologyReportDetail with _$RadiologyReportDetail {
  const factory RadiologyReportDetail({
    required String id,
    required String scanType,
    required RadiologyModality modality,
    required DateTime performedAt,
    DateTime? verifiedAt,
    required String radiologistName,
    required String referringDoctorName,
    required RadiologyReportStatus status,
    String? pdfUrl,
    String? dicomUrl,
    String? thumbnailUrl,
    String? findings,
    String? impression,
    String? reportBody,
  }) = _RadiologyReportDetail;

  factory RadiologyReportDetail.fromJson(Map<String, dynamic> json) =>
      _$RadiologyReportDetailFromJson(json);
}

extension RadiologyReportDetailDisplay on RadiologyReportDetail {
  String get displayTitle => scanType.trim().isEmpty ? 'Imaging scan' : scanType;
}
