import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/radiology_report_model.dart';
import '../../../providers/service_providers.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_page_header.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';
import '../radiology_pdf_download.dart';
import 'patient_radiology_image_carousel.dart';
import 'radiology_status_badge.dart';

class RadiologyReportDetailSections extends ConsumerWidget {
  const RadiologyReportDetailSections({super.key, required this.detail});

  final RadiologyReportDetail detail;

  Future<void> _openUrl(BuildContext context, String url, String label) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return;
    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!launched && context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not open $label')));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radiologyService = ref.read(radiologyServiceProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ImshPageHeader(
          title: detail.displayTitle,
          subtitle: DateFormatter.fullDate(detail.performedAt),
          icon: detail.modality.icon,
          iconColor: ImshAccentColors.indigo,
          trailing: RadiologyStatusBadge(status: detail.status),
        ),
        const SizedBox(height: 12),
        _HeaderCard(detail: detail),
        if (detail.paymentRequired) ...[
          const SizedBox(height: 10),
          ImshSurfaceCard(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ImshSectionHeader(
                  title: 'Results',
                  icon: Icons.lock_outline,
                  iconColor: ImshAccentColors.amber,
                ),
                const SizedBox(height: 10),
                Text(
                  'Your imaging results will be available here once payment '
                  'for this study is completed.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
        if (detail.images.isNotEmpty) ...[
          const SizedBox(height: 10),
          ImshSurfaceCard(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ImshSectionHeader(
                  title: 'Files',
                  icon: Icons.photo_library_outlined,
                  iconColor: ImshAccentColors.purple,
                ),
                const SizedBox(height: 10),
                PatientRadiologyImageCarousel(
                  service: radiologyService,
                  reportId: detail.id,
                  images: detail.images,
                  height: 220,
                ),
              ],
            ),
          ),
        ],
        if (!detail.paymentRequired) ...[
          const SizedBox(height: 10),
          _FileActionButton(
            label: 'Download PDF report',
            icon: Icons.picture_as_pdf_outlined,
            onPressed: () => downloadRadiologyReportPdf(
              context,
              service: radiologyService,
              reportId: detail.id,
              detail: detail,
            ),
          ),
        ],
        if (detail.dicomUrl?.isNotEmpty == true) ...[
          const SizedBox(height: 10),
          _FileActionButton(
            label: 'Open DICOM viewer',
            icon: Icons.view_in_ar_outlined,
            onPressed: () => _openUrl(context, detail.dicomUrl!, 'DICOM'),
          ),
        ],
        if (detail.findings?.isNotEmpty == true) ...[
          const SizedBox(height: 10),
          _TextSection(
            title: 'Findings',
            icon: Icons.find_in_page_outlined,
            iconColor: ImshAccentColors.teal,
            body: detail.findings!,
          ),
        ],
        if (detail.impression?.isNotEmpty == true) ...[
          const SizedBox(height: 10),
          _TextSection(
            title: 'Impression',
            icon: Icons.psychology_outlined,
            iconColor: ImshAccentColors.indigo,
            body: detail.impression!,
          ),
        ],
        if (detail.recommendations?.isNotEmpty == true) ...[
          const SizedBox(height: 10),
          _TextSection(
            title: 'Recommendations',
            icon: Icons.lightbulb_outline,
            iconColor: ImshAccentColors.amber,
            body: detail.recommendations!,
          ),
        ],
        if (detail.severity != null) ...[
          const SizedBox(height: 10),
          ImshSurfaceCard(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ImshSectionHeader(
                  title: 'Severity',
                  icon: Icons.priority_high_outlined,
                  iconColor: ImshAccentColors.pink,
                ),
                const SizedBox(height: 10),
                Text(
                  detail.severity!.label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
        if (detail.reportBody?.isNotEmpty == true) ...[
          const SizedBox(height: 10),
          _TextSection(
            title: 'Report',
            icon: Icons.description_outlined,
            iconColor: ImshAccentColors.blue,
            body: detail.reportBody!,
          ),
        ],
        if (!detail.paymentRequired &&
            detail.findings == null &&
            detail.impression == null &&
            detail.recommendations == null &&
            detail.reportBody == null &&
            detail.images.isEmpty &&
            !detail.status.isComplete) ...[
          const SizedBox(height: 10),
          ImshSurfaceCard(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ImshSectionHeader(
                  title: 'Report',
                  icon: Icons.hourglass_empty_outlined,
                  iconColor: ImshAccentColors.amber,
                ),
                const SizedBox(height: 10),
                Text(
                  'Your imaging report is not available yet. Check back once '
                  'processing is complete.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({required this.detail});

  final RadiologyReportDetail detail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final radiologist =
        detail.radiologistName.trim().isEmpty ? '—' : detail.radiologistName;

    return ImshSurfaceCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ImshSectionHeader(
            title: 'Imaging report',
            icon: Icons.assignment_outlined,
            iconColor: ImshAccentColors.indigo,
          ),
          const SizedBox(height: 10),
          ImshEllipsisText(
            text: radiologist,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          _LabelValueList(
            rows: [
              (
                'Referring doctor',
                detail.referringDoctorName.trim().isEmpty
                    ? '—'
                    : detail.referringDoctorName,
              ),
              ('Modality', detail.modality.label),
              ('Status', detail.status.label),
              if (detail.verifiedAt != null)
                ('Verified', DateFormatter.dateTime(detail.verifiedAt!)),
            ],
          ),
        ],
      ),
    );
  }
}

class _TextSection extends StatelessWidget {
  const _TextSection({
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.body,
  });

  final String title;
  final IconData icon;
  final Color iconColor;
  final String body;

  @override
  Widget build(BuildContext context) {
    return ImshSurfaceCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImshSectionHeader(
            title: title,
            icon: icon,
            iconColor: iconColor,
          ),
          const SizedBox(height: 10),
          Text(
            body,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class _FileActionButton extends StatelessWidget {
  const _FileActionButton({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
        style: OutlinedButton.styleFrom(
          foregroundColor: ImshAccentColors.blue,
          side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDesignTokens.radiusSm),
          ),
        ),
      ),
    );
  }
}

class _LabelValueList extends StatelessWidget {
  const _LabelValueList({required this.rows});

  final List<(String, String)> rows;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final (label, value) in rows) ...[
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              color: cs.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 2),
          ImshEllipsisText(
            text: value.trim().isEmpty ? '—' : value,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          if ((label, value) != rows.last) const SizedBox(height: 8),
        ],
      ],
    );
  }
}
