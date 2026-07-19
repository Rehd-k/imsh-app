import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/radiology_report_model.dart';
import '../../../providers/service_providers.dart';
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
        _HeaderCard(detail: detail),
        if (detail.paymentRequired) ...[
          const Gap(AppDesignTokens.spacingMd),
          _SectionCard(
            title: 'Results',
            child: Text(
              'Your imaging results will be available here once payment '
              'for this study is completed.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
        if (detail.images.isNotEmpty) ...[
          const Gap(AppDesignTokens.spacingMd),
          _SectionCard(
            title: 'Files',
            child: PatientRadiologyImageCarousel(
              service: radiologyService,
              reportId: detail.id,
              images: detail.images,
              height: 220,
            ),
          ),
        ],
        if (detail.pdfUrl?.isNotEmpty == true && detail.images.isEmpty) ...[
          const Gap(AppDesignTokens.spacingMd),
          _FileActionButton(
            label: 'Download PDF report',
            icon: Icons.picture_as_pdf_outlined,
            onPressed: () => _openUrl(context, detail.pdfUrl!, 'PDF'),
          ),
        ],
        if (detail.dicomUrl?.isNotEmpty == true) ...[
          const Gap(AppDesignTokens.spacingMd),
          _FileActionButton(
            label: 'Open DICOM viewer',
            icon: Icons.view_in_ar_outlined,
            onPressed: () => _openUrl(context, detail.dicomUrl!, 'DICOM'),
          ),
        ],
        if (detail.findings?.isNotEmpty == true) ...[
          const Gap(AppDesignTokens.spacingMd),
          _SectionCard(
            title: 'Findings',
            child: Text(
              detail.findings!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
        if (detail.impression?.isNotEmpty == true) ...[
          const Gap(AppDesignTokens.spacingMd),
          _SectionCard(
            title: 'Impression',
            child: Text(
              detail.impression!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
        if (detail.recommendations?.isNotEmpty == true) ...[
          const Gap(AppDesignTokens.spacingMd),
          _SectionCard(
            title: 'Recommendations',
            child: Text(
              detail.recommendations!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
        if (detail.severity != null) ...[
          const Gap(AppDesignTokens.spacingMd),
          _SectionCard(
            title: 'Severity',
            child: Text(
              detail.severity!.label,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ],
        if (detail.reportBody?.isNotEmpty == true) ...[
          const Gap(AppDesignTokens.spacingMd),
          _SectionCard(
            title: 'Report',
            child: Text(
              detail.reportBody!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
        if (!detail.paymentRequired &&
            detail.findings == null &&
            detail.impression == null &&
            detail.recommendations == null &&
            detail.reportBody == null &&
            detail.images.isEmpty &&
            !detail.status.isComplete) ...[
          const Gap(AppDesignTokens.spacingMd),
          _SectionCard(
            title: 'Report',
            child: Text(
              'Your imaging report is not available yet. Check back once '
              'processing is complete.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
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
    final colorScheme = context.colorScheme;

    return _SectionCard(
      title: 'Imaging report',
      trailing: RadiologyStatusBadge(status: detail.status),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            detail.displayTitle,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(AppDesignTokens.spacingXs),
          Text(
            DateFormatter.fullDate(detail.performedAt),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap(AppDesignTokens.spacingSm),
          Text(
            detail.radiologistName,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const Gap(AppDesignTokens.spacingMd),
          _LabelValueList(
            rows: [
              ('Referring doctor', detail.referringDoctorName),
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
          foregroundColor: Theme.of(context).colorScheme.primary,
          side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDesignTokens.spacingMd,
            vertical: AppDesignTokens.spacingSm + 4,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDesignTokens.radiusSm),
          ),
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.child, this.trailing});

  final String title;
  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
        border: Border.all(color: colorScheme.outlineVariant),
        boxShadow: context.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
          const Gap(AppDesignTokens.spacingMd),
          child,
        ],
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
    final colorScheme = context.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final (label, value) in rows) ...[
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap(AppDesignTokens.spacingXs),
          Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          if ((label, value) != rows.last) const Gap(AppDesignTokens.spacingSm),
        ],
      ],
    );
  }
}
