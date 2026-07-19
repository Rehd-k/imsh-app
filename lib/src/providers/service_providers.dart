import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/appointment_service.dart';
import '../services/billing_service.dart';
import '../services/device_service.dart';
import '../services/family_service.dart';
import '../services/feedback_service.dart';
import '../services/health_card_service.dart';
import '../services/lab_service.dart';
import '../services/medication_service.dart';
import '../services/medical_record_service.dart';
import '../services/notification_service.dart';
import '../services/profile_service.dart';
import '../services/radiology_service.dart';

final profileServiceProvider = Provider<ProfileService>((ref) {
  return ProfileService();
});

final appointmentServiceProvider = Provider<AppointmentService>((ref) {
  return AppointmentService();
});

final feedbackServiceProvider = Provider<FeedbackService>((ref) {
  return FeedbackService();
});

final labServiceProvider = Provider<LabService>((ref) {
  return LabService();
});

final medicationServiceProvider = Provider<MedicationService>((ref) {
  return MedicationService();
});

final radiologyServiceProvider = Provider<RadiologyService>((ref) {
  return RadiologyService();
});

final medicalRecordServiceProvider = Provider<MedicalRecordService>((ref) {
  return MedicalRecordService();
});

final billingServiceProvider = Provider<BillingService>((ref) {
  return BillingService();
});

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});

final familyServiceProvider = Provider<FamilyService>((ref) {
  return FamilyService();
});

final healthCardServiceProvider = Provider<HealthCardService>((ref) {
  return HealthCardService();
});

final deviceServiceProvider = Provider<DeviceService>((ref) {
  return DeviceService();
});
