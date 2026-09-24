import 'package:flutter/material.dart';

import '../../../models/lab_result_model.dart';
import '../../../providers/lab_results_provider.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_semantic_badge.dart';

ImshSemanticTone labSummaryTone(
  LabSummaryStatus status, {
  LabOrderStatus? orderStatus,
}) {
  final pending = orderStatus != null
      ? isLabStatusPending(status, orderStatus)
      : status == LabSummaryStatus.pending;
  if (pending) return ImshSemanticTone.info;

  return switch (status) {
    LabSummaryStatus.normal => ImshSemanticTone.success,
    LabSummaryStatus.abnormal => ImshSemanticTone.warning,
    LabSummaryStatus.critical => ImshSemanticTone.error,
    LabSummaryStatus.pending => ImshSemanticTone.info,
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

  String get _label {
    if (orderStatus != null && isLabStatusPending(status, orderStatus!)) {
      return 'Pending';
    }
    if (status == LabSummaryStatus.pending) {
      return 'Pending';
    }
    if (status == LabSummaryStatus.normal && _isOrderComplete) {
      return 'Ready';
    }
    return status.label;
  }

  bool get _isOrderComplete =>
      orderStatus == null ||
      orderStatus == LabOrderStatus.completed ||
      orderStatus == LabOrderStatus.verified;

  @override
  Widget build(BuildContext context) {
    return ImshEllipsisChip(
      label: _label,
      tone: labSummaryTone(status, orderStatus: orderStatus),
    );
  }
}
