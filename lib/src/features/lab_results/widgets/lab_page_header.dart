import 'package:flutter/material.dart';

import '../../../core/theme/imsh_accent_colors.dart';
import '../../../shared/widgets/imsh_page_header.dart';

class LabPageHeader extends StatelessWidget {
  const LabPageHeader({super.key, this.trailing});

  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ImshPageHeader(
      title: 'Lab results',
      subtitle: 'View and track your diagnostic medical reports.',
      icon: Icons.science_outlined,
      iconColor: ImshAccentColors.teal,
      trailing: trailing,
    );
  }
}
