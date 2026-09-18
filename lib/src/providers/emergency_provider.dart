import 'package:flutter_riverpod/flutter_riverpod.dart';

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

final submitEmergencyProvider =
    AsyncNotifierProvider.autoDispose<SubmitEmergencyNotifier, bool>(
      SubmitEmergencyNotifier.new,
    );

class SubmitEmergencyNotifier extends AutoDisposeAsyncNotifier<bool> {
  @override
  Future<bool> build() async => false;

  Future<EmergencyRequest> submit(CreateEmergencyRequestPayload payload) async {
    state = const AsyncLoading();
    try {
      final service = ref.read(emergencyServiceProvider);
      final result = await service.createRequest(payload);
      _invalidateEmergency(ref);
      state = const AsyncData(false);
      return result;
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      rethrow;
    }
  }
}

final submitGuestEmergencyProvider =
    AsyncNotifierProvider.autoDispose<SubmitGuestEmergencyNotifier, bool>(
      SubmitGuestEmergencyNotifier.new,
    );

class SubmitGuestEmergencyNotifier extends AutoDisposeAsyncNotifier<bool> {
  @override
  Future<bool> build() async => false;

  Future<EmergencyRequest> submit(CreateEmergencyRequestPayload payload) async {
    state = const AsyncLoading();
    try {
      final service = ref.read(emergencyServiceProvider);
      final result = await service.createGuestRequest(payload);
      state = const AsyncData(false);
      return result;
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      rethrow;
    }
  }
}

final cancelEmergencyProvider =
    AsyncNotifierProvider.autoDispose<CancelEmergencyNotifier, Set<String>>(
      CancelEmergencyNotifier.new,
    );

class CancelEmergencyNotifier extends AutoDisposeAsyncNotifier<Set<String>> {
  @override
  Future<Set<String>> build() async => {};

  Future<void> cancel(String id) async {
    final inFlight = {...?state.valueOrNull};
    if (inFlight.contains(id)) return;
    inFlight.add(id);
    state = AsyncData(inFlight);
    try {
      final service = ref.read(emergencyServiceProvider);
      await service.cancelRequest(id);
      _invalidateEmergency(ref);
      ref.invalidate(emergencyDetailProvider(id));
    } finally {
      final updated = {...?state.valueOrNull}..remove(id);
      state = AsyncData(updated);
    }
  }

  bool isCancelling(String id) => state.valueOrNull?.contains(id) ?? false;
}

void _invalidateEmergency(Ref ref) {
  final status = ref.read(emergencyStatusFilterProvider);
  ref.invalidate(emergencyListProvider(status));
  ref.invalidate(emergencyListProvider(null));
}

String emergencyErrorMessage(Object error) => authFlowErrorMessage(error);
