import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:imsh/app_router.gr.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/lab_result_model.dart';
import '../../../providers/lab_results_provider.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';
import 'lab_result_status_badge.dart';

class LabHistoryCard extends StatelessWidget {
  const LabHistoryCard({
    super.key,
    required this.result,
  });

  final LabResultSummary result;

  (IconData, Color) _iconForTest() {
    final name = result.testNames.join(' ').toLowerCase();
    if (name.contains('x-ray') ||
        name.contains('xray') ||
        name.contains('chest') ||
        name.contains('radiograph')) {
      return (Icons.monitor_heart_outlined, ImshAccentColors.indigo);
    }
    if (name.contains('thyroid') ||
        name.contains('tft') ||
        name.contains('micro')) {
      return (Icons.biotech_outlined, ImshAccentColors.purple);
    }
    if (name.contains('blood') ||
        name.contains('cbc') ||
        name.contains('lipid') ||
        name.contains('hemoglobin')) {
      return (Icons.water_drop_outlined, ImshAccentColors.pink);
    }
    return (Icons.science_outlined, ImshAccentColors.teal);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final pending = isLabOrderPending(result);
    final (icon, accent) = _iconForTest();

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ImshSurfaceCard(
        padding: const EdgeInsets.all(10),
        onTap: () => context.router.push(LabResultDetailRoute(id: result.id)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImshSolidIcon(
              icon: pending ? Icons.hourglass_empty_outlined : icon,
              color: pending ? ImshAccentColors.amber : accent,
              size: 34,
              iconSize: 18,
              radius: AppDesignTokens.radiusMd,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ImshEllipsisText(
                          text: result.displayTitle,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      LabResultStatusBadge(
                        status: result.summaryStatus,
                        orderStatus: result.status,
                      ),
                    ],
                  ),
                  if (result.additionalTestsLabel != null) ...[
                    const SizedBox(height: 2),
                    ImshEllipsisText(
                      text: result.additionalTestsLabel!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: ImshAccentColors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                  const SizedBox(height: 2),
                  ImshEllipsisText(
                    text:
                        '${DateFormatter.medicalDate(result.orderedAt)} · Ref: ${result.referenceDisplay}',
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
    );
  }
}
