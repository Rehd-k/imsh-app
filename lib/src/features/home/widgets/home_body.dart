import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../models/appointment_model.dart';
import '../../../models/health_content_model.dart';
import '../../../models/medical_records_dashboard_model.dart';
import '../../../models/medication_model.dart';
import '../../../providers/health_content_provider.dart';
import '../../../providers/home_provider.dart';
import '../../../shared/widgets/family_subject_banner.dart';
import '../../../shared/widgets/imsh_sliver_app_bar.dart';
import 'home_billing_snippet.dart';
import 'home_cycle_snippet.dart';
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
    final campaignsAsync = ref.watch(healthCampaignsProvider);
    final newsAsync = ref.watch(healthNewsProvider);

    return dashboardAsync.when(
      loading: () => const _HomeSkeleton(),
      error: (error, _) => _HomeError(
        message: homeErrorMessage(error),
        onRetry: () => invalidateHomeDashboard(ref),
      ),
      data: (dashboard) => RefreshIndicator(
        onRefresh: () async {
          invalidateHomeDashboard(ref);
          ref.invalidate(healthCampaignsProvider);
          ref.invalidate(healthNewsProvider);
          await Future.wait([
            ref.read(homeDashboardProvider.future),
            ref.read(healthCampaignsProvider.future),
            ref.read(healthNewsProvider.future),
          ]);
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
                    _HeroVisitCard(
                      appointment: dashboard.homeAppointments.isNotEmpty
                          ? dashboard.homeAppointments.first
                          : null,
                      onOpenBooking: () =>
                          _switchToTab(context, bookingTabIndex),
                      onRequest: () =>
                          context.router.push(BookAppointmentRoute()),
                      onReschedule: (appointment) =>
                          openHomeReschedule(context, ref, appointment),
                    ),
                    const Gap(AppDesignTokens.spacingLg),
                    _SectionLabel(
                      title: 'Vitals',
                      actionLabel: 'Trends',
                      onAction: () =>
                          context.router.push(const VitalsTrendRoute()),
                    ),
                    const Gap(AppDesignTokens.spacingSm),
                    InkWell(
                      onTap: () =>
                          context.router.push(const VitalsTrendRoute()),
                      child: VitalsSummaryRow(vitals: dashboard.latestVitals),
                    ),
                    const Gap(AppDesignTokens.spacingLg),
                    QuickActionsRow(
                      onPayBill: () => _switchToTab(context, billingTabIndex),
                      onCheckIn: () => _switchToTab(context, bookingTabIndex),
                    ),
                    const Gap(AppDesignTokens.spacingLg),
                    const HomeCycleSnippet(),
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
                      onViewTrends: () => context.router.push(LabTrendRoute()),
                    ),
                    if (dashboard.labResultsPreview.isNotEmpty)
                      const Gap(AppDesignTokens.spacingLg),
                    _HomeHealthFeed(
                      title: 'Campaigns',
                      items: campaignsAsync.maybeWhen(
                        data: (r) => r.data.take(2).toList(),
                        orElse: () => const <HealthContentItem>[],
                      ),
                      onViewAll: () =>
                          context.router.push(const HealthCampaignsRoute()),
                      onOpen: (item) => context.router.push(
                        HealthCampaignDetailRoute(id: item.id),
                      ),
                    ),
                    const Gap(AppDesignTokens.spacingLg),
                    _HomeHealthFeed(
                      title: 'Health news',
                      items: newsAsync.maybeWhen(
                        data: (r) => r.data.take(2).toList(),
                        orElse: () => const <HealthContentItem>[],
                      ),
                      onViewAll: () =>
                          context.router.push(const HealthNewsRoute()),
                      onOpen: (item) => context.router.push(
                        HealthNewsDetailRoute(id: item.id),
                      ),
                    ),
                    const Gap(AppDesignTokens.spacingLg),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDesignTokens.containerPadding,
                      ),
                      child: OutlinedButton.icon(
                        onPressed: () =>
                            context.router.push(const TheatreSchedulesRoute()),
                        icon: const Icon(Icons.local_hospital_outlined),
                        label: const Text('Theatre schedule'),
                      ),
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

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.title, this.actionLabel, this.onAction});

  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDesignTokens.containerPadding,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          if (actionLabel != null && onAction != null)
            TextButton(onPressed: onAction, child: Text(actionLabel!)),
        ],
      ),
    );
  }
}

