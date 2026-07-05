import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../models/radiology_report_model.dart';
import '../../../providers/radiology_reports_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    final pagingController = ref.watch(radiologyReportsPagingControllerProvider);
    final filter = ref.watch(radiologyReportFilterProvider);
    final statistics = ref.watch(radiologyStatisticsProvider);
    final allItems = pagingController.itemList ?? [];
    final latest = pickLatestRadiologyReport(allItems);
    final latestVisible =
        latest != null && matchesRadiologyFilter(latest, filter);
    final history = filterRadiologyHistory(allItems, filter, latest: latest);

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(radiologyStatisticsProvider);
        pagingController.refresh();
      },
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              AppDesignTokens.containerPadding,
              AppDesignTokens.containerPadding,
              AppDesignTokens.containerPadding,
              0,
            ),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const RadiologyPageHeader(),
                  const Gap(AppDesignTokens.spacingMd),
                  const RadiologyActionRow(),
                  if (latestVisible) ...[
                    const Gap(AppDesignTokens.spacingLg),
                    RadiologyLatestCard(report: latest),
                  ],
                  if (statistics != null) ...[
                    const Gap(AppDesignTokens.spacingLg),
                    RadiologyStatisticsCard(statistics: statistics),
                  ],
                  if (history.isNotEmpty) ...[
                    const Gap(AppDesignTokens.spacingLg),
                    Text(
                      'Previous Reports',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const Gap(AppDesignTokens.spacingSm),
                  ] else if (allItems.isNotEmpty &&
                      filter.isActive &&
                      !latestVisible) ...[
                    const Gap(AppDesignTokens.spacingLg),
                    _FilteredEmptyHint(
                      onClearFilter: () {
                        ref
                            .read(radiologyReportFilterProvider.notifier)
                            .state = const RadiologyReportFilter();
                      },
                    ),
                  ] else if (allItems.isNotEmpty && history.isEmpty) ...[
                    const Gap(AppDesignTokens.spacingLg),
                    const RadiologySecurityBanner(),
                    const Gap(AppDesignTokens.spacingMd),
                  ],
                ],
              ),
            ),
          ),
          PagedSliverList<int, RadiologyReportSummary>(
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate<RadiologyReportSummary>(
              itemBuilder: (context, report, index) {
                if (!history.any((r) => r.id == report.id)) {
                  return const SizedBox.shrink();
                }
                final historyIndex =
                    history.indexWhere((r) => r.id == report.id);
                final isLast = historyIndex == history.length - 1;

                return Padding(
                  padding: EdgeInsets.fromLTRB(
                    AppDesignTokens.containerPadding,
                    0,
                    AppDesignTokens.containerPadding,
                    isLast ? AppDesignTokens.spacingLg : 0,
                  ),
                  child: Column(
                    children: [
                      RadiologyHistoryCard(report: report),
                      if (isLast) ...[
                        const Gap(AppDesignTokens.spacingLg),
                        const RadiologySecurityBanner(),
                        const Gap(AppDesignTokens.spacingMd),
                      ],
                    ],
                  ),
                );
              },
              firstPageErrorIndicatorBuilder: (context) => _ErrorState(
                message: pagingController.error?.toString() ??
                    'Unable to load reports',
                onRetry: pagingController.refresh,
              ),
              newPageErrorIndicatorBuilder: (context) => _ErrorState(
                message: pagingController.error?.toString() ??
                    'Unable to load more',
                onRetry: () => pagingController.retryLastFailedRequest(),
              ),
              firstPageProgressIndicatorBuilder: (context) =>
                  const _LoadingPlaceholder(),
              newPageProgressIndicatorBuilder: (context) => const Padding(
                padding:
                    EdgeInsets.symmetric(vertical: AppDesignTokens.spacingMd),
                child: Center(child: CircularProgressIndicator()),
              ),
              noItemsFoundIndicatorBuilder: (context) => _EmptyOrFilteredState(
                filterActive: filter.isActive,
                onClearFilter: () {
                  ref.read(radiologyReportFilterProvider.notifier).state =
                      const RadiologyReportFilter();
                },
              ),
            ),
          ),
        ],
      ),
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
      child: Padding(
        padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const RadiologyPageHeader(),
            const Gap(AppDesignTokens.spacingMd),
            const RadiologyActionRow(),
            const Gap(AppDesignTokens.spacingLg),
            RadiologyLatestCard(report: placeholder),
          ],
        ),
      ),
    );
  }
}

class _FilteredEmptyHint extends StatelessWidget {
  const _FilteredEmptyHint({required this.onClearFilter});

  final VoidCallback onClearFilter;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          'No other reports match your filters.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
        TextButton(
          onPressed: onClearFilter,
          child: const Text('Clear filters'),
        ),
      ],
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
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(AppDesignTokens.spacing2xl),
      child: Column(
        children: [
          const Gap(AppDesignTokens.spacing2xl),
          Icon(
            Icons.image_search_outlined,
            size: 56,
            color: theme.colorScheme.primary,
          ),
          const Gap(AppDesignTokens.spacingMd),
          Text(
            filterActive ? 'No matching reports' : 'No radiology reports yet',
            style: theme.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const Gap(AppDesignTokens.spacingSm),
          Text(
            filterActive
                ? 'Try adjusting your filters to see more results.'
                : 'Your imaging reports will appear here.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          if (filterActive) ...[
            const Gap(AppDesignTokens.spacingMd),
            TextButton(
              onPressed: onClearFilter,
              child: const Text('Clear filters'),
            ),
          ],
          const Gap(AppDesignTokens.spacingLg),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDesignTokens.containerPadding,
            ),
            child: RadiologySecurityBanner(),
          ),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(AppDesignTokens.spacing2xl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
