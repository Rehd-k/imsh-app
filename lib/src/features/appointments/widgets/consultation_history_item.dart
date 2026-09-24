import 'package:flutter/material.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/appointment_model.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_semantic_badge.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';

ImshSemanticTone consultationResultTone(ConsultationResultStatus status) {
  return switch (status) {
    ConsultationResultStatus.normal => ImshSemanticTone.info,
    ConsultationResultStatus.completed => ImshSemanticTone.neutral,
    ConsultationResultStatus.abnormal => ImshSemanticTone.error,
    ConsultationResultStatus.pending => ImshSemanticTone.warning,
  };
}

class ConsultationResultBadge extends StatelessWidget {
  const ConsultationResultBadge({super.key, required this.status});

  final ConsultationResultStatus status;

  @override
  Widget build(BuildContext context) {
    return ImshEllipsisChip(
      label: status.label,
      tone: consultationResultTone(status),
      maxWidth: 110,
    );
  }
}

class ConsultationHistoryTile extends StatelessWidget {
  const ConsultationHistoryTile({
    super.key,
    required this.item,
    required this.onTap,
  });

  final ConsultationHistoryItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final subtitle = item.subtitleLine;
    final dateLabel = DateFormatter.medicalDate(item.visitedAt);
    final meta = subtitle.isNotEmpty ? '$subtitle · $dateLabel' : dateLabel;

    return ImshSurfaceCard(
      padding: const EdgeInsets.all(10),
      onTap: onTap,
      child: Row(
        children: [
          ImshSolidIcon(
            icon: _iconForTitle(item.title),
            color: ImshAccentColors.blue,
            size: 34,
            iconSize: 18,
            radius: AppDesignTokens.radiusMd,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImshEllipsisText(
                  text: item.title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                ImshEllipsisText(
                  text: meta,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ConsultationResultBadge(status: item.resultStatus),
          Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
        ],
      ),
    );
  }

  IconData _iconForTitle(String title) {
    final lower = title.toLowerCase();
    if (lower.contains('lab')) return Icons.biotech_outlined;
    if (lower.contains('checkup') || lower.contains('general')) {
      return Icons.medical_information_outlined;
    }
    return Icons.assignment_outlined;
  }
}
