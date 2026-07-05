import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/appointment_model.dart';
import 'next_appointment_card.dart';

class AppointmentListCard extends StatelessWidget {
  const AppointmentListCard({
    super.key,
    required this.appointment,
    required this.onEdit,
    required this.onDetails,
  });

  final AppointmentSummary appointment;
  final VoidCallback onEdit;
  final VoidCallback onDetails;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: AppDesignTokens.spacingSm),
      padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
        border: Border.all(color: colorScheme.outlineVariant),
        boxShadow: context.cardShadow,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DoctorAvatar(
            name: appointment.doctor.name,
            avatarUrl: appointment.doctor.avatarUrl,
          ),
          const Gap(AppDesignTokens.spacingMd),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appointment.doctor.name,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(2),
                Text(
                  appointment.doctor.specialty,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
                const Gap(AppDesignTokens.spacingSm),
                Row(
                  children: [
                    if (appointment.canReschedule)
                      _ActionChip(label: 'Edit', onTap: onEdit),
                    if (appointment.canReschedule) const Gap(AppDesignTokens.spacingXs),
                    _ActionChip(label: 'Details', onTap: onDetails),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                DateFormatter.appointmentCompactDate(appointment.scheduledAt),
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                DateFormatter.appointmentCompactTime(appointment.scheduledAt),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionChip extends StatelessWidget {
  const _ActionChip({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Material(
      color: colorScheme.surfaceContainer,
      borderRadius: BorderRadius.circular(AppDesignTokens.radiusSm),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusSm),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDesignTokens.spacingSm,
            vertical: AppDesignTokens.spacingXs,
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}
