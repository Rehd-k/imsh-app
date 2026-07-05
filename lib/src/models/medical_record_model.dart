import 'package:freezed_annotation/freezed_annotation.dart';

part 'medical_record_model.freezed.dart';
part 'medical_record_model.g.dart';

@JsonEnum(alwaysCreate: true)
enum EncounterType {
  @JsonValue('OUTPATIENT')
  outpatient,
  @JsonValue('EMERGENCY')
  emergency,
  @JsonValue('INPATIENT_REVIEW')
  inpatientReview,
  @JsonValue('TELEMEDICINE')
  telemedicine,
  @JsonValue('FOLLOW_UP')
  followUp,
}

@JsonEnum(alwaysCreate: true)
enum EncounterStatus {
  @JsonValue('ONGOING')
  ongoing,
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('CANCELLED')
  cancelled,
}

extension EncounterTypeDisplay on EncounterType {
  String get label => switch (this) {
        EncounterType.outpatient => 'Outpatient',
        EncounterType.emergency => 'Emergency',
        EncounterType.inpatientReview => 'Inpatient review',
        EncounterType.telemedicine => 'Telemedicine',
        EncounterType.followUp => 'Follow-up',
      };
}

extension EncounterStatusDisplay on EncounterStatus {
  String get label => switch (this) {
        EncounterStatus.ongoing => 'Ongoing',
        EncounterStatus.completed => 'Completed',
        EncounterStatus.cancelled => 'Cancelled',
      };
}

@freezed
abstract class EncounterSummary with _$EncounterSummary {
  const factory EncounterSummary({
    required String id,
    required EncounterType encounterType,
    required EncounterStatus status,
    required DateTime startTime,
    DateTime? endTime,
    String? chiefComplaint,
    String? visitType,
    required String doctorName,
    String? primaryDiagnosis,
  }) = _EncounterSummary;

  factory EncounterSummary.fromJson(Map<String, dynamic> json) =>
      _$EncounterSummaryFromJson(json);
}

@freezed
abstract class EncounterListResponse with _$EncounterListResponse {
  const factory EncounterListResponse({
    required List<EncounterSummary> data,
    required int total,
    required int page,
    required int limit,
  }) = _EncounterListResponse;

  factory EncounterListResponse.fromJson(Map<String, dynamic> json) =>
      _$EncounterListResponseFromJson(json);
}

@freezed
abstract class EncounterVitals with _$EncounterVitals {
  const factory EncounterVitals({
    int? systolic,
    int? diastolic,
    double? temperature,
    double? height,
    double? weight,
    double? bmi,
    int? pulseRate,
    int? respRate,
    double? spo2,
    int? painScore,
    double? bloodGlucose,
    DateTime? recordedAt,
  }) = _EncounterVitals;

  factory EncounterVitals.fromJson(Map<String, dynamic> json) =>
      _$EncounterVitalsFromJson(json);
}

@freezed
abstract class EncounterDiagnosis with _$EncounterDiagnosis {
  const factory EncounterDiagnosis({
    String? primaryIcdCode,
    String? primaryIcdDescription,
    Object? secondaryDiagnoses,
  }) = _EncounterDiagnosis;

  factory EncounterDiagnosis.fromJson(Map<String, dynamic> json) =>
      _$EncounterDiagnosisFromJson(json);
}

@freezed
abstract class EncounterPrescriptionItem with _$EncounterPrescriptionItem {
  const factory EncounterPrescriptionItem({
    required String drugName,
    required String dosage,
    String? frequency,
    int? duration,
    String? instructions,
  }) = _EncounterPrescriptionItem;

  factory EncounterPrescriptionItem.fromJson(Map<String, dynamic> json) =>
      _$EncounterPrescriptionItemFromJson(json);
}

@freezed
abstract class EncounterPrescription with _$EncounterPrescription {
  const factory EncounterPrescription({
    required String id,
    String? drug,
    String? dosage,
    String? notes,
    DateTime? startDate,
    DateTime? endDate,
    @Default([]) List<EncounterPrescriptionItem> items,
  }) = _EncounterPrescription;

  factory EncounterPrescription.fromJson(Map<String, dynamic> json) =>
      _$EncounterPrescriptionFromJson(json);
}

@freezed
abstract class EncounterSoap with _$EncounterSoap {
  const factory EncounterSoap({
    String? subjective,
    String? objective,
    String? assessment,
    String? plan,
  }) = _EncounterSoap;

  factory EncounterSoap.fromJson(Map<String, dynamic> json) =>
      _$EncounterSoapFromJson(json);
}

@freezed
abstract class EncounterDetail with _$EncounterDetail {
  const factory EncounterDetail({
    required String id,
    required EncounterType encounterType,
    required EncounterStatus status,
    required DateTime startTime,
    DateTime? endTime,
    String? chiefComplaint,
    String? visitType,
    required String doctorName,
    String? primaryDiagnosis,
    EncounterVitals? vitals,
    @Default([]) List<EncounterDiagnosis> diagnoses,
    @Default([]) List<EncounterPrescription> prescriptions,
    EncounterSoap? soap,
    String? followUpDate,
    String? followUpInstructions,
    String? referral,
  }) = _EncounterDetail;

  factory EncounterDetail.fromJson(Map<String, dynamic> json) =>
      _$EncounterDetailFromJson(json);
}
