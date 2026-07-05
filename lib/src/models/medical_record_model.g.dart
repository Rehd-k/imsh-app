// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EncounterSummary _$EncounterSummaryFromJson(Map<String, dynamic> json) =>
    _EncounterSummary(
      id: json['id'] as String,
      encounterType: $enumDecode(_$EncounterTypeEnumMap, json['encounterType']),
      status: $enumDecode(_$EncounterStatusEnumMap, json['status']),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      chiefComplaint: json['chiefComplaint'] as String?,
      visitType: json['visitType'] as String?,
      doctorName: json['doctorName'] as String,
      primaryDiagnosis: json['primaryDiagnosis'] as String?,
    );

Map<String, dynamic> _$EncounterSummaryToJson(_EncounterSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'encounterType': _$EncounterTypeEnumMap[instance.encounterType]!,
      'status': _$EncounterStatusEnumMap[instance.status]!,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'chiefComplaint': instance.chiefComplaint,
      'visitType': instance.visitType,
      'doctorName': instance.doctorName,
      'primaryDiagnosis': instance.primaryDiagnosis,
    };

const _$EncounterTypeEnumMap = {
  EncounterType.outpatient: 'OUTPATIENT',
  EncounterType.emergency: 'EMERGENCY',
  EncounterType.inpatientReview: 'INPATIENT_REVIEW',
  EncounterType.telemedicine: 'TELEMEDICINE',
  EncounterType.followUp: 'FOLLOW_UP',
};

const _$EncounterStatusEnumMap = {
  EncounterStatus.ongoing: 'ONGOING',
  EncounterStatus.completed: 'COMPLETED',
  EncounterStatus.cancelled: 'CANCELLED',
};

