import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/app_timezone.dart';
import '../../../models/medication_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/medications_provider.dart';
import '../../../shared/widgets/adaptive_date_picker.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';

class ScheduleStartBanner extends ConsumerWidget {
  const ScheduleStartBanner({
    super.key,
    required this.prescriptions,
  });

  final List<ActivePrescriptionSummary> prescriptions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pending =
        prescriptions.where((p) => p.needsScheduleStart).toList();
    if (pending.isEmpty) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final notifier = ref.watch(scheduleConfirmProvider.notifier);

    return Column(
      children: [
        for (final rx in pending)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ImshSurfaceCard(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const ImshSolidIcon(
                        icon: Icons.event_available_outlined,
                        color: ImshAccentColors.teal,
                        size: 30,
                        iconSize: 16,
                        radius: 8,
                      ),
                      const Gap(8),
                      Expanded(
                        child: Text(
                          'Confirm schedule for ${rx.displayName}',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(6),
                  Text(
                    'Start reminders now, or choose a later start if your doctor asked you to wait.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () async {
                            final picked = await showAdaptiveDatePicker(
                              context: context,
                              initialDate:
                                  rx.scheduleStartAt ?? DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 90)),
                            );
                            if (picked == null || !context.mounted) return;

                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(
                                rx.scheduleStartAt ?? DateTime.now(),
                              ),
                            );
                            if (time == null || !context.mounted) return;

                            final startAt = DateTime(
                              picked.year,
                              picked.month,
                              picked.day,
                              time.hour,
                              time.minute,
                            );
                            try {
                              await notifier.setStart(rx.id, startAt);
                            } catch (error) {
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(authFlowErrorMessage(error)),
                                ),
                              );
                            }
                          },
                          child: const Text('Start later'),
                        ),
                      ),
                      const Gap(8),
                      Expanded(
                        child: FilledButton(
                          onPressed: () async {
                            try {
                              await notifier.confirm(rx.id);
                            } catch (error) {
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(authFlowErrorMessage(error)),
                                ),
                              );
                            }
                          },
                          child: const Text('Start now'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class DoseTakenButton extends ConsumerWidget {
  const DoseTakenButton({
    super.key,
    required this.doseId,
    required this.status,
    required this.scheduledAt,
  });

  final String doseId;
  final MedicationDoseStatus status;
  final DateTime scheduledAt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (status != MedicationDoseStatus.upcoming &&
        status != MedicationDoseStatus.missed) {
      return const SizedBox.shrink();
    }

    final now = DateTime.now();
    final localScheduled = AppTimezone.toLocal(scheduledAt);
    final isDue = !localScheduled.isAfter(now.add(const Duration(minutes: 5)));
    if (!isDue && status == MedicationDoseStatus.upcoming) {
      return const SizedBox.shrink();
    }

    final isMarking = ref.watch(markDoseTakenProvider).maybeWhen(
          data: (inFlight) => inFlight.contains(doseId),
          orElse: () => false,
        );
    final notifier = ref.read(markDoseTakenProvider.notifier);

    return IconButton(
      tooltip: isMarking ? 'Saving…' : 'Mark taken',
      onPressed: isMarking
          ? null
          : () async {
              try {
                await notifier.markTaken(doseId);
              } catch (error) {
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(authFlowErrorMessage(error))),
                );
              }
            },
      icon: isMarking
          ? const SizedBox(
              width: 28,
              height: 28,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            )
          : const ImshSolidIcon(
              icon: Icons.check_circle_outline,
              color: ImshAccentColors.green,
              size: 32,
              iconSize: 16,
              radius: 8,
            ),
    );
  }
}

String formatDoseTime(DateTime date) {
  return DateFormat('h:mm a').format(AppTimezone.toLocal(date));
}

String formatDoseDateTime(DateTime date) {
  return DateFormat('EEE, MMM d · h:mm a').format(AppTimezone.toLocal(date));
}
