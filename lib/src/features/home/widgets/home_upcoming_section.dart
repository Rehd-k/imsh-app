import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imsh/app_router.gr.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/app_timezone.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/appointment_model.dart';
import '../../../providers/appointments_provider.dart';
import '../../../shared/widgets/imsh_semantic_badge.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';

class HomeNextVisitCard extends StatelessWidget {
  const HomeNextVisitCard({
    super.key,
    required this.appointment,
    required this.onOpenBooking,
    required this.onRequest,
    required this.onReschedule,
  });

  final AppointmentSummary? appointment;
  final VoidCallback onOpenBooking;
  final VoidCallback onRequest;
  final void Function(AppointmentSummary appointment) onReschedule;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    if (appointment == null) {
      return ImshSurfaceCard(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ImshSolidIcon(
              icon: Icons.event_available_outlined,
              color: ImshAccentColors.blue,
              size: 34,
              iconSize: 18,
              radius: AppDesignTokens.radiusMd,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'No visit scheduled',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Request an appointment and the hospital will confirm.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: FilledButton(
                      onPressed: onRequest,
                      child: const Text('Request appointment'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    final a = appointment!;
    final local = AppTimezone.toLocal(a.scheduledAt);
    final month = DateFormat('MMM').format(local).toUpperCase();
    final day = DateFormat('d').format(local);
    final title = a.status == AppointmentStatus.requested
        ? 'Next request'
        : 'Next visit';

    return ImshSurfaceCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const ImshSolidIcon(
                icon: Icons.calendar_month_outlined,
                color: ImshAccentColors.indigo,
                size: 30,
                iconSize: 16,
                radius: 8,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              ImshSemanticBadge(
                label: a.status.label,
                tone: a.status == AppointmentStatus.confirmed
                    ? ImshSemanticTone.success
                    : a.status == AppointmentStatus.requested
                        ? ImshSemanticTone.warning
                        : ImshSemanticTone.info,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: cs.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
                  border: Border.all(color: cs.outlineVariant),
                ),
                child: Column(
                  children: [
                    Text(
                      month,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: ImshAccentColors.indigo,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      day,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImshEllipsisText(
                      text: a.specialtyLabel,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    ImshEllipsisText(
                      text:
                          '${DateFormatter.appointmentCardTime(a.scheduledAt)} · ${a.visitType.label}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: cs.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 2),
                    ImshEllipsisText(
                      text: a.doctorDisplayName,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: cs.onSurfaceVariant,
                      ),
                    ),
                    if ((a.location?.trim().isNotEmpty) ?? false) ...[
                      const SizedBox(height: 2),
                      ImshEllipsisText(
                        text: a.location!.trim(),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onOpenBooking,
                  child: const Text('View all'),
                ),
              ),
              if (a.canReschedule) ...[
                const SizedBox(width: 8),
                Expanded(
                  child: FilledButton(
                    onPressed: () => onReschedule(a),
                    child: const Text('Reschedule'),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

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
    if (appointments.length <= 1) return const SizedBox.shrink();
    final theme = Theme.of(context);
    final rest = appointments.skip(1).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text(
              'Also upcoming',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const Spacer(),
            TextButton(onPressed: onViewAll, child: const Text('View all')),
          ],
        ),
        const SizedBox(height: 8),
        for (var i = 0; i < rest.length; i++) ...[
          if (i > 0) const SizedBox(height: 8),
          HomeUpcomingAppointmentCard(
            appointment: rest[i],
            onReschedule: () => onReschedule(rest[i]),
          ),
        ],
      ],
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
    final cs = theme.colorScheme;

    return ImshSurfaceCard(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const ImshSolidIcon(
            icon: Icons.event_outlined,
            color: ImshAccentColors.teal,
            size: 30,
            iconSize: 16,
            radius: 8,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImshEllipsisText(
                  text: appointment.specialtyLabel,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                ImshEllipsisText(
                  text:
                      '${DateFormatter.appointmentCardDate(appointment.scheduledAt)} · ${DateFormatter.appointmentCardTime(appointment.scheduledAt)}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
                ImshEllipsisText(
                  text: appointment.doctorDisplayName,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          if (appointment.canReschedule)
            TextButton(onPressed: onReschedule, child: const Text('Reschedule')),
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
  ref
      .read(bookingWizardProvider.notifier)
      .startReschedule(appointmentId: appointment.id);
  context.router.push(BookAppointmentRoute(appointmentId: appointment.id));
}
