import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_design_tokens.dart';
import '../../core/theme/context_extensions.dart';
import '../../models/family_model.dart';
import '../../providers/family_provider.dart';

/// Banner shown when viewing a linked child's records.
class FamilySubjectBanner extends ConsumerWidget {
  const FamilySubjectBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final view = ref.watch(familyViewProvider);
    final selected = view.selected;
    if (selected == null) return const SizedBox.shrink();

    final colorScheme = context.colorScheme;

    return Material(
      color: colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDesignTokens.containerPadding,
          vertical: AppDesignTokens.spacingSm,
        ),
        child: Row(
          children: [
            Icon(
              Icons.family_restroom_outlined,
              size: 20,
              color: colorScheme.onSecondaryContainer,
            ),
            const SizedBox(width: AppDesignTokens.spacingSm),
            Expanded(
              child: Text(
                'Viewing ${selected.displayName}',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: colorScheme.onSecondaryContainer,
                    ),
              ),
            ),
            TextButton(
              onPressed: () => ref.read(familyViewProvider.notifier).clear(),
              child: const Text('Back to me'),
            ),
          ],
        ),
      ),
    );
  }
}
