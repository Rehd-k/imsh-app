import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/app_timezone.dart';
import '../../../helper/currency_formatter.dart';
import '../../../models/invoice_model.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_semantic_badge.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';

class PaymentHistoryRow extends StatelessWidget {
  const PaymentHistoryRow({
    super.key,
    required this.payment,
    required this.onTap,
  });

  final PaymentHistoryItem payment;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final paidLocal = AppTimezone.toLocal(payment.paidAt);
    final dateLabel = DateFormat('MMM d, yyyy').format(paidLocal);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 88,
              child: Text(
                dateLabel,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: cs.onSurfaceVariant,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImshEllipsisText(
                    text: payment.description,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(2),
                  ImshEllipsisText(
                    text: payment.methodDetail,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  CurrencyFormatter.formatAmount(payment.amount),
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(4),
                ImshEllipsisChip(
                  label: payment.status.trim().isEmpty ? '—' : payment.status,
                  tone: ImshSemanticTone.success,
                  maxWidth: 90,
                ),
              ],
            ),
            const Gap(4),
            const ImshSolidIcon(
              icon: Icons.chevron_right,
              color: ImshAccentColors.indigo,
              size: 24,
              iconSize: 14,
              radius: 6,
            ),
          ],
        ),
      ),
    );
  }
}
