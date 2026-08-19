class TheatreStaffBrief {
  const TheatreStaffBrief({
    required this.id,
    this.firstName,
    this.lastName,
    this.staffId,
  });

  final String id;
  final String? firstName;
  final String? lastName;
  final String? staffId;

  factory TheatreStaffBrief.fromJson(Map<String, dynamic> json) {
    return TheatreStaffBrief(
      id: (json['id'] as String?) ?? '',
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      staffId: json['staffId'] as String?,
    );
  }

  String get displayName {
    final parts = [firstName, lastName]
        .whereType<String>()
        .map((p) => p.trim())
        .where((p) => p.isNotEmpty)
        .toList();
    if (parts.isEmpty) return 'Staff';
    return parts.join(' ');
  }
}

class TheatreRoomBrief {
  const TheatreRoomBrief({required this.id, required this.name});

  final String id;
  final String name;

  factory TheatreRoomBrief.fromJson(Map<String, dynamic> json) {
    return TheatreRoomBrief(
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? 'Room',
    );
  }
}

class TheatreServiceBrief {
  const TheatreServiceBrief({required this.id, required this.name});

  final String id;
  final String name;

  factory TheatreServiceBrief.fromJson(Map<String, dynamic> json) {
    return TheatreServiceBrief(
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? 'Procedure',
    );
  }
}

class TheatreScheduleSummary {
  const TheatreScheduleSummary({
    required this.id,
    this.scheduledAt,
    this.estimatedDurationMins,
    this.theatreRoom,
    this.surgeon,
    this.anaesthetist,
    this.scrubNurse,
    this.procedureName,
    this.requestStatus,
    this.notes,
    this.surgeryRequestId,
  });

  final String id;
  final DateTime? scheduledAt;
  final int? estimatedDurationMins;
  final TheatreRoomBrief? theatreRoom;
  final TheatreStaffBrief? surgeon;
  final TheatreStaffBrief? anaesthetist;
  final TheatreStaffBrief? scrubNurse;
  final String? procedureName;
  final String? requestStatus;
  final String? notes;
  final String? surgeryRequestId;

  factory TheatreScheduleSummary.fromJson(Map<String, dynamic> json) {
    final requestRaw = json['surgeryRequest'];
    String? procedureName = json['procedureName'] as String?;
    String? requestStatus = json['requestStatus'] as String?;
    String? notes = json['notes'] as String?;
    String? surgeryRequestId = json['surgeryRequestId'] as String?;

    if (requestRaw is Map) {
      final request = Map<String, dynamic>.from(requestRaw);
      surgeryRequestId ??= request['id'] as String?;
      requestStatus ??= request['status'] as String?;
      notes ??= request['notes'] as String?;
      final serviceRaw = request['service'];
      if (serviceRaw is Map) {
        procedureName ??=
            Map<String, dynamic>.from(serviceRaw)['name'] as String?;
      }
    }

    return TheatreScheduleSummary(
      id: (json['id'] as String?) ?? '',
      scheduledAt: _asDateTime(json['scheduledAt']),
      estimatedDurationMins: (json['estimatedDurationMins'] as num?)?.toInt(),
      theatreRoom: _asRoom(json['theatreRoom']),
      surgeon: _asStaff(json['surgeon']),
      anaesthetist: _asStaff(json['anaesthetist']),
      scrubNurse: _asStaff(json['scrubNurse']),
      procedureName: procedureName,
      requestStatus: requestStatus,
      notes: notes,
      surgeryRequestId: surgeryRequestId,
    );
  }

  String get displayProcedureName {
    final name = procedureName?.trim();
    if (name != null && name.isNotEmpty) return name;
    return 'Theatre procedure';
  }

  String get statusLabel {
    final raw = requestStatus?.trim();
    if (raw == null || raw.isEmpty) return 'Scheduled';
    return _titleCaseStatus(raw);
  }

  String get roomLabel => theatreRoom?.name ?? 'Room TBD';
}

