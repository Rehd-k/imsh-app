import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../shared/widgets/feature_placeholder_screen.dart';

@RoutePage()
class FamilyAccountsScreen extends StatelessWidget {
  const FamilyAccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeaturePlaceholderScreen(
      title: 'Family accounts',
      subtitle: 'Manage linked family members.',
      icon: Icons.family_restroom_outlined,
    );
  }
}

@RoutePage()
class AddFamilyMemberScreen extends StatelessWidget {
  const AddFamilyMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeaturePlaceholderScreen(
      title: 'Add family member',
      subtitle: 'Link a dependent to your account.',
      icon: Icons.person_add_outlined,
    );
  }
}
