import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../providers/cycle_provider.dart';
import '../../../providers/family_provider.dart';

class HomeCycleSnippet extends ConsumerWidget {
  const HomeCycleSnippet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(familyViewProvider).isViewingFamily) {
      return const SizedBox.shrink();
    }

    final summaryAsync = ref.watch(cycleSummaryProvider);
    return summaryAsync.maybeWhen(
      data: (summary) {
        if (!summary.configured) return const SizedBox.shrink();
        final theme = Theme.of(context);
        final colorScheme = context.colorScheme;

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDesignTokens.containerPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(
                    'Cycle',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () =>
                        context.router.push(const CycleTrackerRoute()),
                    child: const Text('Open'),
                  ),
                ],
              ),
              Material(
                color: colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
                child: InkWell(
                  borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
                  onTap: () => context.router.push(const CycleTrackerRoute()),
                  child: Container(
                    padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppDesignTokens.radiusMd,
                      ),
                      border: Border.all(color: colorScheme.outlineVariant),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: colorScheme.primaryContainer,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.water_drop_outlined,
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const Gap(AppDesignTokens.spacingMd),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                summary.headline,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              if (summary.pregnancyPaused) ...[
                                const Gap(2),
                                Text(
                                  'Predictions paused during pregnancy',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(AppDesignTokens.spacingLg),
            ],
          ),
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }
}
