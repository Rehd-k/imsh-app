// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MedicationDoseSummary _$MedicationDoseSummaryFromJson(
  Map<String, dynamic> json,
) => _MedicationDoseSummary(
  id: json['id'] as String,
  prescriptionItemId: json['prescriptionItemId'] as String,
  drugName: json['drugName'] as String,
  dosage: json['dosage'] as String,
  instructions: json['instructions'] as String?,
  scheduledAt: DateTime.parse(json['scheduledAt'] as String),
  status: $enumDecode(_$MedicationDoseStatusEnumMap, json['status']),
);

Map<String, dynamic> _$MedicationDoseSummaryToJson(
  _MedicationDoseSummary instance,
) => <String, dynamic>{
  'id': instance.id,
  'prescriptionItemId': instance.prescriptionItemId,
  'drugName': instance.drugName,
  'dosage': instance.dosage,
  'instructions': instance.instructions,
  'scheduledAt': instance.scheduledAt.toIso8601String(),
  'status': _$MedicationDoseStatusEnumMap[instance.status]!,
};

const _$MedicationDoseStatusEnumMap = {
  MedicationDoseStatus.upcoming: 'UPCOMING',
  MedicationDoseStatus.taken: 'TAKEN',
  MedicationDoseStatus.missed: 'MISSED',
  MedicationDoseStatus.skipped: 'SKIPPED',
};

_MedicationScheduleEntry _$MedicationScheduleEntryFromJson(
  Map<String, dynamic> json,
) => _MedicationScheduleEntry(
  id: json['id'] as String,
  prescriptionItemId: json['prescriptionItemId'] as String,
  timeOfDay: $enumDecode(_$MedicationTimeOfDayEnumMap, json['timeOfDay']),
  drugName: json['drugName'] as String,
  dosage: json['dosage'] as String,
  scheduledAt: DateTime.parse(json['scheduledAt'] as String),
  status: $enumDecode(_$MedicationDoseStatusEnumMap, json['status']),
);

Map<String, dynamic> _$MedicationScheduleEntryToJson(
  _MedicationScheduleEntry instance,
) => <String, dynamic>{
  'id': instance.id,
  'prescriptionItemId': instance.prescriptionItemId,
  'timeOfDay': _$MedicationTimeOfDayEnumMap[instance.timeOfDay]!,
  'drugName': instance.drugName,
  'dosage': instance.dosage,
  'scheduledAt': instance.scheduledAt.toIso8601String(),
  'status': _$MedicationDoseStatusEnumMap[instance.status]!,
};

const _$MedicationTimeOfDayEnumMap = {
  MedicationTimeOfDay.morning: 'MORNING',
  MedicationTimeOfDay.afternoon: 'AFTERNOON',
  MedicationTimeOfDay.evening: 'EVENING',
};

_ActivePrescriptionSummary _$ActivePrescriptionSummaryFromJson(
  Map<String, dynamic> json,
) => _ActivePrescriptionSummary(
  id: json['id'] as String,
  displayName: json['displayName'] as String,
  frequencyLabel: json['frequencyLabel'] as String,
  daysRemaining: (json['daysRemaining'] as num).toInt(),
  refillsRemaining: (json['refillsRemaining'] as num).toInt(),
  supplyProgress: (json['supplyProgress'] as num).toDouble(),
  supplyStatus: $enumDecode(
    _$PrescriptionSupplyStatusEnumMap,
    json['supplyStatus'],
  ),
);

Map<String, dynamic> _$ActivePrescriptionSummaryToJson(
  _ActivePrescriptionSummary instance,
) => <String, dynamic>{
  'id': instance.id,
  'displayName': instance.displayName,
  'frequencyLabel': instance.frequencyLabel,
  'daysRemaining': instance.daysRemaining,
  'refillsRemaining': instance.refillsRemaining,
  'supplyProgress': instance.supplyProgress,
  'supplyStatus': _$PrescriptionSupplyStatusEnumMap[instance.supplyStatus]!,
};

