import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';

class RadiologyPageHeader extends StatelessWidget {
  const RadiologyPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.folder_copy_outlined,
              size: 20,
              color: theme.colorScheme.primary,
            ),
            const Gap(AppDesignTokens.spacingSm),
            Text(
              'DIAGNOSTIC IMAGING',
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
        const Gap(AppDesignTokens.spacingSm),
        Text(
          'Radiology Reports',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: colorScheme.onSurface,
          ),
        ),
        const Gap(AppDesignTokens.spacingSm),
        Text(
          'View and manage your digital imaging results from our specialists.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
