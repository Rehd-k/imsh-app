import 'package:flutter/material.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';

class RadiologySecurityBanner extends StatelessWidget {
  const RadiologySecurityBanner({super.key});

  void _showPolicy(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Security policy'),
        content: const Text(
          'Medical imaging data is confidential. Share reports only with '
          'verified healthcare professionals. Do not distribute PDF or DICOM '
          'links through unsecured channels.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return ImshSurfaceCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const ImshSolidIcon(
                icon: Icons.shield_outlined,
                color: ImshAccentColors.blue,
                size: 34,
                iconSize: 18,
                radius: AppDesignTokens.radiusMd,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Sharing medical data',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Your imaging reports contain sensitive health information. '
            'Only share them with verified healthcare professionals you trust.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: cs.onSurfaceVariant,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () => _showPolicy(context),
            style: TextButton.styleFrom(
              visualDensity: VisualDensity.compact,
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text('Security policy'),
          ),
        ],
      ),
    );
  }
}
