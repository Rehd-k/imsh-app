import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../core/theme/app_design_tokens.dart';
import '../../shared/widgets/imsh_app_bar.dart';
import '../../providers/auth_provider.dart';
import '../../providers/radiology_reports_provider.dart';
import 'widgets/radiology_report_detail_sections.dart';
import 'widgets/radiology_reports_body.dart';

@RoutePage()
class RadiologyReportsScreen extends ConsumerWidget {
  const RadiologyReportsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: ImshAppBar(title: Text('Radiology reports')),
      body: RadiologyReportsBody(),
    );
  }
}

@RoutePage()
class RadiologyDetailScreen extends ConsumerWidget {
  const RadiologyDetailScreen({
    super.key,
    @PathParam('id') required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(radiologyReportDetailProvider(id));

    return Scaffold(
      appBar: ImshAppBar(title: const Text('Radiology report')),
      body: detailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => _DetailError(
          message: authFlowErrorMessage(error),
          onRetry: () => ref.invalidate(radiologyReportDetailProvider(id)),
        ),
        data: (detail) => SingleChildScrollView(
          padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
          child: RadiologyReportDetailSections(detail: detail),
        ),
      ),
    );
  }
}

class _DetailError extends StatelessWidget {
  const _DetailError({
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
