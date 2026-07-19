import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/feedback_model.dart';
import 'auth_provider.dart';
import 'service_providers.dart';

final feedbackKindFilterProvider = StateProvider<PatientFeedbackKind?>(
  (ref) => null,
);

final feedbackStatusFilterProvider = StateProvider<PatientFeedbackStatus?>(
  (ref) => null,
);

typedef FeedbackListParams = ({
  PatientFeedbackKind? kind,
  PatientFeedbackStatus? status,
});

final feedbackListProvider = FutureProvider.autoDispose
    .family<PatientFeedbackListResponse, FeedbackListParams>((ref, params) {
      final service = ref.watch(feedbackServiceProvider);
      return service.listFeedback(kind: params.kind, status: params.status);
    });

final feedbackDetailProvider = FutureProvider.autoDispose
    .family<PatientFeedback, String>((ref, id) {
      final service = ref.watch(feedbackServiceProvider);
      return service.getFeedback(id);
    });

final submitFeedbackProvider =
    AsyncNotifierProvider.autoDispose<SubmitFeedbackNotifier, bool>(
      SubmitFeedbackNotifier.new,
    );

class SubmitFeedbackNotifier extends AutoDisposeAsyncNotifier<bool> {
  @override
  Future<bool> build() async => false;

  Future<PatientFeedback> submit({
    required CreateFeedbackRequest request,
    String? feedbackId,
  }) async {
    state = const AsyncLoading();

    try {
      final service = ref.read(feedbackServiceProvider);
      final result = feedbackId == null
          ? await service.createFeedback(request)
          : await service.updateFeedback(
              feedbackId,
              UpdateFeedbackRequest(
                kind: request.kind,
                subject: request.subject,
                message: request.message,
                departmentId: request.departmentId,
              ),
            );
      _invalidateFeedback(ref);
      if (feedbackId != null) {
        ref.invalidate(feedbackDetailProvider(feedbackId));
      }
      state = const AsyncData(false);
      return result;
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      rethrow;
    }
  }
}

final closeFeedbackProvider =
    AsyncNotifierProvider.autoDispose<CloseFeedbackNotifier, Set<String>>(
      CloseFeedbackNotifier.new,
    );

class CloseFeedbackNotifier extends AutoDisposeAsyncNotifier<Set<String>> {
  @override
  Future<Set<String>> build() async => {};

  Future<void> close(String feedbackId) async {
    final inFlight = {...?state.valueOrNull};
    if (inFlight.contains(feedbackId)) return;

    inFlight.add(feedbackId);
    state = AsyncData(inFlight);

    try {
      final service = ref.read(feedbackServiceProvider);
      await service.closeFeedback(feedbackId);
      _invalidateFeedback(ref);
      ref.invalidate(feedbackDetailProvider(feedbackId));
    } finally {
      final updated = {...?state.valueOrNull}..remove(feedbackId);
      state = AsyncData(updated);
    }
  }

  bool isClosing(String feedbackId) =>
      state.valueOrNull?.contains(feedbackId) ?? false;
}

void _invalidateFeedback(Ref ref) {
  final kind = ref.read(feedbackKindFilterProvider);
  final status = ref.read(feedbackStatusFilterProvider);
  ref.invalidate(feedbackListProvider((kind: kind, status: status)));
}

String feedbackErrorMessage(Object error) => authFlowErrorMessage(error);
