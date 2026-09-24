import 'package:flutter/material.dart';

import 'imsh_semantic_badge.dart';
import 'imsh_solid_icon.dart';

/// Single-line status chip with ellipsis + tooltip (HeltyEllipsisChip analogue).
class ImshEllipsisChip extends StatelessWidget {
  const ImshEllipsisChip({
    super.key,
    required this.label,
    this.tone = ImshSemanticTone.neutral,
    this.backgroundColor,
    this.foregroundColor,
    this.maxWidth = 140,
  });

  final String label;
  final ImshSemanticTone tone;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final text = label.trim().isEmpty ? '—' : label;
    return Tooltip(
      message: text,
      waitDuration: const Duration(milliseconds: 350),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: ImshSemanticBadge(
          label: text,
          tone: tone,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
        ),
      ),
    );
  }
}

/// Section title row used inside list/detail pages.
class ImshSectionHeader extends StatelessWidget {
  const ImshSectionHeader({
    super.key,
    required this.title,
    this.icon,
    this.iconColor,
    this.trailing,
  });

  final String title;
  final IconData? icon;
  final Color? iconColor;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Row(
      children: [
        if (icon != null) ...[
          ImshSolidIcon(
            icon: icon!,
            color: iconColor ?? cs.primary,
            size: 28,
            iconSize: 14,
            radius: 8,
          ),
          const SizedBox(width: 8),
        ],
        Expanded(
          child: ImshEllipsisText(
            text: title,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: cs.onSurface,
            ),
          ),
        ),
        ?trailing,
      ],
    );
  }
}
