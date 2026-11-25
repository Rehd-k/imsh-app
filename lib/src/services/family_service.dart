import 'package:dio/dio.dart';

import '../models/family_model.dart';
import 'api_service.dart';

class FamilyService {
  FamilyService([Dio? dio]) : _dio = dio ?? ApiService().dio;

  final Dio _dio;

  /// Dependents the logged-in primary may open. Never the reverse.
  Future<List<FamilyMember>> listFamily() async {
    final resp = await _dio.get<dynamic>('/patient/family');
    final list = _extractList(resp.data);
    return list.map((e) {
      final map = Map<String, dynamic>.from(e as Map);
      final nested = map['child'] ?? map['dependent'] ?? map['patient'];
      if (nested is Map) {
        final person = Map<String, dynamic>.from(nested);
        return FamilyMember.fromJson({
          ...person,
          'id': person['id'] ?? map['childPatientId'],
          'patientId': person['patientId'],
          'displayName': person['displayName'],
          'relationship': map['relationship'] ?? person['relationship'],
        });
      }
      return FamilyMember.fromJson({
        ...map,
        'id': map['childPatientId'] ?? map['patientId'] ?? map['id'],
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
