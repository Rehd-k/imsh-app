/// Hospital patient IDs that skip device verification (QA / demo accounts).
const deviceVerificationExemptPatientIds = {'Q4CMEZM8'};

bool isDeviceVerificationExempt(String? patientId) {
  final normalized = patientId?.trim().toUpperCase();
  if (normalized == null || normalized.isEmpty) return false;
  return deviceVerificationExemptPatientIds.contains(normalized);
}
