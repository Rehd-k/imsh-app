import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';

/// Compact pay / breakdown actions under the billing KPI strip.
class OutstandingBalanceCard extends StatelessWidget {
  const OutstandingBalanceCard({
    super.key,
    required this.totalOutstanding,
    required this.onPayNow,
    required this.onViewBreakdown,
  });

  final String totalOutstanding;
  final VoidCallback onPayNow;
  final VoidCallback onViewBreakdown;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final hasBalance = (double.tryParse(totalOutstanding) ?? 0) > 0;

    return ImshSurfaceCard(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              ImshSolidIcon(
                icon: hasBalance
                    ? Icons.payments_outlined
                    : Icons.check_circle_outline,
                color: hasBalance
                    ? ImshAccentColors.amber
                    : ImshAccentColors.green,
                size: 34,
                iconSize: 18,
                radius: AppDesignTokens.radiusMd,
              ),
              const Gap(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hasBalance
                          ? 'Settle outstanding balance'
                          : 'Nothing due',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      hasBalance
                          ? 'Pay at the desk or view bill breakdown.'
                          : 'You have no outstanding hospital bills.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: cs.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (hasBalance) ...[
            const Gap(10),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onViewBreakdown,
                    child: const Text('Breakdown'),
                  ),
                ),
                const Gap(8),
                Expanded(
                  child: FilledButton(
                    onPressed: onPayNow,
                    child: const Text('Pay now'),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
