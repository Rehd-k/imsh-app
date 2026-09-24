import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imsh/app_router.gr.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/radiology_report_model.dart';
import '../../../providers/service_providers.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';
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

  Color _modalityAccent(RadiologyModality modality) {
    return switch (modality) {
      RadiologyModality.xray => ImshAccentColors.blue,
      RadiologyModality.ct => ImshAccentColors.indigo,
      RadiologyModality.mri => ImshAccentColors.purple,
      RadiologyModality.ultrasound => ImshAccentColors.teal,
      RadiologyModality.echo => ImshAccentColors.pink,
      RadiologyModality.other => ImshAccentColors.amber,
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final hasPdf =
        report.status.isComplete || report.thumbnailUrl?.isNotEmpty == true;
    final hasDicom = report.dicomUrl?.isNotEmpty == true;
    final hasDetail = report.status.isComplete;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ImshSurfaceCard(
        padding: const EdgeInsets.all(10),
        onTap: hasDetail
            ? () => context.router.push(RadiologyDetailRoute(id: report.id))
            : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImshSolidIcon(
              icon: report.modality.icon,
              color: _modalityAccent(report.modality),
              size: 34,
              iconSize: 18,
              radius: AppDesignTokens.radiusMd,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImshEllipsisText(
                    text: report.displayTitle,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  ImshEllipsisText(
                    text: DateFormatter.medicalDate(report.performedAt),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 2),
                  ImshEllipsisText(
                    text: report.referringDoctorName.trim().isEmpty
                        ? 'Ref: —'
                        : 'Ref: ${report.referringDoctorName}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                  if (hasPdf || hasDicom || hasDetail) ...[
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 12,
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
                            onTap: () => _openDicom(context, report.dicomUrl!),
                          ),
                        if (!hasPdf && !hasDicom && hasDetail)
                          _LinkButton(
                            label: 'Full result',
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
          color: ImshAccentColors.teal,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
