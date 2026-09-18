import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../core/theme/app_design_tokens.dart';
import '../../core/theme/context_extensions.dart';
import '../../helper/app_timezone.dart';
import '../../models/cycle_model.dart';
import '../../providers/cycle_provider.dart';
import '../../shared/widgets/imsh_app_bar.dart';
import '../../shared/widgets/imsh_surface_card.dart';
import 'widgets/cycle_day_sheet.dart';
import 'widgets/cycle_settings_sheet.dart';

@RoutePage()
class CycleTrackerScreen extends ConsumerStatefulWidget {
  const CycleTrackerScreen({super.key});

  @override
  ConsumerState<CycleTrackerScreen> createState() => _CycleTrackerScreenState();
}

class _CycleTrackerScreenState extends ConsumerState<CycleTrackerScreen> {
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    final now = AppTimezone.now();
    _focusedDay = DateTime(now.year, now.month, now.day);
  }

  CycleMonthKey get _monthKey =>
      CycleMonthKey(year: _focusedDay.year, month: _focusedDay.month);

  @override
  Widget build(BuildContext context) {
    final calendarAsync = ref.watch(cycleCalendarProvider(_monthKey));

    return Scaffold(
      appBar: ImshAppBar(
        title: const Text('Cycle tracker'),
        actions: [
          IconButton(
            tooltip: 'Cycle settings',
            onPressed: calendarAsync.maybeWhen(
              data: (calendar) =>
                  () => showCycleSettingsSheet(
                    context: context,
                    settings: calendar.settings,
                  ),
              orElse: () => null,
            ),
            icon: const Icon(Icons.tune_outlined),
          ),
        ],
      ),
      body: calendarAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => _CycleError(
          message: cycleErrorMessage(error),
          onRetry: () => ref.invalidate(cycleCalendarProvider(_monthKey)),
        ),
        data: (calendar) => RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(cycleCalendarProvider(_monthKey));
            await ref.read(cycleCalendarProvider(_monthKey).future);
          },
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(
              AppDesignTokens.containerPadding,
              AppDesignTokens.spacingMd,
              AppDesignTokens.containerPadding,
              AppDesignTokens.spacing2xl,
            ),
            children: [
              _CycleStatusCard(calendar: calendar),
              const Gap(AppDesignTokens.spacingLg),
              _CycleCalendar(
                focusedDay: _focusedDay,
                calendar: calendar,
                onPageChanged: (focused) {
                  setState(() => _focusedDay = cycleDateOnly(focused));
                },
                onDaySelected: (day) => showCycleDaySheet(
                  context: context,
                  ref: ref,
                  day: cycleDateOnly(day),
                  calendar: calendar,
                ),
              ),
              const Gap(AppDesignTokens.spacingMd),
              _CycleLegend(),
              const Gap(AppDesignTokens.spacingMd),
              Text(
                'Predictions are estimates based on your logged periods, not medical advice or contraception.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CycleStatusCard extends StatelessWidget {
  const _CycleStatusCard({required this.calendar});

  final CycleCalendarResponse calendar;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return ImshSurfaceCard(
      padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (calendar.pregnancyPaused)
            Padding(
              padding: const EdgeInsets.only(bottom: AppDesignTokens.spacingSm),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppDesignTokens.spacingSm),
                decoration: BoxDecoration(
                  color: context.imshTheme.warningContainer,
                  borderRadius: BorderRadius.circular(AppDesignTokens.radiusSm),
                ),
                child: Text(
                  'Predictions are paused while you have an ongoing pregnancy on file.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: context.imshTheme.onWarningContainer,
                  ),
                ),
              ),
            ),
          Text(
            calendar.headline,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const Gap(4),
          Text(
            calendar.configured
                ? 'Typical cycle ${calendar.settings.cycleLengthDays} days · period ${calendar.settings.periodLengthDays} days'
                : 'Log your last period to start tracking.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _CycleCalendar extends StatelessWidget {
  const _CycleCalendar({
    required this.focusedDay,
    required this.calendar,
    required this.onPageChanged,
    required this.onDaySelected,
  });

  final DateTime focusedDay;
  final CycleCalendarResponse calendar;
  final ValueChanged<DateTime> onPageChanged;
  final ValueChanged<DateTime> onDaySelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final logged = <String>{};
    for (final period in calendar.periods) {
      var cursor = cycleDateFromKey(period.startDate);
      final end = cycleDateFromKey(
        period.endDate ?? calendar.today ?? period.startDate,
      );
      while (!cursor.isAfter(end)) {
        logged.add(cycleDateKey(cursor));
        cursor = cursor.add(const Duration(days: 1));
      }
    }
    final predicted = calendar.predictedDays.toSet();

    return Material(
      color: colorScheme.surfaceContainerLowest,
      borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
          border: Border.all(color: colorScheme.outlineVariant),
        ),
        child: TableCalendar<String>(
          firstDay: DateTime(focusedDay.year - 3, 1, 1),
          lastDay: DateTime(focusedDay.year + 2, 12, 31),
          focusedDay: focusedDay,
          calendarFormat: CalendarFormat.month,
          startingDayOfWeek: StartingDayOfWeek.sunday,
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
          availableCalendarFormats: const {CalendarFormat.month: 'Month'},
          selectedDayPredicate: (_) => false,
          onDaySelected: (selected, focused) {
            onPageChanged(focused);
            onDaySelected(selected);
          },
          onPageChanged: onPageChanged,
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focused) => _CycleDayCell(
              day: day,
              logged: logged.contains(cycleDateKey(day)),
              predicted: predicted.contains(cycleDateKey(day)),
            ),
            todayBuilder: (context, day, focused) => _CycleDayCell(
              day: day,
              logged: logged.contains(cycleDateKey(day)),
              predicted: predicted.contains(cycleDateKey(day)),
              isToday: true,
            ),
            outsideBuilder: (context, day, focused) => _CycleDayCell(
              day: day,
              logged: false,
              predicted: false,
              outside: true,
            ),
          ),
        ),
      ),
    );
  }
}

