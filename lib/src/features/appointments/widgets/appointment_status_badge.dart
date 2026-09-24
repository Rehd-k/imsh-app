import 'package:flutter/material.dart';

import '../../../models/appointment_model.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_semantic_badge.dart';

ImshSemanticTone appointmentStatusTone(AppointmentStatus status) {
  return switch (status) {
    AppointmentStatus.requested => ImshSemanticTone.warning,
    AppointmentStatus.confirmed => ImshSemanticTone.success,
    AppointmentStatus.pending => ImshSemanticTone.warning,
    AppointmentStatus.cancelled => ImshSemanticTone.error,
    AppointmentStatus.completed => ImshSemanticTone.info,
  };
}

class AppointmentStatusBadge extends StatelessWidget {
  const AppointmentStatusBadge({super.key, required this.status});

  final AppointmentStatus status;

  @override
  Widget build(BuildContext context) {
    return ImshEllipsisChip(
      label: status.label,
      tone: appointmentStatusTone(status),
    );
  }
}
