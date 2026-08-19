import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_model.freezed.dart';
part 'appointment_model.g.dart';

@JsonEnum(alwaysCreate: true)
enum AppointmentStatus {
  @JsonValue('REQUESTED')
  requested,
  @JsonValue('CONFIRMED')
  confirmed,
  @JsonValue('PENDING')
  pending,
  @JsonValue('CANCELLED')
  cancelled,
  @JsonValue('COMPLETED')
  completed,
}

@JsonEnum(alwaysCreate: true)
enum AppointmentVisitType {
  @JsonValue('IN_PERSON')
  inPerson,
  @JsonValue('TELEMEDICINE')
  telemedicine,
}

@JsonEnum(alwaysCreate: true)
enum AppointmentFilterTab {
  @JsonValue('UPCOMING')
  upcoming,
  @JsonValue('PAST')
  past,
  @JsonValue('PENDING')
  pending,
}

@JsonEnum(alwaysCreate: true)
enum ConsultationResultStatus {
  @JsonValue('NORMAL')
  normal,
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('ABNORMAL')
  abnormal,
  @JsonValue('PENDING')
  pending,
}

extension AppointmentStatusDisplay on AppointmentStatus {
  String get label => switch (this) {
        AppointmentStatus.requested => 'Requested',
        AppointmentStatus.confirmed => 'Confirmed',
        AppointmentStatus.pending => 'Pending',
        AppointmentStatus.cancelled => 'Cancelled',
        AppointmentStatus.completed => 'Completed',
      };
}

extension AppointmentVisitTypeDisplay on AppointmentVisitType {
  String get label => switch (this) {
        AppointmentVisitType.inPerson => 'In person',
        AppointmentVisitType.telemedicine => 'Telemedicine',
      };

  String get apiValue => switch (this) {
        AppointmentVisitType.inPerson => 'IN_PERSON',
        AppointmentVisitType.telemedicine => 'TELEMEDICINE',
      };
}

extension AppointmentFilterTabDisplay on AppointmentFilterTab {
  String get label => switch (this) {
        AppointmentFilterTab.upcoming => 'Upcoming',
        AppointmentFilterTab.past => 'Past',
        AppointmentFilterTab.pending => 'Pending',
      };

  String get apiValue => switch (this) {
        AppointmentFilterTab.upcoming => 'UPCOMING',
        AppointmentFilterTab.past => 'PAST',
        AppointmentFilterTab.pending => 'PENDING',
      };
}

extension ConsultationResultStatusDisplay on ConsultationResultStatus {
  String get label => switch (this) {
        ConsultationResultStatus.normal => 'Normal',
        ConsultationResultStatus.completed => 'Completed',
        ConsultationResultStatus.abnormal => 'Abnormal',
        ConsultationResultStatus.pending => 'Pending',
      };
}

@freezed
abstract class DoctorSummary with _$DoctorSummary {
  const factory DoctorSummary({
    required String id,
    required String name,
    String? specialty,
    String? avatarUrl,
  }) = _DoctorSummary;

  factory DoctorSummary.fromJson(Map<String, dynamic> json) =>
      _$DoctorSummaryFromJson(json);
}

@freezed
abstract class AppointmentSummary with _$AppointmentSummary {
  const factory AppointmentSummary({
    required String id,
    required AppointmentStatus status,
    required DateTime scheduledAt,
    String? location,
    String? specialty,
    @Default(AppointmentVisitType.inPerson) AppointmentVisitType visitType,
    required DoctorSummary doctor,
    @Default(true) bool canReschedule,
    @Default(true) bool canCancel,
  }) = _AppointmentSummary;

  factory AppointmentSummary.fromJson(Map<String, dynamic> json) =>
      _$AppointmentSummaryFromJson(json);
}

extension AppointmentSummaryDisplay on AppointmentSummary {
  String get specialtyLabel {
    final direct = specialty?.trim();
    if (direct != null && direct.isNotEmpty) return direct;
    final fromDoctor = doctor.specialty?.trim();
    if (fromDoctor != null && fromDoctor.isNotEmpty) return fromDoctor;
    return 'Appointment';
  }

  String get doctorDisplayName {
    final name = doctor.name.trim();
    if (name.isEmpty || name.toLowerCase() == 'unassigned') {
      return status == AppointmentStatus.requested
          ? 'Doctor to be assigned'
          : 'Unassigned';
    }
    return name;
  }

  bool get isUnassignedDoctor {
    final name = doctor.name.trim().toLowerCase();
    return name.isEmpty || name == 'unassigned' || doctor.id.isEmpty;
  }

  String get locationLabel {
    final value = location?.trim();
    if (value == null || value.isEmpty) {
      return visitType == AppointmentVisitType.telemedicine
          ? 'Telemedicine'
          : 'Location TBD';
    }
    return value;
  }
}

