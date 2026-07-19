import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_model.freezed.dart';
part 'device_model.g.dart';

enum PatientDeviceStatus {
  @JsonValue('PENDING')
  pending,
  @JsonValue('APPROVED')
  approved,
  @JsonValue('REVOKED')
  revoked,
}

@freezed
abstract class PatientDevice with _$PatientDevice {
  const factory PatientDevice({
    required String id,
    required PatientDeviceStatus status,
    String? platform,
    String? deviceLabel,
    bool? isCurrent,
    DateTime? createdAt,
    DateTime? approvedAt,
  }) = _PatientDevice;

  factory PatientDevice.fromJson(Map<String, dynamic> json) =>
      _$PatientDeviceFromJson(json);
}

@freezed
abstract class DeviceStatusResponse with _$DeviceStatusResponse {
  const factory DeviceStatusResponse({
    required PatientDevice device,
  }) = _DeviceStatusResponse;

  factory DeviceStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$DeviceStatusResponseFromJson(json);
}
