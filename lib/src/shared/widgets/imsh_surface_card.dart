import 'package:flutter/material.dart';

import '../../core/theme/app_design_tokens.dart';
import '../../core/theme/context_extensions.dart';

class ImshSurfaceCard extends StatelessWidget {
  const ImshSurfaceCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppDesignTokens.spacingLg),
    this.margin,
    this.onTap,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final radius = BorderRadius.circular(AppDesignTokens.radiusLg);

    final content = Container(
      margin: margin,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: radius,
        border: Border.all(color: colorScheme.outlineVariant),
        boxShadow: context.cardShadow,
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );

    if (onTap == null) return content;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: content,
      ),
    );
  }
}
