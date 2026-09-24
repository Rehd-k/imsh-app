import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../providers/lab_results_provider.dart';
import '../../../shared/widgets/imsh_filter_row.dart';

class LabFilterChips extends ConsumerWidget {
  const LabFilterChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(labResultFilterProvider);
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return ImshFilterRow(
      filters: [
        Flexible(
          child: InputDecorator(
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
                borderSide: BorderSide(color: cs.outlineVariant),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
                borderSide: BorderSide(color: cs.outlineVariant),
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<LabResultFilterChip>(
                value: activeFilter,
                isExpanded: true,
                isDense: true,
                icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 20),
                style: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: cs.onSurface,
                ),
                items: [
                  for (final filter in LabResultFilterChip.values)
                    DropdownMenuItem(
                      value: filter,
                      child: Text(filter.label),
                    ),
                ],
                onChanged: (next) {
                  if (next == null) return;
                  ref.read(labResultFilterProvider.notifier).state = next;
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
