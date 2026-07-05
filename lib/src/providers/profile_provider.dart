import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/patient_model.dart';
import '../providers/service_providers.dart';

final profileProvider = FutureProvider<Patient>((ref) async {
  final service = ref.watch(profileServiceProvider);
  return service.getProfile();
});

void invalidateProfile(WidgetRef ref) {
  ref.invalidate(profileProvider);
}
