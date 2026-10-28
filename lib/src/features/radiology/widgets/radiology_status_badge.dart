import 'package:flutter/material.dart';

import '../../../models/radiology_report_model.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_semantic_badge.dart';

ImshSemanticTone radiologyStatusTone(RadiologyReportStatus status) {
  return status.isComplete
      ? ImshSemanticTone.success
      : ImshSemanticTone.info;
}

class RadiologyStatusBadge extends StatelessWidget {
  const RadiologyStatusBadge({super.key, required this.status});

  final RadiologyReportStatus status;

  @override
  Widget build(BuildContext context) {
    return ImshEllipsisChip(
      label: status.patientLabel,
      tone: radiologyStatusTone(status),
    );
  }
}
