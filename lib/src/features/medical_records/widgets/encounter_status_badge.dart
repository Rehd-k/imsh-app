import 'package:flutter/material.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../models/medical_record_model.dart';

class EncounterStatusBadge extends StatelessWidget {
  const EncounterStatusBadge({super.key, required this.status});

  final EncounterStatus status;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final imsh = context.imshTheme;

    final (background, foreground) = switch (status) {
      EncounterStatus.completed => (
          imsh.successContainer,
          imsh.onSuccessContainer,
        ),
      EncounterStatus.ongoing => (
          imsh.warningContainer,
          imsh.onWarningContainer,
        ),
      EncounterStatus.cancelled => (
          colorScheme.errorContainer,
          colorScheme.onErrorContainer,
        ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDesignTokens.spacingSm + 4,
        vertical: AppDesignTokens.spacingXs,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        status.label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: foreground,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
