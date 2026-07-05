import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../models/lab_result_model.dart';

class LabResultValueRow extends StatelessWidget {
  const LabResultValueRow({
    super.key,
    required this.line,
  });

  final LabResultLine line;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;
    final isAbnormal = line.abnormalFlag != null || line.isCritical;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppDesignTokens.spacingSm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              line.label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
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
                    fontWeight: FontWeight.w600,
                    color: isAbnormal
                        ? theme.colorScheme.error
                        : colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.end,
                ),
                if (line.referenceRange?.isNotEmpty == true) ...[
                  const Gap(AppDesignTokens.spacingXs),
                  Text(
                    'Ref: ${line.referenceRange}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
                if (line.abnormalFlag != null) ...[
                  const Gap(AppDesignTokens.spacingXs),
                  Text(
                    line.abnormalFlag!.label,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.error,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
                if (line.isCritical) ...[
                  const Gap(AppDesignTokens.spacingXs),
                  Text(
                    'Critical',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.error,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