_EncounterListResponse _$EncounterListResponseFromJson(
  Map<String, dynamic> json,
) => _EncounterListResponse(
  data: (json['data'] as List<dynamic>)
      .map((e) => EncounterSummary.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
  page: (json['page'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
);

Map<String, dynamic> _$EncounterListResponseToJson(
  _EncounterListResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'total': instance.total,
  'page': instance.page,
  'limit': instance.limit,
};

_EncounterVitals _$EncounterVitalsFromJson(Map<String, dynamic> json) =>
    _EncounterVitals(
      systolic: (json['systolic'] as num?)?.toInt(),
      diastolic: (json['diastolic'] as num?)?.toInt(),
      temperature: (json['temperature'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      bmi: (json['bmi'] as num?)?.toDouble(),
      pulseRate: (json['pulseRate'] as num?)?.toInt(),
      respRate: (json['respRate'] as num?)?.toInt(),
      spo2: (json['spo2'] as num?)?.toDouble(),
      painScore: (json['painScore'] as num?)?.toInt(),
      bloodGlucose: (json['bloodGlucose'] as num?)?.toDouble(),
      recordedAt: json['recordedAt'] == null
          ? null
          : DateTime.parse(json['recordedAt'] as String),
    );

Map<String, dynamic> _$EncounterVitalsToJson(_EncounterVitals instance) =>
    <String, dynamic>{
      'systolic': instance.systolic,
      'diastolic': instance.diastolic,
      'temperature': instance.temperature,
      'height': instance.height,
      'weight': instance.weight,
      'bmi': instance.bmi,
      'pulseRate': instance.pulseRate,
      'respRate': instance.respRate,
      'spo2': instance.spo2,
      'painScore': instance.painScore,
      'bloodGlucose': instance.bloodGlucose,
      'recordedAt': instance.recordedAt?.toIso8601String(),
    };

_EncounterDiagnosis _$EncounterDiagnosisFromJson(Map<String, dynamic> json) =>
    _EncounterDiagnosis(
      primaryIcdCode: json['primaryIcdCode'] as String?,
      primaryIcdDescription: json['primaryIcdDescription'] as String?,
      secondaryDiagnoses: json['secondaryDiagnoses'],
    );

Map<String, dynamic> _$EncounterDiagnosisToJson(_EncounterDiagnosis instance) =>
    <String, dynamic>{
      'primaryIcdCode': instance.primaryIcdCode,
      'primaryIcdDescription': instance.primaryIcdDescription,
      'secondaryDiagnoses': instance.secondaryDiagnoses,
    };

_EncounterPrescriptionItem _$EncounterPrescriptionItemFromJson(
  Map<String, dynamic> json,
) => _EncounterPrescriptionItem(
  drugName: json['drugName'] as String,
  dosage: json['dosage'] as String,
  frequency: json['frequency'] as String?,
  duration: (json['duration'] as num?)?.toInt(),
  instructions: json['instructions'] as String?,
);

Map<String, dynamic> _$EncounterPrescriptionItemToJson(
  _EncounterPrescriptionItem instance,
) => <String, dynamic>{
  'drugName': instance.drugName,
  'dosage': instance.dosage,
  'frequency': instance.frequency,
  'duration': instance.duration,
  'instructions': instance.instructions,
};

_EncounterPrescription _$EncounterPrescriptionFromJson(
  Map<String, dynamic> json,
) => _EncounterPrescription(
  id: json['id'] as String,
  drug: json['drug'] as String?,
  dosage: json['dosage'] as String?,
  notes: json['notes'] as String?,
  startDate: json['startDate'] == null
      ? null
      : DateTime.parse(json['startDate'] as String),
  endDate: json['endDate'] == null
      ? null
      : DateTime.parse(json['endDate'] as String),
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                EncounterPrescriptionItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$EncounterPrescriptionToJson(
  _EncounterPrescription instance,
) => <String, dynamic>{
  'id': instance.id,
  'drug': instance.drug,
  'dosage': instance.dosage,
  'notes': instance.notes,
  'startDate': instance.startDate?.toIso8601String(),
  'endDate': instance.endDate?.toIso8601String(),
  'items': instance.items,
};

_EncounterSoap _$EncounterSoapFromJson(Map<String, dynamic> json) =>
    _EncounterSoap(
      subjective: json['subjective'] as String?,
      objective: json['objective'] as String?,
      assessment: json['assessment'] as String?,
      plan: json['plan'] as String?,
    );

Map<String, dynamic> _$EncounterSoapToJson(_EncounterSoap instance) =>
    <String, dynamic>{
      'subjective': instance.subjective,
      'objective': instance.objective,
      'assessment': instance.assessment,
      'plan': instance.plan,
    };

_EncounterDetail _$EncounterDetailFromJson(Map<String, dynamic> json) =>
    _EncounterDetail(
      id: json['id'] as String,
      encounterType: $enumDecode(_$EncounterTypeEnumMap, json['encounterType']),
      status: $enumDecode(_$EncounterStatusEnumMap, json['status']),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      chiefComplaint: json['chiefComplaint'] as String?,
      visitType: json['visitType'] as String?,
      doctorName: json['doctorName'] as String,
      primaryDiagnosis: json['primaryDiagnosis'] as String?,
      vitals: json['vitals'] == null
          ? null
          : EncounterVitals.fromJson(json['vitals'] as Map<String, dynamic>),
      diagnoses:
          (json['diagnoses'] as List<dynamic>?)
              ?.map(
                (e) => EncounterDiagnosis.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      prescriptions:
          (json['prescriptions'] as List<dynamic>?)
              ?.map(
                (e) =>
                    EncounterPrescription.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      soap: json['soap'] == null
          ? null
          : EncounterSoap.fromJson(json['soap'] as Map<String, dynamic>),
      followUpDate: json['followUpDate'] as String?,
      followUpInstructions: json['followUpInstructions'] as String?,
      referral: json['referral'] as String?,
    );

Map<String, dynamic> _$EncounterDetailToJson(_EncounterDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'encounterType': _$EncounterTypeEnumMap[instance.encounterType]!,
      'status': _$EncounterStatusEnumMap[instance.status]!,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'chiefComplaint': instance.chiefComplaint,
      'visitType': instance.visitType,
      'doctorName': instance.doctorName,
      'primaryDiagnosis': instance.primaryDiagnosis,
      'vitals': instance.vitals,
      'diagnoses': instance.diagnoses,
      'prescriptions': instance.prescriptions,
      'soap': instance.soap,
      'followUpDate': instance.followUpDate,
      'followUpInstructions': instance.followUpInstructions,
      'referral': instance.referral,
    };
