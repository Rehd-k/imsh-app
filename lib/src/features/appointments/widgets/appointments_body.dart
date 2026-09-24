import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imsh/app_router.gr.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/responsive.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/appointment_model.dart';
import '../../../providers/appointments_provider.dart';
import '../../../shared/widgets/family_subject_banner.dart';
import '../../../shared/widgets/imsh_empty_state.dart';
import '../../../shared/widgets/imsh_error_panel.dart';
import '../../../shared/widgets/imsh_kpi_tile.dart';
import '../../../shared/widgets/imsh_sliver_app_bar.dart';
import 'appointment_filter_chips.dart';
import 'appointment_list_card.dart';
import 'appointments_page_header.dart';
import 'consultation_history_section.dart';
import 'next_appointment_card.dart';

class AppointmentsBody extends ConsumerWidget {
  const AppointmentsBody({super.key});

  static const sectionGap = 12.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(appointmentFilterProvider);
    final dashboardAsync = ref.watch(appointmentsDashboardProvider(filter));

    return dashboardAsync.when(
      loading: () => const _AppointmentsSkeleton(),
      error: (error, _) => _AppointmentsError(
        message: appointmentErrorMessage(error),
        onRetry: () => ref.invalidate(appointmentsDashboardProvider(filter)),
      ),
      data: (dashboard) => RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(appointmentsDashboardProvider(filter));
          await ref.read(appointmentsDashboardProvider(filter).future);
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            const ImshSliverAppBar(),
            const SliverToBoxAdapter(child: FamilySubjectBanner()),
            SliverFillRemaining(
              hasScrollBody: true,
              child: ResponsiveBody(
                expand: false,
                center: false,
                bottomPadding: 88,
                builder: (context, bp) {
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: _AppointmentsMainColumn(
                      filter: filter,
                      dashboard: dashboard,
                      useSnapKpis: bp.maxWidth < 520,
                      onReschedule: (appointment) =>
                          _openReschedule(context, ref, appointment),
                      onCancel: (id) => _confirmCancel(context, ref, id),
                      isCancelling: (id) => ref
                          .watch(cancelAppointmentProvider)
                          .maybeWhen(
                            data: (inFlight) => inFlight.contains(id),
                            orElse: () => false,
                          ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openReschedule(
    BuildContext context,
    WidgetRef ref,
    AppointmentSummary appointment,
  ) {
    ref
        .read(bookingWizardProvider.notifier)
        .startReschedule(appointmentId: appointment.id);
    context.router.push(BookAppointmentRoute(appointmentId: appointment.id));
  }

  Future<void> _confirmCancel(
    BuildContext context,
    WidgetRef ref,
    String appointmentId,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        final scheme = Theme.of(context).colorScheme;
        return AlertDialog(
          title: const Text('Cancel appointment?'),
          content: const Text(
            'This action cannot be undone. The hospital will be notified.',
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(foregroundColor: scheme.error),
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Cancel appointment'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Keep appointment'),
            ),
          ],
        );
      },
    );

    if (confirmed != true || !context.mounted) return;

    try {
      await ref.read(cancelAppointmentProvider.notifier).cancel(appointmentId);
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Appointment cancelled')));
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(appointmentErrorMessage(error))));
      }
    }
  }
}

class _AppointmentsMainColumn extends StatelessWidget {
  const _AppointmentsMainColumn({
    required this.filter,
    required this.dashboard,
    required this.useSnapKpis,
    required this.onReschedule,
    required this.onCancel,
    required this.isCancelling,
  });

  final AppointmentFilterTab filter;
  final AppointmentsDashboardResponse dashboard;
  final bool useSnapKpis;
  final void Function(AppointmentSummary appointment) onReschedule;
  final void Function(String id) onCancel;
  final bool Function(String id) isCancelling;

