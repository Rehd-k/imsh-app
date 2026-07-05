import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../models/lab_result_model.dart';
import '../../../providers/lab_results_provider.dart';

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
    if (orderStatus != null &&
        isLabStatusPending(status, orderStatus!)) {
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
    final colorScheme = context.colorScheme;

    if (onPrimary) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDesignTokens.spacingSm + 4,
          vertical: AppDesignTokens.spacingXs,
        ),
        decoration: BoxDecoration(
          color: colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          _label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.w600,
              ),
        ),
      );
    }

    final (background, foreground, dotColor) = _colors(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDesignTokens.spacingSm + 4,
        vertical: AppDesignTokens.spacingXs,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: dotColor,
              shape: BoxShape.circle,
            ),
          ),
          const Gap(6),
          Text(
            _label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: foreground,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }

  (Color background, Color foreground, Color dotColor) _colors(
    BuildContext context,
  ) {
    final colorScheme = context.colorScheme;
    final imsh = context.imshTheme;
    final pending = orderStatus != null
        ? isLabStatusPending(status, orderStatus!)
        : status == LabSummaryStatus.pending;

    if (pending) {
      return (
        imsh.infoContainer,
        imsh.onInfoContainer,
        imsh.onInfoContainer,
      );
    }

    return switch (status) {
      LabSummaryStatus.normal => (
          imsh.successContainer,
          imsh.onSuccessContainer,
          imsh.onSuccessContainer,
        ),
      LabSummaryStatus.abnormal => (
          colorScheme.errorContainer,
          colorScheme.onErrorContainer,
          colorScheme.error,
        ),
      LabSummaryStatus.critical => (
          colorScheme.errorContainer,
          colorScheme.onErrorContainer,
          colorScheme.error,
        ),
      LabSummaryStatus.pending => (
          imsh.infoContainer,
          imsh.onInfoContainer,
          imsh.onInfoContainer,
        ),
    };
  }
}
