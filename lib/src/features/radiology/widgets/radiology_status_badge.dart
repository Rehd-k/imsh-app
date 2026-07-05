import 'package:flutter/material.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../models/radiology_report_model.dart';

class RadiologyStatusBadge extends StatelessWidget {
  const RadiologyStatusBadge({super.key, required this.status});

  final RadiologyReportStatus status;

  Color _backgroundColor(BuildContext context) {
    final colorScheme = context.colorScheme;
    return switch (status) {
      RadiologyReportStatus.pending => colorScheme.surfaceContainerHigh,
      RadiologyReportStatus.inProgress =>
        colorScheme.onPrimaryContainer.withValues(alpha: 0.15),
      RadiologyReportStatus.finalized =>
        colorScheme.secondaryContainer.withValues(alpha: 0.5),
      RadiologyReportStatus.verified =>
        colorScheme.primaryContainer.withValues(alpha: 0.15),
    };
  }

  Color _foregroundColor(BuildContext context) {
    final colorScheme = context.colorScheme;
    return switch (status) {
      RadiologyReportStatus.pending => colorScheme.onSurfaceVariant,
      RadiologyReportStatus.inProgress => colorScheme.primaryContainer,
      RadiologyReportStatus.finalized => colorScheme.secondary,
      RadiologyReportStatus.verified => colorScheme.primaryContainer,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDesignTokens.spacingSm + 2,
        vertical: AppDesignTokens.spacingXs,
      ),
      decoration: BoxDecoration(
        color: _backgroundColor(context),
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusSm),
      ),
      child: Text(
        status.label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: _foregroundColor(context),
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
