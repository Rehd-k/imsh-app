import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/theme/app_design_tokens.dart';
import '../../core/theme/imsh_accent_colors.dart';
import 'imsh_solid_icon.dart';

/// Compact clinical empty state with solid icon tile.
class ImshEmptyState extends StatelessWidget {
  const ImshEmptyState({
    super.key,
    required this.message,
    this.title,
    this.icon = Icons.inbox_outlined,
    this.iconColor = ImshAccentColors.indigo,
    this.actionLabel,
    this.onAction,
  });

  final String? title;
  final String message;
  final IconData icon;
  final Color iconColor;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDesignTokens.spacingLg,
        vertical: AppDesignTokens.spacing2xl,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImshSolidIcon(
            icon: icon,
            color: iconColor,
            size: 48,
            iconSize: 24,
            radius: AppDesignTokens.radiusMd,
          ),
          if (title != null) ...[
            const Gap(AppDesignTokens.spacingMd),
            Text(
              title!,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ],
          const Gap(AppDesignTokens.spacingSm),
          Text(
            message,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: cs.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          if (actionLabel != null && onAction != null) ...[
            const Gap(AppDesignTokens.spacingMd),
            FilledButton(onPressed: onAction, child: Text(actionLabel!)),
          ],
        ],
      ),
    );
  }
}
