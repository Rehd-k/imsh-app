import 'package:flutter/material.dart';

class AppNotificationHost extends StatelessWidget {
  const AppNotificationHost({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
