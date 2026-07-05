// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LabResultSummary _$LabResultSummaryFromJson(
  Map<String, dynamic> json,
) => _LabResultSummary(
  id: json['id'] as String,
  status: $enumDecode(_$LabOrderStatusEnumMap, json['status']),
  orderedAt: DateTime.parse(json['orderedAt'] as String),
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  doctorName: json['doctorName'] as String,
  testNames:
      (json['testNames'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  summaryStatus: $enumDecode(_$LabSummaryStatusEnumMap, json['summaryStatus']),
);

Map<String, dynamic> _$LabResultSummaryToJson(_LabResultSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$LabOrderStatusEnumMap[instance.status]!,
      'orderedAt': instance.orderedAt.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'doctorName': instance.doctorName,
      'testNames': instance.testNames,
      'summaryStatus': _$LabSummaryStatusEnumMap[instance.summaryStatus]!,
    };

const _$LabOrderStatusEnumMap = {
  LabOrderStatus.pending: 'PENDING',
  LabOrderStatus.sampleCollected: 'SAMPLE_COLLECTED',
  LabOrderStatus.processing: 'PROCESSING',
  LabOrderStatus.completed: 'COMPLETED',
  LabOrderStatus.verified: 'VERIFIED',
};

const _$LabSummaryStatusEnumMap = {
  LabSummaryStatus.pending: 'PENDING',
  LabSummaryStatus.normal: 'NORMAL',
  LabSummaryStatus.abnormal: 'ABNORMAL',
  LabSummaryStatus.critical: 'CRITICAL',
};

_LabResultListResponse _$LabResultListResponseFromJson(
  Map<String, dynamic> json,
) => _LabResultListResponse(
  data: (json['data'] as List<dynamic>)
      .map((e) => LabResultSummary.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
  page: (json['page'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
);

Map<String, dynamic> _$LabResultListResponseToJson(
  _LabResultListResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'total': instance.total,
  'page': instance.page,
  'limit': instance.limit,
};

_LabResultLine _$LabResultLineFromJson(Map<String, dynamic> json) =>
    _LabResultLine(
      label: json['label'] as String,
      value: json['value'] as String,
      unit: json['unit'] as String?,
      referenceRange: json['referenceRange'] as String?,
      abnormalFlag: $enumDecodeNullable(
        _$LabAbnormalFlagEnumMap,
        json['abnormalFlag'],
      ),
      isCritical: json['isCritical'] as bool? ?? false,
    );

Map<String, dynamic> _$LabResultLineToJson(_LabResultLine instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'unit': instance.unit,
      'referenceRange': instance.referenceRange,
      'abnormalFlag': _$LabAbnormalFlagEnumMap[instance.abnormalFlag],
      'isCritical': instance.isCritical,
    };

const _$LabAbnormalFlagEnumMap = {
  LabAbnormalFlag.low: 'LOW',
  LabAbnormalFlag.high: 'HIGH',
};

_LabResultPanel _$LabResultPanelFromJson(Map<String, dynamic> json) =>
    _LabResultPanel(
      testName: json['testName'] as String,
      status: json['status'] as String,
      results:
          (json['results'] as List<dynamic>?)
              ?.map((e) => LabResultLine.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$LabResultPanelToJson(_LabResultPanel instance) =>
    <String, dynamic>{
      'testName': instance.testName,
      'status': instance.status,
      'results': instance.results,
    };

_LabResultDetail _$LabResultDetailFromJson(Map<String, dynamic> json) =>
    _LabResultDetail(
      id: json['id'] as String,
      status: $enumDecode(_$LabOrderStatusEnumMap, json['status']),
      orderedAt: DateTime.parse(json['orderedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      verifiedAt: json['verifiedAt'] == null
          ? null
          : DateTime.parse(json['verifiedAt'] as String),
      doctorName: json['doctorName'] as String,
      pdfUrl: json['pdfUrl'] as String?,
      panels:
          (json['panels'] as List<dynamic>?)
              ?.map((e) => LabResultPanel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$LabResultDetailToJson(_LabResultDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$LabOrderStatusEnumMap[instance.status]!,
      'orderedAt': instance.orderedAt.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'verifiedAt': instance.verifiedAt?.toIso8601String(),
      'doctorName': instance.doctorName,
      'pdfUrl': instance.pdfUrl,
      'panels': instance.panels,
    };
