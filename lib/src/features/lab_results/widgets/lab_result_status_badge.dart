import 'package:flutter/material.dart';

import '../../../models/lab_result_model.dart';
import '../../../providers/lab_results_provider.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_semantic_badge.dart';

ImshSemanticTone labSummaryTone(
  LabSummaryStatus status, {
  LabOrderStatus? orderStatus,
}) {
  final label = labPatientStatusLabel(status, orderStatus: orderStatus);
  return switch (label) {
    'Pending' => ImshSemanticTone.info,
    'Abnormal' => ImshSemanticTone.warning,
    _ => ImshSemanticTone.success,
  };
}

class LabResultStatusBadge extends StatelessWidget {
  const LabResultStatusBadge({
    super.key,
    required this.status,
    this.orderStatus,
    this.onPrimary = false,
  });

  final LabSummaryStatus status;
  final LabOrderStatus? orderStatus;
  final bool onPrimary;

  @override
  Widget build(BuildContext context) {
    return ImshEllipsisChip(
      label: labPatientStatusLabel(status, orderStatus: orderStatus),
      tone: labSummaryTone(status, orderStatus: orderStatus),
    );
  }
}
