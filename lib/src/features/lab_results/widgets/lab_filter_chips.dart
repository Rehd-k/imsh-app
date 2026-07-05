import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../providers/lab_results_provider.dart';

class LabFilterChips extends ConsumerWidget {
  const LabFilterChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(labResultFilterProvider);
    final theme = Theme.of(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final filter in LabResultFilterChip.values) ...[
            if (filter != LabResultFilterChip.all) const Gap(AppDesignTokens.spacingSm),
            _FilterChip(
              label: filter.label,
              selected: activeFilter == filter,
              leading: filter == LabResultFilterChip.all
                  ? const Icon(Icons.filter_list, size: 16)
                  : null,
              onSelected: () {
                ref.read(labResultFilterProvider.notifier).state = filter;
              },
              theme: theme,
            ),
          ],
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onSelected,
    required this.theme,
    this.leading,
  });

  final String label;
  final bool selected;
  final VoidCallback onSelected;
  final ThemeData theme;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      avatar: leading,
      selected: selected,
      onSelected: (_) => onSelected(),
      showCheckmark: false,
      labelStyle: theme.textTheme.labelMedium?.copyWith(
        color: selected ? theme.colorScheme.onPrimary : context.colorScheme.onSurface,
        fontWeight: FontWeight.w600,
      ),
      backgroundColor: context.colorScheme.surfaceContainerLow,
      selectedColor: theme.colorScheme.primary,
      side: BorderSide(
        color: selected
            ? theme.colorScheme.primary
            : context.colorScheme.outlineVariant,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(999),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDesignTokens.spacingSm,
        vertical: AppDesignTokens.spacingXs,
      ),
    );
  }
}
