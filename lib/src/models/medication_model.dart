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
  }) = _ActivePrescriptionSummary;

  factory ActivePrescriptionSummary.fromJson(Map<String, dynamic> json) =>
      _$ActivePrescriptionSummaryFromJson(json);
}

@freezed
abstract class MedicationDashboardResponse with _$MedicationDashboardResponse {
  const factory MedicationDashboardResponse({
    @Default([]) List<MedicationDoseSummary> nextDoses,
    @Default([]) List<MedicationScheduleEntry> todaySchedule,
    @Default([]) List<ActivePrescriptionSummary> activePrescriptions,
  }) = _MedicationDashboardResponse;

  factory MedicationDashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicationDashboardResponseFromJson(json);
}

@freezed
abstract class MarkDoseTakenResponse with _$MarkDoseTakenResponse {
  const factory MarkDoseTakenResponse({
    required String id,
    required MedicationDoseStatus status,
    required DateTime takenAt,
  }) = _MarkDoseTakenResponse;

  factory MarkDoseTakenResponse.fromJson(Map<String, dynamic> json) =>
      _$MarkDoseTakenResponseFromJson(json);
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
