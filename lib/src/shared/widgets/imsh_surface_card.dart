import 'package:flutter/material.dart';

import '../../core/theme/app_design_tokens.dart';
import '../../core/theme/context_extensions.dart';

class ImshSurfaceCard extends StatelessWidget {
  const ImshSurfaceCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppDesignTokens.spacingLg),
    this.margin,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
        border: Border.all(color: colorScheme.outlineVariant),
        boxShadow: context.cardShadow,
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
