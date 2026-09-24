import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imsh/app_router.gr.dart';

import '../../core/responsive.dart';
import '../../core/theme/app_design_tokens.dart';
import '../../core/theme/imsh_accent_colors.dart';
import '../../helper/date_formatter.dart';
import '../../models/appointment_model.dart';
import '../../providers/appointments_provider.dart';
import '../../services/appointment_service.dart';
import '../../shared/widgets/adaptive_date_picker.dart';
import '../../shared/widgets/imsh_app_bar.dart';
import '../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../shared/widgets/imsh_empty_state.dart';
import '../../shared/widgets/imsh_page_header.dart';
import '../../shared/widgets/imsh_solid_icon.dart';
import '../../shared/widgets/imsh_surface_card.dart';

@RoutePage()
class BookAppointmentScreen extends ConsumerStatefulWidget {
  const BookAppointmentScreen({
    super.key,
    @QueryParam('appointmentId') this.appointmentId,
  });

  final String? appointmentId;

  @override
  ConsumerState<BookAppointmentScreen> createState() =>
      _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends ConsumerState<BookAppointmentScreen> {
  final _reasonController = TextEditingController();
  bool _initialized = false;
  bool _submitting = false;

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wizard = ref.watch(bookingWizardProvider);
    final isReschedule = widget.appointmentId != null || wizard.isReschedule;

    if (!_initialized && widget.appointmentId != null && !wizard.isReschedule) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref
            .read(bookingWizardProvider.notifier)
            .startReschedule(appointmentId: widget.appointmentId!);
      });
      _initialized = true;
    }

    final steps = isReschedule
        ? const [
            _WizardStepMeta(
              label: 'Date',
              icon: Icons.calendar_today_outlined,
              color: ImshAccentColors.teal,
            ),
            _WizardStepMeta(
              label: 'Confirm',
              icon: Icons.check_circle_outline,
              color: ImshAccentColors.green,
            ),
          ]
        : const [
            _WizardStepMeta(
              label: 'Specialty',
              icon: Icons.medical_services_outlined,
              color: ImshAccentColors.blue,
            ),
            _WizardStepMeta(
              label: 'Date',
              icon: Icons.calendar_today_outlined,
              color: ImshAccentColors.teal,
            ),
            _WizardStepMeta(
              label: 'Visit type',
              icon: Icons.meeting_room_outlined,
              color: ImshAccentColors.purple,
            ),
            _WizardStepMeta(
              label: 'Confirm',
              icon: Icons.check_circle_outline,
              color: ImshAccentColors.green,
            ),
          ];

    final currentStep = wizard.step.clamp(0, steps.length - 1);
    final current = steps[currentStep];

    return Scaffold(
      appBar: ImshAppBar(
        title: Text(
          isReschedule ? 'Reschedule request' : 'Request appointment',
        ),
      ),
      body: Column(
        children: [
          ResponsiveBody(
            expand: false,
            bottomPadding: 0,
            builder: (context, bp) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ImshPageHeader(
                    title: current.label,
                    subtitle: isReschedule
                        ? 'Pick a preferred date for your request'
                        : 'Step ${currentStep + 1} of ${steps.length}',
                    icon: current.icon,
                    iconColor: current.color,
                  ),
                  const SizedBox(height: 12),
                  _StepIndicator(
                    steps: steps,
                    currentStep: currentStep,
                  ),
                ],
              );
            },
          ),
          Expanded(
            child: ResponsiveBody(
              expand: true,
              bottomPadding: 0,
              builder: (context, bp) {
                return _buildStepContent(wizard, isReschedule);
              },
            ),
          ),
          ResponsiveBody(
            expand: false,
            bottomPadding: 0,
            builder: (context, bp) {
              return SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _buildBottomBar(wizard, isReschedule, steps.length - 1),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStepContent(BookingWizardState wizard, bool isReschedule) {
    if (isReschedule) {
      return switch (wizard.step) {
        0 => _DateStep(
          selectedDate: wizard.selectedDate ?? DateTime.now(),
          onDateSelected: (date) {
            ref.read(bookingWizardProvider.notifier).selectDate(date);
          },
        ),
        _ => _ConfirmStep(
          wizard: wizard,
          isReschedule: true,
          reasonController: _reasonController,
          onReasonChanged: ref.read(bookingWizardProvider.notifier).setReason,
        ),
      };
    }

    return switch (wizard.step) {
      0 => _SpecialtyStep(
        onSelected: (specialty) {
          ref.read(bookingWizardProvider.notifier).selectSpecialty(specialty);
        },
      ),
      1 => _DateStep(
        selectedDate: wizard.selectedDate ?? DateTime.now(),
        onDateSelected: (date) {
          ref.read(bookingWizardProvider.notifier).selectDate(date);
        },
      ),
      2 => _VisitTypeStep(
        selected: wizard.visitType,
        onSelected: (type) {
          ref.read(bookingWizardProvider.notifier).selectVisitType(type);
        },
      ),
      _ => _ConfirmStep(
        wizard: wizard,
        isReschedule: false,
        reasonController: _reasonController,
        onReasonChanged: ref.read(bookingWizardProvider.notifier).setReason,
      ),
    };
  }

  Widget _buildBottomBar(
    BookingWizardState wizard,
    bool isReschedule,
    int maxStep,
  ) {
    final step = wizard.step;
    final isConfirmStep = step == maxStep;
    final canGoNext = _canProceed(wizard, step, isReschedule);

    return Row(
      children: [
        if (step > 0)
          OutlinedButton(
            onPressed: _submitting
                ? null
                : () => ref.read(bookingWizardProvider.notifier).previousStep(),
            child: const Text('Back'),
          ),
        if (step > 0) const SizedBox(width: 8),
        Expanded(
          child: FilledButton(
            onPressed: canGoNext && !_submitting
                ? () async {
                    if (isConfirmStep) {
                      await _submit(wizard, isReschedule);
                    } else {
                      if (!isReschedule &&
                          step == 1 &&
                          wizard.selectedDate == null) {
                        ref
                            .read(bookingWizardProvider.notifier)
                            .selectDate(DateTime.now());
                      }
                      ref.read(bookingWizardProvider.notifier).nextStep();
                    }
                  }
                : null,
            child: _submitting
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(isConfirmStep ? 'Submit request' : 'Continue'),
          ),
        ),
      ],
    );
  }

  bool _canProceed(BookingWizardState wizard, int step, bool isReschedule) {
    if (isReschedule) {
      return switch (step) {
        0 => wizard.selectedDate != null,
        1 => wizard.selectedDate != null,
        _ => false,
      };
    }
    return switch (step) {
      0 => wizard.specialty != null,
      1 => wizard.selectedDate != null,
      2 => wizard.visitType != null,
      3 =>
        wizard.specialty != null &&
            wizard.selectedDate != null &&
            wizard.visitType != null,
      _ => false,
    };
  }

  Future<void> _submit(BookingWizardState wizard, bool isReschedule) async {
    setState(() => _submitting = true);
    final reason = _reasonController.text.trim();

    try {
      if (isReschedule) {
        final date = wizard.selectedDate;
        final appointmentId = wizard.rescheduleAppointmentId;
        if (date == null || appointmentId == null) return;

        final scheduledAt = DateTime(date.year, date.month, date.day, 9);
        await ref
            .read(bookAppointmentProvider.notifier)
            .submit(
              request: CreateAppointmentRequest(
                specialty: wizard.specialty?.id ?? '',
                date: AppointmentService.formatPreferredDate(date),
                visitType: wizard.visitType ?? AppointmentVisitType.inPerson,
                reason: reason.isEmpty ? null : reason,
              ),
              appointmentId: appointmentId,
              updateRequest: UpdateAppointmentRequest(
                scheduledAt: scheduledAt,
                reason: reason.isEmpty ? null : reason,
              ),
            );
      } else {
        final specialty = wizard.specialty;
        final date = wizard.selectedDate;
        final visitType = wizard.visitType;
        if (specialty == null || date == null || visitType == null) return;

        await ref
            .read(bookAppointmentProvider.notifier)
            .submit(
              request: CreateAppointmentRequest(
                specialty: specialty.id,
                date: AppointmentService.formatPreferredDate(date),
                visitType: visitType,
                reason: reason.isEmpty ? null : reason,
              ),
            );
      }

      if (!mounted) return;

      ref.read(bookingWizardProvider.notifier).reset();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isReschedule
                ? 'Appointment request updated'
                : 'Appointment requested',
          ),
        ),
      );
      if (context.router.canPop()) {
        context.router.pop();
      } else {
        context.router.replace(const PatientShellRoute());
      }
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(appointmentErrorMessage(error))));
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }
}

