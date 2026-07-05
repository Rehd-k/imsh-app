import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../shared/widgets/feature_placeholder_screen.dart';

@RoutePage()
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeaturePlaceholderScreen(
      title: 'Notifications',
      subtitle: 'Appointment reminders and health updates.',
      icon: Icons.notifications_outlined,
    );
  }
}
