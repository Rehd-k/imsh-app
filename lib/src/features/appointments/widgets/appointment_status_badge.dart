import 'package:flutter/material.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../core/theme/status_badge_colors.dart';
import '../../../models/appointment_model.dart';

class AppointmentStatusBadge extends StatelessWidget {
  const AppointmentStatusBadge({super.key, required this.status});

  final AppointmentStatus status;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final (background, foreground) =
        status.appointmentBadgeColors(colorScheme, context.imshTheme);

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
