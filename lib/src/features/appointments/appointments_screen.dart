import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imsh/app_router.gr.dart';

import '../../core/responsive.dart';
import '../../core/theme/imsh_accent_colors.dart';
import '../../helper/date_formatter.dart';
import '../../models/appointment_model.dart';
import '../../providers/appointments_provider.dart';
import '../../shared/widgets/imsh_app_bar.dart';
import '../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../shared/widgets/imsh_error_panel.dart';
import '../../shared/widgets/imsh_page_header.dart';
import '../../shared/widgets/imsh_solid_icon.dart';
import '../../shared/widgets/imsh_surface_card.dart';
import 'widgets/appointment_status_badge.dart';
import 'widgets/appointments_body.dart';
import 'widgets/next_appointment_card.dart';

@RoutePage()
class AppointmentsScreen extends ConsumerWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: ImshAppBar(
        title: const Text('Ibom Specialist'),
        actions: [
          IconButton(
            onPressed: () => context.router.push(const NotificationsRoute()),
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(bookingWizardProvider.notifier).reset();
          context.router.push(BookAppointmentRoute());
        },
        child: const Icon(Icons.add),
      ),
      body: const AppointmentsBody(),
    );
  }
}

@RoutePage()
class AppointmentDetailScreen extends ConsumerWidget {
  const AppointmentDetailScreen({
    super.key,
    @PathParam('id') required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(appointmentDetailProvider(id));

    return Scaffold(
      appBar: ImshAppBar(title: const Text('Appointment')),
      body: detailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => ImshErrorPanel(
          message: appointmentErrorMessage(error),
          onRetry: () => ref.invalidate(appointmentDetailProvider(id)),
        ),
        data: (detail) {
          final theme = Theme.of(context);
          final cs = theme.colorScheme;
          final timeValue = detail.status == AppointmentStatus.requested
              ? 'To be confirmed'
              : DateFormatter.appointmentCardTime(detail.scheduledAt);

          return ResponsiveBody(
            expand: false,
            builder: (context, bp) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ImshPageHeader(
                      title: detail.specialtyLabel,
                      subtitle: detail.visitType.label,
                      icon: Icons.event_note_outlined,
                      iconColor: ImshAccentColors.teal,
                      trailing: AppointmentStatusBadge(status: detail.status),
                    ),
                    const SizedBox(height: 12),
                    ImshSurfaceCard(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          DoctorAvatar(
                            name: detail.doctorDisplayName,
                            avatarUrl: detail.doctor.avatarUrl,
                            size: 56,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ImshEllipsisText(
                                  text: detail.doctorDisplayName,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                ImshEllipsisText(
                                  text: detail.specialtyLabel,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: cs.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    ImshSurfaceCard(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          _DetailFact(
                            icon: Icons.calendar_today_outlined,
                            accent: ImshAccentColors.teal,
                            label: 'Date',
                            value: DateFormatter.appointmentCardDate(
                              detail.scheduledAt,
                            ),
                          ),
                          const SizedBox(height: 10),
                          _DetailFact(
                            icon: detail.status == AppointmentStatus.requested
                                ? Icons.hourglass_top_outlined
                                : Icons.schedule_outlined,
                            accent: ImshAccentColors.indigo,
                            label: 'Time',
                            value: timeValue,
                          ),
                          const SizedBox(height: 10),
                          _DetailFact(
                            icon: Icons.location_on_outlined,
                            accent: ImshAccentColors.purple,
                            label: 'Location',
                            value: detail.locationLabel,
                          ),
                          const SizedBox(height: 10),
                          _DetailFact(
                            icon: detail.visitType ==
                                    AppointmentVisitType.telemedicine
                                ? Icons.videocam_outlined
                                : Icons.local_hospital_outlined,
                            accent: ImshAccentColors.blue,
                            label: 'Visit type',
                            value: detail.visitType.label,
                          ),
                        ],
                      ),
                    ),
                    if (detail.reason?.trim().isNotEmpty == true) ...[
                      const SizedBox(height: 12),
                      ImshSectionHeader(
                        title: 'Reason',
                        icon: Icons.notes_outlined,
                        iconColor: ImshAccentColors.amber,
                      ),
                      const SizedBox(height: 8),
                      ImshSurfaceCard(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          detail.reason!.trim(),
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ],
                    if (detail.notes?.trim().isNotEmpty == true) ...[
                      const SizedBox(height: 12),
                      ImshSectionHeader(
                        title: 'Notes',
                        icon: Icons.sticky_note_2_outlined,
                        iconColor: ImshAccentColors.pink,
                      ),
                      const SizedBox(height: 8),
                      ImshSurfaceCard(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          detail.notes!.trim(),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                    if (detail.canReschedule) ...[
                      const SizedBox(height: 16),
                      OutlinedButton(
                        onPressed: () {
                          ref
                              .read(bookingWizardProvider.notifier)
                              .startReschedule(appointmentId: detail.id);
                          context.router.push(
                            BookAppointmentRoute(appointmentId: detail.id),
                          );
                        },
                        child: const Text('Reschedule'),
                      ),
                    ],
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _DetailFact extends StatelessWidget {
  const _DetailFact({
    required this.icon,
    required this.accent,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final Color accent;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Row(
      children: [
        ImshSolidIcon(
          icon: icon,
          color: accent,
          size: 30,
          iconSize: 16,
          radius: 8,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: cs.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ImshEllipsisText(
                text: value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
