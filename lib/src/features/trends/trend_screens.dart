import 'package:auto_route/auto_route.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/responsive.dart';
import '../../core/theme/app_design_tokens.dart';
import '../../core/theme/imsh_accent_colors.dart';
import '../../providers/auth_provider.dart';
import '../../providers/trends_provider.dart';
import '../../shared/widgets/imsh_app_bar.dart';
import '../../shared/widgets/imsh_empty_state.dart';
import '../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../shared/widgets/imsh_error_panel.dart';
import '../../shared/widgets/imsh_filter_row.dart';
import '../../shared/widgets/imsh_page_header.dart';
import '../../shared/widgets/imsh_surface_card.dart';
import 'widgets/trend_line_chart.dart';

@RoutePage()
class VitalsTrendScreen extends ConsumerWidget {
  const VitalsTrendScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(vitalsTrendProvider);

    return Scaffold(
      appBar: const ImshAppBar(title: Text('Vitals trends')),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => ImshErrorPanel(
          message: authFlowErrorMessage(error),
          onRetry: () => ref.invalidate(vitalsTrendProvider),
        ),
        data: (points) {
          final labels = points
              .map((p) => compactTrendDate(p.at))
              .toList(growable: false);
          final pulseSpots = <FlSpot>[];
          final systolicSpots = <FlSpot>[];
          final diastolicSpots = <FlSpot>[];
          for (var i = 0; i < points.length; i++) {
            final point = points[i];
            if (point.pulseRate != null) {
              pulseSpots.add(FlSpot(i.toDouble(), point.pulseRate!.toDouble()));
            }
            if (point.systolic != null) {
              systolicSpots.add(
                FlSpot(i.toDouble(), point.systolic!.toDouble()),
              );
            }
            if (point.diastolic != null) {
              diastolicSpots.add(
                FlSpot(i.toDouble(), point.diastolic!.toDouble()),
              );
            }
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(vitalsTrendProvider);
              await ref.read(vitalsTrendProvider.future);
            },
            child: ResponsiveBody(
              expand: false,
              builder: (context, bp) {
                return ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    const ImshPageHeader(
                      title: 'Vitals trends',
                      subtitle:
                          'From clinic visits and hospital observations.',
                      icon: Icons.monitor_heart_outlined,
                      iconColor: ImshAccentColors.pink,
                    ),
                    const SizedBox(height: 12),
                    _TrendChartCard(
                      title: 'Heart rate',
                      icon: Icons.favorite_outline,
                      iconColor: ImshAccentColors.pink,
                      child: TrendLineChart(
                        spots: pulseSpots,
                        labels: labels,
                        unit: 'bpm',
                        lineColor: ImshAccentColors.pink,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _TrendChartCard(
                      title: 'Systolic BP',
                      icon: Icons.bloodtype_outlined,
                      iconColor: ImshAccentColors.blue,
                      child: TrendLineChart(
                        spots: systolicSpots,
                        labels: labels,
                        unit: 'mmHg',
                        lineColor: ImshAccentColors.blue,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _TrendChartCard(
                      title: 'Diastolic BP',
                      icon: Icons.bloodtype_outlined,
                      iconColor: ImshAccentColors.teal,
                      child: TrendLineChart(
                        spots: diastolicSpots,
                        labels: labels,
                        unit: 'mmHg',
                        lineColor: ImshAccentColors.teal,
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

@RoutePage()
class LabTrendScreen extends ConsumerStatefulWidget {
  const LabTrendScreen({super.key, @QueryParam('analyte') this.analyte});

  final String? analyte;

  @override
  ConsumerState<LabTrendScreen> createState() => _LabTrendScreenState();
}

class _LabTrendScreenState extends ConsumerState<LabTrendScreen> {
  String? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.analyte;
  }

  @override
  Widget build(BuildContext context) {
    final optionsAsync = ref.watch(labAnalyteOptionsProvider);
    final selected = _selected;
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      appBar: const ImshAppBar(title: Text('Lab trends')),
      body: optionsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => ImshErrorPanel(
          message: authFlowErrorMessage(error),
          onRetry: () => ref.invalidate(labAnalyteOptionsProvider),
        ),
        data: (options) {
          final effective = selected != null && options.contains(selected)
              ? selected
              : (options.isNotEmpty ? options.first : null);

          return ResponsiveBody(
            expand: false,
            builder: (context, bp) {
              if (effective == null) {
                return ListView(
                  children: const [
                    ImshPageHeader(
                      title: 'Lab trends',
                      subtitle: 'Track numeric analytes over time.',
                      icon: Icons.show_chart_outlined,
                      iconColor: ImshAccentColors.teal,
                    ),
                    SizedBox(height: 12),
                    ImshEmptyState(
                      icon: Icons.show_chart_outlined,
                      iconColor: ImshAccentColors.teal,
                      message: 'No numeric lab analytes available yet.',
                    ),
                  ],
                );
              }

              final trendAsync = ref.watch(labAnalyteTrendProvider(effective));

              return ListView(
                children: [
                  const ImshPageHeader(
                    title: 'Lab trends',
                    subtitle: 'Track numeric analytes over time.',
                    icon: Icons.show_chart_outlined,
                    iconColor: ImshAccentColors.teal,
                  ),
                  const SizedBox(height: 12),
                  ImshFilterRow(
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
                              borderRadius: BorderRadius.circular(
                                AppDesignTokens.radiusMd,
                              ),
                              borderSide:
                                  BorderSide(color: cs.outlineVariant),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                AppDesignTokens.radiusMd,
                              ),
                              borderSide:
                                  BorderSide(color: cs.outlineVariant),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              key: ValueKey(effective),
                              value: effective,
                              isExpanded: true,
                              isDense: true,
                              icon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 20,
                              ),
                              style: theme.textTheme.labelLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: cs.onSurface,
                              ),
                              items: [
                                for (final option in options)
                                  DropdownMenuItem(
                                    value: option,
                                    child: Text(option),
                                  ),
                              ],
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() => _selected = value);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  trendAsync.when(
                    loading: () => const Padding(
                      padding: EdgeInsets.all(24),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    error: (error, _) => ImshErrorPanel(
                      message: authFlowErrorMessage(error),
                      onRetry: () =>
                          ref.invalidate(labAnalyteTrendProvider(effective)),
                    ),
                    data: (points) {
                      final spots = <FlSpot>[
                        for (var i = 0; i < points.length; i++)
                          FlSpot(i.toDouble(), points[i].value),
                      ];
                      final labels = points
                          .map((p) => compactTrendDate(p.at))
                          .toList(growable: false);
                      final unit = points.isNotEmpty ? points.last.unit : null;
                      return _TrendChartCard(
                        title: effective,
                        icon: Icons.science_outlined,
                        iconColor: ImshAccentColors.teal,
                        child: TrendLineChart(
                          spots: spots,
                          labels: labels,
                          unit: unit,
                          lineColor: ImshAccentColors.teal,
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class _TrendChartCard extends StatelessWidget {
  const _TrendChartCard({
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.child,
  });

  final String title;
  final IconData icon;
  final Color iconColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ImshSurfaceCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ImshSectionHeader(
            title: title,
            icon: icon,
            iconColor: iconColor,
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}
