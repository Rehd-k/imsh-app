import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/responsive.dart';
import '../../core/theme/imsh_accent_colors.dart';
import '../../shared/widgets/imsh_app_bar.dart';
import '../../shared/widgets/imsh_page_header.dart';
import '../../shared/widgets/imsh_surface_card.dart';
import 'widgets/profile_body.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ImshAppBar(title: Text('Profile'), showLogout: true),
      body: ProfileBody(),
    );
  }
}

@RoutePage()
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ImshAppBar(title: Text('Edit profile')),
      body: ResponsiveBody(
        expand: false,
        builder: (context, bp) => const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImshPageHeader(
              title: 'Edit profile',
              subtitle: 'Profile editing is coming soon.',
              icon: Icons.edit_outlined,
              iconColor: ImshAccentColors.indigo,
            ),
            SizedBox(height: 12),
            ImshSurfaceCard(
              padding: EdgeInsets.all(12),
              child: Text(
                'You will be able to update contact details from this screen soon. '
                'For urgent changes, visit the hospital frontdesk.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