class _CycleDayCell extends StatelessWidget {
  const _CycleDayCell({
    required this.day,
    required this.logged,
    required this.predicted,
    this.isToday = false,
    this.outside = false,
  });

  final DateTime day;
  final bool logged;
  final bool predicted;
  final bool isToday;
  final bool outside;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final theme = Theme.of(context);
    Color? fill;
    Color? border;
    var textColor = outside
        ? colorScheme.onSurface.withValues(alpha: 0.35)
        : colorScheme.onSurface;

    if (logged) {
      fill = colorScheme.primary;
      textColor = colorScheme.onPrimary;
    } else if (predicted) {
      border = colorScheme.primary;
      textColor = colorScheme.primary;
    } else if (isToday) {
      border = colorScheme.outline;
    }

    return Center(
      child: Container(
        width: 36,
        height: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: fill,
          shape: BoxShape.circle,
          border: border == null ? null : Border.all(color: border),
        ),
        child: Text(
          '${day.day}',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: textColor,
            fontWeight: logged || isToday ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _CycleLegend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return Row(
      children: [
        _LegendDot(color: colorScheme.primary, filled: true, label: 'Logged'),
        const Gap(AppDesignTokens.spacingMd),
        _LegendDot(
          color: colorScheme.primary,
          filled: false,
          label: 'Predicted',
        ),
      ],
    );
  }
}

class _LegendDot extends StatelessWidget {
  const _LegendDot({
    required this.color,
    required this.filled,
    required this.label,
  });

  final Color color;
  final bool filled;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: filled ? color : null,
            shape: BoxShape.circle,
            border: Border.all(color: color),
          ),
        ),
        const SizedBox(width: 6),
        Text(label, style: Theme.of(context).textTheme.labelMedium),
      ],
    );
  }
}

class _CycleError extends StatelessWidget {
  const _CycleError({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, textAlign: TextAlign.center),
            const Gap(AppDesignTokens.spacingMd),
            FilledButton(onPressed: onRetry, child: const Text('Try again')),
          ],
        ),
      ),
    );
  }
}
