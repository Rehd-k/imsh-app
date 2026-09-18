import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/radiology_report_model.dart';
import '../../../providers/service_providers.dart';
import '../radiology_pdf_download.dart';
import 'radiology_status_badge.dart';

class RadiologyLatestCard extends ConsumerWidget {
  const RadiologyLatestCard({super.key, required this.report});

  final RadiologyReportSummary report;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
        border: Border.all(color: colorScheme.outlineVariant),
        boxShadow: context.cardShadow,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Thumbnail(
            thumbnailUrl: report.thumbnailUrl,
            modality: report.modality,
          ),
          Padding(
            padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDesignTokens.spacingSm,
                        vertical: AppDesignTokens.spacingXs,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer.withValues(
                          alpha: 0.12,
                        ),
                        borderRadius: BorderRadius.circular(
                          AppDesignTokens.radiusSm,
                        ),
                      ),
                      child: Text(
                        'LATEST RESULT',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.primaryContainer,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      DateFormatter.medicalDate(report.performedAt),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const Gap(AppDesignTokens.spacingSm),
                Text(
                  report.displayTitle,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(AppDesignTokens.spacingSm),
                Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 16,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    const Gap(AppDesignTokens.spacingXs),
                    Expanded(
                      child: Text(
                        report.radiologistName,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                const Gap(AppDesignTokens.spacingXs),
                Row(
                  children: [
                    Icon(
                      Icons.description_outlined,
                      size: 16,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    const Gap(AppDesignTokens.spacingXs),
                    Expanded(
                      child: Text(
                        'Status: ${report.status.label}',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    RadiologyStatusBadge(status: report.status),
                  ],
                ),
                const Gap(AppDesignTokens.spacingMd),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: () => context.router.push(
                          RadiologyDetailRoute(id: report.id),
                        ),
                        icon: const Icon(Icons.visibility_outlined, size: 18),
                        label: const Text('Full Report'),
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: AppDesignTokens.spacingSm + 2,
                          ),
                        ),
                      ),
                    ),
                    if (report.status.isComplete ||
                        report.thumbnailUrl?.isNotEmpty == true) ...[
                      const Gap(AppDesignTokens.spacingSm),
                      OutlinedButton(
                        onPressed: () => downloadRadiologyReportPdf(
                          context,
                          service: ref.read(radiologyServiceProvider),
                          reportId: report.id,
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.all(
                            AppDesignTokens.spacingSm + 4,
                          ),
                          side: BorderSide(color: colorScheme.outlineVariant),
                        ),
                        child: const Icon(Icons.download_outlined),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Thumbnail extends StatelessWidget {
  const _Thumbnail({required this.thumbnailUrl, required this.modality});

  final String? thumbnailUrl;
  final RadiologyModality modality;

  @override
  Widget build(BuildContext context) {
    if (thumbnailUrl?.isNotEmpty == true) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Image.network(
          thumbnailUrl!,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _Placeholder(modality: modality),
        ),
      );
    }
    return _Placeholder(modality: modality);
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({required this.modality});

  final RadiologyModality modality;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        color: colorScheme.surfaceContainer,
        child: Center(
          child: Icon(
            modality.icon,
            size: 48,
            color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
          ),
        ),
      ),
    );
  }
}
