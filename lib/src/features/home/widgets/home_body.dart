import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../models/appointment_model.dart';
import '../../../models/medical_records_dashboard_model.dart';
import '../../../models/medication_model.dart';
import '../../../providers/home_provider.dart';
import '../../../shared/widgets/family_subject_banner.dart';
import '../../../shared/widgets/imsh_sliver_app_bar.dart';
import 'home_billing_snippet.dart';
import 'home_header.dart';
import 'home_lab_results_snippet.dart';
import 'home_medications_section.dart';
import 'home_upcoming_section.dart';
import 'quick_actions_row.dart';
import 'vitals_summary_row.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({super.key});

  static const bookingTabIndex = 2;
  static const billingTabIndex = 3;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(homeDashboardProvider);

    return dashboardAsync.when(
      loading: () => const _HomeSkeleton(),
      error: (error, _) => _HomeError(
        message: homeErrorMessage(error),
        onRetry: () => invalidateHomeDashboard(ref),
      ),
      data: (dashboard) => RefreshIndicator(
        onRefresh: () async {
          invalidateHomeDashboard(ref);
          await ref.read(homeDashboardProvider.future);
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            const ImshSliverAppBar(),
            const SliverToBoxAdapter(child: FamilySubjectBanner()),
            SliverPadding(
              padding: const EdgeInsets.only(
                bottom: AppDesignTokens.spacing2xl,
              ),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const HomeGreeting(),
                    const Gap(AppDesignTokens.spacingLg),
                    VitalsSummaryRow(vitals: dashboard.latestVitals),
                    const Gap(AppDesignTokens.spacingLg),
                    QuickActionsRow(
                      onPayBill: () => _switchToTab(context, billingTabIndex),
                      onOpenAppointments: () =>
                          _switchToTab(context, bookingTabIndex),
                    ),
                    const Gap(AppDesignTokens.spacingLg),
                    HomeUpcomingSection(
                      appointments: dashboard.homeAppointments,
                      onViewAll: () => _switchToTab(context, bookingTabIndex),
                      onReschedule: (appointment) =>
                          openHomeReschedule(context, ref, appointment),
                    ),
                    const Gap(AppDesignTokens.spacingLg),
                    HomeMedicationsSection(
                      nextDoses: dashboard.medications.nextDoses,
                      todaySchedule: dashboard.medications.todaySchedule,
                    ),
                    if (dashboard.medications.nextDoses.isNotEmpty ||
                        dashboard.medications.todaySchedule.isNotEmpty)
                      const Gap(AppDesignTokens.spacingLg),
                    HomeBillingSnippet(
                      summary: dashboard.billingSummary,
                      onPayBill: () => _switchToTab(context, billingTabIndex),
                    ),
                    if (dashboard.hasOutstandingBalance)
                      const Gap(AppDesignTokens.spacingLg),
                    HomeLabResultsSnippet(
                      results: dashboard.labResultsPreview,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _switchToTab(BuildContext context, int index) {
    AutoTabsRouter.of(context).setActiveIndex(index);
  }
}

class _HomeSkeleton extends StatelessWidget {
  const _HomeSkeleton();

  static final _placeholderVitals = LatestVitalsSummary(
    pulseRate: 72,
    systolic: 118,
    diastolic: 78,
  );

  static final _placeholderAppointment = AppointmentSummary(
    id: 'skeleton',
    status: AppointmentStatus.confirmed,
    scheduledAt: DateTime.now(),
    location: 'Room 204',
    doctor: const DoctorSummary(
      id: 'doc',
      name: 'Dr. Amina Bello',
      specialty: 'Cardiology Follow-up',
    ),
  );

  static final _placeholderDose = MedicationDoseSummary(
    id: 'skeleton',
    prescriptionItemId: 'rx',
    drugName: 'Medication',
    dosage: '10mg',
    instructions: 'Take with water',
    scheduledAt: DateTime.now(),
    status: MedicationDoseStatus.upcoming,
  );

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: CustomScrollView(
        slivers: [
          const ImshSliverAppBar(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const HomeGreeting(),
                const Gap(AppDesignTokens.spacingLg),
                VitalsSummaryRow(vitals: _placeholderVitals),
                const Gap(AppDesignTokens.spacingLg),
                QuickActionsRow(
                  onPayBill: () {},
                  onOpenAppointments: () {},
                ),
                const Gap(AppDesignTokens.spacingLg),
                HomeUpcomingSection(
                  appointments: [_placeholderAppointment],
                  onViewAll: () {},
                  onReschedule: (_) {},
                ),
                const Gap(AppDesignTokens.spacingLg),
                HomeMedicationsSection(
                  nextDoses: [_placeholderDose],
                  todaySchedule: const [],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeError extends StatelessWidget {
  const _HomeError({
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

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
                  Icon(Icons.error_outline, size: 48, color: colorScheme.error),
                  const Gap(AppDesignTokens.spacingMd),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Gap(AppDesignTokens.spacingLg),
                  FilledButton(
                    onPressed: onRetry,
                    child: const Text('Try again'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
