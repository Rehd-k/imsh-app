import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../core/responsive.dart';
import '../../core/theme/imsh_accent_colors.dart';
import '../../helper/date_formatter.dart';
import '../../models/medication_model.dart';
import '../../providers/auth_provider.dart';
import '../../providers/medications_provider.dart';
import '../../shared/widgets/imsh_app_bar.dart';
import '../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../shared/widgets/imsh_empty_state.dart';
import '../../shared/widgets/imsh_error_panel.dart';
import '../../shared/widgets/imsh_semantic_badge.dart';
import '../../shared/widgets/imsh_solid_icon.dart';
import '../../shared/widgets/imsh_surface_card.dart';

@RoutePage()
class MedicationsHistoryScreen extends ConsumerWidget {
  const MedicationsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingController =
        ref.watch(medicationsHistoryPagingControllerProvider);

    return Scaffold(
      appBar: ImshAppBar(title: const Text('Prescription history')),
      body: ResponsiveBody(
        expand: false,
        builder: (context, bp) => RefreshIndicator(
          onRefresh: () async {
            pagingController.refresh();
          },
          child: PagingListener<int, PrescriptionHistorySummary>(
            controller: pagingController,
            builder: (context, state, fetchNextPage) =>
                PagedListView<int, PrescriptionHistorySummary>(
              padding: EdgeInsets.zero,
              state: state,
              fetchNextPage: fetchNextPage,
              builderDelegate:
                  PagedChildBuilderDelegate<PrescriptionHistorySummary>(
                itemBuilder: (context, item, index) =>
                    _HistoryCard(prescription: item),
                firstPageErrorIndicatorBuilder: (context) => ImshErrorPanel(
                  message: authFlowErrorMessage(
                    state.error ?? 'Something went wrong',
                  ),
                  onRetry: pagingController.refresh,
                ),
                newPageErrorIndicatorBuilder: (context) => ImshErrorPanel(
                  message: authFlowErrorMessage(
                    state.error ?? 'Something went wrong',
                  ),
                  onRetry: fetchNextPage,
                ),
                firstPageProgressIndicatorBuilder: (context) => const Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(child: CircularProgressIndicator()),
                ),
                noItemsFoundIndicatorBuilder: (context) => const ImshEmptyState(
                  title: 'No history yet',
                  message: 'No prescription history yet.',
                  icon: Icons.history,
                  iconColor: ImshAccentColors.teal,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  const _HistoryCard({required this.prescription});

  final PrescriptionHistorySummary prescription;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final dateRange = [
      if (prescription.startDate != null)
        DateFormatter.medicalDate(prescription.startDate!),
      if (prescription.endDate != null)
        DateFormatter.medicalDate(prescription.endDate!),
    ].join(' – ');

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ImshSurfaceCard(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ImshSolidIcon(
              icon: Icons.medication_outlined,
              color: ImshAccentColors.teal,
              size: 36,
              iconSize: 18,
              radius: 10,
            ),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImshEllipsisText(
                    text: prescription.displayName,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    prescription.frequencyLabel,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  if (dateRange.isNotEmpty)
                    Text(
                      dateRange,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ImshEllipsisText(
                    text: prescription.doctorName.trim().isEmpty
                        ? '—'
                        : prescription.doctorName,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(8),
            ImshEllipsisChip(
              label: prescription.status.name.toUpperCase(),
              tone: ImshSemanticTone.neutral,
              maxWidth: 90,
            ),
          ],
        ),
      ),
    );
  }
}
