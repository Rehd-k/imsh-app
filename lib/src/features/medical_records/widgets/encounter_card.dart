import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/medical_record_model.dart';
import 'encounter_status_badge.dart';

class EncounterCard extends StatelessWidget {
  const EncounterCard({
    super.key,
    required this.encounter,
    required this.onTap,
  });

  final EncounterSummary encounter;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppDesignTokens.spacingMd),
      child: Material(
        color: colorScheme.surfaceContainerLowest,
        elevation: 0,
        shadowColor: Colors.black.withValues(alpha: 0.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
          side: BorderSide(color: colorScheme.outlineVariant),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
              boxShadow: context.cardShadow,
            ),
            padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            encounter.encounterType.label,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const Gap(AppDesignTokens.spacingXs),
                          Text(
                            DateFormatter.medicalDate(encounter.startTime),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    EncounterStatusBadge(status: encounter.status),
                  ],
                ),
                const Gap(AppDesignTokens.spacingSm),
                Text(
                  encounter.doctorName,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (encounter.chiefComplaint?.isNotEmpty == true) ...[
                  const Gap(AppDesignTokens.spacingXs),
                  Text(
                    encounter.chiefComplaint!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                if (encounter.primaryDiagnosis?.isNotEmpty == true) ...[
                  const Gap(AppDesignTokens.spacingSm),
                  Text(
                    encounter.primaryDiagnosis!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.primaryContainer,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
