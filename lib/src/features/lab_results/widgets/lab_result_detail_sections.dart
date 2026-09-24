import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/lab_result_model.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_page_header.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';
import 'lab_result_status_badge.dart';
import 'lab_result_value_row.dart';

class LabResultDetailSections extends StatelessWidget {
  const LabResultDetailSections({super.key, required this.detail});

  final LabResultDetail detail;

  LabSummaryStatus get _summaryStatus {
    for (final panel in detail.panels) {
      for (final line in panel.results) {
        if (line.isCritical) return LabSummaryStatus.critical;
        if (line.abnormalFlag != null) return LabSummaryStatus.abnormal;
      }
    }
    if (detail.status == LabOrderStatus.pending ||
        detail.status == LabOrderStatus.sampleCollected ||
        detail.status == LabOrderStatus.processing) {
      return LabSummaryStatus.pending;
    }
    if (detail.panels.isEmpty) return LabSummaryStatus.pending;
    return LabSummaryStatus.normal;
  }

  @override
  Widget build(BuildContext context) {
    final testNames = detail.panels.map((p) => p.testName).toList();
    final title = testNames.isEmpty ? 'Laboratory test' : testNames.join(', ');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ImshPageHeader(
          title: title,
          subtitle: DateFormatter.fullDate(detail.orderedAt),
          icon: Icons.science_outlined,
          iconColor: ImshAccentColors.teal,
          trailing: LabResultStatusBadge(
            status: _summaryStatus,
            orderStatus: detail.status,
          ),
        ),
        const SizedBox(height: 12),
        _HeaderCard(detail: detail),
        if (detail.pdfUrl?.isNotEmpty == true) ...[
          const SizedBox(height: 10),
          _PdfActionButton(pdfUrl: detail.pdfUrl!),
        ],
        for (final panel in detail.panels) ...[
          const SizedBox(height: 10),
          _PanelSection(panel: panel),
        ],
        if (detail.panels.isEmpty) ...[
          const SizedBox(height: 10),
          const _PendingResultsCard(),
        ],
      ],
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({required this.detail});

  final LabResultDetail detail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final doctor = detail.doctorName.trim().isEmpty ? '—' : detail.doctorName;

    return ImshSurfaceCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImshSectionHeader(
            title: 'Lab order',
            icon: Icons.assignment_outlined,
            iconColor: ImshAccentColors.indigo,
          ),
          const SizedBox(height: 10),
          ImshEllipsisText(
            text: doctor,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          _LabelValueList(
            rows: [
              ('Order status', detail.status.label),
              if (detail.completedAt != null)
                ('Completed', DateFormatter.dateTime(detail.completedAt!)),
              if (detail.verifiedAt != null)
                ('Verified', DateFormatter.dateTime(detail.verifiedAt!)),
            ],
          ),
        ],
      ),
    );
  }
}

class _PanelSection extends StatelessWidget {
  const _PanelSection({required this.panel});

  final LabResultPanel panel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return ImshSurfaceCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImshSectionHeader(
            title: panel.testName.trim().isEmpty ? '—' : panel.testName,
            icon: Icons.biotech_outlined,
            iconColor: ImshAccentColors.purple,
          ),
          const SizedBox(height: 10),
          if (panel.results.isEmpty)
            Text(
              'Results pending',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: cs.onSurfaceVariant,
              ),
            )
          else
            for (final line in panel.results) LabResultValueRow(line: line),
        ],
      ),
    );
  }
}

class _PendingResultsCard extends StatelessWidget {
  const _PendingResultsCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return ImshSurfaceCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ImshSectionHeader(
            title: 'Results',
            icon: Icons.hourglass_empty_outlined,
            iconColor: ImshAccentColors.amber,
          ),
          const SizedBox(height: 10),
          Text(
            'Your test results are not available yet. Check back once '
            'processing is complete.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: cs.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _PdfActionButton extends StatelessWidget {
  const _PdfActionButton({required this.pdfUrl});

  final String pdfUrl;

  Future<void> _openPdf(BuildContext context) async {
    final uri = Uri.tryParse(pdfUrl);
    if (uri == null) return;
    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!launched && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open report PDF')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () => _openPdf(context),
        icon: const Icon(Icons.picture_as_pdf_outlined),
        label: const Text('Download PDF report'),
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
