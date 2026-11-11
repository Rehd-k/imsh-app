import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../models/emergency_request_model.dart';
import 'auth_provider.dart';
import 'service_providers.dart';

final emergencyStatusFilterProvider = StateProvider<EmergencyRequestStatus?>(
  (ref) => null,
);

final emergencyListProvider = FutureProvider.autoDispose
    .family<EmergencyRequestListResponse, EmergencyRequestStatus?>((
      ref,
      status,
    ) {
      final service = ref.watch(emergencyServiceProvider);
      return service.listRequests(status: status);
    });

final emergencyDetailProvider = FutureProvider.autoDispose
    .family<EmergencyRequest, String>((ref, id) {
      final service = ref.watch(emergencyServiceProvider);
      return service.getRequest(id);
    });

/// Kept for callers that still prefer a notifier; prefer calling
/// [EmergencyService] directly for long media uploads so an autoDispose
/// provider cannot be torn down mid-request on slow networks.
final submitEmergencyProvider =
    AsyncNotifierProvider.autoDispose<SubmitEmergencyNotifier, bool>(
      SubmitEmergencyNotifier.new,
    );

class SubmitEmergencyNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async => false;

  Future<EmergencyRequest> submit(
    CreateEmergencyRequestPayload payload, {
    void Function(int sent, int total)? onSendProgress,
  }) async {
    final link = ref.keepAlive();
    state = const AsyncLoading();
    try {
      final service = ref.read(emergencyServiceProvider);
      final result = await service.createRequest(
        payload,
        onSendProgress: onSendProgress,
      );
      if (!ref.mounted) return result;
      _invalidateEmergency(ref);
      state = const AsyncData(false);
      return result;
    } catch (error, stackTrace) {
      if (ref.mounted) {
        state = AsyncError(error, stackTrace);
      }
      rethrow;
    } finally {
      link.close();
    }
  }
}

final submitGuestEmergencyProvider =
    AsyncNotifierProvider.autoDispose<SubmitGuestEmergencyNotifier, bool>(
      SubmitGuestEmergencyNotifier.new,
    );

class SubmitGuestEmergencyNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async => false;

  Future<EmergencyRequest> submit(
    CreateEmergencyRequestPayload payload, {
    void Function(int sent, int total)? onSendProgress,
  }) async {
    final link = ref.keepAlive();
    state = const AsyncLoading();
    try {
      final service = ref.read(emergencyServiceProvider);
      final result = await service.createGuestRequest(
        payload,
        onSendProgress: onSendProgress,
      );
      if (!ref.mounted) return result;
      state = const AsyncData(false);
      return result;
    } catch (error, stackTrace) {
      if (ref.mounted) {
        state = AsyncError(error, stackTrace);
      }
      rethrow;
    } finally {
      link.close();
    }
  }
}

final cancelEmergencyProvider =
    AsyncNotifierProvider.autoDispose<CancelEmergencyNotifier, Set<String>>(
      CancelEmergencyNotifier.new,
    );

class CancelEmergencyNotifier extends AsyncNotifier<Set<String>> {
  @override
  Future<Set<String>> build() async => {};

  Future<void> cancel(String id) async {
    final inFlight = {...?state.value};
    if (inFlight.contains(id)) return;
    inFlight.add(id);
    state = AsyncData(inFlight);
    try {
      final service = ref.read(emergencyServiceProvider);
      await service.cancelRequest(id);
      _invalidateEmergency(ref);
      ref.invalidate(emergencyDetailProvider(id));
    } finally {
      final updated = {...?state.value}..remove(id);
      state = AsyncData(updated);
    }
  }

  bool isCancelling(String id) => state.value?.contains(id) ?? false;
}

void _invalidateEmergency(Ref ref) {
  final status = ref.read(emergencyStatusFilterProvider);
  ref.invalidate(emergencyListProvider(status));
  ref.invalidate(emergencyListProvider(null));
}

/// Public helper for screens that submit via [EmergencyService] directly.
/// Takes [WidgetRef] because screen `ref` is not assignable to notifier [Ref].
void invalidateEmergencyLists(WidgetRef ref) {
  final status = ref.read(emergencyStatusFilterProvider);
  ref.invalidate(emergencyListProvider(status));
  ref.invalidate(emergencyListProvider(null));
}

String emergencyErrorMessage(Object error) => authFlowErrorMessage(error);
