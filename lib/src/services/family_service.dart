import 'package:dio/dio.dart';

import '../models/family_model.dart';
import 'api_service.dart';

class FamilyService {
  FamilyService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  /// Frontdesk-linked children for the authenticated parent.
  Future<List<FamilyMember>> listFamily() async {
    final resp = await _dio.get<dynamic>('/patient/family');
    final list = _extractList(resp.data);
    return list.map((e) {
      final map = Map<String, dynamic>.from(e as Map);
      // Nested patient object if API wraps it.
      if (map['patient'] is Map) {
        final patient = Map<String, dynamic>.from(map['patient'] as Map);
        return FamilyMember.fromJson({
          ...patient,
          'id': patient['id'] ?? map['id'] ?? map['patientId'],
          'relationship': map['relationship'] ?? patient['relationship'],
        });
      }
      return FamilyMember.fromJson({
        ...map,
        'id': map['id'] ?? map['patientId'] ?? map['childId'],
      });
    }).toList();
  }

  List<dynamic> _extractList(dynamic raw) {
    if (raw is List) return raw;
    if (raw is Map) {
      final data = raw['data'] ?? raw['members'] ?? raw['children'];
      if (data is List) return data;
    }
    return const [];
  }
}
