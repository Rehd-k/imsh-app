import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../core/utils/api_media_url.dart';
import '../../../helper/app_timezone.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/appointment_model.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';
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
    final theme = Theme.of(context);
    final resolvedUrl = resolveApiMediaUrl(avatarUrl);
    if (resolvedUrl != null && resolvedUrl.isNotEmpty) {
      return CircleAvatar(
        radius: size / 2,
        backgroundImage: NetworkImage(resolvedUrl),
      );
    }

    final initials = name
        .split(' ')
        .where((part) => part.isNotEmpty)
        .take(2)
        .map((part) => part[0].toUpperCase())
        .join();

    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ImshAccentColors.teal,
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: Text(
        initials.isEmpty ? '—' : initials,
        style: theme.textTheme.titleSmall?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: size * 0.32,
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
    final cs = theme.colorScheme;
    final local = AppTimezone.toLocal(appointment.scheduledAt);
    final month = DateFormat('MMM').format(local).toUpperCase();
    final day = DateFormat('d').format(local);
    final timeValue = appointment.status == AppointmentStatus.requested
        ? 'Awaiting confirm'
        : DateFormatter.appointmentCardTime(appointment.scheduledAt);
    final title = appointment.status == AppointmentStatus.requested
        ? 'Next request'
        : 'Next visit';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ImshSectionHeader(
          title: title,
          icon: Icons.event_available_outlined,
          iconColor: ImshAccentColors.indigo,
          trailing: AppointmentStatusBadge(status: appointment.status),
        ),
        const SizedBox(height: 8),
        ImshSurfaceCard(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: cs.surfaceContainerLow,
                      borderRadius:
                          BorderRadius.circular(AppDesignTokens.radiusMd),
                      border: Border.all(color: cs.outlineVariant),
                    ),
                    child: Column(
                      children: [
                        Text(
                          month,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: ImshAccentColors.teal,
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
                        Row(
                          children: [
                            DoctorAvatar(
                              name: appointment.doctorDisplayName,
                              avatarUrl: appointment.doctor.avatarUrl,
                              size: 40,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ImshEllipsisText(
                                    text: appointment.doctorDisplayName,
                                    style: theme.textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  ImshEllipsisText(
                                    text: appointment.specialtyLabel,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: cs.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ImshEllipsisText(
                          text:
                              '$timeValue · ${appointment.visitType.label}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 2),
                        ImshEllipsisText(
                          text: appointment.locationLabel,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  if (appointment.canReschedule)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: onReschedule,
                        child: const Text('Reschedule'),
                      ),
                    ),
                  if (appointment.canReschedule && appointment.canCancel)
                    const SizedBox(width: 8),
                  if (appointment.canCancel)
                    Expanded(
                      child: FilledButton(
                        onPressed: isCancelling ? null : onCancel,
                        style: FilledButton.styleFrom(
                          backgroundColor: cs.errorContainer,
                          foregroundColor: cs.onErrorContainer,
                        ),
                        child: isCancelling
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : const Text('Cancel'),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
