import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/health_content_model.dart';
import 'auth_provider.dart';
import 'service_providers.dart';

final healthCampaignsProvider =
    FutureProvider.autoDispose<HealthContentListResponse>((ref) async {
  final service = ref.watch(healthContentServiceProvider);
  return service.listCampaigns(take: 20);
});

final healthNewsProvider =
    FutureProvider.autoDispose<HealthContentListResponse>((ref) async {
  final service = ref.watch(healthContentServiceProvider);
  return service.listNews(take: 20);
});

final healthCampaignDetailProvider =
    Provider.autoDispose.family<HealthContentItem?, String>((ref, id) {
  final async = ref.watch(healthCampaignsProvider);
  return async.maybeWhen(
    data: (response) {
      for (final item in response.data) {
        if (item.id == id) return item;
      }
      return null;
    },
    orElse: () => null,
  );
});

final healthNewsDetailProvider =
    Provider.autoDispose.family<HealthContentItem?, String>((ref, id) {
  final async = ref.watch(healthNewsProvider);
  return async.maybeWhen(
    data: (response) {
      for (final item in response.data) {
        if (item.id == id) return item;
      }
      return null;
    },
    orElse: () => null,
  );
});

String healthContentErrorMessage(Object error) => authFlowErrorMessage(error);