class _HeroVisitCard extends StatelessWidget {
  const _HeroVisitCard({
    required this.appointment,
    required this.onOpenBooking,
    required this.onRequest,
    required this.onReschedule,
  });

  final AppointmentSummary? appointment;
  final VoidCallback onOpenBooking;
  final VoidCallback onRequest;
  final void Function(AppointmentSummary appointment) onReschedule;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDesignTokens.containerPadding,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [colorScheme.primary, colorScheme.primaryContainer],
          ),
          boxShadow: AppDesignTokens.buttonShadow(colorScheme.brightness),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppDesignTokens.spacingLg),
          child: appointment == null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'No visit scheduled',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Gap(AppDesignTokens.spacingXs),
                    Text(
                      'Request an appointment and the hospital will confirm.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onPrimary.withValues(alpha: 0.9),
                      ),
                    ),
                    const Gap(AppDesignTokens.spacingMd),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: colorScheme.onPrimary,
                        foregroundColor: colorScheme.primary,
                      ),
                      onPressed: onRequest,
                      child: const Text('Request appointment'),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment!.status == AppointmentStatus.requested
                          ? 'Next request'
                          : 'Next visit',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: colorScheme.onPrimary.withValues(alpha: 0.85),
                        letterSpacing: 0.4,
                      ),
                    ),
                    const Gap(AppDesignTokens.spacingXs),
                    Text(
                      appointment!.specialtyLabel,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Gap(AppDesignTokens.spacingXs),
                    Text(
                      '${appointment!.status.label} · ${appointment!.visitType.label}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onPrimary.withValues(alpha: 0.9),
                      ),
                    ),
                    const Gap(4),
                    Text(
                      appointment!.doctorDisplayName,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onPrimary.withValues(alpha: 0.9),
                      ),
                    ),
                    const Gap(AppDesignTokens.spacingMd),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: colorScheme.onPrimary,
                              side: BorderSide(
                                color: colorScheme.onPrimary.withValues(
                                  alpha: 0.55,
                                ),
                              ),
                            ),
                            onPressed: onOpenBooking,
                            child: const Text('View all'),
                          ),
                        ),
                        if (appointment!.canReschedule) ...[
                          const Gap(AppDesignTokens.spacingSm),
                          Expanded(
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: colorScheme.onPrimary,
                                foregroundColor: colorScheme.primary,
                              ),
                              onPressed: () => onReschedule(appointment!),
                              child: const Text('Reschedule'),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _HomeHealthFeed extends StatelessWidget {
  const _HomeHealthFeed({
    required this.title,
    required this.items,
    required this.onViewAll,
    required this.onOpen,
  });

  final String title;
  final List<HealthContentItem> items;
  final VoidCallback onViewAll;
  final void Function(HealthContentItem item) onOpen;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();
    final colorScheme = context.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDesignTokens.containerPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              TextButton(onPressed: onViewAll, child: const Text('View all')),
            ],
          ),
          const Gap(AppDesignTokens.spacingSm),
          for (final item in items) ...[
            Material(
              color: colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
              child: InkWell(
                onTap: () => onOpen(item),
                borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
                child: Container(
                  padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      AppDesignTokens.radiusMd,
                    ),
                    border: Border.all(color: colorScheme.outlineVariant),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Gap(4),
                      Text(
                        item.excerpt,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (item != items.last) const Gap(AppDesignTokens.spacingSm),
          ],
        ],
      ),
    );
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
    specialty: 'Cardiology',
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
                _HeroVisitCard(
                  appointment: _placeholderAppointment,
                  onOpenBooking: () {},
                  onRequest: () {},
                  onReschedule: (_) {},
                ),
                const Gap(AppDesignTokens.spacingLg),
                VitalsSummaryRow(vitals: _placeholderVitals),
                const Gap(AppDesignTokens.spacingLg),
                QuickActionsRow(onPayBill: () {}, onCheckIn: () {}),
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
  const _HomeError({required this.message, required this.onRetry});

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
