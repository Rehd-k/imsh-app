import 'package:flutter/material.dart';

import '../../core/theme/app_design_tokens.dart';
import 'imsh_solid_icon.dart';
import 'imsh_surface_card.dart';

/// Data for a dense clinical KPI tile.
class ImshKpiItem {
  const ImshKpiItem({
    required this.label,
    required this.value,
    required this.caption,
    required this.icon,
    required this.accent,
    this.onTap,
  });

  final String label;
  final String value;
  final String caption;
  final IconData icon;
  final Color accent;
  final VoidCallback? onTap;
}

/// Single dense KPI card: solid icon + label / large value / caption.
class ImshKpiTile extends StatelessWidget {
  const ImshKpiTile({
    super.key,
    required this.item,
  });

  final ImshKpiItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: item.onTap,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
        child: ImshSurfaceCard(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            children: [
              ImshSolidIcon(
                icon: item.icon,
                color: item.accent,
                size: 30,
                iconSize: 16,
                radius: 8,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImshEllipsisText(
                      text: item.label,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: cs.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ImshEllipsisText(
                      text: item.value,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: cs.onSurface,
                        height: 1.15,
                      ),
                    ),
                    ImshEllipsisText(
                      text: item.caption,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: cs.onSurfaceVariant,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Responsive strip of [ImshKpiTile]s — row when wide, 2-col grid otherwise.
class ImshKpiStrip extends StatelessWidget {
  const ImshKpiStrip({
    super.key,
    required this.items,
    this.useSnapStrip = false,
    this.snapWidth = 200,
    this.snapHeight = 78,
  });

  final List<ImshKpiItem> items;
  final bool useSnapStrip;
  final double snapWidth;
  final double snapHeight;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    if (useSnapStrip) {
      return SizedBox(
        height: snapHeight,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const PageScrollPhysics(),
          itemCount: items.length,
          separatorBuilder: (_, _) => const SizedBox(width: 8),
          itemBuilder: (context, i) => SizedBox(
            width: snapWidth,
            child: ImshKpiTile(item: items[i]),
          ),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= 820 && items.length >= 3;
        if (wide) {
          return Row(
            children: [
              for (var i = 0; i < items.length; i++) ...[
                if (i > 0) const SizedBox(width: 8),
                Expanded(child: ImshKpiTile(item: items[i])),
              ],
            ],
          );
        }
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: items.length == 1 ? 1 : 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: 72,
          ),
          itemBuilder: (context, i) => ImshKpiTile(item: items[i]),
        );
      },
    );
  }
}
