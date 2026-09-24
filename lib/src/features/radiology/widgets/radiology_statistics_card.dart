import 'package:flutter/material.dart';

import '../../../core/theme/imsh_accent_colors.dart';
import '../../../models/radiology_report_model.dart';
import '../../../shared/widgets/imsh_kpi_tile.dart';

class RadiologyStatisticsCard extends StatelessWidget {
  const RadiologyStatisticsCard({super.key, required this.statistics});

  final RadiologyStatistics statistics;

  @override
  Widget build(BuildContext context) {
    final total = statistics.totalScans;
    final pending = statistics.pendingReviews;
    final completeness = statistics.profileCompleteness.clamp(0, 100);

    return ImshKpiStrip(
      items: [
        ImshKpiItem(
          label: 'Total scans',
          value: total > 0 ? '$total' : '—',
          caption: total > 0 ? 'On record' : 'None yet',
          icon: Icons.image_search_outlined,
          accent: ImshAccentColors.indigo,
        ),
        ImshKpiItem(
          label: 'Pending',
          value: pending > 0 ? '$pending' : '—',
          caption: 'Reviews',
          icon: Icons.hourglass_empty_outlined,
          accent: ImshAccentColors.amber,
        ),
        ImshKpiItem(
          label: 'Completeness',
          value: '$completeness%',
          caption: 'Health record',
          icon: Icons.fact_check_outlined,
          accent: ImshAccentColors.green,
        ),
      ],
    );
  }
}