class TheatreSurgeryRequestBrief {
  const TheatreSurgeryRequestBrief({
    required this.id,
    required this.status,
    this.notes,
    this.createdAt,
    this.service,
    this.requestedBy,
    this.schedule,
  });

  final String id;
  final String status;
  final String? notes;
  final DateTime? createdAt;
  final TheatreServiceBrief? service;
  final TheatreStaffBrief? requestedBy;
  final TheatreScheduleSummary? schedule;

  factory TheatreSurgeryRequestBrief.fromJson(Map<String, dynamic> json) {
    final scheduleRaw = json['schedule'];
    TheatreScheduleSummary? schedule;
    if (scheduleRaw is Map) {
      schedule = TheatreScheduleSummary.fromJson(
        Map<String, dynamic>.from(scheduleRaw),
      );
    }

    final serviceRaw = json['service'];
    return TheatreSurgeryRequestBrief(
      id: (json['id'] as String?) ?? '',
      status: (json['status'] as String?) ?? 'REQUESTED',
      notes: json['notes'] as String?,
      createdAt: _asDateTime(json['createdAt']),
      service: serviceRaw is Map
          ? TheatreServiceBrief.fromJson(Map<String, dynamic>.from(serviceRaw))
          : null,
      requestedBy: _asStaff(json['requestedBy']),
      schedule: schedule == null
          ? null
          : TheatreScheduleSummary(
              id: schedule.id,
              scheduledAt: schedule.scheduledAt,
              estimatedDurationMins: schedule.estimatedDurationMins,
              theatreRoom: schedule.theatreRoom,
              surgeon: schedule.surgeon,
              anaesthetist: schedule.anaesthetist,
              scrubNurse: schedule.scrubNurse,
              procedureName: serviceRaw is Map
                  ? Map<String, dynamic>.from(serviceRaw)['name'] as String?
                  : schedule.procedureName,
              requestStatus: (json['status'] as String?) ?? schedule.requestStatus,
              notes: (json['notes'] as String?) ?? schedule.notes,
              surgeryRequestId: (json['id'] as String?) ?? schedule.surgeryRequestId,
            ),
    );
  }

  String get procedureName {
    final name = service?.name.trim();
    if (name != null && name.isNotEmpty) return name;
    return 'Surgery request';
  }

  String get statusLabel => _titleCaseStatus(status);
}

class TheatreSchedulesResponse {
  const TheatreSchedulesResponse({
    this.schedules = const [],
    this.surgeryRequests = const [],
  });

  final List<TheatreScheduleSummary> schedules;
  final List<TheatreSurgeryRequestBrief> surgeryRequests;

  factory TheatreSchedulesResponse.fromJson(Map<String, dynamic> json) {
    List<T> parseList<T>(
      String key,
      T Function(Map<String, dynamic>) fromJson,
    ) {
      final raw = json[key];
      if (raw is! List) return <T>[];
      return raw
          .whereType<Map>()
          .map((item) => fromJson(Map<String, dynamic>.from(item)))
          .toList();
    }

    return TheatreSchedulesResponse(
      schedules: parseList('schedules', TheatreScheduleSummary.fromJson),
      surgeryRequests:
          parseList('surgeryRequests', TheatreSurgeryRequestBrief.fromJson),
    );
  }
}

TheatreRoomBrief? _asRoom(Object? raw) {
  if (raw is! Map) return null;
  return TheatreRoomBrief.fromJson(Map<String, dynamic>.from(raw));
}

TheatreStaffBrief? _asStaff(Object? raw) {
  if (raw is! Map) return null;
  return TheatreStaffBrief.fromJson(Map<String, dynamic>.from(raw));
}

DateTime? _asDateTime(Object? raw) {
  if (raw is! String || raw.isEmpty) return null;
  return DateTime.tryParse(raw);
}

String _titleCaseStatus(String raw) {
  if (raw.trim().isEmpty) return 'Requested';
  return raw
      .toLowerCase()
      .split('_')
      .map((part) => part.isEmpty
          ? part
          : '${part[0].toUpperCase()}${part.substring(1)}')
      .join(' ');
}
