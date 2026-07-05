import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';
import 'package:intl/intl.dart';

import '../../core/theme/app_design_tokens.dart';
import '../../core/theme/context_extensions.dart';
import '../../helper/date_formatter.dart';
import '../../models/appointment_model.dart';
import '../../providers/appointments_provider.dart';
import '../../shared/widgets/imsh_app_bar.dart';
import 'widgets/next_appointment_card.dart';

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
        ref.read(appointmentDetailProvider(widget.appointmentId!).future).then(
          (detail) {
            if (!mounted) return;
            ref.read(bookingWizardProvider.notifier).startReschedule(
                  appointmentId: detail.id,
                  doctor: BookableDoctor(
                    id: detail.doctor.id,
                    name: detail.doctor.name,
                    specialty: detail.doctor.specialty,
                    avatarUrl: detail.doctor.avatarUrl,
                  ),
                );
          },
        );
      });
      _initialized = true;
    }

    final stepLabels = isReschedule
        ? const ['Doctor', 'Date & Time', 'Confirm']
        : const ['Specialty', 'Doctor', 'Date & Time', 'Confirm'];

    final displayStep =
        isReschedule ? (wizard.step - 2).clamp(0, stepLabels.length - 1) : wizard.step;

    return Scaffold(
      appBar: ImshAppBar(
        title: Text(isReschedule ? 'Reschedule' : 'Book Appointment'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
            child: _StepIndicator(
              labels: stepLabels,
              currentStep: displayStep.clamp(0, stepLabels.length - 1),
            ),
          ),
          Expanded(
            child: _buildStepContent(wizard, isReschedule),
          ),
          _buildBottomBar(wizard, isReschedule),
        ],
      ),
    );
  }

  Widget _buildStepContent(BookingWizardState wizard, bool isReschedule) {
    if (isReschedule) {
      return switch (wizard.step) {
        2 => _buildDateTimeStep(wizard),
        3 => _buildConfirmStep(wizard),
        _ => _buildDateTimeStep(wizard),
      };
    }

    return switch (wizard.step) {
      0 => _SpecialtyStep(
          onSelected: (specialty) {
            ref.read(bookingWizardProvider.notifier).selectSpecialty(specialty);
          },
        ),
      1 => _buildDoctorStep(wizard),
      2 => _buildDateTimeStep(wizard),
      3 => _buildConfirmStep(wizard),
      _ => const SizedBox.shrink(),
    };
  }

  Widget _buildDoctorStep(BookingWizardState wizard) {
    final specialtyId = wizard.specialty?.id;
    if (specialtyId == null) {
      return const Center(child: Text('Select a specialty first'));
    }

    return _DoctorStep(
      specialtyId: specialtyId,
      selectedDoctorId: wizard.doctor?.id,
      onSelected: (doctor) {
        ref.read(bookingWizardProvider.notifier).selectDoctor(doctor);
      },
    );
  }

  Widget _buildDateTimeStep(BookingWizardState wizard) {
    final doctor = wizard.doctor;
    if (doctor == null) {
      return const Center(child: Text('Select a doctor first'));
    }

    return _DateTimeStep(
      doctorId: doctor.id,
      selectedDate: wizard.selectedDate ?? DateTime.now(),
      selectedSlot: wizard.selectedSlot,
      onDateSelected: (date) {
        ref.read(bookingWizardProvider.notifier).selectDate(date);
      },
      onSlotSelected: (slot) {
        ref.read(bookingWizardProvider.notifier).selectSlot(slot);
      },
    );
  }

  Widget _buildConfirmStep(BookingWizardState wizard) {
    return _ConfirmStep(
      wizard: wizard,
      reasonController: _reasonController,
      onReasonChanged: ref.read(bookingWizardProvider.notifier).setReason,
    );
  }

  Widget _buildBottomBar(BookingWizardState wizard, bool isReschedule) {
    final step = wizard.step;
    final minStep = isReschedule ? 2 : 0;
    final maxStep = isReschedule ? 3 : 3;
    final isConfirmStep = step == maxStep;
    final canGoNext = _canProceed(wizard, step);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
        child: Row(
          children: [
            if (step > minStep)
              OutlinedButton(
                onPressed: () =>
                    ref.read(bookingWizardProvider.notifier).previousStep(),
                child: const Text('Back'),
              ),
            if (step > minStep) const Gap(AppDesignTokens.spacingSm),
            Expanded(
              child: FilledButton(
                onPressed: canGoNext
                    ? () async {
                        if (isConfirmStep) {
                          await _submit(wizard);
                        } else {
                          ref.read(bookingWizardProvider.notifier).nextStep();
                        }
                      }
                    : null,
                child: Text(isConfirmStep ? 'Confirm' : 'Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _canProceed(BookingWizardState wizard, int step) {
    if (wizard.isReschedule) {
      return switch (step) {
        2 => wizard.selectedSlot != null,
        3 => wizard.selectedSlot != null,
        _ => false,
      };
    }
    return switch (step) {
      0 => wizard.specialty != null,
      1 => wizard.doctor != null,
      2 => wizard.selectedSlot != null,
      3 => wizard.selectedSlot != null,
      _ => false,
    };
  }

  Future<void> _submit(BookingWizardState wizard) async {
    final doctor = wizard.doctor;
    final slot = wizard.selectedSlot;
    if (doctor == null || slot == null) return;

    final reason = _reasonController.text.trim();

    try {
      await ref.read(bookAppointmentProvider.notifier).submit(
            request: CreateAppointmentRequest(
              doctorId: doctor.id,
              scheduledAt: slot.scheduledAt,
              reason: reason.isEmpty ? null : reason,
            ),
            appointmentId: wizard.rescheduleAppointmentId,
          );

      if (!mounted) return;

      ref.read(bookingWizardProvider.notifier).reset();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            wizard.isReschedule
                ? 'Appointment rescheduled'
                : 'Appointment booked',
          ),
        ),
      );
      context.router.popUntilRouteWithName(AppointmentsRoute.name);
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(appointmentErrorMessage(error))),
      );
    }
  }
}

