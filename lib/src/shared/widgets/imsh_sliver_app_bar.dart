import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imsh/app_router.gr.dart';

import '../../providers/auth_provider.dart';
import 'logout_button.dart';
import 'patient_avatar.dart';
import 'theme_mode_menu_button.dart';

class ImshSliverAppBar extends ConsumerWidget {
  const ImshSliverAppBar({super.key});

  static const double toolbarHeight = 52;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final patient = ref.watch(currentPatientProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SliverAppBar(
      floating: true,
      snap: true,
      automaticallyImplyLeading: false,
      toolbarHeight: toolbarHeight,
      backgroundColor: colorScheme.surfaceContainerHighest,
      scrolledUnderElevation: 0,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Center(
          child: GestureDetector(
            onTap: () => context.router.push(const ProfileRoute()),
            child: PatientAvatar(patient: patient, radius: 18),
          ),
        ),
      ),
      title: Text(
        'Ibom Specialist',
        style: theme.textTheme.titleLarge?.copyWith(
          color: colorScheme.primary,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none_outlined),
          iconSize: ImshAppBarActions.iconSize,
          padding: ImshAppBarActions.iconPadding,
          constraints: ImshAppBarActions.iconConstraints,
          tooltip: 'Notifications',
          onPressed: () => context.router.push(const NotificationsRoute()),
        ),
        ThemeModeMenuButton(iconSize: ImshAppBarActions.iconSize),
        LogoutIconButton(iconSize: ImshAppBarActions.iconSize),
        const SizedBox(width: 4),
      ],
    );
  }
}
