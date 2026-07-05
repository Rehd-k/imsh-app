import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../helper/app_timezone.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/appointment_model.dart';
import '../../../providers/appointments_provider.dart';

class HomeUpcomingSection extends StatelessWidget {
  const HomeUpcomingSection({
    super.key,
    required this.appointments,
    required this.onViewAll,
    required this.onReschedule,
  });

  final List<AppointmentSummary> appointments;
  final VoidCallback onViewAll;
  final void Function(AppointmentSummary appointment) onReschedule;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDesignTokens.containerPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                'Upcoming',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: onViewAll,
                child: const Text('View All'),
              ),
            ],
          ),
          if (appointments.isEmpty)
            _EmptyUpcoming(
              onBook: () => context.router.push(BookAppointmentRoute()),
            )
          else
            for (final appointment in appointments) ...[
              HomeUpcomingAppointmentCard(
                appointment: appointment,
                onReschedule: () => onReschedule(appointment),
              ),
              if (appointment != appointments.last)
                const Gap(AppDesignTokens.spacingMd),
            ],
        ],
      ),
    );
  }
}

class HomeUpcomingAppointmentCard extends StatelessWidget {
  const HomeUpcomingAppointmentCard({
    super.key,
    required this.appointment,
    required this.onReschedule,
  });

  final AppointmentSummary appointment;
  final VoidCallback onReschedule;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;
    final localDate = AppTimezone.toLocal(appointment.scheduledAt);
    final monthLabel = DateFormat('MMM').format(localDate).toUpperCase();
    final dayLabel = DateFormat('d').format(localDate);
    final title = appointment.doctor.specialty.isNotEmpty
        ? appointment.doctor.specialty
        : 'Appointment';

    return Container(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 52,
                          padding: const EdgeInsets.symmetric(
                            vertical: AppDesignTokens.spacingSm,
                          ),
                          decoration: BoxDecoration(
                            color: context.imshTheme.primaryHighlight,
                            borderRadius: BorderRadius.circular(
                              AppDesignTokens.radiusMd,
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                monthLabel,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                dayLabel,
                                style: theme.textTheme.titleLarge?.copyWith(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(AppDesignTokens.spacingMd),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Gap(4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.schedule_outlined,
                                    size: 14,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                  const Gap(4),
                                  Text(
                                    DateFormatter.appointmentCardTime(
                                      appointment.scheduledAt,
                                    ),
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(2),
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_outline,
                                    size: 14,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                  const Gap(4),
                                  Expanded(
                                    child: Text(
                                      appointment.doctor.name,
                                      style:
                                          theme.textTheme.bodySmall?.copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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
                        if (appointment.canReschedule)
                          const Gap(AppDesignTokens.spacingSm),
                        Expanded(
                          child: FilledButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Check-in is coming soon.'),
                                ),
                              );
                            },
                            child: const Text('Check-in Now'),
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
    );
  }
}

class _EmptyUpcoming extends StatelessWidget {
  const _EmptyUpcoming({required this.onBook});

  final VoidCallback onBook;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return Container(
      padding: const EdgeInsets.all(AppDesignTokens.spacingLg),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        children: [
          Text(
            'No upcoming appointments',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(AppDesignTokens.spacingSm),
          Text(
            'Book your next visit with a specialist.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const Gap(AppDesignTokens.spacingMd),
          FilledButton(
            onPressed: onBook,
            child: const Text('Book appointment'),
          ),
        ],
      ),
    );
  }
}

void openHomeReschedule(
  BuildContext context,
  WidgetRef ref,
  AppointmentSummary appointment,
) {
  ref.read(bookingWizardProvider.notifier).startReschedule(
        appointmentId: appointment.id,
        doctor: BookableDoctor(
          id: appointment.doctor.id,
          name: appointment.doctor.name,
          specialty: appointment.doctor.specialty,
          avatarUrl: appointment.doctor.avatarUrl,
        ),
      );
  context.router.push(
    BookAppointmentRoute(appointmentId: appointment.id),
  );
}