const _$PrescriptionSupplyStatusEnumMap = {
  PrescriptionSupplyStatus.healthy: 'HEALTHY',
  PrescriptionSupplyStatus.low: 'LOW',
  PrescriptionSupplyStatus.expired: 'EXPIRED',
};

_MedicationDashboardResponse _$MedicationDashboardResponseFromJson(
  Map<String, dynamic> json,
) => _MedicationDashboardResponse(
  nextDoses:
      (json['nextDoses'] as List<dynamic>?)
          ?.map(
            (e) => MedicationDoseSummary.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  todaySchedule:
      (json['todaySchedule'] as List<dynamic>?)
          ?.map(
            (e) => MedicationScheduleEntry.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  activePrescriptions:
      (json['activePrescriptions'] as List<dynamic>?)
          ?.map(
            (e) =>
                ActivePrescriptionSummary.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$MedicationDashboardResponseToJson(
  _MedicationDashboardResponse instance,
) => <String, dynamic>{
  'nextDoses': instance.nextDoses,
  'todaySchedule': instance.todaySchedule,
  'activePrescriptions': instance.activePrescriptions,
};

_MarkDoseTakenResponse _$MarkDoseTakenResponseFromJson(
  Map<String, dynamic> json,
) => _MarkDoseTakenResponse(
  id: json['id'] as String,
  status: $enumDecode(_$MedicationDoseStatusEnumMap, json['status']),
  takenAt: DateTime.parse(json['takenAt'] as String),
);

Map<String, dynamic> _$MarkDoseTakenResponseToJson(
  _MarkDoseTakenResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': _$MedicationDoseStatusEnumMap[instance.status]!,
  'takenAt': instance.takenAt.toIso8601String(),
};

_PrescriptionHistorySummary _$PrescriptionHistorySummaryFromJson(
  Map<String, dynamic> json,
) => _PrescriptionHistorySummary(
  id: json['id'] as String,
  displayName: json['displayName'] as String,
  frequencyLabel: json['frequencyLabel'] as String,
  status: $enumDecode(_$PrescriptionHistoryStatusEnumMap, json['status']),
  startDate: json['startDate'] == null
      ? null
      : DateTime.parse(json['startDate'] as String),
  endDate: json['endDate'] == null
      ? null
      : DateTime.parse(json['endDate'] as String),
  doctorName: json['doctorName'] as String,
);

Map<String, dynamic> _$PrescriptionHistorySummaryToJson(
  _PrescriptionHistorySummary instance,
) => <String, dynamic>{
  'id': instance.id,
  'displayName': instance.displayName,
  'frequencyLabel': instance.frequencyLabel,
  'status': _$PrescriptionHistoryStatusEnumMap[instance.status]!,
  'startDate': instance.startDate?.toIso8601String(),
  'endDate': instance.endDate?.toIso8601String(),
  'doctorName': instance.doctorName,
};

const _$PrescriptionHistoryStatusEnumMap = {
  PrescriptionHistoryStatus.completed: 'COMPLETED',
  PrescriptionHistoryStatus.cancelled: 'CANCELLED',
};

_PrescriptionHistoryListResponse _$PrescriptionHistoryListResponseFromJson(
  Map<String, dynamic> json,
) => _PrescriptionHistoryListResponse(
  data:
      (json['data'] as List<dynamic>?)
          ?.map(
            (e) =>
                PrescriptionHistorySummary.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  total: (json['total'] as num?)?.toInt() ?? 0,
  page: (json['page'] as num?)?.toInt() ?? 1,
  limit: (json['limit'] as num?)?.toInt() ?? 20,
);

Map<String, dynamic> _$PrescriptionHistoryListResponseToJson(
  _PrescriptionHistoryListResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'total': instance.total,
  'page': instance.page,
  'limit': instance.limit,
};

_RefillRequestResponse _$RefillRequestResponseFromJson(
  Map<String, dynamic> json,
) => _RefillRequestResponse(
  id: json['id'] as String,
  prescriptionId: json['prescriptionId'] as String,
  status: json['status'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$RefillRequestResponseToJson(
  _RefillRequestResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'prescriptionId': instance.prescriptionId,
  'status': instance.status,
  'createdAt': instance.createdAt.toIso8601String(),
};
