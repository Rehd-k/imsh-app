class MedicalRecordsDashboardResponse {
  const MedicalRecordsDashboardResponse({
    required this.bloodType,
    required this.heightCm,
    required this.weightKg,
    this.latestVitals,
    required this.allergies,
    required this.recentDiagnoses,
    required this.immunizations,
    required this.recentLabResults,
  });

  final String? bloodType;
  final double? heightCm;
  final double? weightKg;
  final LatestVitalsSummary? latestVitals;
  final List<DashboardAllergy> allergies;
  final List<DashboardDiagnosis> recentDiagnoses;
  final List<DashboardImmunization> immunizations;
  final List<DashboardLabResult> recentLabResults;

  factory MedicalRecordsDashboardResponse.fromJson(Map<String, dynamic> json) {
    List<T> parseList<T>(
      String key,
      T Function(Map<String, dynamic> json) fromJson,
    ) {
      final raw = json[key];
      if (raw is! List) return <T>[];
      return raw
          .whereType<Map>()
          .map((item) => fromJson(Map<String, dynamic>.from(item)))
          .toList();
    }

    final latestVitalsRaw = json['latestVitals'];
    LatestVitalsSummary? latestVitals;
    if (latestVitalsRaw is Map) {
      latestVitals = LatestVitalsSummary.fromJson(
        Map<String, dynamic>.from(latestVitalsRaw),
      );
    }

    return MedicalRecordsDashboardResponse(
      bloodType: json['bloodType'] as String?,
      heightCm: _asDouble(json['heightCm']),
      weightKg: _asDouble(json['weightKg']),
      latestVitals: latestVitals,
      allergies: parseList('allergies', DashboardAllergy.fromJson),
      recentDiagnoses: parseList(
        'recentDiagnoses',
        DashboardDiagnosis.fromJson,
      ),
      immunizations: parseList('immunizations', DashboardImmunization.fromJson),
      recentLabResults: parseList(
        'recentLabResults',
        DashboardLabResult.fromJson,
      ),
    );
  }
}

class LatestVitalsSummary {
  const LatestVitalsSummary({
    this.pulseRate,
    this.systolic,
    this.diastolic,
    this.recordedAt,
    this.bloodPressureStatus,
  });

  final int? pulseRate;
  final int? systolic;
  final int? diastolic;
  final DateTime? recordedAt;
  final String? bloodPressureStatus;

  bool get hasHeartRate => pulseRate != null;
  bool get hasBloodPressure => systolic != null || diastolic != null;
  bool get hasAnyVitals => hasHeartRate || hasBloodPressure;

  String get bloodPressureDisplay {
    if (systolic != null && diastolic != null) {
      return '$systolic/$diastolic';
    }
    if (systolic != null) return '$systolic/—';
    if (diastolic != null) return '—/$diastolic';
    return '—';
  }

  factory LatestVitalsSummary.fromJson(Map<String, dynamic> json) {
    return LatestVitalsSummary(
      pulseRate: _asInt(json['pulseRate']),
      systolic: _asInt(json['systolic']),
      diastolic: _asInt(json['diastolic']),
      recordedAt: _asDateTime(json['recordedAt']),
      bloodPressureStatus: json['bloodPressureStatus'] as String?,
    );
  }
}

class DashboardAllergy {
  const DashboardAllergy({required this.name, this.severity});

  final String name;
  final String? severity;

  factory DashboardAllergy.fromJson(Map<String, dynamic> json) {
    return DashboardAllergy(
      name: (json['name'] as String?)?.trim() ?? '',
      severity: json['severity'] as String?,
    );
  }
}

class DashboardDiagnosis {
  const DashboardDiagnosis({
    required this.id,
    required this.title,
    required this.doctorName,
    this.specialty,
    this.status,
    this.diagnosedAt,
  });

  final String id;
  final String title;
  final String doctorName;
  final String? specialty;
  final String? status;
  final DateTime? diagnosedAt;

  factory DashboardDiagnosis.fromJson(Map<String, dynamic> json) {
    return DashboardDiagnosis(
      id: (json['id'] as String?)?.trim() ?? '',
      title: (json['title'] as String?)?.trim() ?? '',
      doctorName: (json['doctorName'] as String?)?.trim() ?? '',
      specialty: json['specialty'] as String?,
      status: json['status'] as String?,
      diagnosedAt: _asDateTime(json['diagnosedAt']),
    );
  }
}

class DashboardImmunization {
  const DashboardImmunization({
    required this.vaccineName,
    this.detail,
    this.date,
  });

  final String vaccineName;
  final String? detail;
  final DateTime? date;

  factory DashboardImmunization.fromJson(Map<String, dynamic> json) {
    return DashboardImmunization(
      vaccineName: (json['vaccineName'] as String?)?.trim() ?? '',
      detail: json['detail'] as String?,
      date: _asDateTime(json['date']),
    );
  }
}

class DashboardLabResult {
  const DashboardLabResult({
    required this.testName,
    this.result,
    this.referenceRange,
    this.status,
  });

  final String testName;
  final String? result;
  final String? referenceRange;
  final String? status;

  factory DashboardLabResult.fromJson(Map<String, dynamic> json) {
    return DashboardLabResult(
      testName: (json['testName'] as String?)?.trim() ?? '',
      result: json['result'] as String?,
      referenceRange: json['referenceRange'] as String?,
      status: json['status'] as String?,
    );
  }
}

double? _asDouble(Object? value) {
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

int? _asInt(Object? value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}

DateTime? _asDateTime(Object? value) {
  if (value is! String || value.trim().isEmpty) return null;
  return DateTime.tryParse(value);
}
