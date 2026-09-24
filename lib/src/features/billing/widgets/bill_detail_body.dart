import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/app_timezone.dart';
import '../../../helper/currency_formatter.dart';
import '../../../models/invoice_model.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_page_header.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';
import 'breakdown_category_section.dart';

class BillDetailBody extends StatelessWidget {
  const BillDetailBody({super.key, required this.detail});

  final InvoiceDetail detail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final issuedLocal = AppTimezone.toLocal(detail.issuedAt);
    final dateLabel = DateFormat('MMM d, yyyy').format(issuedLocal);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ImshPageHeader(
          title: detail.titleLabel,
          subtitle: 'Invoice #${detail.invoiceNumber} · $dateLabel',
          icon: Icons.receipt_long_outlined,
          iconColor: ImshAccentColors.amber,
        ),
        const Gap(12),
        _SummaryCard(detail: detail),
        if (detail.admission != null) ...[
          const Gap(10),
          _AdmissionCard(admission: detail.admission!),
        ],
        const Gap(12),
        const ImshSectionHeader(
          title: 'Charge breakdown',
          icon: Icons.list_alt_outlined,
          iconColor: ImshAccentColors.indigo,
        ),
        const Gap(10),
        if (detail.breakdown.isEmpty)
          Text(
            'No line items on this bill.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: cs.onSurfaceVariant,
            ),
          )
        else
          ...detail.breakdown.map(
            (category) => BreakdownCategorySection(category: category),
          ),
        if (detail.payments.isNotEmpty) ...[
          const Gap(12),
          const ImshSectionHeader(
            title: 'Payments on this bill',
            icon: Icons.payments_outlined,
            iconColor: ImshAccentColors.green,
          ),
          const Gap(10),
          ImshSurfaceCard(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Column(
              children: detail.payments
                  .map(
                    (payment) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const ImshSolidIcon(
                        icon: Icons.payments_outlined,
                        color: ImshAccentColors.green,
                        size: 30,
                        iconSize: 16,
                        radius: 8,
                      ),
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
                  )
                  .toList(),
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
    final firstCategory = breakdown.isNotEmpty ? breakdown.first : null;
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
    final cs = theme.colorScheme;
    final hasBalance = detail.balance != '0.00';

    return ImshSurfaceCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          _SummaryRow(
            label: 'Total',
            value: CurrencyFormatter.formatAmount(detail.totalAmount),
          ),
          const Gap(8),
          _SummaryRow(
            label: 'Paid',
            value: CurrencyFormatter.formatAmount(detail.amountPaid),
          ),
          const Divider(height: 20),
          _SummaryRow(
            label: 'Balance due',
            value: CurrencyFormatter.formatAmount(detail.balance),
            emphasize: true,
            valueColor: hasBalance ? cs.error : cs.onSurface,
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
    final cs = theme.colorScheme;

    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: cs.onSurfaceVariant,
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
    final cs = theme.colorScheme;
    final admitted = DateFormat('MMM d, yyyy').format(
      AppTimezone.toLocal(admission.admittedAt),
    );
    final discharged = admission.dischargedAt != null
        ? DateFormat('MMM d, yyyy').format(
            AppTimezone.toLocal(admission.dischargedAt!),
          )
        : 'Active stay';

    return ImshSurfaceCard(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const ImshSolidIcon(
            icon: Icons.local_hospital_outlined,
            color: ImshAccentColors.purple,
            size: 34,
            iconSize: 18,
            radius: AppDesignTokens.radiusMd,
          ),
          const Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImshEllipsisText(
                  text: admission.wardName,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(2),
                Text(
                  'Admitted $admitted · $discharged',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
