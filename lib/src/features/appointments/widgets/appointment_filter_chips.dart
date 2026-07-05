import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../models/appointment_model.dart';
import '../../../providers/appointments_provider.dart';

class AppointmentFilterChips extends ConsumerWidget {
  const AppointmentFilterChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(appointmentFilterProvider);
    final theme = Theme.of(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < AppointmentFilterTab.values.length; i++) ...[
            if (i > 0) const Gap(AppDesignTokens.spacingSm),
            _FilterChip(
              label: AppointmentFilterTab.values[i].label,
              selected: activeFilter == AppointmentFilterTab.values[i],
              onSelected: () {
                ref.read(appointmentFilterProvider.notifier).state =
                    AppointmentFilterTab.values[i];
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
  });

  final String label;
  final bool selected;
  final VoidCallback onSelected;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return FilterChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onSelected(),
      showCheckmark: false,
      labelStyle: theme.textTheme.labelMedium?.copyWith(
        color: selected
            ? colorScheme.onPrimary
            : colorScheme.onSurfaceVariant,
        fontWeight: FontWeight.w600,
      ),
      backgroundColor: colorScheme.surfaceContainerLow,
      selectedColor: colorScheme.primary,
      side: BorderSide(
        color: selected
            ? colorScheme.primary
            : colorScheme.outlineVariant,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(999),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDesignTokens.spacingMd,
        vertical: AppDesignTokens.spacingXs,
      ),
    );
  }
}
