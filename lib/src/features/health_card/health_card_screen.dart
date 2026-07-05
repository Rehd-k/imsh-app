import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../shared/widgets/feature_placeholder_screen.dart';

@RoutePage()
class HealthCardScreen extends StatelessWidget {
  const HealthCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeaturePlaceholderScreen(
      title: 'QR health card',
      subtitle: 'Your digital hospital health card.',
      icon: Icons.qr_code_2_outlined,
    );
  }
}
