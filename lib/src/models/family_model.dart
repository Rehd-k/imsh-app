import 'package:freezed_annotation/freezed_annotation.dart';

part 'family_model.freezed.dart';
part 'family_model.g.dart';

@freezed
abstract class FamilyMember with _$FamilyMember {
  const FamilyMember._();

  const factory FamilyMember({
    required String id,
    String? patientId,
    String? surname,
    String? firstName,
    String? otherName,
    String? relationship,
    DateTime? dob,
    String? avatarUrl,
    /// Name already formatted by the API (`displayName`).
    @JsonKey(name: 'displayName') String? listedName,
  }) = _FamilyMember;

  factory FamilyMember.fromJson(Map<String, dynamic> json) =>
      _$FamilyMemberFromJson(json);

  String get displayName {
    final listed = listedName?.trim();
    if (listed != null && listed.isNotEmpty) return listed;
    final parts = [firstName, surname]
        .whereType<String>()
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty);
    final joined = parts.join(' ');
    if (joined.isNotEmpty) return joined;
    final id = patientId?.trim();
    if (id != null && id.isNotEmpty) return id;
    return 'Family member';
  }
}
