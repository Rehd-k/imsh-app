import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../models/lab_result_model.dart';

class LabResultValueRow extends StatelessWidget {
  const LabResultValueRow({super.key, required this.line});

  final LabResultLine line;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;
    final isFlagged = line.abnormalFlag != null || line.isCritical;

    return InkWell(
      onTap: () => context.router.push(LabTrendRoute(analyte: line.label)),
      borderRadius: BorderRadius.circular(AppDesignTokens.radiusSm),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDesignTokens.spacingSm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    line.label,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isFlagged ? colorScheme.error : null,
                    ),
                  ),
                  if (line.referenceRange?.trim().isNotEmpty == true) ...[
                    const Gap(2),
                    Text(
                      'Ref: ${line.referenceRange}',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const Gap(AppDesignTokens.spacingSm),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    line.valueWithUnit,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: isFlagged ? colorScheme.error : colorScheme.primary,
                    ),
                  ),
                  if (line.abnormalFlag != null) ...[
                    const Gap(2),
                    Text(
                      line.abnormalFlag!.label,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.error,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                  const Gap(2),
                  Text(
                    'View trend',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.primary,
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
