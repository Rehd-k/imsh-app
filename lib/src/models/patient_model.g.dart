// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Patient _$PatientFromJson(Map<String, dynamic> json) => _Patient(
  id: json['id'] as String,
  patientId: json['patientId'] as String?,
  cardNo: json['cardNo'] as String?,
  title: json['title'] as String?,
  surname: json['surname'] as String?,
  firstName: json['firstName'] as String?,
  otherName: json['otherName'] as String?,
  dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
  gender: json['gender'] as String?,
  email: json['email'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  addressOfResidence: json['addressOfResidence'] as String?,
  hmo: json['hmo'] as String?,
);

Map<String, dynamic> _$PatientToJson(_Patient instance) => <String, dynamic>{
  'id': instance.id,
  'patientId': instance.patientId,
  'cardNo': instance.cardNo,
  'title': instance.title,
  'surname': instance.surname,
  'firstName': instance.firstName,
  'otherName': instance.otherName,
  'dob': instance.dob?.toIso8601String(),
  'gender': instance.gender,
  'email': instance.email,
  'phoneNumber': instance.phoneNumber,
  'addressOfResidence': instance.addressOfResidence,
  'hmo': instance.hmo,
};

_PatientLoginResponse _$PatientLoginResponseFromJson(
  Map<String, dynamic> json,
) => _PatientLoginResponse(
  accessToken: json['accessToken'] as String,
  patient: Patient.fromJson(json['patient'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PatientLoginResponseToJson(
  _PatientLoginResponse instance,
) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'patient': instance.patient,
};
