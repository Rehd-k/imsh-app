/// Defensive DTO for `GET /patient/health-card`.
class HealthCardData {
  const HealthCardData({
    required this.patientName,
    required this.patientId,
    required this.cardNo,
    required this.dobLabel,
    required this.bloodType,
    required this.hmo,
    required this.allergies,
    required this.qrPayload,
  });

  final String patientName;
  final String patientId;
  final String cardNo;
  final String dobLabel;
  final String bloodType;
  final String hmo;
  final String allergies;
  final String qrPayload;

  static String _dash(String? value) {
    final t = value?.trim();
    if (t == null || t.isEmpty) return '—';
    return t;
  }

  static String? _pick(Map<String, dynamic> map, List<String> keys) {
    for (final key in keys) {
      final v = map[key];
      if (v == null) continue;
      if (v is String && v.trim().isNotEmpty) return v.trim();
      if (v is num || v is bool) return '$v';
    }
    return null;
  }

  static String _allergiesFrom(Map<String, dynamic> map) {
    final raw = map['allergies'] ?? map['allergy'] ?? map['allergyList'];
    if (raw is List) {
      final parts = raw
          .map((e) {
            if (e is String) return e.trim();
            if (e is Map) {
              return (e['name'] ?? e['allergen'] ?? e['label'] ?? '')
                  .toString()
                  .trim();
            }
            return e.toString().trim();
          })
          .where((s) => s.isNotEmpty)
          .toList();
      if (parts.isEmpty) return '—';
      return parts.join(', ');
    }
    return _dash(raw?.toString());
  }

  static String _nameFrom(Map<String, dynamic> map) {
    final full = _pick(map, [
      'patientName',
      'fullName',
      'name',
      'displayName',
    ]);
    if (full != null) return full;
    final first = _pick(map, ['firstName', 'first_name']);
    final last = _pick(map, ['surname', 'lastName', 'last_name']);
    final parts = [first, last].whereType<String>().toList();
    if (parts.isEmpty) return '—';
    return parts.join(' ');
  }

  factory HealthCardData.fromJson(Map<String, dynamic> json) {
    // Some APIs nest under `data` / `patient` / `card`.
    final root = json['data'] is Map<String, dynamic>
        ? json['data'] as Map<String, dynamic>
        : json;
    final patient = root['patient'] is Map<String, dynamic>
        ? root['patient'] as Map<String, dynamic>
        : root;
    final card = root['card'] is Map<String, dynamic>
        ? root['card'] as Map<String, dynamic>
        : root;

    final patientId = _dash(
      _pick(patient, ['patientId', 'patient_id', 'mrn', 'id']) ??
          _pick(root, ['patientId', 'patient_id']),
    );
    final cardNo = _dash(
      _pick(card, ['cardNo', 'card_no', 'cardNumber', 'cardId']) ??
          _pick(root, ['cardNo', 'card_no']),
    );
    final qr = _pick(root, [
          'qrPayload',
          'qrData',
          'qrCode',
          'qr',
          'code',
          'payload',
        ]) ??
        _pick(card, ['qrPayload', 'qrData', 'qr', 'code']) ??
        (patientId != '—' ? patientId : null) ??
        (cardNo != '—' ? cardNo : 'IMSH');

    return HealthCardData(
      patientName: _nameFrom(patient),
      patientId: patientId,
      cardNo: cardNo,
      dobLabel: _dash(
        _pick(patient, ['dob', 'dateOfBirth', 'date_of_birth', 'birthDate']),
      ),
      bloodType: _dash(
        _pick(patient, ['bloodType', 'bloodGroup', 'blood_group', 'blood']),
      ),
      hmo: _dash(_pick(patient, ['hmo', 'insurance', 'payer'])),
      allergies: _allergiesFrom(patient),
      qrPayload: qr,
    );
  }
}
