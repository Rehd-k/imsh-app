// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PatientDevice _$PatientDeviceFromJson(Map<String, dynamic> json) =>
    _PatientDevice(
      id: json['id'] as String,
      status: $enumDecode(_$PatientDeviceStatusEnumMap, json['status']),
      platform: json['platform'] as String?,
      deviceLabel: json['deviceLabel'] as String?,
      isCurrent: json['isCurrent'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      approvedAt: json['approvedAt'] == null
          ? null
          : DateTime.parse(json['approvedAt'] as String),
    );

Map<String, dynamic> _$PatientDeviceToJson(_PatientDevice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$PatientDeviceStatusEnumMap[instance.status]!,
      'platform': instance.platform,
      'deviceLabel': instance.deviceLabel,
      'isCurrent': instance.isCurrent,
      'createdAt': instance.createdAt?.toIso8601String(),
      'approvedAt': instance.approvedAt?.toIso8601String(),
    };

const _$PatientDeviceStatusEnumMap = {
  PatientDeviceStatus.pending: 'PENDING',
  PatientDeviceStatus.approved: 'APPROVED',
  PatientDeviceStatus.revoked: 'REVOKED',
};

_DeviceStatusResponse _$DeviceStatusResponseFromJson(
  Map<String, dynamic> json,
) => _DeviceStatusResponse(
  device: PatientDevice.fromJson(json['device'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DeviceStatusResponseToJson(
  _DeviceStatusResponse instance,
) => <String, dynamic>{'device': instance.device};
