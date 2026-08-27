import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';

import '../../core/theme/app_design_tokens.dart';
import '../../models/patient_model.dart';
import '../../providers/auth_provider.dart';
import '../../shared/widgets/imsh_surface_card.dart';

@RoutePage()
class DevicePendingScreen extends ConsumerStatefulWidget {
  const DevicePendingScreen({super.key});

  @override
  ConsumerState<DevicePendingScreen> createState() =>
      _DevicePendingScreenState();
}

class _DevicePendingScreenState extends ConsumerState<DevicePendingScreen> {
  Timer? _pollTimer;
  bool _navigating = false;
  bool _loggingOut = false;

  @override
  void initState() {
    super.initState();
    _pollTimer = Timer.periodic(const Duration(seconds: 8), (_) => _poll());
    WidgetsBinding.instance.addPostFrameCallback((_) => _poll());
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    super.dispose();
  }

  Future<void> _poll() async {
    if (_navigating || !mounted) return;
    try {
      await ref.read(patientAuthProvider.notifier).refreshDeviceStatus();
      final auth = ref.read(patientAuthProvider);
      if (auth.canAccessApp) {
        await _goToShell();
      }
    } catch (_) {
      // Keep waiting; revoke/logout handled by interceptor when applicable.
    }
  }

  Future<void> _goToShell() async {
    if (_navigating || !mounted) return;
    _navigating = true;
    _pollTimer?.cancel();
    await context.router.replaceAll([const PatientShellRoute()]);
  }

  Future<void> _logout() async {
    if (_loggingOut) return;
    setState(() => _loggingOut = true);
    try {
      await ref.read(patientAuthProvider.notifier).logout();
      if (!mounted) return;
      await context.router.replaceAll([const LoginRoute()]);
    } finally {
      if (mounted) setState(() => _loggingOut = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(patientAuthProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    ref.listen(patientAuthProvider, (prev, next) {
      if (next.canAccessApp) {
        _goToShell();
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
          child: Column(
            children: [
              const Spacer(),
              ImshSurfaceCard(
                child: Column(
                  children: [
                    Icon(
                      Icons.phonelink_lock_outlined,
                      size: 56,
                      color: colorScheme.primary,
                    ),
                    const Gap(AppDesignTokens.spacingLg),
                    Text(
                      'Waiting for frontdesk approval',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Gap(AppDesignTokens.spacingMd),
                    Text(
                      'This device needs frontdesk approval before you can '
                      'use the patient portal. If you signed in with a '
                      'different account on this device, approval is required again.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (auth.patient != null) ...[
                      const Gap(AppDesignTokens.spacingMd),
                      Text(
                        auth.patient!.patientId ??
                            auth.patient!.displayFirstName,
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: colorScheme.primary,
                        ),
                      ),
                    ],
                    const Gap(AppDesignTokens.spacingLg),
                    const SizedBox(
                      width: 28,
                      height: 28,
                      child: CircularProgressIndicator(strokeWidth: 2.5),
                    ),
                    const Gap(AppDesignTokens.spacingSm),
                    Text(
                      'Checking approval status…',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: _loggingOut ? null : _logout,
                child: _loggingOut
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Sign out'),
              ),
              const Gap(AppDesignTokens.spacingMd),
            ],
          ),
        ),
      ),
    );
  }
}
