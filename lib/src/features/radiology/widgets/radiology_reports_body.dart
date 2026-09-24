import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/responsive.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../models/radiology_report_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/radiology_reports_provider.dart';
import '../../../shared/widgets/imsh_empty_state.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_error_panel.dart';
import 'radiology_action_row.dart';
import 'radiology_history_card.dart';
import 'radiology_latest_card.dart';
import 'radiology_page_header.dart';
import 'radiology_security_banner.dart';
import 'radiology_statistics_card.dart';

class RadiologyReportsBody extends ConsumerStatefulWidget {
  const RadiologyReportsBody({super.key});

  @override
  ConsumerState<RadiologyReportsBody> createState() =>
      _RadiologyReportsBodyState();
}

class _RadiologyReportsBodyState extends ConsumerState<RadiologyReportsBody> {
  static const _sectionGap = 12.0;

  @override
  Widget build(BuildContext context) {
    final pagingController = ref.watch(radiologyReportsPagingControllerProvider);
    final filter = ref.watch(radiologyReportFilterProvider);
    final statistics = ref.watch(radiologyStatisticsProvider);

    return ListenableBuilder(
      listenable: pagingController,
      builder: (context, _) {
        final allItems = pagingController.items ?? [];
        final latest = pickLatestRadiologyReport(allItems);
        final latestVisible =
            latest != null && matchesRadiologyFilter(latest, filter);
        final history =
            filterRadiologyHistory(allItems, filter, latest: latest);

        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(radiologyStatisticsProvider);
            pagingController.refresh();
          },
          child: ResponsiveBody(
            expand: false,
            center: false,
            builder: (context, bp) {
              return CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const RadiologyPageHeader(),
                        const SizedBox(height: _sectionGap),
                        const RadiologyActionRow(),
                        if (latestVisible) ...[
                          const SizedBox(height: _sectionGap),
                          RadiologyLatestCard(report: latest),
                        ],
                        if (statistics != null) ...[
                          const SizedBox(height: _sectionGap),
                          RadiologyStatisticsCard(statistics: statistics),
                        ],
                        if (history.isNotEmpty) ...[
                          const SizedBox(height: _sectionGap),
                          const ImshSectionHeader(
                            title: 'Previous reports',
                            icon: Icons.history_outlined,
                            iconColor: ImshAccentColors.indigo,
                          ),
                          const SizedBox(height: 8),
                        ] else if (allItems.isNotEmpty &&
                            filter.isActive &&
                            !latestVisible) ...[
                          const SizedBox(height: _sectionGap),
                          ImshEmptyState(
                            icon: Icons.filter_alt_off_outlined,
                            iconColor: ImshAccentColors.indigo,
                            message: 'No reports match your filters.',
                            actionLabel: 'Clear filters',
                            onAction: () {
                              ref
                                  .read(radiologyReportFilterProvider.notifier)
                                  .state = const RadiologyReportFilter();
                            },
                          ),
                        ] else if (allItems.isNotEmpty && history.isEmpty) ...[
                          const SizedBox(height: _sectionGap),
                          const RadiologySecurityBanner(),
                        ],
                      ],
                    ),
                  ),
                  PagedSliverList<int, RadiologyReportSummary>(
                    state: pagingController.value,
                    fetchNextPage: pagingController.fetchNextPage,
                    builderDelegate:
                        PagedChildBuilderDelegate<RadiologyReportSummary>(
                      itemBuilder: (context, report, index) {
                        if (!history.any((r) => r.id == report.id)) {
                          return const SizedBox.shrink();
                        }
                        final historyIndex =
                            history.indexWhere((r) => r.id == report.id);
                        final isLast = historyIndex == history.length - 1;

                        return Column(
                          children: [
                            RadiologyHistoryCard(report: report),
                            if (isLast) ...[
                              const SizedBox(height: _sectionGap),
                              const RadiologySecurityBanner(),
                              const SizedBox(height: 8),
                            ],
                          ],
                        );
                      },
                      firstPageErrorIndicatorBuilder: (context) =>
                          ImshErrorPanel(
                        message: authFlowErrorMessage(
                          pagingController.error ?? 'Unable to load reports',
                        ),
                        onRetry: pagingController.refresh,
                      ),
                      newPageErrorIndicatorBuilder: (context) =>
                          ImshErrorPanel(
                        message: authFlowErrorMessage(
                          pagingController.error ?? 'Unable to load more',
                        ),
                        onRetry: pagingController.fetchNextPage,
                      ),
                      firstPageProgressIndicatorBuilder: (context) =>
                          const _LoadingPlaceholder(),
                      newPageProgressIndicatorBuilder: (context) =>
                          const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      noItemsFoundIndicatorBuilder: (context) =>
                          _EmptyOrFilteredState(
                        filterActive: filter.isActive,
                        onClearFilter: () {
                          ref
                              .read(radiologyReportFilterProvider.notifier)
                              .state = const RadiologyReportFilter();
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class _LoadingPlaceholder extends StatelessWidget {
  const _LoadingPlaceholder();

  @override
  Widget build(BuildContext context) {
    final placeholder = RadiologyReportSummary(
      id: 'loading',
      scanType: 'Brain MRI (With Contrast)',
      modality: RadiologyModality.mri,
      performedAt: DateTime.now(),
      radiologistName: 'Dr. Loading',
      referringDoctorName: 'Dr. Loading',
      status: RadiologyReportStatus.verified,
    );

    return Skeletonizer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const RadiologyPageHeader(),
          const SizedBox(height: 12),
          const RadiologyActionRow(),
          const SizedBox(height: 12),
          RadiologyLatestCard(report: placeholder),
        ],
      ),
    );
  }
}

class _EmptyOrFilteredState extends StatelessWidget {
  const _EmptyOrFilteredState({
    required this.filterActive,
    required this.onClearFilter,
  });

  final bool filterActive;
  final VoidCallback onClearFilter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImshEmptyState(
          icon: Icons.image_search_outlined,
          iconColor: ImshAccentColors.indigo,
          title:
              filterActive ? 'No matching reports' : 'No radiology reports yet',
          message: filterActive
              ? 'Try adjusting your filters to see more results.'
              : 'Your imaging reports will appear here.',
          actionLabel: filterActive ? 'Clear filters' : null,
          onAction: filterActive ? onClearFilter : null,
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: RadiologySecurityBanner(),
        ),
      ],
    );
  }
}
