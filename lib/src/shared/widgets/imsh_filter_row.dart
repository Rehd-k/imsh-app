import 'package:flutter/material.dart';

import '../../core/theme/app_design_tokens.dart';
import '../../core/theme/imsh_accent_colors.dart';
import 'imsh_solid_icon.dart';

/// One-row clinical filter bar: search + primary filters + overflow menu.
class ImshFilterRow extends StatelessWidget {
  const ImshFilterRow({
    super.key,
    this.search,
    this.filters = const [],
    this.overflowItems = const [],
    this.overflowTooltip = 'More filters',
  });

  /// Typically an [Expanded] search [TextField] / [SearchBar].
  final Widget? search;

  /// Primary dropdowns / chips shown inline (keep few).
  final List<Widget> filters;

  /// Extra controls shown behind a filter icon menu.
  final List<PopupMenuEntry<void>> overflowItems;

  final String overflowTooltip;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (search != null) Expanded(child: search!),
        for (final filter in filters) ...[
          if (search != null || filters.first != filter)
            const SizedBox(width: 8),
          filter,
        ],
        if (overflowItems.isNotEmpty) ...[
          const SizedBox(width: 8),
          PopupMenuButton<void>(
            tooltip: overflowTooltip,
            offset: const Offset(0, 40),
            itemBuilder: (_) => overflowItems,
            child: const ImshSolidIcon(
              icon: Icons.tune_rounded,
              color: ImshAccentColors.indigo,
              size: 36,
              iconSize: 18,
              radius: AppDesignTokens.radiusMd,
            ),
          ),
        ],
      ],
    );
  }
}
