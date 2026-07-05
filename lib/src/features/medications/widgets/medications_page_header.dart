import 'package:flutter/material.dart';

import '../../../shared/widgets/imsh_page_header.dart';

class MedicationsPageHeader extends StatelessWidget {
  const MedicationsPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const ImshPageHeader(
      title: 'Medications',
      subtitle: 'Manage your prescriptions and daily schedule.',
    );
  }
}
