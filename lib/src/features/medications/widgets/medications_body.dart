import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/responsive.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../models/medication_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/medications_provider.dart';
import '../../../shared/widgets/imsh_error_panel.dart';
import '../../../shared/widgets/imsh_kpi_tile.dart';
import 'active_prescriptions_section.dart';
import 'dose_actions.dart';
import 'medications_by_drug_view.dart';
import 'medications_calendar_view.dart';
import 'medications_page_header.dart';
import 'next_dose_carousel.dart';
import 'today_schedule_section.dart';

class MedicationsBody extends ConsumerWidget {
  const MedicationsBody({super.key});

  static const _sectionGap = 12.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(medicationsDashboardProvider);
    final viewMode = ref.watch(medicationsViewModeProvider);

    return dashboardAsync.when(
      loading: () => const _MedicationsSkeleton(),
      error: (error, _) => ImshErrorPanel(
        message: authFlowErrorMessage(error),
        onRetry: () => ref.invalidate(medicationsDashboardProvider),
      ),
      data: (dashboard) => RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(medicationsDashboardProvider);
          ref.invalidate(medicationCalendarProvider);
          await ref.read(medicationsDashboardProvider.future);
        },
        child: ResponsiveBody(
          expand: false,
          builder: (context, bp) {
            final useSnap = bp.maxWidth < 520;
            final dueToday = _dueTodayCount(dashboard.todaySchedule);
            final takenToday = dashboard.todaySchedule
                .where((e) => e.status == MedicationDoseStatus.taken)
                .length;
            final activeCount = dashboard.activePrescriptions.length;

            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MedicationsPageHeader(
                    trailing: TextButton(
                      onPressed: () => context.router
                          .push(const MedicationsHistoryRoute()),
                      child: const Text('History'),
                    ),
                  ),
                  const Gap(_sectionGap),
                  ImshKpiStrip(
                    useSnapStrip: useSnap,
                    items: [
                      ImshKpiItem(
                        label: 'Due today',
                        value: dueToday > 0 ? '$dueToday' : '—',
                        caption: dueToday > 0
                            ? 'Still to take'
                            : 'Nothing pending',
                        icon: Icons.schedule_outlined,
                        accent: ImshAccentColors.teal,
                      ),
                      ImshKpiItem(
                        label: 'Taken today',
                        value: takenToday > 0 ? '$takenToday' : '—',
                        caption: 'Marked taken',
                        icon: Icons.check_circle_outline,
                        accent: ImshAccentColors.green,
                      ),
                      ImshKpiItem(
                        label: 'Active Rx',
                        value: activeCount > 0 ? '$activeCount' : '—',
                        caption: 'Prescriptions',
                        icon: Icons.medication_outlined,
                        accent: ImshAccentColors.blue,
                      ),
                    ],
                  ),
                  const Gap(10),
                  ScheduleStartBanner(
                    prescriptions: dashboard.activePrescriptions,
                  ),
                  if (dashboard.nextDoses.isNotEmpty) ...[
                    NextDoseCarousel(doses: dashboard.nextDoses),
                    const Gap(_sectionGap),
                  ],
                  SegmentedButton<MedicationsViewMode>(
                    segments: const [
                      ButtonSegment(
                        value: MedicationsViewMode.calendar,
                        label: Text('Calendar'),
                        icon: Icon(Icons.calendar_month_outlined),
                      ),
                      ButtonSegment(
                        value: MedicationsViewMode.byDrug,
                        label: Text('By drug'),
                        icon: Icon(Icons.medication_outlined),
                      ),
                    ],
                    selected: {viewMode},
                    onSelectionChanged: (next) {
                      ref
                          .read(medicationsViewModeProvider.notifier)
                          .setMode(next.first);
                    },
                  ),
                  const Gap(_sectionGap),
                  if (viewMode == MedicationsViewMode.calendar)
                    const MedicationsCalendarView()
                  else
                    MedicationsByDrugView(
                      prescriptions: dashboard.activePrescriptions,
                    ),
                  if (viewMode == MedicationsViewMode.calendar &&
                      dashboard.todaySchedule.isNotEmpty) ...[
                    const Gap(_sectionGap),
                    TodayScheduleSection(
                      schedule: dashboard.todaySchedule,
                    ),
                  ],
                  if (viewMode == MedicationsViewMode.calendar) ...[
                    const Gap(_sectionGap),
                    ActivePrescriptionsSection(
                      prescriptions: dashboard.activePrescriptions,
                    ),
                  ],
                  const Gap(_sectionGap),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  int _dueTodayCount(List<MedicationScheduleEntry> schedule) {
    return schedule
        .where(
          (e) =>
              e.status == MedicationDoseStatus.upcoming ||
              e.status == MedicationDoseStatus.missed,
        )
        .length;
  }
}

class _MedicationsSkeleton extends StatelessWidget {
  const _MedicationsSkeleton();

  static final _placeholderDose = MedicationDoseSummary(
    id: 'skeleton',
    prescriptionItemId: 'skeleton',
    drugName: 'Medication Name',
    dosage: '10mg',
    instructions: 'Take 1 tablet with water',
    scheduledAt: DateTime.now(),
    status: MedicationDoseStatus.upcoming,
  );

  static final _placeholderSchedule = MedicationScheduleEntry(
    id: 'skeleton-schedule',
    prescriptionItemId: 'skeleton',
    timeOfDay: MedicationTimeOfDay.morning,
    drugName: 'Medication',
    dosage: '10mg',
    scheduledAt: DateTime.now(),
    status: MedicationDoseStatus.taken,
  );

  static final _placeholderPrescription = ActivePrescriptionSummary(
    id: 'skeleton-rx',
    displayName: 'Medication 10mg',
    frequencyLabel: '1 tablet daily',
    daysRemaining: 30,
    refillsRemaining: 3,
    supplyProgress: 0.5,
    supplyStatus: PrescriptionSupplyStatus.healthy,
  );

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ResponsiveBody(
        expand: false,
        builder: (context, bp) => SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const MedicationsPageHeader(),
              const Gap(12),
              NextDoseCarousel(doses: [_placeholderDose, _placeholderDose]),
              const Gap(12),
              TodayScheduleSection(
                schedule: [
                  _placeholderSchedule,
                  _placeholderSchedule,
                  _placeholderSchedule,
                ],
              ),
              const Gap(12),
              ActivePrescriptionsSection(
                prescriptions: [
                  _placeholderPrescription,
                  _placeholderPrescription,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
