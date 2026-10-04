import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'medication_model.freezed.dart';
part 'medication_model.g.dart';

@JsonEnum(alwaysCreate: true)
enum MedicationDoseStatus {
  @JsonValue('UPCOMING')
  upcoming,
  @JsonValue('TAKEN')
  taken,
  @JsonValue('MISSED')
  missed,
  @JsonValue('SKIPPED')
  skipped,
}

@JsonEnum(alwaysCreate: true)
enum MedicationTimeOfDay {
  @JsonValue('MORNING')
  morning,
  @JsonValue('AFTERNOON')
  afternoon,
  @JsonValue('EVENING')
  evening,
}

@JsonEnum(alwaysCreate: true)
enum PrescriptionSupplyStatus {
  @JsonValue('HEALTHY')
  healthy,
  @JsonValue('LOW')
  low,
  @JsonValue('EXPIRED')
  expired,
}

@JsonEnum(alwaysCreate: true)
enum PrescriptionHistoryStatus {
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('CANCELLED')
  cancelled,
}

enum MedicationsViewMode { calendar, byDrug }

extension MedicationDoseStatusDisplay on MedicationDoseStatus {
  String get label => switch (this) {
        MedicationDoseStatus.upcoming => 'Upcoming',
        MedicationDoseStatus.taken => 'Taken',
        MedicationDoseStatus.missed => 'Missed',
        MedicationDoseStatus.skipped => 'Skipped',
      };
}

extension MedicationTimeOfDayDisplay on MedicationTimeOfDay {
  String get label => switch (this) {
        MedicationTimeOfDay.morning => 'Morning',
        MedicationTimeOfDay.afternoon => 'Afternoon',
        MedicationTimeOfDay.evening => 'Evening',
      };

  IconData get icon => switch (this) {
        MedicationTimeOfDay.morning => Icons.wb_sunny_outlined,
        MedicationTimeOfDay.afternoon => Icons.wb_sunny,
        MedicationTimeOfDay.evening => Icons.nights_stay_outlined,
      };
}

@freezed
abstract class MedicationDoseSummary with _$MedicationDoseSummary {
  const factory MedicationDoseSummary({
    required String id,
    required String prescriptionItemId,
    required String drugName,
    required String dosage,
    String? instructions,
    required DateTime scheduledAt,
    required MedicationDoseStatus status,
  }) = _MedicationDoseSummary;

  factory MedicationDoseSummary.fromJson(Map<String, dynamic> json) =>
      _$MedicationDoseSummaryFromJson(json);
}

@freezed
abstract class MedicationScheduleEntry with _$MedicationScheduleEntry {
  const factory MedicationScheduleEntry({
    required String id,
    required String prescriptionItemId,
    required MedicationTimeOfDay timeOfDay,
    required String drugName,
    required String dosage,
    required DateTime scheduledAt,
    required MedicationDoseStatus status,
  }) = _MedicationScheduleEntry;

  factory MedicationScheduleEntry.fromJson(Map<String, dynamic> json) =>
      _$MedicationScheduleEntryFromJson(json);
}

@freezed
abstract class ActivePrescriptionSummary with _$ActivePrescriptionSummary {
  const factory ActivePrescriptionSummary({
    required String id,
    required String displayName,
    required String frequencyLabel,
    required int daysRemaining,
    required int refillsRemaining,
    required double supplyProgress,
    required PrescriptionSupplyStatus supplyStatus,
    DateTime? scheduleStartAt,
    @Default(false) bool needsScheduleStart,
    @Default(true) bool scheduleConfirmed,
    DateTime? endDate,
  }) = _ActivePrescriptionSummary;

  factory ActivePrescriptionSummary.fromJson(Map<String, dynamic> json) =>
      _$ActivePrescriptionSummaryFromJson(json);
}

@freezed
abstract class MedicationStreak with _$MedicationStreak {
  const factory MedicationStreak({
    @Default(0) int currentStreak,
    @Default(0) int longestStreak,
    String? lastPerfectDate,
    @Default(1) int shieldsRemaining,
    @Default(false) bool todayCompleted,
  }) = _MedicationStreak;

