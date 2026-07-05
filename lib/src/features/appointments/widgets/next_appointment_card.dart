import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/appointment_model.dart';
import 'appointment_status_badge.dart';

class DoctorAvatar extends StatelessWidget {
  const DoctorAvatar({
    super.key,
    required this.name,
    this.avatarUrl,
    this.size = 48,
  });

  final String name;
  final String? avatarUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (avatarUrl != null && avatarUrl!.isNotEmpty) {
      return CircleAvatar(
        radius: size / 2,
        backgroundImage: NetworkImage(avatarUrl!),
      );
    }

    final initials = name
        .split(' ')
        .where((part) => part.isNotEmpty)
        .take(2)
        .map((part) => part[0].toUpperCase())
        .join();

    return CircleAvatar(
      radius: size / 2,
      backgroundColor: context.imshTheme.primaryHighlight,
      child: Text(
        initials,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}

class NextAppointmentCard extends StatelessWidget {
  const NextAppointmentCard({
    super.key,
    required this.appointment,
    required this.onReschedule,
    required this.onCancel,
    this.isCancelling = false,
  });

  final AppointmentSummary appointment;
  final VoidCallback onReschedule;
  final VoidCallback onCancel;
  final bool isCancelling;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'NEXT APPOINTMENT',
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
              ),
            ),
            const Spacer(),
            AppointmentStatusBadge(status: appointment.status),
          ],
        ),
        const Gap(AppDesignTokens.spacingSm),
        Container(
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
            border: Border.all(color: colorScheme.outlineVariant),
            boxShadow: context.cardShadow,
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 4,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(AppDesignTokens.radiusLg),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            DoctorAvatar(
                              name: appointment.doctor.name,
                              avatarUrl: appointment.doctor.avatarUrl,
                              size: 56,
                            ),
                            const Gap(AppDesignTokens.spacingMd),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    appointment.doctor.name,
                                    style:
                                        theme.textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Gap(2),
                                  Text(
                                    appointment.doctor.specialty,
                                    style:
                                        theme.textTheme.bodyMedium?.copyWith(
                                      color: colorScheme.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Gap(AppDesignTokens.spacingMd),
                        Row(
                          children: [
                            Expanded(
                              child: _InfoTile(
                                icon: Icons.calendar_today_outlined,
                                label: 'DATE',
                                value: DateFormatter.appointmentCardDate(
                                  appointment.scheduledAt,
                                ),
                              ),
                            ),
                            const Gap(AppDesignTokens.spacingSm),
                            Expanded(
                              child: _InfoTile(
                                icon: Icons.schedule_outlined,
                                label: 'TIME',
                                value: DateFormatter.appointmentCardTime(
                                  appointment.scheduledAt,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Gap(AppDesignTokens.spacingMd),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(
                            AppDesignTokens.spacingMd,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerLow,
                            borderRadius: BorderRadius.circular(
                              AppDesignTokens.radiusMd,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 18,
                                color: colorScheme.onSurfaceVariant,
                              ),
                              const Gap(AppDesignTokens.spacingSm),
                              Expanded(
                                child: Text(
                                  appointment.location,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(AppDesignTokens.spacingMd),
                        Row(
                          children: [
                            if (appointment.canReschedule)
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: onReschedule,
                                  child: const Text('Reschedule'),
                                ),
                              ),
                            if (appointment.canReschedule &&
                                appointment.canCancel)
                              const Gap(AppDesignTokens.spacingSm),
                            if (appointment.canCancel)
                              Expanded(
                                child: FilledButton(
                                  onPressed: isCancelling ? null : onCancel,
                                  style: FilledButton.styleFrom(
                                    backgroundColor:
                                        colorScheme.errorContainer,
                                    foregroundColor:
                                        colorScheme.onErrorContainer,
                                  ),
                                  child: isCancelling
                                      ? const SizedBox(
                                          width: 18,
                                          height: 18,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        )
                                      : const Text('Cancel'),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return Container(
      padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: context.imshTheme.primaryHighlight,
              borderRadius: BorderRadius.circular(AppDesignTokens.radiusSm),
            ),
            child: Icon(icon, size: 18, color: colorScheme.primary),
          ),
          const Gap(AppDesignTokens.spacingSm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                Text(
                  value,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
