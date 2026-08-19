import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/theatre_schedule_model.dart';
import 'auth_provider.dart';
import 'family_provider.dart';
import 'service_providers.dart';

final theatreSchedulesProvider =
    FutureProvider.autoDispose<TheatreSchedulesResponse>((ref) async {
  final service = ref.watch(theatreServiceProvider);
  final forPatientId = watchForPatientId(ref);
  return service.listSchedules(forPatientId: forPatientId);
});

final theatreScheduleDetailProvider = Provider.autoDispose
    .family<TheatreScheduleSummary?, String>((ref, id) {
  final async = ref.watch(theatreSchedulesProvider);
  return async.maybeWhen(
    data: (response) {
      for (final schedule in response.schedules) {
        if (schedule.id == id) return schedule;
      }
      for (final request in response.surgeryRequests) {
        final schedule = request.schedule;
        if (schedule?.id == id || request.id == id) {
          return TheatreScheduleSummary(
            id: schedule?.id ?? request.id,
            scheduledAt: schedule?.scheduledAt,
            estimatedDurationMins: schedule?.estimatedDurationMins,
            theatreRoom: schedule?.theatreRoom,
            surgeon: schedule?.surgeon,
            anaesthetist: schedule?.anaesthetist,
            scrubNurse: schedule?.scrubNurse,
            procedureName: request.procedureName,
            requestStatus: request.status,
            notes: request.notes,
            surgeryRequestId: request.id,
          );
        }
      }
      return null;
    },
    orElse: () => null,
  );
});

String theatreErrorMessage(Object error) => authFlowErrorMessage(error);
