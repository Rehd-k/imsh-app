import 'package:flutter/material.dart';

import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/medical_record_model.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';
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
    final cs = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ImshSurfaceCard(
        padding: const EdgeInsets.all(10),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ImshSolidIcon(
                  icon: Icons.folder_shared_outlined,
                  color: ImshAccentColors.blue,
                  size: 32,
                  iconSize: 16,
                  radius: 8,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImshEllipsisText(
                        text: encounter.encounterType.label,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: cs.onSurface,
                        ),
                      ),
                      const SizedBox(height: 2),
                      ImshEllipsisText(
                        text: DateFormatter.medicalDate(encounter.startTime),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                EncounterStatusBadge(status: encounter.status),
              ],
            ),
            const SizedBox(height: 8),
            ImshEllipsisText(
              text: encounter.doctorName,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            if (encounter.chiefComplaint?.isNotEmpty == true) ...[
              const SizedBox(height: 4),
              Text(
                encounter.chiefComplaint!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: cs.onSurfaceVariant,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            if (encounter.primaryDiagnosis?.isNotEmpty == true) ...[
              const SizedBox(height: 6),
              ImshEllipsisText(
                text: encounter.primaryDiagnosis!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: ImshAccentColors.indigo,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
