import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_provider.dart';

/// Initializes FCM listeners once the app tree is mounted.
class AppNotificationHost extends ConsumerStatefulWidget {
  const AppNotificationHost({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<AppNotificationHost> createState() =>
      _AppNotificationHostState();
}

class _AppNotificationHostState extends ConsumerState<AppNotificationHost> {
  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      Future.microtask(() => ref.read(fcmPushServiceProvider).initialize());
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
