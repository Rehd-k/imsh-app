// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CycleSettings _$CycleSettingsFromJson(Map<String, dynamic> json) =>
    _CycleSettings(
      cycleLengthDays: (json['cycleLengthDays'] as num).toInt(),
      periodLengthDays: (json['periodLengthDays'] as num).toInt(),
      isDefault: json['isDefault'] as bool? ?? false,
    );

Map<String, dynamic> _$CycleSettingsToJson(_CycleSettings instance) =>
    <String, dynamic>{
      'cycleLengthDays': instance.cycleLengthDays,
      'periodLengthDays': instance.periodLengthDays,
      'isDefault': instance.isDefault,
    };

_CyclePeriod _$CyclePeriodFromJson(Map<String, dynamic> json) => _CyclePeriod(
  id: json['id'] as String,
  startDate: json['startDate'] as String,
  endDate: json['endDate'] as String?,
  flow: $enumDecodeNullable(_$PatientCycleFlowEnumMap, json['flow']),
  notes: json['notes'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$CyclePeriodToJson(_CyclePeriod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'flow': _$PatientCycleFlowEnumMap[instance.flow],
      'notes': instance.notes,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$PatientCycleFlowEnumMap = {
  PatientCycleFlow.light: 'LIGHT',
  PatientCycleFlow.medium: 'MEDIUM',
  PatientCycleFlow.heavy: 'HEAVY',
};

_CycleSummaryResponse _$CycleSummaryResponseFromJson(
  Map<String, dynamic> json,
) => _CycleSummaryResponse(
  configured: json['configured'] as bool? ?? false,
  pregnancyPaused: json['pregnancyPaused'] as bool? ?? false,
  today: json['today'] as String?,
  headline:
      json['headline'] as String? ?? 'Log your last period to start tracking',
  cycleDay: (json['cycleDay'] as num?)?.toInt(),
  daysUntilNext: (json['daysUntilNext'] as num?)?.toInt(),
  nextPeriodStart: json['nextPeriodStart'] as String?,
  currentPeriodStart: json['currentPeriodStart'] as String?,
);

Map<String, dynamic> _$CycleSummaryResponseToJson(
  _CycleSummaryResponse instance,
) => <String, dynamic>{
  'configured': instance.configured,
  'pregnancyPaused': instance.pregnancyPaused,
  'today': instance.today,
  'headline': instance.headline,
  'cycleDay': instance.cycleDay,
  'daysUntilNext': instance.daysUntilNext,
  'nextPeriodStart': instance.nextPeriodStart,
  'currentPeriodStart': instance.currentPeriodStart,
};

_CycleCalendarResponse _$CycleCalendarResponseFromJson(
  Map<String, dynamic> json,
) => _CycleCalendarResponse(
  configured: json['configured'] as bool? ?? false,
  pregnancyPaused: json['pregnancyPaused'] as bool? ?? false,
  year: (json['year'] as num).toInt(),
  month: (json['month'] as num).toInt(),
  today: json['today'] as String?,
  settings: CycleSettings.fromJson(json['settings'] as Map<String, dynamic>),
  periods:
      (json['periods'] as List<dynamic>?)
          ?.map((e) => CyclePeriod.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  predictedDays:
      (json['predictedDays'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  headline:
      json['headline'] as String? ?? 'Log your last period to start tracking',
  cycleDay: (json['cycleDay'] as num?)?.toInt(),
  daysUntilNext: (json['daysUntilNext'] as num?)?.toInt(),
  nextPeriodStart: json['nextPeriodStart'] as String?,
  currentPeriodStart: json['currentPeriodStart'] as String?,
);

Map<String, dynamic> _$CycleCalendarResponseToJson(
  _CycleCalendarResponse instance,
) => <String, dynamic>{
  'configured': instance.configured,
  'pregnancyPaused': instance.pregnancyPaused,
  'year': instance.year,
  'month': instance.month,
  'today': instance.today,
  'settings': instance.settings,
  'periods': instance.periods,
  'predictedDays': instance.predictedDays,
  'headline': instance.headline,
  'cycleDay': instance.cycleDay,
  'daysUntilNext': instance.daysUntilNext,
  'nextPeriodStart': instance.nextPeriodStart,
  'currentPeriodStart': instance.currentPeriodStart,
};
