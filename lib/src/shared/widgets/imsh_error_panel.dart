import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/theme/app_design_tokens.dart';

class ImshErrorPanel extends StatelessWidget {
  const ImshErrorPanel({
    super.key,
    required this.message,
    required this.onRetry,
    this.title,
    this.icon = Icons.error_outline,
    this.tips = const [],
    this.retryLabel = 'Try again',
  });

  final String? title;
  final String message;
  final IconData icon;
  final List<String> tips;
  final VoidCallback onRetry;
  final String retryLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(AppDesignTokens.spacing2xl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(icon, size: 56, color: colorScheme.primary),
          if (title != null) ...[
            const Gap(AppDesignTokens.spacingLg),
            Text(
              title!,
              style: theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ],
          const Gap(AppDesignTokens.spacingMd),
          Text(
            message,
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          if (tips.isNotEmpty) ...[
            const Gap(AppDesignTokens.spacingLg),
            Text(
              'What you can try',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(AppDesignTokens.spacingSm),
            ...tips.map(
              (tip) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '• ',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        tip,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          const Gap(AppDesignTokens.spacingLg),
          FilledButton(
            onPressed: onRetry,
            child: Text(retryLabel),
          ),
        ],
      ),
    );
  }
}