class _StepIndicator extends StatelessWidget {
  const _StepIndicator({
    required this.labels,
    required this.currentStep,
  });

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
                      fontWeight:
                          i == currentStep ? FontWeight.w700 : FontWeight.w400,
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
      error: (error, _) => Center(
        child: Text(appointmentErrorMessage(error)),
      ),
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
                borderRadius:
                    BorderRadius.circular(AppDesignTokens.radiusMd),
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

class _DoctorStep extends ConsumerWidget {
  const _DoctorStep({
    required this.specialtyId,
    required this.selectedDoctorId,
    required this.onSelected,
  });

  final String? specialtyId;
  final String? selectedDoctorId;
  final void Function(BookableDoctor doctor) onSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (specialtyId == null) {
      return const Center(child: Text('Select a specialty first'));
    }

    final doctorsAsync = ref.watch(bookableDoctorsProvider(specialtyId!));

    return doctorsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(
        child: Text(appointmentErrorMessage(error)),
      ),
      data: (response) {
        final colorScheme = context.colorScheme;

        if (response.data.isEmpty) {
          return const Center(child: Text('No doctors available'));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
          itemCount: response.data.length,
          separatorBuilder: (_, __) => const Gap(AppDesignTokens.spacingSm),
          itemBuilder: (context, index) {
            final doctor = response.data[index];
            final selected = doctor.id == selectedDoctorId;

            return ListTile(
              tileColor: selected
                  ? context.imshTheme.primaryHighlight
                  : colorScheme.surfaceContainerLowest,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(AppDesignTokens.radiusMd),
                side: BorderSide(
                  color: selected
                      ? colorScheme.primary
                      : colorScheme.outlineVariant,
                ),
              ),
              leading: DoctorAvatar(
                name: doctor.name,
                avatarUrl: doctor.avatarUrl,
              ),
              title: Text(
                doctor.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(doctor.specialty),
              onTap: () => onSelected(doctor),
            );
          },
        );
      },
    );
  }
}

class _DateTimeStep extends ConsumerWidget {
  const _DateTimeStep({
    required this.doctorId,
    required this.selectedDate,
    required this.selectedSlot,
    required this.onDateSelected,
    required this.onSlotSelected,
  });

  final String doctorId;
  final DateTime selectedDate;
  final AvailabilitySlot? selectedSlot;
  final void Function(DateTime date) onDateSelected;
  final void Function(AvailabilitySlot slot) onSlotSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateKey = DateFormat('yyyy-MM-dd').format(selectedDate);
    final availabilityAsync = ref.watch(
      appointmentAvailabilityProvider(
        (doctorId: doctorId, date: dateKey),
      ),
    );

    return ListView(
      padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
      children: [
        Text(
          'Select date',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        const Gap(AppDesignTokens.spacingSm),
        OutlinedButton.icon(
          onPressed: () async {
            final picked = await showDatePicker(
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
        const Gap(AppDesignTokens.spacingLg),
        Text(
          'Available times',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        const Gap(AppDesignTokens.spacingSm),
        availabilityAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Text(appointmentErrorMessage(error)),
          data: (response) {
            final availableSlots =
                response.slots.where((slot) => slot.available).toList();

            if (availableSlots.isEmpty) {
              return const Text('No slots available for this date.');
            }

            return Wrap(
              spacing: AppDesignTokens.spacingSm,
              runSpacing: AppDesignTokens.spacingSm,
              children: availableSlots.map((slot) {
                final selected = selectedSlot?.scheduledAt == slot.scheduledAt;
                return ChoiceChip(
                  label: Text(
                    DateFormatter.appointmentCardTime(slot.scheduledAt),
                  ),
                  selected: selected,
                  onSelected: (_) => onSlotSelected(slot),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}

class _ConfirmStep extends StatelessWidget {
  const _ConfirmStep({
    required this.wizard,
    required this.reasonController,
    required this.onReasonChanged,
  });

  final BookingWizardState wizard;
  final TextEditingController reasonController;
  final void Function(String reason) onReasonChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final doctor = wizard.doctor;
    final slot = wizard.selectedSlot;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (doctor != null) ...[
            Row(
              children: [
                DoctorAvatar(
                  name: doctor.name,
                  avatarUrl: doctor.avatarUrl,
                  size: 56,
                ),
                const Gap(AppDesignTokens.spacingMd),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.name,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      Text(
                        doctor.specialty,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: colorScheme.primary,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(AppDesignTokens.spacingLg),
          ],
          if (slot != null) ...[
            Text(
              DateFormatter.appointmentCardDate(slot.scheduledAt),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            Text(
              DateFormatter.appointmentCardTime(slot.scheduledAt),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
            ),
            const Gap(AppDesignTokens.spacingLg),
          ],
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