class _WizardStepMeta {
  const _WizardStepMeta({
    required this.label,
    required this.icon,
    required this.color,
  });

  final String label;
  final IconData icon;
  final Color color;
}

class _StepIndicator extends StatelessWidget {
  const _StepIndicator({required this.steps, required this.currentStep});

  final List<_WizardStepMeta> steps;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Row(
      children: [
        for (var i = 0; i < steps.length; i++) ...[
          if (i > 0)
            Expanded(
              child: Container(
                height: 2,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                color: i <= currentStep
                    ? steps[i].color
                    : cs.outlineVariant,
              ),
            ),
          Column(
            children: [
              ImshSolidIcon(
                icon: i < currentStep ? Icons.check_rounded : steps[i].icon,
                color: i <= currentStep
                    ? steps[i].color
                    : cs.onSurfaceVariant,
                size: 28,
                iconSize: 14,
                radius: 8,
              ),
              const SizedBox(height: 4),
              Text(
                steps[i].label,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontWeight:
                      i == currentStep ? FontWeight.w700 : FontWeight.w500,
                  color: i == currentStep
                      ? cs.onSurface
                      : cs.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

class _SpecialtyStep extends ConsumerWidget {
  const _SpecialtyStep({required this.onSelected});

  final void Function(AppointmentSpecialty specialty) onSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final specialtiesAsync = ref.watch(appointmentSpecialtiesProvider);
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return specialtiesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text(appointmentErrorMessage(error))),
      data: (response) {
        if (response.data.isEmpty) {
          return const ImshEmptyState(
            message: 'No specialties available',
            icon: Icons.medical_services_outlined,
            iconColor: ImshAccentColors.blue,
          );
        }

        return ListView.separated(
          itemCount: response.data.length,
          separatorBuilder: (_, _) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final specialty = response.data[index];
            return ImshSurfaceCard(
              padding: const EdgeInsets.all(10),
              onTap: () => onSelected(specialty),
              child: Row(
                children: [
                  const ImshSolidIcon(
                    icon: Icons.medical_services_outlined,
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
                        ImshEllipsisText(
                          text: specialty.name,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        if (specialty.description != null) ...[
                          const SizedBox(height: 2),
                          ImshEllipsisText(
                            text: specialty.description!,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: cs.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _DateStep extends StatelessWidget {
  const _DateStep({required this.selectedDate, required this.onDateSelected});

  final DateTime selectedDate;
  final void Function(DateTime date) onDateSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return ListView(
      children: [
        ImshSectionHeader(
          title: 'Preferred date',
          icon: Icons.calendar_today_outlined,
          iconColor: ImshAccentColors.teal,
        ),
        const SizedBox(height: 8),
        Text(
          'The hospital will confirm a time after reviewing your request.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: cs.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 12),
        ImshSurfaceCard(
          padding: const EdgeInsets.all(12),
          onTap: () async {
            final picked = await showAdaptiveDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 90)),
            );
            if (picked != null) onDateSelected(picked);
          },
          child: Row(
            children: [
              const ImshSolidIcon(
                icon: Icons.event_outlined,
                color: ImshAccentColors.teal,
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
                      'Selected date',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: cs.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ImshEllipsisText(
                      text: DateFormatter.appointmentCardDate(selectedDate),
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.edit_calendar_outlined, color: cs.onSurfaceVariant),
            ],
          ),
        ),
      ],
    );
  }
}

class _VisitTypeStep extends StatelessWidget {
  const _VisitTypeStep({required this.selected, required this.onSelected});

  final AppointmentVisitType? selected;
  final void Function(AppointmentVisitType type) onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return ListView(
      children: [
        ImshSectionHeader(
          title: 'How would you like to visit?',
          icon: Icons.meeting_room_outlined,
          iconColor: ImshAccentColors.purple,
        ),
        const SizedBox(height: 12),
        for (final type in AppointmentVisitType.values) ...[
          ImshSurfaceCard(
            padding: const EdgeInsets.all(12),
            onTap: () => onSelected(type),
            child: Row(
              children: [
                ImshSolidIcon(
                  icon: type == AppointmentVisitType.telemedicine
                      ? Icons.videocam_outlined
                      : Icons.local_hospital_outlined,
                  color: type == AppointmentVisitType.telemedicine
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
                      ImshEllipsisText(
                        text: type.label,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      ImshEllipsisText(
                        text: type == AppointmentVisitType.telemedicine
                            ? 'Remote consultation by video'
                            : 'Visit the hospital in person',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                if (selected == type)
                  const ImshSolidIcon(
                    icon: Icons.check_rounded,
                    color: ImshAccentColors.green,
                    size: 28,
                    iconSize: 14,
                    radius: 8,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ],
    );
  }
}

class _ConfirmStep extends StatelessWidget {
  const _ConfirmStep({
    required this.wizard,
    required this.isReschedule,
    required this.reasonController,
    required this.onReasonChanged,
  });

  final BookingWizardState wizard;
  final bool isReschedule;
  final TextEditingController reasonController;
  final void Function(String reason) onReasonChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final date = wizard.selectedDate;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ImshSectionHeader(
            title: 'Review request',
            icon: Icons.check_circle_outline,
            iconColor: ImshAccentColors.green,
          ),
          const SizedBox(height: 8),
          ImshSurfaceCard(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isReschedule && wizard.specialty != null) ...[
                  _ConfirmRow(
                    icon: Icons.medical_services_outlined,
                    accent: ImshAccentColors.blue,
                    label: 'Specialty',
                    value: wizard.specialty!.name,
                  ),
                  const SizedBox(height: 10),
                ],
                _ConfirmRow(
                  icon: Icons.calendar_today_outlined,
                  accent: ImshAccentColors.teal,
                  label: 'Preferred date',
                  value: date == null
                      ? '—'
                      : DateFormatter.appointmentCardDate(date),
                ),
                if (!isReschedule && wizard.visitType != null) ...[
                  const SizedBox(height: 10),
                  _ConfirmRow(
                    icon: wizard.visitType == AppointmentVisitType.telemedicine
                        ? Icons.videocam_outlined
                        : Icons.local_hospital_outlined,
                    accent: ImshAccentColors.purple,
                    label: 'Visit type',
                    value: wizard.visitType!.label,
                  ),
                ],
                const SizedBox(height: 10),
                Text(
                  isReschedule
                      ? 'Your preferred date will be updated. Staff will confirm timing.'
                      : 'Submitted as Requested. A doctor will be assigned after review.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: reasonController,
            onChanged: onReasonChanged,
            decoration: const InputDecoration(
              labelText: 'Reason for visit (optional)',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}

class _ConfirmRow extends StatelessWidget {
  const _ConfirmRow({
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
