import 'package:flutter/material.dart';

import '../../core/theme/app_design_tokens.dart';

/// Solid colored icon tile — white glyph on an opaque rounded square.
/// Never use a translucent primary wash for leading icons.
class ImshSolidIcon extends StatelessWidget {
  const ImshSolidIcon({
    super.key,
    required this.icon,
    required this.color,
    this.size = 32,
    this.iconSize = 16,
    this.radius = AppDesignTokens.radiusSm,
  });

  final IconData icon;
  final Color color;
  final double size;
  final double iconSize;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Icon(icon, color: Colors.white, size: iconSize),
    );
  }
}

/// Single-line text with ellipsis and a hover tooltip.
class ImshEllipsisText extends StatelessWidget {
  const ImshEllipsisText({
    super.key,
    required this.text,
    this.style,
    this.maxLines = 1,
    this.align,
  });

  final String text;
  final TextStyle? style;
  final int maxLines;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    final label = text.trim().isEmpty ? '—' : text;
    return Tooltip(
      message: label,
      waitDuration: const Duration(milliseconds: 350),
      child: Text(
        label,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        textAlign: align,
        style: style,
      ),
    );
  }
}
