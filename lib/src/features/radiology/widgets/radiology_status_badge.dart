import 'package:flutter/material.dart';

import '../../../models/radiology_report_model.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_semantic_badge.dart';

ImshSemanticTone radiologyStatusTone(RadiologyReportStatus status) {
  return switch (status) {
    RadiologyReportStatus.pending => ImshSemanticTone.neutral,
    RadiologyReportStatus.inProgress => ImshSemanticTone.info,
    RadiologyReportStatus.finalized => ImshSemanticTone.warning,
    RadiologyReportStatus.verified => ImshSemanticTone.success,
  };
}

class RadiologyStatusBadge extends StatelessWidget {
  const RadiologyStatusBadge({super.key, required this.status});

  final RadiologyReportStatus status;

  @override
  Widget build(BuildContext context) {
    return ImshEllipsisChip(
      label: status.label,
      tone: radiologyStatusTone(status),
    );
  }
}
