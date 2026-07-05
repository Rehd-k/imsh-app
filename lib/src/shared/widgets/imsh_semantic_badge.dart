import 'package:flutter/material.dart';

import '../../core/theme/app_design_tokens.dart';
import '../../core/theme/imsh_theme_extension.dart';

enum ImshSemanticTone {
  info,
  success,
  warning,
  error,
  neutral,
}

class ImshSemanticBadge extends StatelessWidget {
  const ImshSemanticBadge({
    super.key,
    required this.label,
    this.tone = ImshSemanticTone.info,
    this.backgroundColor,
    this.foregroundColor,
  });

  final String label;
  final ImshSemanticTone tone;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final imsh = theme.imsh;

    final (bg, fg) = switch (tone) {
      ImshSemanticTone.info => (imsh.infoContainer, imsh.onInfoContainer),
      ImshSemanticTone.success =>
        (imsh.successContainer, imsh.onSuccessContainer),
      ImshSemanticTone.warning =>
        (imsh.warningContainer, imsh.onWarningContainer),
      ImshSemanticTone.error =>
        (colorScheme.errorContainer, colorScheme.onErrorContainer),
      ImshSemanticTone.neutral => (
          colorScheme.surfaceContainerHigh,
          colorScheme.onSurfaceVariant,
        ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDesignTokens.spacingSm + 4,
        vertical: AppDesignTokens.spacingXs,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelSmall?.copyWith(
          color: foregroundColor ?? fg,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
