import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../providers/radiology_reports_provider.dart';
import 'radiology_filter_sheet.dart';

class RadiologyActionRow extends ConsumerWidget {
  const RadiologyActionRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(radiologyReportFilterProvider);
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return Row(
      children: [
        OutlinedButton.icon(
          onPressed: () => showRadiologyFilterSheet(context, ref),
          icon: Badge(
            isLabelVisible: filter.isActive,
            child: const Icon(Icons.tune, size: 18),
          ),
          label: const Text('Filter'),
          style: OutlinedButton.styleFrom(
            foregroundColor: colorScheme.onSurface,
            side: BorderSide(color: colorScheme.outlineVariant),
            padding: const EdgeInsets.symmetric(
              horizontal: AppDesignTokens.spacingMd,
              vertical: AppDesignTokens.spacingSm + 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDesignTokens.radiusSm),
            ),
          ),
        ),
        const Gap(AppDesignTokens.spacingSm),
        Expanded(
          child: FilledButton.icon(
            onPressed: () => context.router.push(const AppointmentsRoute()),
            icon: const Icon(Icons.calendar_month_outlined, size: 18),
            label: const Text('Book Scan'),
            style: FilledButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(
                horizontal: AppDesignTokens.spacingMd,
                vertical: AppDesignTokens.spacingSm + 2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDesignTokens.radiusSm),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
