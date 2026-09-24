import 'package:flutter/material.dart';

import '../../core/theme/app_design_tokens.dart';
import 'imsh_solid_icon.dart';

/// Compact clinical page header: solid title icon + title/subtitle + trailing.
class ImshPageHeader extends StatelessWidget {
  const ImshPageHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.titleStyle,
    this.icon,
    this.iconColor,
    this.trailing,
  });

  final String title;
  final String? subtitle;
  final TextStyle? titleStyle;
  final IconData? icon;
  final Color? iconColor;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final titleText = ImshEllipsisText(
      text: title,
      style: titleStyle ??
          theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w800,
            color: colorScheme.onSurface,
          ),
    );

    final subtitleWidget = subtitle == null
        ? null
        : ImshEllipsisText(
            text: subtitle!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (icon != null) ...[
          ImshSolidIcon(
            icon: icon!,
            color: iconColor ?? colorScheme.primary,
            size: 34,
            iconSize: 18,
            radius: AppDesignTokens.radiusMd,
          ),
          const SizedBox(width: 10),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText,
              if (subtitleWidget != null) ...[
                const SizedBox(height: 2),
                subtitleWidget,
              ],
            ],
          ),
        ),
        if (trailing != null) ...[
          const SizedBox(width: 8),
          trailing!,
        ],
      ],
    );
  }
}
