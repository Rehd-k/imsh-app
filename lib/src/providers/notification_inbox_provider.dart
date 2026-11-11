import 'dart:async';

import 'package:flutter_riverpod/legacy.dart';

import '../services/notification_inbox_store.dart';

final notificationInboxProvider = StateNotifierProvider.autoDispose<
  NotificationInboxNotifier,
  List<InboxNotification>
>((ref) {
  final notifier = NotificationInboxNotifier();
  ref.onDispose(notifier.close);
  return notifier;
});

class NotificationInboxNotifier extends StateNotifier<List<InboxNotification>> {
  NotificationInboxNotifier() : super(const []) {
    _subscription = NotificationInboxStore.instance.changes.listen((items) {
      if (!mounted) return;
      state = items;
    });
    refresh();
  }

  late final StreamSubscription<List<InboxNotification>> _subscription;

  Future<void> refresh() => NotificationInboxStore.instance.load();

  Future<void> togglePin(InboxNotification item) {
    return NotificationInboxStore.instance.setPinned(
      item.id,
      pinned: !item.pinned,
    );
  }

  Future<void> markRead(String id) =>
      NotificationInboxStore.instance.markRead(id);

  Future<void> delete(String id) => NotificationInboxStore.instance.delete(id);

  void close() {
    _subscription.cancel();
  }
}
