import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../core/theme/app_design_tokens.dart';
import '../../helper/date_formatter.dart';
import '../../models/medication_model.dart';
import '../../providers/auth_provider.dart';
import '../../providers/medications_provider.dart';
import '../../shared/widgets/imsh_app_bar.dart';

@RoutePage()
class MedicationsHistoryScreen extends ConsumerWidget {
  const MedicationsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingController =
        ref.watch(medicationsHistoryPagingControllerProvider);

    return Scaffold(
      appBar: ImshAppBar(title: const Text('Prescription history')),
      body: RefreshIndicator(
        onRefresh: () async {
          pagingController.refresh();
        },
        child: PagedListView<int, PrescriptionHistorySummary>(
          padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
          pagingController: pagingController,
          builderDelegate: PagedChildBuilderDelegate<PrescriptionHistorySummary>(
            itemBuilder: (context, item, index) =>
                _HistoryCard(prescription: item),
            firstPageErrorIndicatorBuilder: (context) => _HistoryError(
              message: authFlowErrorMessage(
                pagingController.error ?? 'Something went wrong',
              ),
              onRetry: pagingController.refresh,
            ),
            newPageErrorIndicatorBuilder: (context) => _HistoryError(
              message: authFlowErrorMessage(
                pagingController.error ?? 'Something went wrong',
              ),
              onRetry: () => pagingController.retryLastFailedRequest(),
            ),
            firstPageProgressIndicatorBuilder: (context) => const Padding(
              padding: EdgeInsets.all(AppDesignTokens.spacingLg),
              child: Center(child: CircularProgressIndicator()),
            ),
            noItemsFoundIndicatorBuilder: (context) => const _HistoryEmpty(),
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

    return Card(
      margin: const EdgeInsets.only(bottom: AppDesignTokens.spacingSm),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDesignTokens.spacingMd,
          vertical: AppDesignTokens.spacingSm,
        ),
        leading: CircleAvatar(
          backgroundColor: colorScheme.surfaceContainer,
          child: Icon(
            Icons.medication_outlined,
            color: colorScheme.primary,
          ),
        ),
        title: Text(
          prescription.displayName,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(AppDesignTokens.spacingXs),
            Text(prescription.frequencyLabel),
            if (dateRange.isNotEmpty) Text(dateRange),
            Text(prescription.doctorName),
          ],
        ),
        trailing: Text(
          prescription.status.name.toUpperCase(),
          style: theme.textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}

class _HistoryEmpty extends StatelessWidget {
  const _HistoryEmpty();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDesignTokens.spacing2xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.history,
              size: 48,
              color: colorScheme.onSurfaceVariant,
            ),
            const Gap(AppDesignTokens.spacingMd),
            Text(
              'No prescription history yet.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _HistoryError extends StatelessWidget {
  const _HistoryError({
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDesignTokens.spacing2xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, textAlign: TextAlign.center),
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
