import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imsh/app_router.gr.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../providers/radiology_reports_provider.dart';
import '../../../shared/widgets/imsh_filter_row.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import 'radiology_filter_sheet.dart';

class RadiologyActionRow extends ConsumerWidget {
  const RadiologyActionRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(radiologyReportFilterProvider);

    return ImshFilterRow(
      filters: [
        Flexible(
          child: FilledButton.icon(
            onPressed: () => context.router.push(const AppointmentsRoute()),
            icon: const Icon(Icons.calendar_month_outlined, size: 18),
            label: const Text('Book scan'),
            style: FilledButton.styleFrom(
              visualDensity: VisualDensity.compact,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            ),
          ),
        ),
        Tooltip(
          message: filter.isActive ? 'Filters (active)' : 'Filters',
          child: InkWell(
            onTap: () => showRadiologyFilterSheet(context, ref),
            borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
            child: Badge(
              isLabelVisible: filter.isActive,
              child: const ImshSolidIcon(
                icon: Icons.tune_rounded,
                color: ImshAccentColors.indigo,
                size: 36,
                iconSize: 18,
                radius: AppDesignTokens.radiusMd,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
