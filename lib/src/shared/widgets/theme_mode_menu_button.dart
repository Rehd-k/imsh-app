import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/theme_mode_provider.dart';

class ThemeModeMenuButton extends ConsumerWidget {
  const ThemeModeMenuButton({
    super.key,
    this.iconSize = 24,
  });

  final double iconSize;

  static IconData _iconFor(ThemeMode mode, Brightness platformBrightness) {
    return switch (mode) {
      ThemeMode.light => Icons.light_mode_outlined,
      ThemeMode.dark => Icons.dark_mode_outlined,
      ThemeMode.system => platformBrightness == Brightness.dark
          ? Icons.dark_mode_outlined
          : Icons.light_mode_outlined,
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final platformBrightness = MediaQuery.platformBrightnessOf(context);

    return PopupMenuButton<ThemeMode>(
      icon: Icon(
        _iconFor(themeMode, platformBrightness),
        size: iconSize,
      ),
      padding: iconSize <= 20 ? const EdgeInsets.all(8) : EdgeInsets.zero,
      constraints: iconSize <= 20
          ? const BoxConstraints(minWidth: 36, minHeight: 36)
          : null,
      tooltip: 'Theme',
      onSelected: (mode) =>
          ref.read(themeModeProvider.notifier).setThemeMode(mode),
      itemBuilder: (context) => [
        _buildItem(
          context,
          value: ThemeMode.light,
          label: 'Light',
          icon: Icons.light_mode_outlined,
          selected: themeMode == ThemeMode.light,
        ),
        _buildItem(
          context,
          value: ThemeMode.dark,
          label: 'Dark',
          icon: Icons.dark_mode_outlined,
          selected: themeMode == ThemeMode.dark,
        ),
        _buildItem(
          context,
          value: ThemeMode.system,
          label: 'System',
          icon: Icons.brightness_auto_outlined,
          selected: themeMode == ThemeMode.system,
        ),
      ],
    );
  }

  PopupMenuItem<ThemeMode> _buildItem(
    BuildContext context, {
    required ThemeMode value,
    required String label,
    required IconData icon,
    required bool selected,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return PopupMenuItem<ThemeMode>(
      value: value,
      child: Row(
        children: [
          Icon(icon, size: 20, color: colorScheme.onSurface),
          const SizedBox(width: 12),
          Expanded(child: Text(label)),
          if (selected)
            Icon(Icons.check, size: 20, color: colorScheme.primary),
        ],
      ),
    );
  }
}
