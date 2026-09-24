import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:imsh/app_router.gr.dart';

import '../../../core/theme/imsh_accent_colors.dart';
import '../../../models/lab_result_model.dart';

class LabResultValueRow extends StatelessWidget {
  const LabResultValueRow({super.key, required this.line});

  final LabResultLine line;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final isFlagged = line.abnormalFlag != null || line.isCritical;
    final value = line.valueWithUnit.trim().isEmpty ? '—' : line.valueWithUnit;
    final refRange = line.referenceRange?.trim();

    return InkWell(
      onTap: () => context.router.push(LabTrendRoute(analyte: line.label)),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    line.label.trim().isEmpty ? '—' : line.label,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isFlagged ? cs.error : null,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    (refRange == null || refRange.isEmpty)
                        ? 'Ref: —'
                        : 'Ref: $refRange',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    value,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: isFlagged ? cs.error : ImshAccentColors.blue,
                    ),
                  ),
                  if (line.abnormalFlag != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      line.abnormalFlag!.label,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: cs.error,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                  const SizedBox(height: 2),
                  Text(
                    'View trend',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: ImshAccentColors.teal,
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
