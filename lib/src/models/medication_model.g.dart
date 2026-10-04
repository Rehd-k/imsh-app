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
  scheduleStartAt: json['scheduleStartAt'] == null
      ? null
      : DateTime.parse(json['scheduleStartAt'] as String),
  needsScheduleStart: json['needsScheduleStart'] as bool? ?? false,
  scheduleConfirmed: json['scheduleConfirmed'] as bool? ?? true,
  endDate: json['endDate'] == null
      ? null
      : DateTime.parse(json['endDate'] as String),
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
  'scheduleStartAt': instance.scheduleStartAt?.toIso8601String(),
  'needsScheduleStart': instance.needsScheduleStart,
  'scheduleConfirmed': instance.scheduleConfirmed,
  'endDate': instance.endDate?.toIso8601String(),
};

const _$PrescriptionSupplyStatusEnumMap = {
  PrescriptionSupplyStatus.healthy: 'HEALTHY',
  PrescriptionSupplyStatus.low: 'LOW',
  PrescriptionSupplyStatus.expired: 'EXPIRED',
};

_MedicationStreak _$MedicationStreakFromJson(Map<String, dynamic> json) =>
    _MedicationStreak(
      currentStreak: (json['currentStreak'] as num?)?.toInt() ?? 0,
      longestStreak: (json['longestStreak'] as num?)?.toInt() ?? 0,
      lastPerfectDate: json['lastPerfectDate'] as String?,
      shieldsRemaining: (json['shieldsRemaining'] as num?)?.toInt() ?? 1,
      todayCompleted: json['todayCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$MedicationStreakToJson(_MedicationStreak instance) =>
    <String, dynamic>{
      'currentStreak': instance.currentStreak,
      'longestStreak': instance.longestStreak,
      'lastPerfectDate': instance.lastPerfectDate,
      'shieldsRemaining': instance.shieldsRemaining,
      'todayCompleted': instance.todayCompleted,
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
  streak: json['streak'] == null
      ? null
      : MedicationStreak.fromJson(json['streak'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MedicationDashboardResponseToJson(
  _MedicationDashboardResponse instance,
) => <String, dynamic>{
  'nextDoses': instance.nextDoses,
  'todaySchedule': instance.todaySchedule,
  'activePrescriptions': instance.activePrescriptions,
  'streak': instance.streak,
};

_MedicationCalendarResponse _$MedicationCalendarResponseFromJson(
  Map<String, dynamic> json,
) => _MedicationCalendarResponse(
  doses:
      (json['doses'] as List<dynamic>?)
          ?.map(
            (e) => MedicationScheduleEntry.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$MedicationCalendarResponseToJson(
  _MedicationCalendarResponse instance,
) => <String, dynamic>{'doses': instance.doses};

_PrescriptionDosesResponse _$PrescriptionDosesResponseFromJson(
  Map<String, dynamic> json,
) => _PrescriptionDosesResponse(
  prescriptionId: json['prescriptionId'] as String,
  displayName: json['displayName'] as String,
  doses:
      (json['doses'] as List<dynamic>?)
          ?.map(
            (e) => MedicationScheduleEntry.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$PrescriptionDosesResponseToJson(
  _PrescriptionDosesResponse instance,
) => <String, dynamic>{
  'prescriptionId': instance.prescriptionId,
  'displayName': instance.displayName,
  'doses': instance.doses,
};

_ScheduleUpdateResponse _$ScheduleUpdateResponseFromJson(
  Map<String, dynamic> json,
) => _ScheduleUpdateResponse(
  id: json['id'] as String,
  patientScheduleStartAt: json['patientScheduleStartAt'] == null
      ? null
      : DateTime.parse(json['patientScheduleStartAt'] as String),
  scheduleConfirmedAt: json['scheduleConfirmedAt'] == null
      ? null
      : DateTime.parse(json['scheduleConfirmedAt'] as String),
  dosesGenerated: (json['dosesGenerated'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ScheduleUpdateResponseToJson(
  _ScheduleUpdateResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'patientScheduleStartAt': instance.patientScheduleStartAt?.toIso8601String(),
  'scheduleConfirmedAt': instance.scheduleConfirmedAt?.toIso8601String(),
  'dosesGenerated': instance.dosesGenerated,
};

_MarkDoseTakenResponse _$MarkDoseTakenResponseFromJson(
  Map<String, dynamic> json,
) => _MarkDoseTakenResponse(
  id: json['id'] as String,
  status: $enumDecode(_$MedicationDoseStatusEnumMap, json['status']),
  takenAt: DateTime.parse(json['takenAt'] as String),
  streak: json['streak'] == null
      ? null
      : MedicationStreak.fromJson(json['streak'] as Map<String, dynamic>),
  dayCompleted: json['dayCompleted'] as bool? ?? false,
);

Map<String, dynamic> _$MarkDoseTakenResponseToJson(
  _MarkDoseTakenResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': _$MedicationDoseStatusEnumMap[instance.status]!,
  'takenAt': instance.takenAt.toIso8601String(),
  'streak': instance.streak,
  'dayCompleted': instance.dayCompleted,
};

_UnmarkDoseTakenResponse _$UnmarkDoseTakenResponseFromJson(
  Map<String, dynamic> json,
) => _UnmarkDoseTakenResponse(
  id: json['id'] as String,
  status: $enumDecode(_$MedicationDoseStatusEnumMap, json['status']),
  streak: json['streak'] == null
      ? null
      : MedicationStreak.fromJson(json['streak'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UnmarkDoseTakenResponseToJson(
  _UnmarkDoseTakenResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': _$MedicationDoseStatusEnumMap[instance.status]!,
  'streak': instance.streak,
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
