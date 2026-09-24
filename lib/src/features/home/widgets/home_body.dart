import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imsh/app_router.gr.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/responsive.dart';
import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../models/appointment_model.dart';
import '../../../models/health_content_model.dart';
import '../../../models/invoice_model.dart';
import '../../../models/medical_records_dashboard_model.dart';
import '../../../models/medication_model.dart';
import '../../../providers/health_content_provider.dart';
import '../../../providers/home_provider.dart';
import '../../../shared/widgets/family_subject_banner.dart';
import '../../../shared/widgets/imsh_error_panel.dart';
import '../../../shared/widgets/imsh_sliver_app_bar.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';
import 'home_billing_snippet.dart';
import 'home_cycle_snippet.dart';
import 'home_header.dart';
import 'home_kpi_strip.dart';
import 'home_lab_results_snippet.dart';
import 'home_medications_section.dart';
import 'home_upcoming_section.dart';
import 'quick_actions_row.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({super.key});

  static const bookingTabIndex = 2;
  static const billingTabIndex = 3;
  static const sectionGap = 12.0;

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
      data: (dashboard) {
        final campaigns = campaignsAsync.maybeWhen(
          data: (r) => r.data.take(2).toList(),
          orElse: () => const <HealthContentItem>[],
        );
        final news = newsAsync.maybeWhen(
          data: (r) => r.data.take(2).toList(),
          orElse: () => const <HealthContentItem>[],
        );

        return RefreshIndicator(
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
              SliverFillRemaining(
                hasScrollBody: true,
                child: ResponsiveBody(
                  center: false,
                  bottomPadding: 24,
                  builder: (context, bp) {
                    final width = bp.maxWidth;
                    final showRail = width >= AppBreakpoints.desktopMin;
                    final useSnapKpis = width < 520;

                    final main = _HomeMainColumn(
                      dashboard: dashboard,
                      campaigns: campaigns,
                      news: news,
                      useSnapKpis: useSnapKpis,
                      showInlineQuickActions: !showRail,
                      onOpenBooking: () =>
                          _switchToTab(context, bookingTabIndex),
                      onPayBill: () => _switchToTab(context, billingTabIndex),
                      onCheckIn: () => _switchToTab(context, bookingTabIndex),
                      onRequest: () =>
                          context.router.push(BookAppointmentRoute()),
                      onReschedule: (appointment) =>
                          openHomeReschedule(context, ref, appointment),
                    );

                    if (!showRail) {
                      return SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: main,
                      );
                    }

                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 9,
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: main,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 3,
                          child: HomeQuickActions(
                            asRail: true,
                            fillHeight: true,
                            onPayBill: () =>
                                _switchToTab(context, billingTabIndex),
                            onCheckIn: () =>
                                _switchToTab(context, bookingTabIndex),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _switchToTab(BuildContext context, int index) {
    AutoTabsRouter.of(context).setActiveIndex(index);
  }
}

class _HomeMainColumn extends StatelessWidget {
  const _HomeMainColumn({
    required this.dashboard,
    required this.campaigns,
    required this.news,
    required this.useSnapKpis,
    required this.showInlineQuickActions,
    required this.onOpenBooking,
    required this.onPayBill,
    required this.onCheckIn,
    required this.onRequest,
    required this.onReschedule,
  });

  final HomeDashboardData dashboard;
  final List<HealthContentItem> campaigns;
  final List<HealthContentItem> news;
  final bool useSnapKpis;
  final bool showInlineQuickActions;
  final VoidCallback onOpenBooking;
  final VoidCallback onPayBill;
  final VoidCallback onCheckIn;
  final VoidCallback onRequest;
  final void Function(AppointmentSummary appointment) onReschedule;

  @override
  Widget build(BuildContext context) {
    final next = dashboard.homeAppointments.isNotEmpty
        ? dashboard.homeAppointments.first
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const HomePageHeader(),
        const SizedBox(height: 10),
        HomeKpiStrip(
          vitals: dashboard.latestVitals,
          medsDueToday: dashboard.medications.todaySchedule.length,
          billingSummary: dashboard.billingSummary,
          useSnapStrip: useSnapKpis,
          onVitalsTap: () => context.router.push(const VitalsTrendRoute()),
          onMedsTap: () => context.router.push(const MedicationsRoute()),
          onBillingTap: onPayBill,
        ),
        const SizedBox(height: HomeBody.sectionGap),
        HomeNextVisitCard(
          appointment: next,
          onOpenBooking: onOpenBooking,
          onRequest: onRequest,
          onReschedule: onReschedule,
        ),
        if (dashboard.homeAppointments.length > 1) ...[
          const SizedBox(height: HomeBody.sectionGap),
          HomeUpcomingSection(
            appointments: dashboard.homeAppointments,
            onViewAll: onOpenBooking,
            onReschedule: onReschedule,
          ),
        ],
        if (showInlineQuickActions) ...[
          const SizedBox(height: HomeBody.sectionGap),
          HomeQuickActions(
            onPayBill: onPayBill,
            onCheckIn: onCheckIn,
          ),
        ],
        const HomeCycleSnippet(),
        _Spaced(
          show: dashboard.medications.nextDoses.isNotEmpty ||
              dashboard.medications.todaySchedule.isNotEmpty,
          child: HomeMedicationsSection(
            nextDoses: dashboard.medications.nextDoses,
            todaySchedule: dashboard.medications.todaySchedule,
          ),
        ),
        _Spaced(
          show: dashboard.hasOutstandingBalance,
          child: HomeBillingSnippet(
            summary: dashboard.billingSummary,
            onPayBill: onPayBill,
          ),
        ),
        _Spaced(
          show: dashboard.labResultsPreview.isNotEmpty,
          child: HomeLabResultsSnippet(
            results: dashboard.labResultsPreview,
            onViewTrends: () => context.router.push(LabTrendRoute()),
          ),
        ),
        _Spaced(
          show: campaigns.isNotEmpty,
          child: _HomeHealthFeed(
            title: 'Campaigns',
            icon: Icons.campaign_outlined,
            accent: ImshAccentColors.purple,
            items: campaigns,
            onViewAll: () =>
                context.router.push(const HealthCampaignsRoute()),
            onOpen: (item) => context.router.push(
              HealthCampaignDetailRoute(id: item.id),
            ),
          ),
        ),
        _Spaced(
          show: news.isNotEmpty,
          child: _HomeHealthFeed(
            title: 'Health news',
            icon: Icons.newspaper_outlined,
            accent: ImshAccentColors.teal,
            items: news,
            onViewAll: () => context.router.push(const HealthNewsRoute()),
            onOpen: (item) =>
                context.router.push(HealthNewsDetailRoute(id: item.id)),
          ),
        ),
        const SizedBox(height: HomeBody.sectionGap),
        ImshSurfaceCard(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const ImshSolidIcon(
              icon: Icons.local_hospital_outlined,
              color: ImshAccentColors.indigo,
              size: 30,
              iconSize: 16,
              radius: 8,
            ),
            title: const Text('Theatre schedule'),
            subtitle: const Text('View upcoming theatre sessions'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.router.push(const TheatreSchedulesRoute()),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class _Spaced extends StatelessWidget {
  const _Spaced({required this.child, this.show = true});

  final Widget child;
  final bool show;

  @override
  Widget build(BuildContext context) {
    if (!show) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: HomeBody.sectionGap),
      child: child,
    );
  }
}

class _HomeHealthFeed extends StatelessWidget {
  const _HomeHealthFeed({
    required this.title,
    required this.icon,
    required this.accent,
    required this.items,
    required this.onViewAll,
    required this.onOpen,
  });

  final String title;
  final IconData icon;
  final Color accent;
  final List<HealthContentItem> items;
  final VoidCallback onViewAll;
  final void Function(HealthContentItem item) onOpen;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            ImshSolidIcon(
              icon: icon,
              color: accent,
              size: 26,
              iconSize: 14,
              radius: 7,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const Spacer(),
            TextButton(onPressed: onViewAll, child: const Text('View all')),
          ],
        ),
        const SizedBox(height: 8),
        for (var i = 0; i < items.length; i++) ...[
          if (i > 0) const SizedBox(height: 6),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onOpen(items[i]),
              borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
              child: ImshSurfaceCard(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImshEllipsisText(
                      text: items[i].title,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      items[i].excerpt,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: cs.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ],
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

  static const _placeholderBilling = BillingSummaryResponse(
    totalOutstanding: '48500',
    unpaidInvoiceCount: 2,
  );

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: CustomScrollView(
        slivers: [
          const ImshSliverAppBar(),
          SliverPadding(
            padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const HomePageHeader(),
                  const SizedBox(height: 10),
                  HomeKpiStrip(
                    vitals: _placeholderVitals,
                    medsDueToday: 3,
                    billingSummary: _placeholderBilling,
                  ),
                  const SizedBox(height: 12),
                  HomeNextVisitCard(
                    appointment: _placeholderAppointment,
                    onOpenBooking: () {},
                    onRequest: () {},
                    onReschedule: (_) {},
                  ),
                  const SizedBox(height: 12),
                  HomeQuickActions(onPayBill: () {}, onCheckIn: () {}),
                  const SizedBox(height: 12),
                  HomeMedicationsSection(
                    nextDoses: [_placeholderDose],
                    todaySchedule: const [],
                  ),
                ],
              ),
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
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        const ImshSliverAppBar(),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
            child: ImshErrorPanel(message: message, onRetry: onRetry),
          ),
        ),
      ],
    );
  }
}