  factory MedicationStreak.fromJson(Map<String, dynamic> json) =>
      _$MedicationStreakFromJson(json);
}

@freezed
abstract class MedicationDashboardResponse with _$MedicationDashboardResponse {
  const factory MedicationDashboardResponse({
    @Default([]) List<MedicationDoseSummary> nextDoses,
    @Default([]) List<MedicationScheduleEntry> todaySchedule,
    @Default([]) List<ActivePrescriptionSummary> activePrescriptions,
    MedicationStreak? streak,
  }) = _MedicationDashboardResponse;

  factory MedicationDashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicationDashboardResponseFromJson(json);
}

@freezed
abstract class MedicationCalendarResponse with _$MedicationCalendarResponse {
  const factory MedicationCalendarResponse({
    @Default([]) List<MedicationScheduleEntry> doses,
  }) = _MedicationCalendarResponse;

  factory MedicationCalendarResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicationCalendarResponseFromJson(json);
}

@freezed
abstract class PrescriptionDosesResponse with _$PrescriptionDosesResponse {
  const factory PrescriptionDosesResponse({
    required String prescriptionId,
    required String displayName,
    @Default([]) List<MedicationScheduleEntry> doses,
  }) = _PrescriptionDosesResponse;

  factory PrescriptionDosesResponse.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionDosesResponseFromJson(json);
}

@freezed
abstract class ScheduleUpdateResponse with _$ScheduleUpdateResponse {
  const factory ScheduleUpdateResponse({
    required String id,
    DateTime? patientScheduleStartAt,
    DateTime? scheduleConfirmedAt,
    @Default(0) int dosesGenerated,
  }) = _ScheduleUpdateResponse;

  factory ScheduleUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleUpdateResponseFromJson(json);
}

@freezed
abstract class MarkDoseTakenResponse with _$MarkDoseTakenResponse {
  const factory MarkDoseTakenResponse({
    required String id,
    required MedicationDoseStatus status,
    required DateTime takenAt,
    MedicationStreak? streak,
    @Default(false) bool dayCompleted,
  }) = _MarkDoseTakenResponse;

  factory MarkDoseTakenResponse.fromJson(Map<String, dynamic> json) =>
      _$MarkDoseTakenResponseFromJson(json);
}

@freezed
abstract class UnmarkDoseTakenResponse with _$UnmarkDoseTakenResponse {
  const factory UnmarkDoseTakenResponse({
    required String id,
    required MedicationDoseStatus status,
    MedicationStreak? streak,
  }) = _UnmarkDoseTakenResponse;

  factory UnmarkDoseTakenResponse.fromJson(Map<String, dynamic> json) =>
      _$UnmarkDoseTakenResponseFromJson(json);
}

@freezed
abstract class PrescriptionHistorySummary with _$PrescriptionHistorySummary {
  const factory PrescriptionHistorySummary({
    required String id,
    required String displayName,
    required String frequencyLabel,
    required PrescriptionHistoryStatus status,
    DateTime? startDate,
    DateTime? endDate,
    required String doctorName,
  }) = _PrescriptionHistorySummary;

  factory PrescriptionHistorySummary.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionHistorySummaryFromJson(json);
}

@freezed
abstract class PrescriptionHistoryListResponse
    with _$PrescriptionHistoryListResponse {
  const factory PrescriptionHistoryListResponse({
    @Default([]) List<PrescriptionHistorySummary> data,
    @Default(0) int total,
    @Default(1) int page,
    @Default(20) int limit,
  }) = _PrescriptionHistoryListResponse;

  factory PrescriptionHistoryListResponse.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionHistoryListResponseFromJson(json);
}

@freezed
abstract class RefillRequestResponse with _$RefillRequestResponse {
  const factory RefillRequestResponse({
    required String id,
    required String prescriptionId,
    required String status,
    required DateTime createdAt,
  }) = _RefillRequestResponse;

  factory RefillRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$RefillRequestResponseFromJson(json);
}
