import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../helper/app_timezone.dart';
import '../../../helper/currency_formatter.dart';
import '../../../models/invoice_model.dart';
import 'breakdown_category_section.dart';

class BillDetailBody extends StatelessWidget {
  const BillDetailBody({super.key, required this.detail});

  final InvoiceDetail detail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final issuedLocal = AppTimezone.toLocal(detail.issuedAt);
    final dateLabel = DateFormat('MMM d, yyyy').format(issuedLocal);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          detail.titleLabel,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const Gap(AppDesignTokens.spacingXs),
        Text(
          'Invoice #${detail.invoiceNumber} • $dateLabel',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const Gap(AppDesignTokens.spacingLg),
        _SummaryCard(detail: detail),
        if (detail.admission != null) ...[
          const Gap(AppDesignTokens.spacingMd),
          _AdmissionCard(admission: detail.admission!),
        ],
        const Gap(AppDesignTokens.spacingLg),
        Text(
          'Charge Breakdown',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const Gap(AppDesignTokens.spacingMd),
        if (detail.breakdown.isEmpty)
          Text(
            'No line items on this bill.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          )
        else
          ...detail.breakdown.map(
            (category) => BreakdownCategorySection(category: category),
          ),
        if (detail.payments.isNotEmpty) ...[
          const Gap(AppDesignTokens.spacingLg),
          Text(
            'Payments on this bill',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const Gap(AppDesignTokens.spacingSm),
          ...detail.payments.map(
            (payment) => ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(payment.methodLabel),
              subtitle: Text(
                DateFormat('MMM d, yyyy').format(
                  AppTimezone.toLocal(payment.paidAt),
                ),
              ),
              trailing: Text(
                CurrencyFormatter.formatAmount(payment.amount),
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

extension on InvoiceDetail {
  String get titleLabel {
    if (billType == BillType.inpatient && admission != null) {
      return 'Inpatient Stay — ${admission!.wardName}';
    }
    final firstCategory =
        breakdown.isNotEmpty ? breakdown.first : null;
    final firstItem = firstCategory != null && firstCategory.items.isNotEmpty
        ? firstCategory.items.first
        : null;
    if (firstItem != null) return firstItem.description;
    return 'Hospital Bill';
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.detail});

  final InvoiceDetail detail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
      ),
      child: Column(
        children: [
          _SummaryRow(
            label: 'Total',
            value: CurrencyFormatter.formatAmount(detail.totalAmount),
          ),
          const Gap(AppDesignTokens.spacingSm),
          _SummaryRow(
            label: 'Paid',
            value: CurrencyFormatter.formatAmount(detail.amountPaid),
          ),
          const Divider(height: 20),
          _SummaryRow(
            label: 'Balance due',
            value: CurrencyFormatter.formatAmount(detail.balance),
            emphasize: true,
            valueColor: detail.balance != '0.00'
                ? theme.colorScheme.error
                : colorScheme.onSurface,
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    this.emphasize = false,
    this.valueColor,
  });

  final String label;
  final String value;
  final bool emphasize;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: emphasize ? FontWeight.w600 : null,
            ),
          ),
        ),
        Text(
          value,
          style: (emphasize
                  ? theme.textTheme.titleMedium
                  : theme.textTheme.bodyLarge)
              ?.copyWith(
            fontWeight: FontWeight.w700,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}

class _AdmissionCard extends StatelessWidget {
  const _AdmissionCard({required this.admission});

  final PatientAdmissionSummary admission;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final admitted = DateFormat('MMM d, yyyy').format(
      AppTimezone.toLocal(admission.admittedAt),
    );
    final discharged = admission.dischargedAt != null
        ? DateFormat('MMM d, yyyy').format(
            AppTimezone.toLocal(admission.dischargedAt!),
          )
        : 'Active stay';

    return Container(
      padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            admission.wardName,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const Gap(4),
          Text(
            'Admitted $admitted • $discharged',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
