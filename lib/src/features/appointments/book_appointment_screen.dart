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
import '../../services/appointment_service.dart';
import '../../shared/widgets/adaptive_date_picker.dart';
import '../../shared/widgets/imsh_app_bar.dart';

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

    final stepLabels = isReschedule
        ? const ['Date', 'Confirm']
        : const ['Specialty', 'Date', 'Visit type', 'Confirm'];

    return Scaffold(
      appBar: ImshAppBar(
        title: Text(
          isReschedule ? 'Reschedule request' : 'Request appointment',
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
            child: _StepIndicator(
              labels: stepLabels,
              currentStep: wizard.step.clamp(0, stepLabels.length - 1),
            ),
          ),
          Expanded(child: _buildStepContent(wizard, isReschedule)),
          _buildBottomBar(wizard, isReschedule, stepLabels.length - 1),
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

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
        child: Row(
          children: [
            if (step > 0)
              OutlinedButton(
                onPressed: _submitting
                    ? null
                    : () => ref
                          .read(bookingWizardProvider.notifier)
                          .previousStep(),
                child: const Text('Back'),
              ),
            if (step > 0) const Gap(AppDesignTokens.spacingSm),
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
        ),
      ),
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

class _StepIndicator extends StatelessWidget {
  const _StepIndicator({required this.labels, required this.currentStep});

  final List<String> labels;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Row(
      children: [
        for (var i = 0; i < labels.length; i++) ...[
          if (i > 0)
            Expanded(
              child: Container(
                height: 2,
                color: i <= currentStep
                    ? colorScheme.primary
                    : colorScheme.outlineVariant,
              ),
            ),
          Column(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: i <= currentStep
                    ? colorScheme.primary
                    : colorScheme.surfaceContainerHigh,
                child: Text(
                  '${i + 1}',
                  style: TextStyle(
                    color: i <= currentStep
                        ? colorScheme.onPrimary
                        : colorScheme.onSurfaceVariant,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Gap(4),
              Text(
                labels[i],
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontWeight: i == currentStep
                      ? FontWeight.w700
                      : FontWeight.w400,
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

    return specialtiesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text(appointmentErrorMessage(error))),
      data: (response) {
        final colorScheme = context.colorScheme;

        if (response.data.isEmpty) {
          return const Center(child: Text('No specialties available'));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
          itemCount: response.data.length,
          separatorBuilder: (_, __) => const Gap(AppDesignTokens.spacingSm),
          itemBuilder: (context, index) {
            final specialty = response.data[index];
            return ListTile(
              tileColor: colorScheme.surfaceContainerLowest,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
                side: BorderSide(color: colorScheme.outlineVariant),
              ),
              title: Text(
                specialty.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: specialty.description != null
                  ? Text(specialty.description!)
                  : null,
              trailing: const Icon(Icons.chevron_right),
              onTap: () => onSelected(specialty),
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
    return ListView(
      padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
      children: [
        Text(
          'Preferred date',
          style: Theme.of(
            context,
          ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
        ),
        const Gap(AppDesignTokens.spacingXs),
        Text(
          'The hospital will confirm a time after reviewing your request.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        const Gap(AppDesignTokens.spacingLg),
        OutlinedButton.icon(
          onPressed: () async {
            final picked = await showAdaptiveDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 90)),
            );
            if (picked != null) onDateSelected(picked);
          },
          icon: const Icon(Icons.calendar_today_outlined),
          label: Text(DateFormatter.appointmentCardDate(selectedDate)),
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
    final colorScheme = context.colorScheme;

    return ListView(
      padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
      children: [
        Text(
          'How would you like to visit?',
          style: Theme.of(
            context,
          ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
        ),
        const Gap(AppDesignTokens.spacingMd),
        for (final type in AppointmentVisitType.values) ...[
          ListTile(
            tileColor: selected == type
                ? context.imshTheme.primaryHighlight
                : colorScheme.surfaceContainerLowest,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
              side: BorderSide(
                color: selected == type
                    ? colorScheme.primary
                    : colorScheme.outlineVariant,
              ),
            ),
            leading: Icon(
              type == AppointmentVisitType.telemedicine
                  ? Icons.videocam_outlined
                  : Icons.local_hospital_outlined,
              color: colorScheme.primary,
            ),
            title: Text(
              type.label,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              type == AppointmentVisitType.telemedicine
                  ? 'Remote consultation by video'
                  : 'Visit the hospital in person',
            ),
            onTap: () => onSelected(type),
          ),
          const Gap(AppDesignTokens.spacingSm),
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
    final colorScheme = context.colorScheme;
    final date = wizard.selectedDate;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
              border: Border.all(color: colorScheme.outlineVariant),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isReschedule && wizard.specialty != null) ...[
                  Text(
                    wizard.specialty!.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Gap(AppDesignTokens.spacingSm),
                ],
                if (date != null)
                  Text(
                    DateFormatter.appointmentCardDate(date),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                if (!isReschedule && wizard.visitType != null) ...[
                  const Gap(AppDesignTokens.spacingXs),
                  Text(
                    wizard.visitType!.label,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
                const Gap(AppDesignTokens.spacingSm),
                Text(
                  isReschedule
                      ? 'Your preferred date will be updated. Staff will confirm timing.'
                      : 'Submitted as Requested. A doctor will be assigned after review.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const Gap(AppDesignTokens.spacingLg),
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
