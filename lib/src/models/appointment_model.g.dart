// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DoctorSummary _$DoctorSummaryFromJson(Map<String, dynamic> json) =>
    _DoctorSummary(
      id: json['id'] as String,
      name: json['name'] as String,
      specialty: json['specialty'] as String,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$DoctorSummaryToJson(_DoctorSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'specialty': instance.specialty,
      'avatarUrl': instance.avatarUrl,
    };

_AppointmentSummary _$AppointmentSummaryFromJson(Map<String, dynamic> json) =>
    _AppointmentSummary(
      id: json['id'] as String,
      status: $enumDecode(_$AppointmentStatusEnumMap, json['status']),
      scheduledAt: DateTime.parse(json['scheduledAt'] as String),
      location: json['location'] as String,
      doctor: DoctorSummary.fromJson(json['doctor'] as Map<String, dynamic>),
      canReschedule: json['canReschedule'] as bool? ?? true,
      canCancel: json['canCancel'] as bool? ?? true,
    );

Map<String, dynamic> _$AppointmentSummaryToJson(_AppointmentSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$AppointmentStatusEnumMap[instance.status]!,
      'scheduledAt': instance.scheduledAt.toIso8601String(),
      'location': instance.location,
      'doctor': instance.doctor,
      'canReschedule': instance.canReschedule,
      'canCancel': instance.canCancel,
    };

const _$AppointmentStatusEnumMap = {
  AppointmentStatus.confirmed: 'CONFIRMED',
  AppointmentStatus.pending: 'PENDING',
  AppointmentStatus.cancelled: 'CANCELLED',
  AppointmentStatus.completed: 'COMPLETED',
};

_AppointmentDetail _$AppointmentDetailFromJson(Map<String, dynamic> json) =>
    _AppointmentDetail(
      id: json['id'] as String,
      status: $enumDecode(_$AppointmentStatusEnumMap, json['status']),
      scheduledAt: DateTime.parse(json['scheduledAt'] as String),
      location: json['location'] as String,
      doctor: DoctorSummary.fromJson(json['doctor'] as Map<String, dynamic>),
      reason: json['reason'] as String?,
      notes: json['notes'] as String?,
      canReschedule: json['canReschedule'] as bool? ?? true,
      canCancel: json['canCancel'] as bool? ?? true,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AppointmentDetailToJson(_AppointmentDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$AppointmentStatusEnumMap[instance.status]!,
      'scheduledAt': instance.scheduledAt.toIso8601String(),
      'location': instance.location,
      'doctor': instance.doctor,
      'reason': instance.reason,
      'notes': instance.notes,
      'canReschedule': instance.canReschedule,
      'canCancel': instance.canCancel,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_ConsultationHistoryItem _$ConsultationHistoryItemFromJson(
  Map<String, dynamic> json,
) => _ConsultationHistoryItem(
  id: json['id'] as String,
  title: json['title'] as String,
  providerName: json['providerName'] as String?,
  department: json['department'] as String?,
  visitedAt: DateTime.parse(json['visitedAt'] as String),
  resultStatus: $enumDecode(
    _$ConsultationResultStatusEnumMap,
    json['resultStatus'],
  ),
);

Map<String, dynamic> _$ConsultationHistoryItemToJson(
  _ConsultationHistoryItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'providerName': instance.providerName,
  'department': instance.department,
  'visitedAt': instance.visitedAt.toIso8601String(),
  'resultStatus': _$ConsultationResultStatusEnumMap[instance.resultStatus]!,
};

const _$ConsultationResultStatusEnumMap = {
  ConsultationResultStatus.normal: 'NORMAL',
  ConsultationResultStatus.completed: 'COMPLETED',
  ConsultationResultStatus.abnormal: 'ABNORMAL',
  ConsultationResultStatus.pending: 'PENDING',
};

_AppointmentsDashboardResponse _$AppointmentsDashboardResponseFromJson(
  Map<String, dynamic> json,
) => _AppointmentsDashboardResponse(
  nextAppointment: json['nextAppointment'] == null
      ? null
      : AppointmentSummary.fromJson(
          json['nextAppointment'] as Map<String, dynamic>,
        ),
  upcomingAppointments:
      (json['upcomingAppointments'] as List<dynamic>?)
          ?.map((e) => AppointmentSummary.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  consultationHistory:
      (json['consultationHistory'] as List<dynamic>?)
          ?.map(
            (e) => ConsultationHistoryItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$AppointmentsDashboardResponseToJson(
  _AppointmentsDashboardResponse instance,
) => <String, dynamic>{
  'nextAppointment': instance.nextAppointment,
  'upcomingAppointments': instance.upcomingAppointments,
  'consultationHistory': instance.consultationHistory,
};

_AppointmentListResponse _$AppointmentListResponseFromJson(
  Map<String, dynamic> json,
) => _AppointmentListResponse(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => AppointmentSummary.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  total: (json['total'] as num?)?.toInt() ?? 0,
  page: (json['page'] as num?)?.toInt() ?? 1,
  limit: (json['limit'] as num?)?.toInt() ?? 20,
);

Map<String, dynamic> _$AppointmentListResponseToJson(
  _AppointmentListResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'total': instance.total,
  'page': instance.page,
  'limit': instance.limit,
};

_CancelAppointmentResponse _$CancelAppointmentResponseFromJson(
  Map<String, dynamic> json,
) => _CancelAppointmentResponse(
  id: json['id'] as String,
  status: $enumDecode(_$AppointmentStatusEnumMap, json['status']),
);

Map<String, dynamic> _$CancelAppointmentResponseToJson(
  _CancelAppointmentResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': _$AppointmentStatusEnumMap[instance.status]!,
};

_AppointmentSpecialty _$AppointmentSpecialtyFromJson(
  Map<String, dynamic> json,
) => _AppointmentSpecialty(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
);

Map<String, dynamic> _$AppointmentSpecialtyToJson(
  _AppointmentSpecialty instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
};

_AppointmentSpecialtyListResponse _$AppointmentSpecialtyListResponseFromJson(
  Map<String, dynamic> json,
) => _AppointmentSpecialtyListResponse(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => AppointmentSpecialty.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$AppointmentSpecialtyListResponseToJson(
  _AppointmentSpecialtyListResponse instance,
) => <String, dynamic>{'data': instance.data};

_BookableDoctor _$BookableDoctorFromJson(Map<String, dynamic> json) =>
    _BookableDoctor(
      id: json['id'] as String,
      name: json['name'] as String,
      specialty: json['specialty'] as String,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$BookableDoctorToJson(_BookableDoctor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'specialty': instance.specialty,
      'avatarUrl': instance.avatarUrl,
    };

_BookableDoctorListResponse _$BookableDoctorListResponseFromJson(
  Map<String, dynamic> json,
) => _BookableDoctorListResponse(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => BookableDoctor.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$BookableDoctorListResponseToJson(
  _BookableDoctorListResponse instance,
) => <String, dynamic>{'data': instance.data};

_AvailabilitySlot _$AvailabilitySlotFromJson(Map<String, dynamic> json) =>
    _AvailabilitySlot(
      scheduledAt: DateTime.parse(json['scheduledAt'] as String),
      available: json['available'] as bool? ?? true,
    );

Map<String, dynamic> _$AvailabilitySlotToJson(_AvailabilitySlot instance) =>
    <String, dynamic>{
      'scheduledAt': instance.scheduledAt.toIso8601String(),
      'available': instance.available,
    };

_AvailabilityResponse _$AvailabilityResponseFromJson(
  Map<String, dynamic> json,
) => _AvailabilityResponse(
  doctorId: json['doctorId'] as String,
  date: json['date'] as String,
  slots:
      (json['slots'] as List<dynamic>?)
          ?.map((e) => AvailabilitySlot.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$AvailabilityResponseToJson(
  _AvailabilityResponse instance,
) => <String, dynamic>{
  'doctorId': instance.doctorId,
  'date': instance.date,
  'slots': instance.slots,
};

_CreateAppointmentRequest _$CreateAppointmentRequestFromJson(
  Map<String, dynamic> json,
) => _CreateAppointmentRequest(
  doctorId: json['doctorId'] as String,
  scheduledAt: DateTime.parse(json['scheduledAt'] as String),
  reason: json['reason'] as String?,
);

Map<String, dynamic> _$CreateAppointmentRequestToJson(
  _CreateAppointmentRequest instance,
) => <String, dynamic>{
  'doctorId': instance.doctorId,
  'scheduledAt': instance.scheduledAt.toIso8601String(),
  'reason': instance.reason,
};

_UpdateAppointmentRequest _$UpdateAppointmentRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateAppointmentRequest(
  scheduledAt: json['scheduledAt'] == null
      ? null
      : DateTime.parse(json['scheduledAt'] as String),
  reason: json['reason'] as String?,
);

Map<String, dynamic> _$UpdateAppointmentRequestToJson(
  _UpdateAppointmentRequest instance,
) => <String, dynamic>{
  'scheduledAt': instance.scheduledAt?.toIso8601String(),
  'reason': instance.reason,
};
