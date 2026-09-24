import 'package:flutter/material.dart';

import '../../../core/theme/imsh_accent_colors.dart';
import '../../../shared/widgets/imsh_page_header.dart';

class RadiologyPageHeader extends StatelessWidget {
  const RadiologyPageHeader({super.key, this.trailing});

  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ImshPageHeader(
      title: 'Radiology reports',
      subtitle:
          'View and manage your digital imaging results from our specialists.',
      icon: Icons.folder_copy_outlined,
      iconColor: ImshAccentColors.indigo,
      trailing: trailing,
    );
  }
}
