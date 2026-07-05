import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/appointment_model.dart';
import '../models/invoice_model.dart';
import '../models/medical_records_dashboard_model.dart';
import '../models/medication_model.dart';
import 'appointments_provider.dart';
import 'auth_provider.dart';
import 'medications_provider.dart';
import 'medical_records_provider.dart';
import 'service_providers.dart';

class HomeDashboardData {
  const HomeDashboardData({
    required this.appointments,
    required this.medications,
    required this.medicalRecords,
    required this.billingSummary,
  });

  final AppointmentsDashboardResponse appointments;
  final MedicationDashboardResponse medications;
  final MedicalRecordsDashboardResponse medicalRecords;
  final BillingSummaryResponse billingSummary;

  LatestVitalsSummary? get latestVitals => medicalRecords.latestVitals;

  List<DashboardLabResult> get labResultsPreview =>
      medicalRecords.recentLabResults.take(2).toList();

  bool get hasOutstandingBalance {
    final amount = double.tryParse(billingSummary.totalOutstanding) ?? 0;
    return amount > 0;
  }

  List<AppointmentSummary> get homeAppointments {
    final result = <AppointmentSummary>[];
    final next = appointments.nextAppointment;
    if (next != null) {
      result.add(next);
    }
    for (final appointment in appointments.upcomingAppointments) {
      if (result.length >= 2) break;
      if (result.any((item) => item.id == appointment.id)) continue;
      result.add(appointment);
    }
    return result;
  }
}

final homeDashboardProvider =
    FutureProvider.autoDispose<HomeDashboardData>((ref) async {
  final appointmentService = ref.watch(appointmentServiceProvider);
  final medicationService = ref.watch(medicationServiceProvider);
  final medicalRecordService = ref.watch(medicalRecordServiceProvider);
  final billingService = ref.watch(billingServiceProvider);

  final results = await Future.wait([
    appointmentService.getDashboard(AppointmentFilterTab.upcoming),
    medicationService.getDashboard(),
    medicalRecordService.getDashboard(),
    billingService.getBillingSummary(),
  ]);

  return HomeDashboardData(
    appointments: results[0] as AppointmentsDashboardResponse,
    medications: results[1] as MedicationDashboardResponse,
    medicalRecords: results[2] as MedicalRecordsDashboardResponse,
    billingSummary: results[3] as BillingSummaryResponse,
  );
});

void invalidateHomeDashboard(WidgetRef ref) {
  ref.invalidate(homeDashboardProvider);
  ref.invalidate(medicalRecordsDashboardProvider);
  ref.invalidate(medicationsDashboardProvider);
  ref.invalidate(appointmentsDashboardProvider(AppointmentFilterTab.upcoming));
}

String homeErrorMessage(Object error) => authFlowErrorMessage(error);
