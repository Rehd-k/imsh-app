import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/theme/app_design_tokens.dart';

class ImshPageHeader extends StatelessWidget {
  const ImshPageHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.titleStyle,
  });

  final String title;
  final String? subtitle;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle ??
              theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: colorScheme.onSurface,
              ),
        ),
        if (subtitle != null) ...[
          const Gap(AppDesignTokens.spacingSm),
          Text(
            subtitle!,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }
}
