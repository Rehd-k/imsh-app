import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';

import '../../core/theme/app_design_tokens.dart';
import '../../core/theme/context_extensions.dart';
import '../../core/utils/user_error_message.dart';
import '../../models/device_model.dart';
import '../../providers/auth_provider.dart';
import '../../providers/family_provider.dart';
import '../../providers/service_providers.dart';
import '../../shared/widgets/imsh_surface_card.dart';

final devicesListProvider =
    FutureProvider.autoDispose<List<PatientDevice>>((ref) async {
  final service = ref.watch(deviceServiceProvider);
  return service.listDevices();
});

@RoutePage()
class DevicesScreen extends ConsumerWidget {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devicesAsync = ref.watch(devicesListProvider);
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Signed-in devices')),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(devicesListProvider);
          await ref.read(devicesListProvider.future);
        },
        child: devicesAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
            children: [
              const Gap(48),
              Text(userFacingErrorMessage(error), textAlign: TextAlign.center),
              const Gap(AppDesignTokens.spacingMd),
              Center(
                child: FilledButton(
                  onPressed: () => ref.invalidate(devicesListProvider),
                  child: const Text('Try again'),
                ),
              ),
            ],
          ),
          data: (devices) {
            if (devices.isEmpty) {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
                children: [
                  const Gap(48),
                  Text(
                    'No devices found.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleMedium,
                  ),
                ],
              );
            }

            return ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
              itemCount: devices.length,
              separatorBuilder: (_, __) =>
                  const Gap(AppDesignTokens.spacingSm),
              itemBuilder: (context, index) {
                final device = devices[index];
                final isCurrent = device.isCurrent == true;
                final label = device.deviceLabel?.trim().isNotEmpty == true
                    ? device.deviceLabel!.trim()
                    : (device.platform ?? 'Device');
                final statusLabel = switch (device.status) {
                  PatientDeviceStatus.approved => 'Approved',
                  PatientDeviceStatus.pending => 'Pending approval',
                  PatientDeviceStatus.revoked => 'Revoked',
                };

                return ImshSurfaceCard(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      Icons.smartphone_outlined,
                      color: colorScheme.primary,
                    ),
                    title: Text(
                      isCurrent ? '$label (This device)' : label,
                    ),
                    subtitle: Text(statusLabel),
                    trailing: IconButton(
                      tooltip: isCurrent
                          ? 'Sign out this device'
                          : 'Remove device',
                      icon: Icon(
                        Icons.delete_outline,
                        color: colorScheme.error,
                      ),
                      onPressed: () => _confirmDelete(
                        context,
                        ref,
                        device: device,
                        isCurrent: isCurrent,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref, {
    required PatientDevice device,
    required bool isCurrent,
  }) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(isCurrent ? 'Sign out this device?' : 'Remove device?'),
        content: Text(
          isCurrent
              ? 'You will need frontdesk approval again the next time you sign in on this device.'
              : 'That device will need frontdesk approval again before it can access the portal.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(isCurrent ? 'Sign out' : 'Remove'),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;

    try {
      if (isCurrent) {
        ref.read(familyViewProvider.notifier).clear();
        await ref.read(patientAuthProvider.notifier).logout();
        if (!context.mounted) return;
        await context.router.replaceAll([const LoginRoute()]);
        return;
      }
      await ref.read(deviceServiceProvider).deleteDevice(device.id);
      ref.invalidate(devicesListProvider);
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Device removed')),
      );
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(userFacingErrorMessage(e))),
      );
    }
  }
}
