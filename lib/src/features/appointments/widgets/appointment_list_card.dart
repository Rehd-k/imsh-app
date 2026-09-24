import 'package:flutter/material.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/appointment_model.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';
import 'appointment_status_badge.dart';

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
    final cs = theme.colorScheme;
    final dateLabel = DateFormatter.appointmentCompactDate(appointment.scheduledAt);
    final timeLabel = appointment.status == AppointmentStatus.requested
        ? 'To be confirmed'
        : DateFormatter.appointmentCompactTime(appointment.scheduledAt);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ImshSurfaceCard(
        padding: const EdgeInsets.all(10),
        onTap: onDetails,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImshSolidIcon(
              icon: appointment.visitType == AppointmentVisitType.telemedicine
                  ? Icons.videocam_outlined
                  : Icons.event_outlined,
              color: appointment.visitType == AppointmentVisitType.telemedicine
                  ? ImshAccentColors.purple
                  : ImshAccentColors.teal,
              size: 34,
              iconSize: 18,
              radius: AppDesignTokens.radiusMd,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ImshEllipsisText(
                          text: appointment.specialtyLabel,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      AppointmentStatusBadge(status: appointment.status),
                    ],
                  ),
                  const SizedBox(height: 2),
                  ImshEllipsisText(
                    text: appointment.doctorDisplayName,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 2),
                  ImshEllipsisText(
                    text: '$dateLabel · $timeLabel · ${appointment.visitType.label}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      if (appointment.canReschedule) ...[
                        TextButton(
                          onPressed: onEdit,
                          style: TextButton.styleFrom(
                            visualDensity: VisualDensity.compact,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text('Reschedule'),
                        ),
                        const SizedBox(width: 8),
                      ],
                      TextButton(
                        onPressed: onDetails,
                        style: TextButton.styleFrom(
                          visualDensity: VisualDensity.compact,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text('Details'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
