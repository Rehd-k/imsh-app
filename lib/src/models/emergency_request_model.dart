import 'package:freezed_annotation/freezed_annotation.dart';

part 'emergency_request_model.freezed.dart';
part 'emergency_request_model.g.dart';

@JsonEnum(alwaysCreate: true)
enum EmergencyRequestStatus {
  @JsonValue('SUBMITTED')
  submitted,
  @JsonValue('ACKNOWLEDGED')
  acknowledged,
  @JsonValue('DISPATCHED')
  dispatched,
  @JsonValue('CLOSED')
  closed,
  @JsonValue('CANCELLED')
  cancelled,
}

extension EmergencyRequestStatusDisplay on EmergencyRequestStatus {
  String get label => switch (this) {
    EmergencyRequestStatus.submitted => 'Waiting',
    EmergencyRequestStatus.acknowledged => 'Acknowledged',
    EmergencyRequestStatus.dispatched => 'Ambulance dispatched',
    EmergencyRequestStatus.closed => 'Closed',
    EmergencyRequestStatus.cancelled => 'Cancelled',
  };

  String get apiValue => switch (this) {
    EmergencyRequestStatus.submitted => 'SUBMITTED',
    EmergencyRequestStatus.acknowledged => 'ACKNOWLEDGED',
    EmergencyRequestStatus.dispatched => 'DISPATCHED',
    EmergencyRequestStatus.closed => 'CLOSED',
    EmergencyRequestStatus.cancelled => 'CANCELLED',
  };
}

@freezed
abstract class EmergencyResponder with _$EmergencyResponder {
  const factory EmergencyResponder({
    required String id,
    String? firstName,
    String? lastName,
  }) = _EmergencyResponder;

  factory EmergencyResponder.fromJson(Map<String, dynamic> json) =>
      _$EmergencyResponderFromJson(json);
}

extension EmergencyResponderDisplay on EmergencyResponder {
  String get displayName {
    final parts = [firstName, lastName]
        .whereType<String>()
        .map((value) => value.trim())
        .where((value) => value.isNotEmpty);
    final name = parts.join(' ');
    return name.isEmpty ? 'ED staff' : name;
  }
}

@freezed
abstract class EmergencyRequest with _$EmergencyRequest {
  const factory EmergencyRequest({
    required String id,
    required EmergencyRequestStatus status,
    required double latitude,
    required double longitude,
    double? accuracyMeters,
    String? addressText,
    String? description,
    String? voiceUrl,
    String? videoUrl,
    String? staffNote,
    EmergencyResponder? respondedBy,
    DateTime? acknowledgedAt,
    DateTime? dispatchedAt,
    DateTime? closedAt,
    DateTime? cancelledAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _EmergencyRequest;

  factory EmergencyRequest.fromJson(Map<String, dynamic> json) =>
      _$EmergencyRequestFromJson(json);
}

@freezed
abstract class EmergencyRequestListResponse
    with _$EmergencyRequestListResponse {
  const factory EmergencyRequestListResponse({
    @Default([]) List<EmergencyRequest> data,
    @Default(0) int total,
    @Default(1) int page,
    @Default(20) int limit,
  }) = _EmergencyRequestListResponse;

  factory EmergencyRequestListResponse.fromJson(Map<String, dynamic> json) =>
      _$EmergencyRequestListResponseFromJson(json);
}

class CreateEmergencyRequestPayload {
  const CreateEmergencyRequestPayload({
    required this.latitude,
    required this.longitude,
    this.accuracyMeters,
    this.addressText,
    this.description,
    this.voicePath,
    this.videoPath,
    this.guestName,
    this.guestPhone,
  });

  final double latitude;
  final double longitude;
  final double? accuracyMeters;
  final String? addressText;
  final String? description;
  final String? voicePath;
  final String? videoPath;
  final String? guestName;
  final String? guestPhone;

  bool get hasAttachment {
    final text = description?.trim() ?? '';
    return text.isNotEmpty ||
        (voicePath != null && voicePath!.isNotEmpty) ||
        (videoPath != null && videoPath!.isNotEmpty);
  }
}
