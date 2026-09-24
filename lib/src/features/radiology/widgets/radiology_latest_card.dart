import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imsh/app_router.gr.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/radiology_report_model.dart';
import '../../../providers/service_providers.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_semantic_badge.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';
import '../radiology_pdf_download.dart';
import 'radiology_status_badge.dart';

class RadiologyLatestCard extends ConsumerWidget {
  const RadiologyLatestCard({super.key, required this.report});

  final RadiologyReportSummary report;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return ImshSurfaceCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
            child: _Thumbnail(
              thumbnailUrl: report.thumbnailUrl,
              modality: report.modality,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const ImshEllipsisChip(
                label: 'Latest result',
                tone: ImshSemanticTone.info,
                maxWidth: 120,
              ),
              const Spacer(),
              ImshEllipsisText(
                text: DateFormatter.medicalDate(report.performedAt),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: cs.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ImshEllipsisText(
            text: report.displayTitle,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const ImshSolidIcon(
                icon: Icons.person_outline,
                color: ImshAccentColors.blue,
                size: 28,
                iconSize: 14,
                radius: 8,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ImshEllipsisText(
                  text: report.radiologistName.trim().isEmpty
                      ? '—'
                      : report.radiologistName,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: ImshEllipsisText(
                  text: 'Status: ${report.status.label}',
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              RadiologyStatusBadge(status: report.status),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: () => context.router.push(
                    RadiologyDetailRoute(id: report.id),
                  ),
                  icon: const Icon(Icons.visibility_outlined, size: 18),
                  label: const Text('Full report'),
                  style: FilledButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
              if (report.status.isComplete ||
                  report.thumbnailUrl?.isNotEmpty == true) ...[
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: () => downloadRadiologyReportPdf(
                    context,
                    service: ref.read(radiologyServiceProvider),
                    reportId: report.id,
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    side: BorderSide(color: cs.outlineVariant),
                  ),
                  child: const Icon(Icons.download_outlined),
                ),
              ],
            ],
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
          errorBuilder: (_, _, _) => _Placeholder(modality: modality),
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
    final cs = Theme.of(context).colorScheme;

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ColoredBox(
        color: cs.surfaceContainer,
        child: Center(
          child: ImshSolidIcon(
            icon: modality.icon,
            color: ImshAccentColors.indigo,
            size: 48,
            iconSize: 24,
            radius: AppDesignTokens.radiusMd,
          ),
        ),
      ),
    );
  }
}
