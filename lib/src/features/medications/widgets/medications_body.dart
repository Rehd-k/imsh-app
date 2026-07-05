import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../models/medication_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/medications_provider.dart';
import '../../../shared/widgets/imsh_page_header.dart';
import 'active_prescriptions_section.dart';
import 'next_dose_carousel.dart';
import 'today_schedule_section.dart';

class MedicationsBody extends ConsumerWidget {
  const MedicationsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(medicationsDashboardProvider);

    return dashboardAsync.when(
      loading: () => const _MedicationsSkeleton(),
      error: (error, _) => _MedicationsError(
        message: authFlowErrorMessage(error),
        onRetry: () => ref.invalidate(medicationsDashboardProvider),
      ),
      data: (dashboard) => RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(medicationsDashboardProvider);
          await ref.read(medicationsDashboardProvider.future);
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const ImshPageHeader(
                      title: 'Medications',
                      subtitle: 'Manage your prescriptions and daily schedule.',
                    ),
                    if (dashboard.nextDoses.isNotEmpty) ...[
                      const Gap(AppDesignTokens.spacingLg),
                      NextDoseCarousel(doses: dashboard.nextDoses),
                    ],
                    if (dashboard.todaySchedule.isNotEmpty) ...[
                      const Gap(AppDesignTokens.spacingLg),
                      TodayScheduleSection(schedule: dashboard.todaySchedule),
                    ],
                    const Gap(AppDesignTokens.spacingLg),
                    ActivePrescriptionsSection(
                      prescriptions: dashboard.activePrescriptions,
                    ),
                    const Gap(AppDesignTokens.spacingLg),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ImshPageHeader(
              title: 'Medications',
              subtitle: 'Manage your prescriptions and daily schedule.',
            ),
            const Gap(AppDesignTokens.spacingLg),
            NextDoseCarousel(doses: [_placeholderDose, _placeholderDose]),
            const Gap(AppDesignTokens.spacingLg),
            TodayScheduleSection(
              schedule: [
                _placeholderSchedule,
                _placeholderSchedule,
                _placeholderSchedule,
              ],
            ),
            const Gap(AppDesignTokens.spacingLg),
            ActivePrescriptionsSection(
              prescriptions: [_placeholderPrescription, _placeholderPrescription],
            ),
          ],
        ),
      ),
    );
  }
}

class _MedicationsError extends StatelessWidget {
  const _MedicationsError({
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDesignTokens.spacing2xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: theme.colorScheme.error,
            ),
            const Gap(AppDesignTokens.spacingMd),
            Text(
              message,
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const Gap(AppDesignTokens.spacingMd),
            FilledButton(
              onPressed: onRetry,
              child: const Text('Try again'),
            ),
          ],
        ),
      ),
    );
  }
}
