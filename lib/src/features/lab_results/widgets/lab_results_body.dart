import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../models/lab_result_model.dart';
import '../../../providers/lab_results_provider.dart';
import 'lab_filter_chips.dart';
import 'lab_history_card.dart';
import 'lab_latest_card.dart';
import 'lab_official_documentation_card.dart';
import 'lab_page_header.dart';

class LabResultsBody extends ConsumerWidget {
  const LabResultsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingController = ref.watch(labResultsPagingControllerProvider);
    final filter = ref.watch(labResultFilterProvider);
    final allItems = pagingController.itemList ?? [];
    final latest = pickLatestLabResult(allItems);
    final latestVisible =
        latest != null && matchesLabFilter(latest, filter);
    final history = filterLabHistory(allItems, filter, latest: latest);

    return RefreshIndicator(
      onRefresh: () async {
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
                  const LabPageHeader(),
                  const Gap(AppDesignTokens.spacingMd),
                  const LabFilterChips(),
                  if (latestVisible) ...[
                    const Gap(AppDesignTokens.spacingLg),
                    LabLatestCard(result: latest),
                  ],
                  if (history.isEmpty &&
                      latestVisible &&
                      allItems.isNotEmpty) ...[
                    const Gap(AppDesignTokens.spacingLg),
                    const LabOfficialDocumentationCard(),
                  ],
                  if (history.isNotEmpty) ...[
                    const Gap(AppDesignTokens.spacingLg),
                  ] else if (allItems.isNotEmpty &&
                      filter.isActive &&
                      !latestVisible) ...[
                    const Gap(AppDesignTokens.spacingLg),
                    _FilteredEmptyHint(
                      onClearFilter: () {
                        ref.read(labResultFilterProvider.notifier).state =
                            LabResultFilterChip.all;
                      },
                    ),
                  ],
                ],
              ),
            ),
          ),
          PagedSliverList<int, LabResultSummary>(
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate<LabResultSummary>(
              itemBuilder: (context, result, index) {
                if (!history.any((r) => r.id == result.id)) {
                  return const SizedBox.shrink();
                }
                final historyIndex =
                    history.indexWhere((r) => r.id == result.id);
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
                      LabHistoryCard(result: result),
                      if (isLast) ...[
                        const Gap(AppDesignTokens.spacingLg),
                        const LabOfficialDocumentationCard(),
                        const Gap(AppDesignTokens.spacingMd),
                      ],
                    ],
                  ),
                );
              },
              firstPageErrorIndicatorBuilder: (context) => _ErrorState(
                message: pagingController.error?.toString() ??
                    'Unable to load results',
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
                  ref.read(labResultFilterProvider.notifier).state =
                      LabResultFilterChip.all;
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
    final placeholder = LabResultSummary(
      id: 'loading',
      status: LabOrderStatus.completed,
      orderedAt: DateTime.now(),
      doctorName: 'Loading doctor name',
      testNames: const ['Complete Blood Count (CBC)'],
      summaryStatus: LabSummaryStatus.normal,
    );

    return Skeletonizer(
      child: Padding(
        padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const LabPageHeader(),
            const Gap(AppDesignTokens.spacingMd),
            const LabFilterChips(),
            const Gap(AppDesignTokens.spacingLg),
            LabLatestCard(result: placeholder),
            const Gap(AppDesignTokens.spacingLg),
            LabHistoryCard(result: placeholder),
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
          'No other results match your filters.',
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
            Icons.science_outlined,
            size: 56,
            color: theme.colorScheme.primary,
          ),
          const Gap(AppDesignTokens.spacingMd),
          Text(
            filterActive ? 'No matching results' : 'No lab results yet',
            style: theme.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const Gap(AppDesignTokens.spacingSm),
          Text(
            filterActive
                ? 'Try adjusting your filters to see more results.'
                : 'Your laboratory test results will appear here.',
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
            child: LabOfficialDocumentationCard(),
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
