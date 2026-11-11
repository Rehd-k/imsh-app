import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../core/theme/app_design_tokens.dart';
import '../../core/theme/imsh_accent_colors.dart';
import '../../helper/date_formatter.dart';
import '../../providers/auth_provider.dart';
import '../../providers/notification_inbox_provider.dart';
import '../../services/notification_inbox_store.dart';
import '../../shared/widgets/imsh_app_bar.dart';
import '../../shared/widgets/imsh_empty_state.dart';
import '../../shared/widgets/imsh_solid_icon.dart';

@RoutePage()
class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      ref.read(notificationInboxProvider.notifier).refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(notificationInboxProvider);
    final pinned = items.where((item) => item.pinned).toList();
    final rest = items.where((item) => !item.pinned).toList();

    return Scaffold(
      appBar: const ImshAppBar(title: Text('Notifications')),
      body: items.isEmpty
          ? const ImshEmptyState(
              title: 'No notifications yet',
              message:
                  'Appointment reminders, medications, and hospital alerts will show up here.',
              icon: Icons.notifications_none_outlined,
            )
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              children: [
                Text(
                  'Swipe right to pin. Swipe left to delete.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const Gap(12),
                if (pinned.isNotEmpty) ...[
                  const _SectionLabel('Pinned'),
                  for (final item in pinned) _NotificationTile(item: item),
                ],
                if (rest.isNotEmpty) ...[
                  if (pinned.isNotEmpty) const _SectionLabel('Earlier'),
                  for (final item in rest) _NotificationTile(item: item),
                ],
              ],
            ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 4),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _NotificationTile extends ConsumerWidget {
  const _NotificationTile({required this.item});

  final InboxNotification item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final accent = _accentFor(item.type);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Dismissible(
        key: ValueKey(item.id),
        direction: DismissDirection.horizontal,
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.startToEnd) {
            await ref.read(notificationInboxProvider.notifier).togglePin(item);
            return false;
          }
          return true;
        },
        onDismissed: (_) {
          ref.read(notificationInboxProvider.notifier).delete(item.id);
        },
        background: _SwipeBackground(
          alignment: Alignment.centerLeft,
          color: ImshAccentColors.indigo,
          icon: item.pinned ? Icons.push_pin : Icons.push_pin_outlined,
          label: item.pinned ? 'Unpin' : 'Pin',
        ),
        secondaryBackground: const _SwipeBackground(
          alignment: Alignment.centerRight,
          color: AppDesignTokens.error,
          icon: Icons.delete_outline,
          label: 'Delete',
        ),
        child: Material(
          color: colorScheme.surfaceContainerLowest,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
            side: BorderSide(color: colorScheme.outlineVariant),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () async {
              await ref
                  .read(notificationInboxProvider.notifier)
                  .markRead(item.id);
              final type = item.type?.trim();
              if (!context.mounted || type == null || type.isEmpty) return;
              ref.read(fcmPushServiceProvider).openFromData(item.data);
            },
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImshSolidIcon(
                    icon: _iconFor(item.type),
                    color: accent,
                    size: 40,
                    iconSize: 20,
                  ),
                  const Gap(12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                item.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: item.read
                                      ? FontWeight.w600
                                      : FontWeight.w800,
                                ),
                              ),
                            ),
                            const Gap(8),
                            Text(
                              _when(item.receivedAt),
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        if (item.body.isNotEmpty) ...[
                          const Gap(4),
                          Text(
                            item.body,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (item.pinned) ...[
                    const Gap(8),
                    Icon(
                      Icons.push_pin,
                      size: 16,
                      color: ImshAccentColors.indigo,
                    ),
                  ] else if (!item.read) ...[
                    const Gap(8),
                    Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.only(top: 6),
                      decoration: BoxDecoration(
                        color: accent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SwipeBackground extends StatelessWidget {
  const _SwipeBackground({
    required this.alignment,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Alignment alignment;
  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (alignment == Alignment.centerRight) ...[
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Gap(8),
          ],
          Icon(icon, color: Colors.white),
          if (alignment == Alignment.centerLeft) ...[
            const Gap(8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

IconData _iconFor(String? type) {
  switch (type) {
    case 'APPOINTMENT':
      return Icons.event_outlined;
    case 'MEDICATION':
    case 'MEDICATION_MISSED':
      return Icons.medication_outlined;
    case 'EMERGENCY_REQUEST':
      return Icons.emergency_outlined;
    case 'DEVICE_APPROVED':
      return Icons.phonelink_lock_outlined;
    default:
      return Icons.notifications_outlined;
  }
}

Color _accentFor(String? type) {
  switch (type) {
    case 'APPOINTMENT':
      return ImshAccentColors.teal;
    case 'MEDICATION':
    case 'MEDICATION_MISSED':
      return ImshAccentColors.pink;
    case 'EMERGENCY_REQUEST':
      return AppDesignTokens.error;
    case 'DEVICE_APPROVED':
      return ImshAccentColors.green;
    default:
      return ImshAccentColors.indigo;
  }
}

String _when(DateTime time) {
  final local = time.toLocal();
  final now = DateTime.now();
  final diff = now.difference(local);
  if (diff.isNegative) return DateFormatter.appointmentCardTime(local);
  if (diff.inMinutes < 1) return 'Just now';
  if (diff.inMinutes < 60) return '${diff.inMinutes}m';
  final sameDay =
      now.year == local.year && now.month == local.month && now.day == local.day;
  if (sameDay) return DateFormatter.appointmentCardTime(local);
  if (diff.inDays < 7) return DateFormatter.appointmentCompactDate(local);
  return DateFormatter.medicalDate(local);
}
