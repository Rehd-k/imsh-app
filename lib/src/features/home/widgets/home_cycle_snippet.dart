import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imsh/app_router.gr.dart';

import '../../../core/theme/imsh_accent_colors.dart';
import '../../../providers/cycle_provider.dart';
import '../../../providers/family_provider.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';

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
        final cs = theme.colorScheme;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 12),
            Row(
              children: [
                const ImshSolidIcon(
                  icon: Icons.water_drop_outlined,
                  color: ImshAccentColors.pink,
                  size: 26,
                  iconSize: 14,
                  radius: 7,
                ),
                const SizedBox(width: 8),
                Text(
                  'Cycle',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w800,
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
            const SizedBox(height: 8),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () => context.router.push(const CycleTrackerRoute()),
                child: ImshSurfaceCard(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const ImshSolidIcon(
                        icon: Icons.water_drop_outlined,
                        color: ImshAccentColors.pink,
                        size: 30,
                        iconSize: 16,
                        radius: 8,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ImshEllipsisText(
                              text: summary.headline,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            if (summary.pregnancyPaused) ...[
                              const SizedBox(height: 2),
                              Text(
                                'Predictions paused during pregnancy',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: cs.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: cs.onSurfaceVariant,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }
}
