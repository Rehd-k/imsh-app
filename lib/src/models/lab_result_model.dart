import 'package:freezed_annotation/freezed_annotation.dart';

part 'lab_result_model.freezed.dart';
part 'lab_result_model.g.dart';

@JsonEnum(alwaysCreate: true)
enum LabOrderStatus {
  @JsonValue('PENDING')
  pending,
  @JsonValue('SAMPLE_COLLECTED')
  sampleCollected,
  @JsonValue('PROCESSING')
  processing,
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('VERIFIED')
  verified,
}

@JsonEnum(alwaysCreate: true)
enum LabSummaryStatus {
  @JsonValue('PENDING')
  pending,
  @JsonValue('NORMAL')
  normal,
  @JsonValue('ABNORMAL')
  abnormal,
  @JsonValue('CRITICAL')
  critical,
}

@JsonEnum(alwaysCreate: true)
enum LabAbnormalFlag {
  @JsonValue('LOW')
  low,
  @JsonValue('HIGH')
  high,
}

extension LabOrderStatusDisplay on LabOrderStatus {
  String get label => switch (this) {
        LabOrderStatus.pending => 'Pending',
        LabOrderStatus.sampleCollected => 'Sample collected',
        LabOrderStatus.processing => 'Processing',
        LabOrderStatus.completed => 'Completed',
        LabOrderStatus.verified => 'Verified',
      };
}

extension LabSummaryStatusDisplay on LabSummaryStatus {
  String get label => switch (this) {
        LabSummaryStatus.pending => 'Pending',
        LabSummaryStatus.normal => 'Normal',
        LabSummaryStatus.abnormal => 'Abnormal',
        LabSummaryStatus.critical => 'Critical',
      };
}

extension LabAbnormalFlagDisplay on LabAbnormalFlag {
  String get label => switch (this) {
        LabAbnormalFlag.low => 'Low',
        LabAbnormalFlag.high => 'High',
      };
}

@freezed
abstract class LabResultSummary with _$LabResultSummary {
  const factory LabResultSummary({
    required String id,
    required LabOrderStatus status,
    required DateTime orderedAt,
    DateTime? completedAt,
    required String doctorName,
    @Default([]) List<String> testNames,
    required LabSummaryStatus summaryStatus,
  }) = _LabResultSummary;

  factory LabResultSummary.fromJson(Map<String, dynamic> json) =>
      _$LabResultSummaryFromJson(json);
}

extension LabResultSummaryDisplay on LabResultSummary {
  String get displayTitle {
    if (testNames.isEmpty) return 'Lab test';
    if (testNames.length == 1) return testNames.first;
    return testNames.first;
  }

  String? get additionalTestsLabel {
    if (testNames.length <= 1) return null;
    final extra = testNames.length - 1;
    return '+$extra more test${extra == 1 ? '' : 's'}';
  }

  String get referenceDisplay {
    final suffix = id.length <= 4 ? id : id.substring(id.length - 4);
    return 'ISH-$suffix';
  }

  bool get isOrderComplete =>
      status == LabOrderStatus.completed || status == LabOrderStatus.verified;

  String get summaryMessage => switch (summaryStatus) {
        LabSummaryStatus.normal => 'All levels within normal range.',
        LabSummaryStatus.pending => 'Results are being processed.',
        LabSummaryStatus.abnormal =>
          'Some values are outside the normal range.',
        LabSummaryStatus.critical => 'Urgent attention required.',
      };
}

@freezed
abstract class LabResultListResponse with _$LabResultListResponse {
  const factory LabResultListResponse({
    required List<LabResultSummary> data,
    required int total,
    required int page,
    required int limit,
  }) = _LabResultListResponse;

  factory LabResultListResponse.fromJson(Map<String, dynamic> json) =>
      _$LabResultListResponseFromJson(json);
}

@freezed
abstract class LabResultLine with _$LabResultLine {
  const factory LabResultLine({
    required String label,
    required String value,
    String? unit,
    String? referenceRange,
    LabAbnormalFlag? abnormalFlag,
    @Default(false) bool isCritical,
  }) = _LabResultLine;

  factory LabResultLine.fromJson(Map<String, dynamic> json) =>
      _$LabResultLineFromJson(json);
}

extension LabResultLineDisplay on LabResultLine {
  String get valueWithUnit {
    final trimmedUnit = unit?.trim();
    if (trimmedUnit == null || trimmedUnit.isEmpty) return value;
    return '$value $trimmedUnit';
  }
}

@freezed
abstract class LabResultPanel with _$LabResultPanel {
  const factory LabResultPanel({
    required String testName,
    required String status,
    @Default([]) List<LabResultLine> results,
  }) = _LabResultPanel;

  factory LabResultPanel.fromJson(Map<String, dynamic> json) =>
      _$LabResultPanelFromJson(json);
}

@freezed
abstract class LabResultDetail with _$LabResultDetail {
  const factory LabResultDetail({
    required String id,
    required LabOrderStatus status,
    required DateTime orderedAt,
    DateTime? completedAt,
    DateTime? verifiedAt,
    required String doctorName,
    String? pdfUrl,
    @Default([]) List<LabResultPanel> panels,
  }) = _LabResultDetail;

  factory LabResultDetail.fromJson(Map<String, dynamic> json) =>
      _$LabResultDetailFromJson(json);
}