  @override
  Widget build(BuildContext context) {
    final upcomingCount = dashboard.upcomingAppointments.length +
        (dashboard.nextAppointment != null ? 1 : 0);
    final historyCount = dashboard.consultationHistory.length;
    final next = dashboard.nextAppointment;
    final nextValue = next == null
        ? '—'
        : DateFormatter.appointmentCompactDate(next.scheduledAt);
    final nextCaption = next == null
        ? 'None scheduled'
        : next.status == AppointmentStatus.requested
            ? 'Awaiting confirm'
            : DateFormatter.appointmentCardTime(next.scheduledAt);

    final listEmpty = dashboard.upcomingAppointments.isEmpty &&
        (filter != AppointmentFilterTab.upcoming ||
            dashboard.nextAppointment == null);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AppointmentsPageHeader(),
        const SizedBox(height: AppointmentsBody.sectionGap),
        ImshKpiStrip(
          useSnapStrip: useSnapKpis,
          items: [
            ImshKpiItem(
              label: filter.label,
              value: upcomingCount > 0 ? '$upcomingCount' : '—',
              caption: upcomingCount > 0 ? 'In this view' : 'None listed',
              icon: Icons.event_note_outlined,
              accent: ImshAccentColors.teal,
            ),
            ImshKpiItem(
              label: 'Next visit',
              value: nextValue,
              caption: nextCaption,
              icon: Icons.event_available_outlined,
              accent: ImshAccentColors.indigo,
            ),
            ImshKpiItem(
              label: 'History',
              value: historyCount > 0 ? '$historyCount' : '—',
              caption: historyCount > 0 ? 'Recent consults' : 'No consults',
              icon: Icons.history_outlined,
              accent: ImshAccentColors.blue,
            ),
          ],
        ),
        const SizedBox(height: AppointmentsBody.sectionGap),
        const AppointmentFilterChips(),
        const SizedBox(height: AppointmentsBody.sectionGap),
        if (filter == AppointmentFilterTab.upcoming && next != null) ...[
          NextAppointmentCard(
            appointment: next,
            isCancelling: isCancelling(next.id),
            onReschedule: () => onReschedule(next),
            onCancel: () => onCancel(next.id),
          ),
          const SizedBox(height: AppointmentsBody.sectionGap),
        ],
        if (dashboard.upcomingAppointments.isNotEmpty)
          for (final appointment in dashboard.upcomingAppointments)
            AppointmentListCard(
              appointment: appointment,
              onEdit: () => onReschedule(appointment),
              onDetails: () => context.router.push(
                AppointmentDetailRoute(id: appointment.id),
              ),
            )
        else if (listEmpty)
          ImshEmptyState(
            icon: Icons.event_busy_outlined,
            iconColor: ImshAccentColors.teal,
            message: switch (filter) {
              AppointmentFilterTab.upcoming =>
                'No upcoming appointments scheduled.',
              AppointmentFilterTab.past => 'No past appointments on record.',
              AppointmentFilterTab.pending => 'No pending appointments.',
            },
          ),
        if (filter == AppointmentFilterTab.upcoming) ...[
          const SizedBox(height: AppointmentsBody.sectionGap),
          ConsultationHistorySection(
            items: dashboard.consultationHistory,
            onViewAll: () => context.router.push(const MedicalRecordsRoute()),
            onItemTap: (item) => context.router.push(
              EncounterDetailRoute(id: item.id),
            ),
          ),
        ],
      ],
    );
  }
}

class _AppointmentsSkeleton extends StatelessWidget {
  const _AppointmentsSkeleton();

  static final _placeholderDoctor = DoctorSummary(
    id: 'skeleton',
    name: 'Dr. Emem Akpan',
    specialty: 'Senior Cardiologist',
  );

  static final _placeholderAppointment = AppointmentSummary(
    id: 'skeleton',
    status: AppointmentStatus.confirmed,
    scheduledAt: DateTime.now().add(const Duration(days: 3)),
    location: 'Wing B, 2nd Floor, Room 204',
    doctor: _placeholderDoctor,
  );

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: CustomScrollView(
        slivers: [
          const ImshSliverAppBar(),
          SliverFillRemaining(
            hasScrollBody: true,
            child: ResponsiveBody(
              expand: false,
              center: false,
              builder: (context, bp) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const AppointmentsPageHeader(),
                      const SizedBox(height: AppointmentsBody.sectionGap),
                      const AppointmentFilterChips(),
                      const SizedBox(height: AppointmentsBody.sectionGap),
                      NextAppointmentCard(
                        appointment: _placeholderAppointment,
                        onReschedule: () {},
                        onCancel: () {},
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _AppointmentsError extends StatelessWidget {
  const _AppointmentsError({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        const ImshSliverAppBar(),
        SliverFillRemaining(
          hasScrollBody: false,
          child: ImshErrorPanel(message: message, onRetry: onRetry),
        ),
      ],
    );
  }
}
