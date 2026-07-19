// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeedbackDepartment _$FeedbackDepartmentFromJson(Map<String, dynamic> json) =>
    _FeedbackDepartment(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$FeedbackDepartmentToJson(_FeedbackDepartment instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_FeedbackResponder _$FeedbackResponderFromJson(Map<String, dynamic> json) =>
    _FeedbackResponder(
      id: json['id'] as String,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
    );

Map<String, dynamic> _$FeedbackResponderToJson(_FeedbackResponder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

_PatientFeedback _$PatientFeedbackFromJson(
  Map<String, dynamic> json,
) => _PatientFeedback(
  id: json['id'] as String,
  kind: $enumDecode(_$PatientFeedbackKindEnumMap, json['kind']),
  status: $enumDecode(_$PatientFeedbackStatusEnumMap, json['status']),
  subject: json['subject'] as String,
  message: json['message'] as String,
  department: json['department'] == null
      ? null
      : FeedbackDepartment.fromJson(json['department'] as Map<String, dynamic>),
  staffResponse: json['staffResponse'] as String?,
  resolvedAt: json['resolvedAt'] == null
      ? null
      : DateTime.parse(json['resolvedAt'] as String),
  respondedBy: json['respondedBy'] == null
      ? null
      : FeedbackResponder.fromJson(json['respondedBy'] as Map<String, dynamic>),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$PatientFeedbackToJson(_PatientFeedback instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': _$PatientFeedbackKindEnumMap[instance.kind]!,
      'status': _$PatientFeedbackStatusEnumMap[instance.status]!,
      'subject': instance.subject,
      'message': instance.message,
      'department': instance.department,
      'staffResponse': instance.staffResponse,
      'resolvedAt': instance.resolvedAt?.toIso8601String(),
      'respondedBy': instance.respondedBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$PatientFeedbackKindEnumMap = {
  PatientFeedbackKind.complaint: 'COMPLAINT',
  PatientFeedbackKind.suggestion: 'SUGGESTION',
  PatientFeedbackKind.general: 'GENERAL',
};

const _$PatientFeedbackStatusEnumMap = {
  PatientFeedbackStatus.open: 'OPEN',
  PatientFeedbackStatus.inReview: 'IN_REVIEW',
  PatientFeedbackStatus.resolved: 'RESOLVED',
  PatientFeedbackStatus.closed: 'CLOSED',
};

_PatientFeedbackListResponse _$PatientFeedbackListResponseFromJson(
  Map<String, dynamic> json,
) => _PatientFeedbackListResponse(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => PatientFeedback.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  total: (json['total'] as num?)?.toInt() ?? 0,
  page: (json['page'] as num?)?.toInt() ?? 1,
  limit: (json['limit'] as num?)?.toInt() ?? 20,
);

Map<String, dynamic> _$PatientFeedbackListResponseToJson(
  _PatientFeedbackListResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'total': instance.total,
  'page': instance.page,
  'limit': instance.limit,
};

_CloseFeedbackResponse _$CloseFeedbackResponseFromJson(
  Map<String, dynamic> json,
) => _CloseFeedbackResponse(
  id: json['id'] as String,
  status: $enumDecode(_$PatientFeedbackStatusEnumMap, json['status']),
  message: json['message'] as String?,
);

Map<String, dynamic> _$CloseFeedbackResponseToJson(
  _CloseFeedbackResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': _$PatientFeedbackStatusEnumMap[instance.status]!,
  'message': instance.message,
};