@freezed
abstract class AppointmentDetail with _$AppointmentDetail {
  const factory AppointmentDetail({
    required String id,
    required AppointmentStatus status,
    required DateTime scheduledAt,
    String? location,
    String? specialty,
    @Default(AppointmentVisitType.inPerson) AppointmentVisitType visitType,
    required DoctorSummary doctor,
    String? reason,
    String? notes,
    @Default(true) bool canReschedule,
    @Default(true) bool canCancel,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _AppointmentDetail;

  factory AppointmentDetail.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDetailFromJson(json);
}

extension AppointmentDetailDisplay on AppointmentDetail {
  String get specialtyLabel {
    final direct = specialty?.trim();
    if (direct != null && direct.isNotEmpty) return direct;
    final fromDoctor = doctor.specialty?.trim();
    if (fromDoctor != null && fromDoctor.isNotEmpty) return fromDoctor;
    return 'Appointment';
  }

  String get doctorDisplayName {
    final name = doctor.name.trim();
    if (name.isEmpty || name.toLowerCase() == 'unassigned') {
      return status == AppointmentStatus.requested
          ? 'Doctor to be assigned'
          : 'Unassigned';
    }
    return name;
  }

  bool get isUnassignedDoctor {
    final name = doctor.name.trim().toLowerCase();
    return name.isEmpty || name == 'unassigned' || doctor.id.isEmpty;
  }

  String get locationLabel {
    final value = location?.trim();
    if (value == null || value.isEmpty) {
      return visitType == AppointmentVisitType.telemedicine
          ? 'Telemedicine'
          : 'Location TBD';
    }
    return value;
  }
}

@freezed
abstract class ConsultationHistoryItem with _$ConsultationHistoryItem {
  const factory ConsultationHistoryItem({
    required String id,
    required String title,
    String? providerName,
    String? department,
    required DateTime visitedAt,
    required ConsultationResultStatus resultStatus,
  }) = _ConsultationHistoryItem;

  factory ConsultationHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$ConsultationHistoryItemFromJson(json);
}

extension ConsultationHistoryItemDisplay on ConsultationHistoryItem {
  String get subtitleLine {
    final provider = providerName ?? department;
    if (provider == null) return '';
    return provider;
  }
}

@freezed
abstract class AppointmentsDashboardResponse
    with _$AppointmentsDashboardResponse {
  const factory AppointmentsDashboardResponse({
    AppointmentSummary? nextAppointment,
    @Default([]) List<AppointmentSummary> upcomingAppointments,
    @Default([]) List<ConsultationHistoryItem> consultationHistory,
  }) = _AppointmentsDashboardResponse;

  factory AppointmentsDashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentsDashboardResponseFromJson(json);
}

@freezed
abstract class AppointmentListResponse with _$AppointmentListResponse {
  const factory AppointmentListResponse({
    @Default([]) List<AppointmentSummary> data,
    @Default(0) int total,
    @Default(1) int page,
    @Default(20) int limit,
  }) = _AppointmentListResponse;

  factory AppointmentListResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentListResponseFromJson(json);
}

@freezed
abstract class CancelAppointmentResponse with _$CancelAppointmentResponse {
  const factory CancelAppointmentResponse({
    required String id,
    required AppointmentStatus status,
  }) = _CancelAppointmentResponse;

  factory CancelAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelAppointmentResponseFromJson(json);
}

@freezed
abstract class AppointmentSpecialty with _$AppointmentSpecialty {
  const factory AppointmentSpecialty({
    required String id,
    required String name,
    String? description,
  }) = _AppointmentSpecialty;

  factory AppointmentSpecialty.fromJson(Map<String, dynamic> json) =>
      _$AppointmentSpecialtyFromJson(json);
}

@freezed
abstract class AppointmentSpecialtyListResponse
    with _$AppointmentSpecialtyListResponse {
  const factory AppointmentSpecialtyListResponse({
    @Default([]) List<AppointmentSpecialty> data,
  }) = _AppointmentSpecialtyListResponse;

  factory AppointmentSpecialtyListResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AppointmentSpecialtyListResponseFromJson(json);
}

@freezed
abstract class BookableDoctor with _$BookableDoctor {
  const factory BookableDoctor({
    required String id,
    required String name,
    String? specialty,
    String? avatarUrl,
  }) = _BookableDoctor;

  factory BookableDoctor.fromJson(Map<String, dynamic> json) =>
      _$BookableDoctorFromJson(json);
}

@freezed
abstract class BookableDoctorListResponse with _$BookableDoctorListResponse {
  const factory BookableDoctorListResponse({
    @Default([]) List<BookableDoctor> data,
  }) = _BookableDoctorListResponse;

  factory BookableDoctorListResponse.fromJson(Map<String, dynamic> json) =>
      _$BookableDoctorListResponseFromJson(json);
}

@freezed
abstract class AvailabilitySlot with _$AvailabilitySlot {
  const factory AvailabilitySlot({
    required DateTime scheduledAt,
    @Default(true) bool available,
  }) = _AvailabilitySlot;

  factory AvailabilitySlot.fromJson(Map<String, dynamic> json) =>
      _$AvailabilitySlotFromJson(json);
}

@freezed
abstract class AvailabilityResponse with _$AvailabilityResponse {
  const factory AvailabilityResponse({
    required String doctorId,
    required String date,
    @Default([]) List<AvailabilitySlot> slots,
  }) = _AvailabilityResponse;

  factory AvailabilityResponse.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityResponseFromJson(json);
}

@freezed
abstract class CreateAppointmentRequest with _$CreateAppointmentRequest {
  const factory CreateAppointmentRequest({
    required String specialty,
    required String date,
    required AppointmentVisitType visitType,
    String? reason,
  }) = _CreateAppointmentRequest;

  factory CreateAppointmentRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAppointmentRequestFromJson(json);
}

@freezed
abstract class UpdateAppointmentRequest with _$UpdateAppointmentRequest {
  const factory UpdateAppointmentRequest({
    DateTime? scheduledAt,
    String? reason,
  }) = _UpdateAppointmentRequest;

  factory UpdateAppointmentRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateAppointmentRequestFromJson(json);
}
