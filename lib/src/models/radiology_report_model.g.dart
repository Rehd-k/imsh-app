// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radiology_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RadiologyReportSummary _$RadiologyReportSummaryFromJson(
  Map<String, dynamic> json,
) => _RadiologyReportSummary(
  id: json['id'] as String,
  scanType: json['scanType'] as String,
  modality: $enumDecode(_$RadiologyModalityEnumMap, json['modality']),
  performedAt: DateTime.parse(json['performedAt'] as String),
  radiologistName: json['radiologistName'] as String,
  referringDoctorName: json['referringDoctorName'] as String,
  status: $enumDecode(_$RadiologyReportStatusEnumMap, json['status']),
  pdfUrl: json['pdfUrl'] as String?,
  dicomUrl: json['dicomUrl'] as String?,
  thumbnailUrl: json['thumbnailUrl'] as String?,
);

Map<String, dynamic> _$RadiologyReportSummaryToJson(
  _RadiologyReportSummary instance,
) => <String, dynamic>{
  'id': instance.id,
  'scanType': instance.scanType,
  'modality': _$RadiologyModalityEnumMap[instance.modality]!,
  'performedAt': instance.performedAt.toIso8601String(),
  'radiologistName': instance.radiologistName,
  'referringDoctorName': instance.referringDoctorName,
  'status': _$RadiologyReportStatusEnumMap[instance.status]!,
  'pdfUrl': instance.pdfUrl,
  'dicomUrl': instance.dicomUrl,
  'thumbnailUrl': instance.thumbnailUrl,
};

const _$RadiologyModalityEnumMap = {
  RadiologyModality.mri: 'MRI',
  RadiologyModality.xray: 'XRAY',
  RadiologyModality.ct: 'CT',
  RadiologyModality.ultrasound: 'ULTRASOUND',
  RadiologyModality.echo: 'ECHO',
  RadiologyModality.other: 'OTHER',
};

const _$RadiologyReportStatusEnumMap = {
  RadiologyReportStatus.pending: 'PENDING',
  RadiologyReportStatus.inProgress: 'IN_PROGRESS',
  RadiologyReportStatus.finalized: 'FINALIZED',
  RadiologyReportStatus.verified: 'VERIFIED',
};

_RadiologyStatistics _$RadiologyStatisticsFromJson(Map<String, dynamic> json) =>
    _RadiologyStatistics(
      totalScans: (json['totalScans'] as num?)?.toInt() ?? 0,
      pendingReviews: (json['pendingReviews'] as num?)?.toInt() ?? 0,
      profileCompleteness: (json['profileCompleteness'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$RadiologyStatisticsToJson(
  _RadiologyStatistics instance,
) => <String, dynamic>{
  'totalScans': instance.totalScans,
  'pendingReviews': instance.pendingReviews,
  'profileCompleteness': instance.profileCompleteness,
};

_RadiologyReportListResponse _$RadiologyReportListResponseFromJson(
  Map<String, dynamic> json,
) => _RadiologyReportListResponse(
  data: (json['data'] as List<dynamic>)
      .map((e) => RadiologyReportSummary.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
  page: (json['page'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  statistics: RadiologyStatistics.fromJson(
    json['statistics'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$RadiologyReportListResponseToJson(
  _RadiologyReportListResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'total': instance.total,
  'page': instance.page,
  'limit': instance.limit,
  'statistics': instance.statistics,
};

_RadiologyReportDetail _$RadiologyReportDetailFromJson(
  Map<String, dynamic> json,
) => _RadiologyReportDetail(
  id: json['id'] as String,
  scanType: json['scanType'] as String,
  modality: $enumDecode(_$RadiologyModalityEnumMap, json['modality']),
  performedAt: DateTime.parse(json['performedAt'] as String),
  verifiedAt: json['verifiedAt'] == null
      ? null
      : DateTime.parse(json['verifiedAt'] as String),
  radiologistName: json['radiologistName'] as String,
  referringDoctorName: json['referringDoctorName'] as String,
  status: $enumDecode(_$RadiologyReportStatusEnumMap, json['status']),
  pdfUrl: json['pdfUrl'] as String?,
  dicomUrl: json['dicomUrl'] as String?,
  thumbnailUrl: json['thumbnailUrl'] as String?,
  findings: json['findings'] as String?,
  impression: json['impression'] as String?,
  reportBody: json['reportBody'] as String?,
);

Map<String, dynamic> _$RadiologyReportDetailToJson(
  _RadiologyReportDetail instance,
) => <String, dynamic>{
  'id': instance.id,
  'scanType': instance.scanType,
  'modality': _$RadiologyModalityEnumMap[instance.modality]!,
  'performedAt': instance.performedAt.toIso8601String(),
  'verifiedAt': instance.verifiedAt?.toIso8601String(),
  'radiologistName': instance.radiologistName,
  'referringDoctorName': instance.referringDoctorName,
  'status': _$RadiologyReportStatusEnumMap[instance.status]!,
  'pdfUrl': instance.pdfUrl,
  'dicomUrl': instance.dicomUrl,
  'thumbnailUrl': instance.thumbnailUrl,
  'findings': instance.findings,
  'impression': instance.impression,
  'reportBody': instance.reportBody,
};
