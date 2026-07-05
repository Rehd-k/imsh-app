import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/lab_result_model.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _HeaderCard(detail: detail, summaryStatus: _summaryStatus),
        if (detail.pdfUrl?.isNotEmpty == true) ...[
          const Gap(AppDesignTokens.spacingMd),
          _PdfActionButton(pdfUrl: detail.pdfUrl!),
        ],
        for (final panel in detail.panels) ...[
          const Gap(AppDesignTokens.spacingMd),
          _PanelSection(panel: panel),
        ],
        if (detail.panels.isEmpty) ...[
          const Gap(AppDesignTokens.spacingMd),
          const _PendingResultsCard(),
        ],
      ],
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({
    required this.detail,
    required this.summaryStatus,
  });

  final LabResultDetail detail;
  final LabSummaryStatus summaryStatus;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;
    final testNames = detail.panels.map((p) => p.testName).toList();

    return _SectionCard(
      title: 'Lab order',
      trailing: LabResultStatusBadge(
        status: summaryStatus,
        orderStatus: detail.status,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (testNames.isNotEmpty)
            Text(
              testNames.join(', '),
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            )
          else
            Text(
              'Laboratory test',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          const Gap(AppDesignTokens.spacingXs),
          Text(
            DateFormatter.fullDate(detail.orderedAt),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap(AppDesignTokens.spacingSm),
          Text(
            detail.doctorName,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const Gap(AppDesignTokens.spacingMd),
          _LabelValueList(rows: [
            ('Order status', detail.status.label),
            if (detail.completedAt != null)
              ('Completed', DateFormatter.dateTime(detail.completedAt!)),
            if (detail.verifiedAt != null)
              ('Verified', DateFormatter.dateTime(detail.verifiedAt!)),
          ]),
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
    return _SectionCard(
      title: panel.testName,
      child: panel.results.isEmpty
          ? Text(
              'Results pending',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
            )
          : Column(
              children: [
                for (final line in panel.results)
                  LabResultValueRow(line: line),
              ],
            ),
    );
  }
}

class _PendingResultsCard extends StatelessWidget {
  const _PendingResultsCard();

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: 'Results',
      child: Text(
        'Your test results are not available yet. Check back once processing is complete.',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
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
  const _SectionCard({
    required this.title,
    required this.child,
    this.trailing,
  });

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
          if ((label, value) != rows.last)
            const Gap(AppDesignTokens.spacingSm),
        ],
      ],
    );
  }
}
