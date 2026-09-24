import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../models/appointment_model.dart';
import '../../../providers/appointments_provider.dart';
import '../../../shared/widgets/imsh_filter_row.dart';

class AppointmentFilterChips extends ConsumerWidget {
  const AppointmentFilterChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(appointmentFilterProvider);
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
              child: DropdownButton<AppointmentFilterTab>(
                value: activeFilter,
                isExpanded: true,
                isDense: true,
                icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 20),
                style: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: cs.onSurface,
                ),
                items: [
                  for (final tab in AppointmentFilterTab.values)
                    DropdownMenuItem(
                      value: tab,
                      child: Text(tab.label),
                    ),
                ],
                onChanged: (next) {
                  if (next == null) return;
                  ref.read(appointmentFilterProvider.notifier).state = next;
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
