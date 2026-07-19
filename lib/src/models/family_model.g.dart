// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FamilyMember _$FamilyMemberFromJson(Map<String, dynamic> json) =>
    _FamilyMember(
      id: json['id'] as String,
      patientId: json['patientId'] as String?,
      surname: json['surname'] as String?,
      firstName: json['firstName'] as String?,
      otherName: json['otherName'] as String?,
      relationship: json['relationship'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$FamilyMemberToJson(_FamilyMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'surname': instance.surname,
      'firstName': instance.firstName,
      'otherName': instance.otherName,
      'relationship': instance.relationship,
      'dob': instance.dob?.toIso8601String(),
      'avatarUrl': instance.avatarUrl,
    };
