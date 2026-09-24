import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:imsh/app_router.gr.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/app_timezone.dart';
import '../../../models/medication_model.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';

class HomeMedicationsSection extends StatelessWidget {
  const HomeMedicationsSection({
    super.key,
    required this.nextDoses,
    required this.todaySchedule,
  });

  final List<MedicationDoseSummary> nextDoses;
  final List<MedicationScheduleEntry> todaySchedule;

  bool get _hasContent => nextDoses.isNotEmpty || todaySchedule.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    if (!_hasContent) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final previewDose = nextDoses.isNotEmpty ? nextDoses.first : null;
    final previewSchedule = todaySchedule.take(2).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const ImshSolidIcon(
              icon: Icons.medication_outlined,
              color: ImshAccentColors.teal,
              size: 26,
              iconSize: 14,
              radius: 7,
            ),
            const SizedBox(width: 8),
            Text(
              'Medications',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () => context.router.push(const MedicationsRoute()),
              child: const Text('View all'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (previewDose != null) ...[
          ImshSurfaceCard(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const ImshSolidIcon(
                  icon: Icons.schedule_outlined,
                  color: ImshAccentColors.indigo,
                  size: 30,
                  iconSize: 16,
                  radius: 8,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Next dose',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: cs.onSurfaceVariant,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      ImshEllipsisText(
                        text: '${previewDose.drugName} ${previewDose.dosage}',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      ImshEllipsisText(
                        text:
                            '${_formatTime(previewDose.scheduledAt)} · ${previewDose.instructions}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (previewSchedule.isNotEmpty) const SizedBox(height: 8),
        ],
        for (var i = 0; i < previewSchedule.length; i++) ...[
          if (i > 0) const SizedBox(height: 6),
          _SchedulePreviewRow(entry: previewSchedule[i]),
        ],
      ],
    );
  }

  String _formatTime(DateTime date) {
    return DateFormat('h:mm a').format(AppTimezone.toLocal(date));
  }
}

class _SchedulePreviewRow extends StatelessWidget {
  const _SchedulePreviewRow({required this.entry});

  final MedicationScheduleEntry entry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final isTaken = entry.status == MedicationDoseStatus.taken;

    return ImshSurfaceCard(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          ImshSolidIcon(
            icon: isTaken ? Icons.check_circle_outline : Icons.schedule_outlined,
            color: isTaken ? ImshAccentColors.green : ImshAccentColors.blue,
            size: 28,
            iconSize: 15,
            radius: 7,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ImshEllipsisText(
              text: '${entry.drugName} ${entry.dosage}',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            entry.timeOfDay.label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: cs.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
