import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/health_card_model.dart';
import 'service_providers.dart';

final healthCardProvider = FutureProvider.autoDispose<HealthCardData>((
  ref,
) async {
  final service = ref.watch(healthCardServiceProvider);
  final raw = await service.getHealthCard();
  return HealthCardData.fromJson(raw);
});
