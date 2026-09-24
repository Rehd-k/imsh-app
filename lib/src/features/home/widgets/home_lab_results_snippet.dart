import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:imsh/app_router.gr.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../models/medical_records_dashboard_model.dart';
import '../../../shared/widgets/imsh_semantic_badge.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';

class HomeLabResultsSnippet extends StatelessWidget {
  const HomeLabResultsSnippet({
    super.key,
    required this.results,
    this.onViewTrends,
  });

  final List<DashboardLabResult> results;
  final VoidCallback? onViewTrends;

  @override
  Widget build(BuildContext context) {
    if (results.isEmpty) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const ImshSolidIcon(
              icon: Icons.science_outlined,
              color: ImshAccentColors.blue,
              size: 26,
              iconSize: 14,
              radius: 7,
            ),
            const SizedBox(width: 8),
            Text(
              'Recent lab results',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const Spacer(),
            if (onViewTrends != null)
              TextButton(
                onPressed: onViewTrends,
                child: const Text('Trends'),
              ),
          ],
        ),
        const SizedBox(height: 8),
        for (var i = 0; i < results.length; i++) ...[
          if (i > 0) const SizedBox(height: 6),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
              onTap: () {
                final name = results[i].testName.trim();
                if (name.isNotEmpty) {
                  context.router.push(LabTrendRoute(analyte: name));
                } else {
                  onViewTrends?.call();
                }
              },
              child: ImshSurfaceCard(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImshEllipsisText(
                            text: results[i].testName,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (results[i].result != null) ...[
                            const SizedBox(height: 2),
                            ImshEllipsisText(
                              text: results[i].result!,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: cs.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    if ((results[i].status?.trim().isNotEmpty) ?? false)
                      _statusBadge(results[i].status!),
                  ],
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _statusBadge(String status) {
    final key = status.toLowerCase();
    final tone = key == 'high' || key == 'critical'
        ? ImshSemanticTone.error
        : key == 'low'
            ? ImshSemanticTone.warning
            : ImshSemanticTone.success;
    final label =
        '${status[0].toUpperCase()}${status.substring(1).toLowerCase()}';
    return ImshSemanticBadge(label: label, tone: tone);
  }
}
