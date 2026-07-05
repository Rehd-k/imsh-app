import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../helper/app_timezone.dart';
import '../../../helper/currency_formatter.dart';
import '../../../models/invoice_model.dart';

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
    final colorScheme = theme.colorScheme;
    final issuedLocal = AppTimezone.toLocal(invoice.issuedAt);
    final dateLabel = DateFormat('MMM d, yyyy').format(issuedLocal);

    return Material(
      color: colorScheme.surfaceContainerLowest,
      borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
        child: Container(
          padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
            border: Border.all(color: colorScheme.outlineVariant),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: context.imshTheme.primaryHighlight
                      .withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(AppDesignTokens.radiusSm),
                ),
                child: Icon(
                  _iconForInvoice(invoice),
                  color: colorScheme.primary,
                  size: 22,
                ),
              ),
              const Gap(AppDesignTokens.spacingMd),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      invoice.title,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Gap(AppDesignTokens.spacingXs),
                    Text(
                      'Inv #${invoice.invoiceNumber} • $dateLabel',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const Gap(AppDesignTokens.spacingSm),
                    Row(
                      children: [
                        Text(
                          CurrencyFormatter.formatAmount(invoice.balance),
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Gap(AppDesignTokens.spacingSm),
                        _StatusBadge(status: invoice.status),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onReceiptTap,
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: context.imshTheme.primaryHighlight
                        .withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.receipt_long_outlined,
                    size: 20,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final InvoiceStatus status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isUnpaid = status.isUnpaid;
    final label = isUnpaid ? 'UNPAID' : status.label.toUpperCase();
    final color = isUnpaid ? colorScheme.error : colorScheme.primary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}
