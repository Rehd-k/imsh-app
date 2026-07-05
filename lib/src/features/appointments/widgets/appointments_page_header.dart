import 'package:flutter/material.dart';

import '../../../shared/widgets/imsh_page_header.dart';

class AppointmentsPageHeader extends StatelessWidget {
  const AppointmentsPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const ImshPageHeader(
      title: 'My Appointments',
      subtitle: 'Manage your clinical visits and history',
    );
  }
}
