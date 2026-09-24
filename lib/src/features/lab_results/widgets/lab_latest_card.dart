import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:imsh/app_router.gr.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/lab_result_model.dart';
import '../../../providers/lab_results_provider.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_semantic_badge.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';
import 'lab_result_status_badge.dart';

class LabLatestCard extends StatelessWidget {
  const LabLatestCard({
    super.key,
    required this.result,
  });

  final LabResultSummary result;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final pending = isLabOrderPending(result);

    return ImshSurfaceCard(
      padding: const EdgeInsets.all(12),
      onTap: () => context.router.push(LabResultDetailRoute(id: result.id)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImshSolidIcon(
                icon: pending
                    ? Icons.hourglass_empty_outlined
                    : Icons.science_outlined,
                color: pending ? ImshAccentColors.amber : ImshAccentColors.teal,
                size: 34,
                iconSize: 18,
                radius: AppDesignTokens.radiusMd,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ImshEllipsisChip(
                      label: 'Latest result',
                      tone: ImshSemanticTone.info,
                      maxWidth: 120,
                    ),
                    const SizedBox(height: 4),
                    ImshEllipsisText(
                      text: result.displayTitle,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              LabResultStatusBadge(
                status: result.summaryStatus,
                orderStatus: result.status,
              ),
            ],
          ),
          const SizedBox(height: 10),
          ImshEllipsisText(
            text: 'Requested: ${DateFormatter.medicalDate(result.orderedAt)}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: cs.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 4),
          ImshEllipsisText(
            text: 'Summary: ${result.summaryMessage}',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () =>
                  context.router.push(LabResultDetailRoute(id: result.id)),
              style: TextButton.styleFrom(
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(pending ? 'View status' : 'View details'),
            ),
          ),
        ],
      ),
    );
  }
}
