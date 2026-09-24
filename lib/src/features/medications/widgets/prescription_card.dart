import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../models/medication_model.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_semantic_badge.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';

class PrescriptionCard extends ConsumerWidget {
  const PrescriptionCard({
    super.key,
    required this.prescription,
  });

  final ActivePrescriptionSummary prescription;

  static const _lowSupplyThreshold = 7;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isLow = prescription.supplyStatus == PrescriptionSupplyStatus.low ||
        prescription.daysRemaining <= _lowSupplyThreshold;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ImshSurfaceCard(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImshSolidIcon(
              icon: Icons.medication_outlined,
              color: isLow ? ImshAccentColors.amber : ImshAccentColors.teal,
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
                    text: prescription.displayName,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(4),
                  ImshEllipsisText(
                    text:
                        '${prescription.frequencyLabel} · ${prescription.daysRemaining} days left',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: isLow
                          ? colorScheme.error
                          : colorScheme.onSurfaceVariant,
                      fontWeight: isLow ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                  const Gap(8),
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppDesignTokens.radiusSm),
                    child: LinearProgressIndicator(
                      value: prescription.supplyProgress.clamp(0.0, 1.0),
                      minHeight: 6,
                      backgroundColor: colorScheme.surfaceContainer,
                      color: isLow
                          ? ImshAccentColors.amber
                          : ImshAccentColors.teal,
                    ),
                  ),
                  const Gap(6),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${prescription.refillsRemaining} refills remaining',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      if (isLow)
                        const ImshEllipsisChip(
                          label: 'Low supply',
                          tone: ImshSemanticTone.warning,
                          maxWidth: 100,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
