import 'package:flutter/material.dart';

import '../../../core/theme/imsh_accent_colors.dart';
import '../../../shared/widgets/imsh_page_header.dart';

class MedicationsPageHeader extends StatelessWidget {
  const MedicationsPageHeader({super.key, this.trailing});

  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ImshPageHeader(
      title: 'Medications',
      subtitle: 'Track doses, mark Taken, and stay on schedule.',
      icon: Icons.medication_outlined,
      iconColor: ImshAccentColors.teal,
      trailing: trailing,
    );
  }
}
