import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/app_timezone.dart';
import '../../../models/medication_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/medications_provider.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_empty_state.dart';
import '../../../shared/widgets/imsh_semantic_badge.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';
import 'dose_actions.dart';

String _dayKey(DateTime day) =>
    '${day.year}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}';

class MedicationsCalendarView extends ConsumerStatefulWidget {
  const MedicationsCalendarView({super.key});

  @override
  ConsumerState<MedicationsCalendarView> createState() =>
      _MedicationsCalendarViewState();
}

class _MedicationsCalendarViewState
    extends ConsumerState<MedicationsCalendarView> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _focusedDay = DateTime(now.year, now.month, now.day);
    _selectedDay = _focusedDay;
  }

  ({DateTime from, DateTime to}) _monthRange(DateTime focused) {
    final first = DateTime(focused.year, focused.month, 1);
    final last = DateTime(focused.year, focused.month + 1, 0, 23, 59, 59);
    return (from: first.toUtc(), to: last.toUtc());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final range = _monthRange(_focusedDay);
    final calendarAsync = ref.watch(medicationCalendarProvider(range));

    return calendarAsync.when(
      loading: () => const Padding(
        padding: EdgeInsets.all(AppDesignTokens.spacing2xl),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (error, _) => Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(authFlowErrorMessage(error)),
            TextButton(
              onPressed: () =>
                  ref.invalidate(medicationCalendarProvider(range)),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
      data: (response) {
        final byDay = <String, List<MedicationScheduleEntry>>{};
        for (final dose in response.doses) {
          final local = AppTimezone.toLocal(dose.scheduledAt);
          final key = _dayKey(local);
          (byDay[key] ??= []).add(dose);
        }
        final selectedKey = _dayKey(_selectedDay);
        final selectedDoses = [...(byDay[selectedKey] ?? [])]
          ..sort((a, b) => a.scheduledAt.compareTo(b.scheduledAt));

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImshSurfaceCard(
              padding: EdgeInsets.zero,
              child: TableCalendar<MedicationScheduleEntry>(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2035, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
                calendarFormat: CalendarFormat.month,
                startingDayOfWeek: StartingDayOfWeek.monday,
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                availableCalendarFormats: const {
                  CalendarFormat.month: 'Month',
                },
                eventLoader: (day) => byDay[_dayKey(day)] ?? const [],
                onDaySelected: (selected, focused) {
                  setState(() {
                    _selectedDay = DateTime(
                      selected.year,
                      selected.month,
                      selected.day,
                    );
                    _focusedDay = focused;
                  });
                },
                onPageChanged: (focused) {
                  setState(() => _focusedDay = focused);
                },
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, day, events) {
                    if (events.isEmpty) return null;
                    final hasMissed = events.any(
                      (e) => e.status == MedicationDoseStatus.missed,
                    );
                    final allTaken = events.every(
                      (e) => e.status == MedicationDoseStatus.taken,
                    );
                    return Positioned(
                      bottom: 4,
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: hasMissed
                              ? colorScheme.error
                              : allTaken
                                  ? ImshAccentColors.green
                                  : ImshAccentColors.teal,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Gap(12),
            ImshSectionHeader(
              title: 'Doses on ${DateFormat.MMMd().format(_selectedDay)}',
              icon: Icons.medication_outlined,
              iconColor: ImshAccentColors.teal,
            ),
            const Gap(10),
            if (selectedDoses.isEmpty)
              const ImshEmptyState(
                message: 'No doses scheduled for this day.',
                icon: Icons.event_busy_outlined,
                iconColor: ImshAccentColors.teal,
              )
            else
              for (final dose in selectedDoses) _CalendarDoseTile(dose: dose),
          ],
        );
      },
    );
  }
}

class _CalendarDoseTile extends StatelessWidget {
  const _CalendarDoseTile({required this.dose});

  final MedicationScheduleEntry dose;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isMissed = dose.status == MedicationDoseStatus.missed;
    final isTaken = dose.status == MedicationDoseStatus.taken;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ImshSurfaceCard(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          children: [
            ImshSolidIcon(
              icon: dose.timeOfDay.icon,
              color: isMissed
                  ? ImshAccentColors.amber
                  : isTaken
                      ? ImshAccentColors.green
                      : ImshAccentColors.teal,
              size: 32,
              iconSize: 16,
              radius: 8,
            ),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImshEllipsisText(
                    text: '${dose.drugName} ${dose.dosage}',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      decoration: isTaken ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  Text(
                    formatDoseTime(dose.scheduledAt),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            ImshEllipsisChip(
              label: dose.status.label,
              tone: isMissed
                  ? ImshSemanticTone.error
                  : isTaken
                      ? ImshSemanticTone.success
                      : ImshSemanticTone.info,
              maxWidth: 90,
            ),
            DoseTakenButton(
              doseId: dose.id,
              status: dose.status,
              scheduledAt: dose.scheduledAt,
            ),
          ],
        ),
      ),
    );
  }
}
