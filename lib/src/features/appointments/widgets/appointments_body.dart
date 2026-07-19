import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../models/appointment_model.dart';
import '../../../providers/appointments_provider.dart';
import '../../../shared/widgets/family_subject_banner.dart';
import '../../../shared/widgets/imsh_sliver_app_bar.dart';
import 'appointment_filter_chips.dart';
import 'appointment_list_card.dart';
import 'appointments_page_header.dart';
import 'consultation_history_section.dart';
import 'next_appointment_card.dart';

class AppointmentsBody extends ConsumerWidget {
  const AppointmentsBody({super.key});

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
            SliverPadding(
              padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const AppointmentsPageHeader(),
                    const Gap(AppDesignTokens.spacingLg),
                    const AppointmentFilterChips(),
                    const Gap(AppDesignTokens.spacingLg),
                    if (filter == AppointmentFilterTab.upcoming &&
                        dashboard.nextAppointment != null) ...[
                      NextAppointmentCard(
                        appointment: dashboard.nextAppointment!,
                        isCancelling: ref
                            .watch(cancelAppointmentProvider)
                            .maybeWhen(
                              data: (inFlight) => inFlight
                                  .contains(dashboard.nextAppointment!.id),
                              orElse: () => false,
                            ),
                        onReschedule: () => _openReschedule(
                          context,
                          ref,
                          dashboard.nextAppointment!,
                        ),
                        onCancel: () => _confirmCancel(
                          context,
                          ref,
                          dashboard.nextAppointment!.id,
                        ),
                      ),
                      const Gap(AppDesignTokens.spacingLg),
                    ],
                    if (dashboard.upcomingAppointments.isNotEmpty) ...[
                      for (final appointment in dashboard.upcomingAppointments)
                        AppointmentListCard(
                          appointment: appointment,
                          onEdit: () =>
                              _openReschedule(context, ref, appointment),
                          onDetails: () => context.router.push(
                            AppointmentDetailRoute(id: appointment.id),
                          ),
                        ),
                      const Gap(AppDesignTokens.spacingMd),
                    ] else if (filter != AppointmentFilterTab.upcoming ||
                        dashboard.nextAppointment == null) ...[
                      _EmptyAppointments(filter: filter),
                      const Gap(AppDesignTokens.spacingMd),
                    ],
                    if (filter == AppointmentFilterTab.upcoming)
                      ConsultationHistorySection(
                        items: dashboard.consultationHistory,
                        onViewAll: () =>
                            context.router.push(const MedicalRecordsRoute()),
                        onItemTap: (item) => context.router.push(
                          EncounterDetailRoute(id: item.id),
                        ),
                      ),
                    const Gap(80),
                  ],
                ),
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

  Future<void> _confirmCancel(
    BuildContext context,
    WidgetRef ref,
    String appointmentId,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel appointment?'),
        content: const Text(
          'This action cannot be undone. The hospital will be notified.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Keep'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Cancel appointment'),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return;

    try {
      await ref.read(cancelAppointmentProvider.notifier).cancel(appointmentId);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Appointment cancelled')),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(appointmentErrorMessage(error))),
        );
      }
    }
  }
}

class _EmptyAppointments extends StatelessWidget {
  const _EmptyAppointments({required this.filter});

  final AppointmentFilterTab filter;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final message = switch (filter) {
      AppointmentFilterTab.upcoming => 'No upcoming appointments scheduled.',
      AppointmentFilterTab.past => 'No past appointments on record.',
      AppointmentFilterTab.pending => 'No pending appointments.',
    };

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDesignTokens.spacingLg),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
      ),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
      ),
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
          SliverPadding(
            padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const AppointmentsPageHeader(),
                  const Gap(AppDesignTokens.spacingLg),
                  const AppointmentFilterChips(),
                  const Gap(AppDesignTokens.spacingLg),
                  NextAppointmentCard(
                    appointment: _placeholderAppointment,
                    onReschedule: () {},
                    onCancel: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppointmentsError extends StatelessWidget {
  const _AppointmentsError({
    required this.message,
    required this.onRetry,
  });

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
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48),
                  const Gap(AppDesignTokens.spacingMd),
                  Text(message, textAlign: TextAlign.center),
                  const Gap(AppDesignTokens.spacingMd),
                  FilledButton(onPressed: onRetry, child: const Text('Retry')),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
