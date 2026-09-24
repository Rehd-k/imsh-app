import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';

import '../../core/responsive.dart';
import '../../core/theme/context_extensions.dart';
import '../../core/theme/imsh_accent_colors.dart';
import '../../core/utils/user_error_message.dart';
import '../../models/device_model.dart';
import '../../providers/auth_provider.dart';
import '../../providers/family_provider.dart';
import '../../providers/service_providers.dart';
import '../../shared/widgets/imsh_app_bar.dart';
import '../../shared/widgets/imsh_empty_state.dart';
import '../../shared/widgets/imsh_error_panel.dart';
import '../../shared/widgets/imsh_page_header.dart';
import '../../shared/widgets/imsh_solid_icon.dart';
import '../../shared/widgets/imsh_surface_card.dart';

final devicesListProvider = FutureProvider.autoDispose<List<PatientDevice>>((
  ref,
) async {
  final service = ref.watch(deviceServiceProvider);
  return service.listDevices();
});

const _kSectionGap = 10.0;

@RoutePage()
class DevicesScreen extends ConsumerWidget {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devicesAsync = ref.watch(devicesListProvider);

    return Scaffold(
      appBar: const ImshAppBar(title: Text('Signed-in devices')),
      body: ResponsiveBody(
        expand: false,
        builder: (context, bp) => RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(devicesListProvider);
            await ref.read(devicesListProvider.future);
          },
          child: devicesAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                ImshErrorPanel(
                  message: userFacingErrorMessage(error),
                  onRetry: () => ref.invalidate(devicesListProvider),
                ),
              ],
            ),
            data: (devices) {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  const ImshPageHeader(
                    title: 'Signed-in devices',
                    subtitle: 'Manage devices approved for your patient portal',
                    icon: Icons.devices_outlined,
                    iconColor: ImshAccentColors.indigo,
                  ),
                  const Gap(12),
                  if (devices.isEmpty)
                    const ImshEmptyState(
                      title: 'No devices found',
                      message:
                          'Devices you sign in on will appear here after frontdesk approval.',
                      icon: Icons.smartphone_outlined,
                      iconColor: ImshAccentColors.indigo,
                    )
                  else
                    for (final device in devices) ...[
                      _DeviceCard(
                        device: device,
                        onDelete: () => _confirmDelete(
                          context,
                          ref,
                          device: device,
                          isCurrent: device.isCurrent == true,
                        ),
                      ),
                      const Gap(_kSectionGap),
                    ],
                ],
              );
            },
          ),
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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Device removed')));
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(userFacingErrorMessage(e))));
    }
  }
}

class _DeviceCard extends StatelessWidget {
  const _DeviceCard({required this.device, required this.onDelete});

  final PatientDevice device;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final isCurrent = device.isCurrent == true;
    final label = device.deviceLabel?.trim().isNotEmpty == true
        ? device.deviceLabel!.trim()
        : (device.platform ?? 'Device');
    final statusLabel = switch (device.status) {
      PatientDeviceStatus.approved => 'Approved',
      PatientDeviceStatus.pending => 'Pending approval',
      PatientDeviceStatus.revoked => 'Revoked',
    };
    final accent = switch (device.status) {
      PatientDeviceStatus.approved => ImshAccentColors.green,
      PatientDeviceStatus.pending => ImshAccentColors.amber,
      PatientDeviceStatus.revoked => ImshAccentColors.pink,
    };

    return ImshSurfaceCard(
      padding: const EdgeInsets.all(10),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: ImshSolidIcon(
          icon: Icons.smartphone_outlined,
          color: isCurrent ? ImshAccentColors.teal : accent,
          size: 36,
          iconSize: 18,
          radius: 10,
        ),
        title: Text(isCurrent ? '$label (This device)' : label),
        subtitle: Text(statusLabel),
        trailing: IconButton(
          tooltip: isCurrent ? 'Sign out this device' : 'Remove device',
          icon: Icon(Icons.delete_outline, color: colorScheme.error),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
