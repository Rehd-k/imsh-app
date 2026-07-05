import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';

class RadiologySecurityBanner extends StatelessWidget {
  const RadiologySecurityBanner({super.key});

  void _showPolicy(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Security Policy'),
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

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline,
                color: theme.colorScheme.onPrimary,
                size: 20,
              ),
              const Gap(AppDesignTokens.spacingSm),
              Text(
                'Sharing Medical Data',
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Gap(AppDesignTokens.spacingSm),
          Text(
            'Your imaging reports contain sensitive health information. '
            'Only share them with verified healthcare professionals you trust.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onPrimary.withValues(alpha: 0.9),
            ),
          ),
          const Gap(AppDesignTokens.spacingMd),
          OutlinedButton(
            onPressed: () => _showPolicy(context),
            style: OutlinedButton.styleFrom(
              foregroundColor: theme.colorScheme.onPrimary,
              side: BorderSide(
                color: theme.colorScheme.onPrimary.withValues(alpha: 0.6),
              ),
            ),
            child: const Text('Security Policy'),
          ),
        ],
      ),
    );
  }
}
