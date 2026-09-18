import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/radiology_report_model.dart';
import '../../../providers/service_providers.dart';
import '../radiology_pdf_download.dart';

class RadiologyHistoryCard extends ConsumerWidget {
  const RadiologyHistoryCard({super.key, required this.report});

  final RadiologyReportSummary report;

  Future<void> _openDicom(BuildContext context, String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return;
    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!launched && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open DICOM viewer')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;
    final hasPdf =
        report.status.isComplete || report.thumbnailUrl?.isNotEmpty == true;
    final hasDicom = report.dicomUrl?.isNotEmpty == true;
    final hasDetail = report.status.isComplete;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppDesignTokens.spacingSm),
      child: Material(
        color: colorScheme.surfaceContainerLowest,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
          side: BorderSide(color: colorScheme.outlineVariant),
        ),
        child: InkWell(
          onTap: hasDetail
              ? () => context.router.push(RadiologyDetailRoute(id: report.id))
              : null,
          borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
          child: Padding(
            padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(
                      AppDesignTokens.radiusSm,
                    ),
                  ),
                  child: Icon(
                    report.modality.icon,
                    color: theme.colorScheme.primary,
                    size: 22,
                  ),
                ),
                const Gap(AppDesignTokens.spacingMd),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        report.displayTitle,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(AppDesignTokens.spacingXs),
                      Text(
                        DateFormatter.medicalDate(report.performedAt),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const Gap(AppDesignTokens.spacingXs),
                      Text(
                        'Ref: ${report.referringDoctorName}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      if (hasPdf || hasDicom || hasDetail) ...[
                        const Gap(AppDesignTokens.spacingSm),
                        Wrap(
                          spacing: AppDesignTokens.spacingMd,
                          children: [
                            if (hasPdf)
                              _LinkButton(
                                label: 'Download PDF',
                                onTap: () => downloadRadiologyReportPdf(
                                  context,
                                  service: ref.read(radiologyServiceProvider),
                                  reportId: report.id,
                                ),
                              ),
                            if (hasDicom)
                              _LinkButton(
                                label: 'DICOM',
                                onTap: () =>
                                    _openDicom(context, report.dicomUrl!),
                              ),
                            if (!hasPdf && !hasDicom && hasDetail)
                              _LinkButton(
                                label: 'Full Result',
                                onTap: () => context.router.push(
                                  RadiologyDetailRoute(id: report.id),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LinkButton extends StatelessWidget {
  const _LinkButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
