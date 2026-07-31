// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmergencyResponder _$EmergencyResponderFromJson(Map<String, dynamic> json) =>
    _EmergencyResponder(
      id: json['id'] as String,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
    );

Map<String, dynamic> _$EmergencyResponderToJson(_EmergencyResponder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

_EmergencyRequest _$EmergencyRequestFromJson(Map<String, dynamic> json) =>
    _EmergencyRequest(
      id: json['id'] as String,
      status: $enumDecode(_$EmergencyRequestStatusEnumMap, json['status']),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      accuracyMeters: (json['accuracyMeters'] as num?)?.toDouble(),
      addressText: json['addressText'] as String?,
      description: json['description'] as String?,
      voiceUrl: json['voiceUrl'] as String?,
      videoUrl: json['videoUrl'] as String?,
      staffNote: json['staffNote'] as String?,
      respondedBy: json['respondedBy'] == null
          ? null
          : EmergencyResponder.fromJson(
              json['respondedBy'] as Map<String, dynamic>,
            ),
      acknowledgedAt: json['acknowledgedAt'] == null
          ? null
          : DateTime.parse(json['acknowledgedAt'] as String),
      dispatchedAt: json['dispatchedAt'] == null
          ? null
          : DateTime.parse(json['dispatchedAt'] as String),
      closedAt: json['closedAt'] == null
          ? null
          : DateTime.parse(json['closedAt'] as String),
      cancelledAt: json['cancelledAt'] == null
          ? null
          : DateTime.parse(json['cancelledAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$EmergencyRequestToJson(_EmergencyRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$EmergencyRequestStatusEnumMap[instance.status]!,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'accuracyMeters': instance.accuracyMeters,
      'addressText': instance.addressText,
      'description': instance.description,
      'voiceUrl': instance.voiceUrl,
      'videoUrl': instance.videoUrl,
      'staffNote': instance.staffNote,
      'respondedBy': instance.respondedBy,
      'acknowledgedAt': instance.acknowledgedAt?.toIso8601String(),
      'dispatchedAt': instance.dispatchedAt?.toIso8601String(),
      'closedAt': instance.closedAt?.toIso8601String(),
      'cancelledAt': instance.cancelledAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$EmergencyRequestStatusEnumMap = {
  EmergencyRequestStatus.submitted: 'SUBMITTED',
  EmergencyRequestStatus.acknowledged: 'ACKNOWLEDGED',
  EmergencyRequestStatus.dispatched: 'DISPATCHED',
  EmergencyRequestStatus.closed: 'CLOSED',
  EmergencyRequestStatus.cancelled: 'CANCELLED',
};

_EmergencyRequestListResponse _$EmergencyRequestListResponseFromJson(
  Map<String, dynamic> json,
) => _EmergencyRequestListResponse(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => EmergencyRequest.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  total: (json['total'] as num?)?.toInt() ?? 0,
  page: (json['page'] as num?)?.toInt() ?? 1,
  limit: (json['limit'] as num?)?.toInt() ?? 20,
);

Map<String, dynamic> _$EmergencyRequestListResponseToJson(
  _EmergencyRequestListResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'total': instance.total,
  'page': instance.page,
  'limit': instance.limit,
};
