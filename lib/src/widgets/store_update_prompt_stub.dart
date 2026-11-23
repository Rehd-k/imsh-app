import 'package:flutter/material.dart';

import 'store_update_screen.dart';

class StoreUpdatePrompt extends StatelessWidget {
  const StoreUpdatePrompt({
    super.key,
    required this.currentVersion,
    required this.minAppVersion,
  });

  final String currentVersion;
  final String minAppVersion;

  @override
  Widget build(BuildContext context) {
    return StoreUpdateScreen(
      currentVersion: currentVersion,
      minAppVersion: minAppVersion,
      storeName: 'store',
      onUpdate: null,
    );
  }
}
