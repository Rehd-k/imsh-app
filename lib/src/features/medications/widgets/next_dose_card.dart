import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../helper/app_timezone.dart';
import '../../../models/medication_model.dart';

class NextDoseCard extends StatelessWidget {
  const NextDoseCard({
    super.key,
    required this.dose,
    required this.onMarkTaken,
    required this.isMarking,
  });

  final MedicationDoseSummary dose;
  final VoidCallback onMarkTaken;
  final bool isMarking;

  String _formatTime(DateTime date) {
    return DateFormat('h:mm a')
        .format(AppTimezone.toLocal(date))
        .toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final displayName = '${dose.drugName} ${dose.dosage}';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDesignTokens.spacingXs),
      padding: const EdgeInsets.all(AppDesignTokens.spacingLg),
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
        boxShadow: context.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.schedule_outlined,
                size: 16,
                color: colorScheme.onPrimary.withValues(alpha: 0.85),
              ),
              const Gap(AppDesignTokens.spacingSm),
              Text(
                'NEXT DOSE AT ${_formatTime(dose.scheduledAt)}',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onPrimary.withValues(alpha: 0.85),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6,
                ),
              ),
            ],
          ),
          const Gap(AppDesignTokens.spacingMd),
          Text(
            displayName,
            style: theme.textTheme.titleLarge?.copyWith(
              color: colorScheme.onPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (dose.instructions?.isNotEmpty == true) ...[
            const Gap(AppDesignTokens.spacingSm),
            Text(
              dose.instructions!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onPrimary.withValues(alpha: 0.9),
              ),
            ),
          ],
          const Gap(AppDesignTokens.spacingLg),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: isMarking ? null : onMarkTaken,
              style: FilledButton.styleFrom(
                backgroundColor: colorScheme.onPrimary,
                foregroundColor: colorScheme.primary,
                disabledBackgroundColor:
                    colorScheme.onPrimary.withValues(alpha: 0.7),
                padding: const EdgeInsets.symmetric(
                  vertical: AppDesignTokens.spacingMd,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
                ),
              ),
              icon: isMarking
                  ? SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: colorScheme.primary.withValues(alpha: 0.7),
                      ),
                    )
                  : const Icon(Icons.check_circle_outline, size: 20),
              label: Text(isMarking ? 'Saving...' : 'Mark as Taken'),
            ),
          ),
        ],
      ),
    );
  }
}
