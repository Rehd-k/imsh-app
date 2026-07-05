import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../models/medication_model.dart';
import 'prescription_card.dart';

class ActivePrescriptionsSection extends StatelessWidget {
  const ActivePrescriptionsSection({
    super.key,
    required this.prescriptions,
  });

  final List<ActivePrescriptionSummary> prescriptions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (prescriptions.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Active Prescriptions',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const Gap(AppDesignTokens.spacingMd),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppDesignTokens.spacingLg),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
            ),
            child: Text(
              'No active medications.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Active Prescriptions',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () =>
                  context.router.push(const MedicationsHistoryRoute()),
              child: const Text('History >'),
            ),
          ],
        ),
        const Gap(AppDesignTokens.spacingSm),
        for (final prescription in prescriptions)
          PrescriptionCard(prescription: prescription),
      ],
    );
  }
}
