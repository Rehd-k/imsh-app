import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_model.freezed.dart';
part 'feedback_model.g.dart';

@JsonEnum(alwaysCreate: true)
enum PatientFeedbackKind {
  @JsonValue('COMPLAINT')
  complaint,
  @JsonValue('SUGGESTION')
  suggestion,
  @JsonValue('GENERAL')
  general,
}

@JsonEnum(alwaysCreate: true)
enum PatientFeedbackStatus {
  @JsonValue('OPEN')
  open,
  @JsonValue('IN_REVIEW')
  inReview,
  @JsonValue('RESOLVED')
  resolved,
  @JsonValue('CLOSED')
  closed,
}

extension PatientFeedbackKindDisplay on PatientFeedbackKind {
  String get label => switch (this) {
    PatientFeedbackKind.complaint => 'Complaint',
    PatientFeedbackKind.suggestion => 'Suggestion',
    PatientFeedbackKind.general => 'General feedback',
  };

  String get apiValue => switch (this) {
    PatientFeedbackKind.complaint => 'COMPLAINT',
    PatientFeedbackKind.suggestion => 'SUGGESTION',
    PatientFeedbackKind.general => 'GENERAL',
  };
}

extension PatientFeedbackStatusDisplay on PatientFeedbackStatus {
  String get label => switch (this) {
    PatientFeedbackStatus.open => 'Open',
    PatientFeedbackStatus.inReview => 'In review',
    PatientFeedbackStatus.resolved => 'Resolved',
    PatientFeedbackStatus.closed => 'Closed',
  };

  String get apiValue => switch (this) {
    PatientFeedbackStatus.open => 'OPEN',
    PatientFeedbackStatus.inReview => 'IN_REVIEW',
    PatientFeedbackStatus.resolved => 'RESOLVED',
    PatientFeedbackStatus.closed => 'CLOSED',
  };
}

@freezed
abstract class FeedbackDepartment with _$FeedbackDepartment {
  const factory FeedbackDepartment({required String id, required String name}) =
      _FeedbackDepartment;

  factory FeedbackDepartment.fromJson(Map<String, dynamic> json) =>
      _$FeedbackDepartmentFromJson(json);
}

@freezed
abstract class FeedbackResponder with _$FeedbackResponder {
  const factory FeedbackResponder({
    required String id,
    String? firstName,
    String? lastName,
  }) = _FeedbackResponder;

  factory FeedbackResponder.fromJson(Map<String, dynamic> json) =>
      _$FeedbackResponderFromJson(json);
}

extension FeedbackResponderDisplay on FeedbackResponder {
  String get displayName {
    final parts = [firstName, lastName]
        .whereType<String>()
        .map((value) => value.trim())
        .where((value) => value.isNotEmpty);
    final name = parts.join(' ');
    return name.isEmpty ? 'Frontdesk' : name;
  }
}

@freezed
abstract class PatientFeedback with _$PatientFeedback {
  const factory PatientFeedback({
    required String id,
    required PatientFeedbackKind kind,
    required PatientFeedbackStatus status,
    required String subject,
    required String message,
    FeedbackDepartment? department,
    String? staffResponse,
    DateTime? resolvedAt,
    FeedbackResponder? respondedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _PatientFeedback;

  factory PatientFeedback.fromJson(Map<String, dynamic> json) =>
      _$PatientFeedbackFromJson(json);
}

@freezed
abstract class PatientFeedbackListResponse with _$PatientFeedbackListResponse {
  const factory PatientFeedbackListResponse({
    @Default([]) List<PatientFeedback> data,
    @Default(0) int total,
    @Default(1) int page,
    @Default(20) int limit,
  }) = _PatientFeedbackListResponse;

  factory PatientFeedbackListResponse.fromJson(Map<String, dynamic> json) =>
      _$PatientFeedbackListResponseFromJson(json);
}

@freezed
abstract class CloseFeedbackResponse with _$CloseFeedbackResponse {
  const factory CloseFeedbackResponse({
    required String id,
    required PatientFeedbackStatus status,
    String? message,
  }) = _CloseFeedbackResponse;

  factory CloseFeedbackResponse.fromJson(Map<String, dynamic> json) =>
      _$CloseFeedbackResponseFromJson(json);
}

class CreateFeedbackRequest {
  const CreateFeedbackRequest({
    required this.kind,
    required this.subject,
    required this.message,
    this.departmentId,
  });

  final PatientFeedbackKind kind;
  final String subject;
  final String message;
  final String? departmentId;
}

class UpdateFeedbackRequest {
  const UpdateFeedbackRequest({
    this.kind,
    this.subject,
    this.message,
    this.departmentId,
  });

  final PatientFeedbackKind? kind;
  final String? subject;
  final String? message;
  final String? departmentId;
}
