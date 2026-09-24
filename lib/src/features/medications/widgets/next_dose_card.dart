import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/app_timezone.dart';
import '../../../models/medication_model.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';

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
    return DateFormat('h:mm a').format(AppTimezone.toLocal(date));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final displayName = '${dose.drugName} ${dose.dosage}';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDesignTokens.spacingXs),
      child: ImshSurfaceCard(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const ImshSolidIcon(
                  icon: Icons.schedule_outlined,
                  color: ImshAccentColors.teal,
                  size: 28,
                  iconSize: 15,
                  radius: 7,
                ),
                const Gap(8),
                Expanded(
                  child: ImshEllipsisText(
                    text: 'Next dose at ${_formatTime(dose.scheduledAt)}',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: cs.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(10),
            ImshEllipsisText(
              text: displayName,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            if (dose.instructions?.isNotEmpty == true) ...[
              const Gap(6),
              Text(
                dose.instructions!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: cs.onSurfaceVariant,
                ),
              ),
            ],
            const Gap(12),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: isMarking ? null : onMarkTaken,
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(AppDesignTokens.radiusMd),
                  ),
                ),
                icon: isMarking
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.check_circle_outline, size: 20),
                label: Text(isMarking ? 'Saving…' : 'Mark as Taken'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
