import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/lab_result_model.dart';
import 'family_provider.dart';
import 'service_providers.dart';

class VitalTrendPoint {
  const VitalTrendPoint({
    required this.at,
    this.pulseRate,
    this.systolic,
    this.diastolic,
  });

  final DateTime at;
  final int? pulseRate;
  final int? systolic;
  final int? diastolic;

  bool get hasAnyValue =>
      pulseRate != null || systolic != null || diastolic != null;

  factory VitalTrendPoint.fromJson(Map<String, dynamic> json) {
    final recordedAt = DateTime.tryParse(json['recordedAt']?.toString() ?? '');
    return VitalTrendPoint(
      at: recordedAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      pulseRate: _asInt(json['pulseRate']),
      systolic: _asInt(json['systolic']),
      diastolic: _asInt(json['diastolic']),
    );
  }
}

class LabAnalyteTrendPoint {
  const LabAnalyteTrendPoint({
    required this.at,
    required this.value,
    this.unit,
    this.reportId,
  });

  final DateTime at;
  final double value;
  final String? unit;
  final String? reportId;
}

final vitalsTrendProvider = FutureProvider.autoDispose<List<VitalTrendPoint>>((
  ref,
) async {
  final service = ref.watch(medicalRecordServiceProvider);
  final forPatientId = watchForPatientId(ref);
  final rows = await service.getVitalsTrend(forPatientId: forPatientId);
  return rows
      .map(VitalTrendPoint.fromJson)
      .where(
        (point) => point.hasAnyValue && point.at.millisecondsSinceEpoch > 0,
      )
      .toList();
});

final labAnalyteTrendProvider = FutureProvider.autoDispose
    .family<List<LabAnalyteTrendPoint>, String>((ref, analyteLabel) async {
      final service = ref.watch(labServiceProvider);
      final forPatientId = watchForPatientId(ref);
      final list = await service.listLabReports(
        page: 1,
        limit: 20,
        forPatientId: forPatientId,
      );

      final needle = analyteLabel.trim().toLowerCase();
      final points = <LabAnalyteTrendPoint>[];

      for (final summary in list.data.take(12)) {
        if (!summary.isOrderComplete) continue;
        try {
          final detail = await service.getLabReport(
            summary.id,
            forPatientId: forPatientId,
          );
          for (final panel in detail.panels) {
            for (final line in panel.results) {
              if (line.label.trim().toLowerCase() != needle) continue;
              final parsed = double.tryParse(
                line.value.replaceAll(RegExp(r'[^0-9.\-]'), ''),
              );
              if (parsed == null) continue;
              points.add(
                LabAnalyteTrendPoint(
                  at: detail.completedAt ?? detail.orderedAt,
                  value: parsed,
                  unit: line.unit,
                  reportId: detail.id,
                ),
              );
            }
          }
        } catch (_) {
          // Skip reports that fail to load.
        }
      }

      points.sort((a, b) => a.at.compareTo(b.at));
      return points;
    });

final labAnalyteOptionsProvider = FutureProvider.autoDispose<List<String>>((
  ref,
) async {
  final service = ref.watch(labServiceProvider);
  final forPatientId = watchForPatientId(ref);
  final list = await service.listLabReports(
    page: 1,
    limit: 10,
    forPatientId: forPatientId,
  );

  final labels = <String>{};
  for (final summary in list.data.take(8)) {
    if (!summary.isOrderComplete) continue;
    try {
      final detail = await service.getLabReport(
        summary.id,
        forPatientId: forPatientId,
      );
      for (final panel in detail.panels) {
        for (final line in panel.results) {
          final label = line.label.trim();
          if (label.isEmpty) continue;
          if (double.tryParse(
                line.value.replaceAll(RegExp(r'[^0-9.\-]'), ''),
              ) ==
              null) {
            continue;
          }
          labels.add(label);
        }
      }
    } catch (_) {}
  }

  final sorted = labels.toList()..sort();
  return sorted;
});

int? _asInt(Object? value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}
