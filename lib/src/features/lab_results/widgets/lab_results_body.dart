import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/responsive.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../models/lab_result_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/lab_results_provider.dart';
import '../../../shared/widgets/imsh_empty_state.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_error_panel.dart';
import '../../../shared/widgets/imsh_kpi_tile.dart';
import 'lab_filter_chips.dart';
import 'lab_history_card.dart';
import 'lab_latest_card.dart';
import 'lab_official_documentation_card.dart';
import 'lab_page_header.dart';

class LabResultsBody extends ConsumerWidget {
  const LabResultsBody({super.key});

  static const _sectionGap = 12.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingController = ref.watch(labResultsPagingControllerProvider);
    final filter = ref.watch(labResultFilterProvider);

    return ListenableBuilder(
      listenable: pagingController,
      builder: (context, _) {
        final allItems = pagingController.items ?? [];
        final latest = pickLatestLabResult(allItems);
        final latestVisible =
            latest != null && matchesLabFilter(latest, filter);
        final history = filterLabHistory(allItems, filter, latest: latest);

        return RefreshIndicator(
          onRefresh: () async {
            pagingController.refresh();
          },
          child: ResponsiveBody(
            expand: false,
            center: false,
            builder: (context, bp) {
              final useSnap = bp.maxWidth < 520;
              final total = allItems.length;
              final pendingCount =
                  allItems.where(isLabOrderPending).length;
              final readyCount = allItems
                  .where((r) => r.isOrderComplete && !isLabOrderPending(r))
                  .length;

              return CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const LabPageHeader(),
                        const SizedBox(height: _sectionGap),
                        ImshKpiStrip(
                          useSnapStrip: useSnap,
                          items: [
                            ImshKpiItem(
                              label: 'Results',
                              value: total > 0 ? '$total' : '—',
                              caption: total > 0 ? 'Loaded' : 'None yet',
                              icon: Icons.science_outlined,
                              accent: ImshAccentColors.teal,
                            ),
                            ImshKpiItem(
                              label: 'Ready',
                              value: readyCount > 0 ? '$readyCount' : '—',
                              caption: 'Complete',
                              icon: Icons.check_circle_outline,
                              accent: ImshAccentColors.green,
                            ),
                            ImshKpiItem(
                              label: 'Pending',
                              value: pendingCount > 0 ? '$pendingCount' : '—',
                              caption: 'In process',
                              icon: Icons.hourglass_empty_outlined,
                              accent: ImshAccentColors.amber,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const LabFilterChips(),
                        if (latestVisible) ...[
                          const SizedBox(height: _sectionGap),
                          LabLatestCard(result: latest),
                        ],
                        if (history.isNotEmpty) ...[
                          const SizedBox(height: _sectionGap),
                          ImshSectionHeader(
                            title: 'Previous results',
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
                            message: 'No results match your filters.',
                            actionLabel: 'Clear filters',
                            onAction: () {
                              ref.read(labResultFilterProvider.notifier).state =
                                  LabResultFilterChip.all;
                            },
                          ),
                        ] else if (allItems.isNotEmpty &&
                            history.isEmpty &&
                            latestVisible) ...[
                          const SizedBox(height: _sectionGap),
                          const LabOfficialDocumentationCard(),
                        ],
                      ],
                    ),
                  ),
                  PagedSliverList<int, LabResultSummary>(
                    state: pagingController.value,
                    fetchNextPage: pagingController.fetchNextPage,
                    builderDelegate:
                        PagedChildBuilderDelegate<LabResultSummary>(
                      itemBuilder: (context, result, index) {
                        if (!history.any((r) => r.id == result.id)) {
                          return const SizedBox.shrink();
                        }
                        final historyIndex = history.indexWhere(
                          (r) => r.id == result.id,
                        );
                        final isLast = historyIndex == history.length - 1;

                        return Column(
                          children: [
                            LabHistoryCard(result: result),
                            if (isLast) ...[
                              const SizedBox(height: _sectionGap),
                              const LabOfficialDocumentationCard(),
                              const SizedBox(height: 8),
                            ],
                          ],
                        );
                      },
                      firstPageErrorIndicatorBuilder: (context) =>
                          ImshErrorPanel(
                        message: authFlowErrorMessage(
                          pagingController.error ?? 'Unable to load results',
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
                          _LoadingPlaceholder(useSnap: useSnap),
                      newPageProgressIndicatorBuilder: (context) =>
                          const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      noItemsFoundIndicatorBuilder: (context) =>
                          _EmptyOrFilteredState(
                        filterActive: filter.isActive,
                        onClearFilter: () {
                          ref.read(labResultFilterProvider.notifier).state =
                              LabResultFilterChip.all;
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
  const _LoadingPlaceholder({required this.useSnap});

  final bool useSnap;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const LabPageHeader(),
          const SizedBox(height: 12),
          ImshKpiStrip(
            useSnapStrip: useSnap,
            items: const [
              ImshKpiItem(
                label: 'Results',
                value: '—',
                caption: 'Loading',
                icon: Icons.science_outlined,
                accent: ImshAccentColors.teal,
              ),
              ImshKpiItem(
                label: 'Ready',
                value: '—',
                caption: 'Loading',
                icon: Icons.check_circle_outline,
                accent: ImshAccentColors.green,
              ),
              ImshKpiItem(
                label: 'Pending',
                value: '—',
                caption: 'Loading',
                icon: Icons.hourglass_empty_outlined,
                accent: ImshAccentColors.amber,
              ),
            ],
          ),
          const SizedBox(height: 10),
          const LabFilterChips(),
          const SizedBox(height: 12),
          LabLatestCard(result: placeholder),
          const SizedBox(height: 12),
          LabHistoryCard(result: placeholder),
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
          icon: Icons.science_outlined,
          iconColor: ImshAccentColors.teal,
          title: filterActive ? 'No matching results' : 'No lab results yet',
          message: filterActive
              ? 'Try adjusting your filters to see more results.'
              : 'Your laboratory test results will appear here.',
          actionLabel: filterActive ? 'Clear filters' : null,
          onAction: filterActive ? onClearFilter : null,
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: LabOfficialDocumentationCard(),
        ),
      ],
    );
  }
}
