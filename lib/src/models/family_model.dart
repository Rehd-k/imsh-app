import 'package:freezed_annotation/freezed_annotation.dart';

part 'family_model.freezed.dart';
part 'family_model.g.dart';

@freezed
abstract class FamilyMember with _$FamilyMember {
  const factory FamilyMember({
    required String id,
    String? patientId,
    String? surname,
    String? firstName,
    String? otherName,
    String? relationship,
    DateTime? dob,
    String? avatarUrl,
  }) = _FamilyMember;

  factory FamilyMember.fromJson(Map<String, dynamic> json) =>
      _$FamilyMemberFromJson(json);
}

extension FamilyMemberDisplay on FamilyMember {
  String get displayName {
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
