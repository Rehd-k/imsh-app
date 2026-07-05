import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';

import '../../core/theme/app_design_tokens.dart';
import '../../core/theme/context_extensions.dart';
import '../../helper/date_formatter.dart';
import '../../models/appointment_model.dart';
import '../../providers/appointments_provider.dart';
import '../../shared/widgets/imsh_app_bar.dart';
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
            onPressed: () =>
                context.router.push(const NotificationsRoute()),
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
        error: (error, _) => _DetailError(
          message: appointmentErrorMessage(error),
          onRetry: () => ref.invalidate(appointmentDetailProvider(id)),
        ),
        data: (detail) {
          final colorScheme = context.colorScheme;

          return SingleChildScrollView(
          padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      detail.doctor.name,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  AppointmentStatusBadge(status: detail.status),
                ],
              ),
              const Gap(AppDesignTokens.spacingXs),
              Text(
                detail.doctor.specialty,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const Gap(AppDesignTokens.spacingLg),
              Row(
                children: [
                  DoctorAvatar(
                    name: detail.doctor.name,
                    avatarUrl: detail.doctor.avatarUrl,
                    size: 72,
                  ),
                  const Gap(AppDesignTokens.spacingMd),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _DetailRow(
                          icon: Icons.calendar_today_outlined,
                          label: 'Date',
                          value: DateFormatter.appointmentCardDate(
                            detail.scheduledAt,
                          ),
                        ),
                        const Gap(AppDesignTokens.spacingSm),
                        _DetailRow(
                          icon: Icons.schedule_outlined,
                          label: 'Time',
                          value: DateFormatter.appointmentCardTime(
                            detail.scheduledAt,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(AppDesignTokens.spacingLg),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerLow,
                  borderRadius:
                      BorderRadius.circular(AppDesignTokens.radiusMd),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    const Gap(AppDesignTokens.spacingSm),
                    Expanded(child: Text(detail.location)),
                  ],
                ),
              ),
              if (detail.reason?.isNotEmpty == true) ...[
                const Gap(AppDesignTokens.spacingLg),
                Text(
                  'Reason',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const Gap(AppDesignTokens.spacingXs),
                Text(detail.reason!),
              ],
              if (detail.notes?.isNotEmpty == true) ...[
                const Gap(AppDesignTokens.spacingLg),
                Text(
                  'Notes',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const Gap(AppDesignTokens.spacingXs),
                Text(
                  detail.notes!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                ),
              ],
              const Gap(AppDesignTokens.spacing2xl),
              if (detail.canReschedule)
                OutlinedButton(
                  onPressed: () {
                    ref.read(bookingWizardProvider.notifier).startReschedule(
                          appointmentId: detail.id,
                          doctor: BookableDoctor(
                            id: detail.doctor.id,
                            name: detail.doctor.name,
                            specialty: detail.doctor.specialty,
                            avatarUrl: detail.doctor.avatarUrl,
                          ),
                        );
                    context.router.push(
                      BookAppointmentRoute(appointmentId: detail.id),
                    );
                  },
                  child: const Text('Reschedule'),
                ),
            ],
          ),
        );
        },
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Row(
      children: [
        Icon(icon, size: 18, color: colorScheme.onSurfaceVariant),
        const Gap(AppDesignTokens.spacingSm),
        Text(
          '$label: ',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}

class _DetailError extends StatelessWidget {
  const _DetailError({
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDesignTokens.spacing2xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 48, color: Theme.of(context).colorScheme.error),
            const Gap(AppDesignTokens.spacingMd),
            Text(message, textAlign: TextAlign.center),
            const Gap(AppDesignTokens.spacingMd),
            FilledButton(onPressed: onRetry, child: const Text('Retry')),
          ],
        ),
      ),
    );
  }
}
