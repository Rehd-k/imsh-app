import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imsh/app_router.gr.dart';

import '../../providers/auth_provider.dart';

Future<void> confirmAndLogout(BuildContext context, WidgetRef ref) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Log out?'),
      content: const Text('You will need to sign in again to access your records.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Log out'),
        ),
      ],
    ),
  );

  if (confirmed != true || !context.mounted) return;

  await ref.read(patientAuthProvider.notifier).logout();
  if (!context.mounted) return;

  context.router.replaceAll([const LoginRoute()]);
}

class LogoutIconButton extends ConsumerWidget {
  const LogoutIconButton({
    super.key,
    this.iconSize = ImshAppBarActions.iconSize,
  });

  final double iconSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.logout_outlined),
      iconSize: iconSize,
      padding: ImshAppBarActions.iconPadding,
      constraints: ImshAppBarActions.iconConstraints,
      tooltip: 'Log out',
      onPressed: () => confirmAndLogout(context, ref),
    );
  }
}

class LogoutTextButton extends ConsumerWidget {
  const LogoutTextButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return OutlinedButton.icon(
      onPressed: () => confirmAndLogout(context, ref),
      icon: Icon(Icons.logout_outlined, color: colorScheme.error),
      label: Text(
        'Log out',
        style: TextStyle(color: colorScheme.error),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: colorScheme.error),
      ),
    );
  }
}

/// Shared sizing for compact app bar action icons.
abstract final class ImshAppBarActions {
  static const double iconSize = 20;

  static const EdgeInsets iconPadding = EdgeInsets.all(8);

  static const BoxConstraints iconConstraints = BoxConstraints(
    minWidth: 36,
    minHeight: 36,
  );
}
