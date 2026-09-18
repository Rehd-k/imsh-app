import 'package:freezed_annotation/freezed_annotation.dart';

part 'cycle_model.freezed.dart';
part 'cycle_model.g.dart';

@JsonEnum(alwaysCreate: true)
enum PatientCycleFlow {
  @JsonValue('LIGHT')
  light,
  @JsonValue('MEDIUM')
  medium,
  @JsonValue('HEAVY')
  heavy,
}

extension PatientCycleFlowDisplay on PatientCycleFlow {
  String get label => switch (this) {
    PatientCycleFlow.light => 'Light',
    PatientCycleFlow.medium => 'Medium',
    PatientCycleFlow.heavy => 'Heavy',
  };

  String get apiValue => switch (this) {
    PatientCycleFlow.light => 'LIGHT',
    PatientCycleFlow.medium => 'MEDIUM',
    PatientCycleFlow.heavy => 'HEAVY',
  };
}

@freezed
abstract class CycleSettings with _$CycleSettings {
  const factory CycleSettings({
    required int cycleLengthDays,
    required int periodLengthDays,
    @Default(false) bool isDefault,
  }) = _CycleSettings;

  factory CycleSettings.fromJson(Map<String, dynamic> json) =>
      _$CycleSettingsFromJson(json);
}

@freezed
abstract class CyclePeriod with _$CyclePeriod {
  const factory CyclePeriod({
    required String id,
    required String startDate,
    String? endDate,
    PatientCycleFlow? flow,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CyclePeriod;

  factory CyclePeriod.fromJson(Map<String, dynamic> json) =>
      _$CyclePeriodFromJson(json);
}

@freezed
abstract class CycleSummaryResponse with _$CycleSummaryResponse {
  const factory CycleSummaryResponse({
    @Default(false) bool configured,
    @Default(false) bool pregnancyPaused,
    String? today,
    @Default('Log your last period to start tracking') String headline,
    int? cycleDay,
    int? daysUntilNext,
    String? nextPeriodStart,
    String? currentPeriodStart,
  }) = _CycleSummaryResponse;

  factory CycleSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$CycleSummaryResponseFromJson(json);
}

@freezed
abstract class CycleCalendarResponse with _$CycleCalendarResponse {
  const factory CycleCalendarResponse({
    @Default(false) bool configured,
    @Default(false) bool pregnancyPaused,
    required int year,
    required int month,
    String? today,
    required CycleSettings settings,
    @Default([]) List<CyclePeriod> periods,
    @Default([]) List<String> predictedDays,
    @Default('Log your last period to start tracking') String headline,
    int? cycleDay,
    int? daysUntilNext,
    String? nextPeriodStart,
    String? currentPeriodStart,
  }) = _CycleCalendarResponse;

  factory CycleCalendarResponse.fromJson(Map<String, dynamic> json) =>
      _$CycleCalendarResponseFromJson(json);
}

class CycleMonthKey {
  const CycleMonthKey({required this.year, required this.month});

  final int year;
  final int month;

  @override
  bool operator ==(Object other) =>
      other is CycleMonthKey && other.year == year && other.month == month;

  @override
  int get hashCode => Object.hash(year, month);
}

DateTime cycleDateFromKey(String key) {
  final parts = key.split('-');
  return DateTime(
    int.parse(parts[0]),
    int.parse(parts[1]),
    int.parse(parts[2]),
  );
}

String cycleDateKey(DateTime date) {
  final year = date.year.toString().padLeft(4, '0');
  final month = date.month.toString().padLeft(2, '0');
  final day = date.day.toString().padLeft(2, '0');
  return '$year-$month-$day';
}

DateTime cycleDateOnly(DateTime date) =>
    DateTime(date.year, date.month, date.day);

bool cycleDateInPeriod(String dateKey, CyclePeriod period) {
  if (dateKey.compareTo(period.startDate) < 0) return false;
  final end = period.endDate ?? dateKey;
  return dateKey.compareTo(end) <= 0;
}

CyclePeriod? cyclePeriodOnDay(String dateKey, List<CyclePeriod> periods) {
  for (final period in periods) {
    if (cycleDateInPeriod(dateKey, period)) return period;
  }
  return null;
}

CyclePeriod? cycleOpenPeriod(List<CyclePeriod> periods) {
  for (final period in periods) {
    if (period.endDate == null) return period;
  }
  return null;
}
