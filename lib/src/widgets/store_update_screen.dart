import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';

/// Full-screen block shown until the installed build meets [minAppVersion].
class StoreUpdateScreen extends StatelessWidget {
  const StoreUpdateScreen({
    super.key,
    required this.currentVersion,
    required this.minAppVersion,
    required this.storeName,
    required this.onUpdate,
    this.busy = false,
    this.status,
  });

  final String currentVersion;
  final String minAppVersion;
  final String storeName;
  final VoidCallback? onUpdate;
  final bool busy;
  final String? status;

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    final theme = brightness == Brightness.dark
        ? AppTheme.darkTheme
        : AppTheme.lightTheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.system_update,
                    size: 56,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Update required',
                    style: theme.textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Version $currentVersion of IMSH Patient is no longer supported. '
                    'Install $minAppVersion or newer from the $storeName to continue.',
                    style: theme.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  if (status != null) ...[
                    const SizedBox(height: 16),
                    Text(
                      status!,
                      style: theme.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                  const SizedBox(height: 32),
                  FilledButton(
                    onPressed: busy ? null : onUpdate,
                    child: busy
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(strokeWidth: 2.4),
                          )
                        : Text('Update on the $storeName'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
