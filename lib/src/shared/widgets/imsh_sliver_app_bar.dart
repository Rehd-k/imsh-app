import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imsh/app_router.gr.dart';

import '../../providers/auth_provider.dart';
import 'logout_button.dart';
import 'patient_avatar.dart';

class ImshSliverAppBar extends ConsumerWidget {
  const ImshSliverAppBar({super.key});

  static const double toolbarHeight = 56;

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
      leading: IconButton(
        tooltip: 'Profile',
        padding: ImshAppBarActions.iconPadding,
        constraints: ImshAppBarActions.iconConstraints,
        onPressed: () => context.router.push(const ProfileRoute()),
        icon: PatientAvatar(patient: patient, radius: 18),
      ),
      title: Text(
        'Ibom Specialist',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
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
        const SizedBox(width: 4),
      ],
    );
  }
}
