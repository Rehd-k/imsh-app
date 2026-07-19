import 'package:freezed_annotation/freezed_annotation.dart';

import 'device_model.dart';

part 'patient_model.freezed.dart';
part 'patient_model.g.dart';

@freezed
abstract class Patient with _$Patient {
  const factory Patient({
    required String id,
    String? patientId,
    String? cardNo,
    String? title,
    String? surname,
    String? firstName,
    String? otherName,
    DateTime? dob,
    String? gender,
    String? email,
    String? phoneNumber,
    String? addressOfResidence,
    String? hmo,
    String? avatarUrl,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);
}

@freezed
abstract class PatientLoginResponse with _$PatientLoginResponse {
  const factory PatientLoginResponse({
    required String accessToken,
    required Patient patient,
    required PatientDevice device,
  }) = _PatientLoginResponse;

  factory PatientLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$PatientLoginResponseFromJson(json);
}

extension PatientDisplay on Patient {
  String get displayFirstName {
    final name = firstName?.trim();
    if (name != null && name.isNotEmpty) return name;
    final last = surname?.trim();
    if (last != null && last.isNotEmpty) return last;
    return 'there';
  }

  String get initials {
    final parts = [firstName, surname]
        .whereType<String>()
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .take(2)
        .map((s) => s[0].toUpperCase())
        .join();
    return parts.isEmpty ? '?' : parts;
  }
}

String timeBasedGreeting() {
  final hour = DateTime.now().hour;
  if (hour < 12) return 'Good Morning';
  if (hour < 17) return 'Good Afternoon';
  return 'Good Evening';
}
