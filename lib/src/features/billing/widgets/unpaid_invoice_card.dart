import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/app_timezone.dart';
import '../../../helper/currency_formatter.dart';
import '../../../models/invoice_model.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_semantic_badge.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';

class UnpaidInvoiceCard extends StatelessWidget {
  const UnpaidInvoiceCard({
    super.key,
    required this.invoice,
    required this.onTap,
    required this.onReceiptTap,
  });

  final InvoiceSummary invoice;
  final VoidCallback onTap;
  final VoidCallback onReceiptTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final issuedLocal = AppTimezone.toLocal(invoice.issuedAt);
    final dateLabel = DateFormat('MMM d, yyyy').format(issuedLocal);
    final accent = _accentForInvoice(invoice);

    return ImshSurfaceCard(
      onTap: onTap,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          ImshSolidIcon(
            icon: _iconForInvoice(invoice),
            color: accent,
            size: 36,
            iconSize: 18,
            radius: AppDesignTokens.radiusMd,
          ),
          const Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImshEllipsisText(
                  text: invoice.title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(2),
                ImshEllipsisText(
                  text: 'Inv #${invoice.invoiceNumber} · $dateLabel',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
                const Gap(6),
                Row(
                  children: [
                    Text(
                      CurrencyFormatter.formatAmount(invoice.balance),
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Gap(8),
                    ImshEllipsisChip(
                      label: invoice.status.isUnpaid
                          ? 'Unpaid'
                          : invoice.status.label,
                      tone: invoice.status.isUnpaid
                          ? ImshSemanticTone.error
                          : ImshSemanticTone.info,
                      maxWidth: 100,
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            tooltip: 'View bill',
            onPressed: onReceiptTap,
            icon: const ImshSolidIcon(
              icon: Icons.receipt_long_outlined,
              color: ImshAccentColors.indigo,
              size: 32,
              iconSize: 16,
              radius: 8,
            ),
          ),
        ],
      ),
    );
  }

  Color _accentForInvoice(InvoiceSummary invoice) {
    final title = invoice.title.toLowerCase();
    if (title.contains('lab') || title.contains('panel')) {
      return ImshAccentColors.blue;
    }
    if (title.contains('pharmacy') || title.contains('medication')) {
      return ImshAccentColors.teal;
    }
    if (invoice.billType == BillType.inpatient) {
      return ImshAccentColors.purple;
    }
    return ImshAccentColors.amber;
  }

  IconData _iconForInvoice(InvoiceSummary invoice) {
    final title = invoice.title.toLowerCase();
    if (title.contains('lab') || title.contains('panel')) {
      return Icons.biotech_outlined;
    }
    if (title.contains('pharmacy') || title.contains('medication')) {
      return Icons.medication_outlined;
    }
    if (invoice.billType == BillType.inpatient) {
      return Icons.local_hospital_outlined;
    }
    return Icons.medical_services_outlined;
  }
}
