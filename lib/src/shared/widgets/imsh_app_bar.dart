import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'logout_button.dart';
import 'theme_mode_menu_button.dart';

class ImshAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const ImshAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.showThemeToggle = true,
    this.showLogout = false,
  });

  final Widget title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final bool showThemeToggle;
  final bool showLogout;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: title,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: [
        ...?actions?.map(
          (action) => _wrapCompactAction(action),
        ),
        if (showLogout) const LogoutIconButton(),
        if (showThemeToggle)
          const ThemeModeMenuButton(iconSize: ImshAppBarActions.iconSize),
        const SizedBox(width: 4),
      ],
    );
  }

  Widget _wrapCompactAction(Widget action) {
    if (action is IconButton) {
      return IconButton(
        onPressed: action.onPressed,
        icon: action.icon,
        iconSize: ImshAppBarActions.iconSize,
        padding: ImshAppBarActions.iconPadding,
        constraints: ImshAppBarActions.iconConstraints,
        tooltip: action.tooltip,
      );
    }
    return action;
  }
}
