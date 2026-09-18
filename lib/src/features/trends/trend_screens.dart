import 'package:auto_route/auto_route.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../core/theme/app_design_tokens.dart';
import '../../core/theme/context_extensions.dart';
import '../../providers/auth_provider.dart';
import '../../providers/trends_provider.dart';
import '../../shared/widgets/imsh_app_bar.dart';
import 'widgets/trend_line_chart.dart';

@RoutePage()
class VitalsTrendScreen extends ConsumerWidget {
  const VitalsTrendScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(vitalsTrendProvider);
    final colorScheme = context.colorScheme;

    return Scaffold(
      appBar: const ImshAppBar(title: Text('Vitals trends')),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(authFlowErrorMessage(error), textAlign: TextAlign.center),
                const Gap(AppDesignTokens.spacingMd),
                FilledButton(
                  onPressed: () => ref.invalidate(vitalsTrendProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
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
            child: ListView(
              padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
              children: [
                Text(
                  'From clinic visits and hospital observations',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const Gap(AppDesignTokens.spacingLg),
                Text(
                  'Heart rate',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(AppDesignTokens.spacingSm),
                TrendLineChart(
                  spots: pulseSpots,
                  labels: labels,
                  unit: 'bpm',
                  lineColor: colorScheme.tertiary,
                ),
                const Gap(AppDesignTokens.spacingXl),
                Text(
                  'Systolic BP',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(AppDesignTokens.spacingSm),
                TrendLineChart(
                  spots: systolicSpots,
                  labels: labels,
                  unit: 'mmHg',
                ),
                const Gap(AppDesignTokens.spacingXl),
                Text(
                  'Diastolic BP',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(AppDesignTokens.spacingSm),
                TrendLineChart(
                  spots: diastolicSpots,
                  labels: labels,
                  unit: 'mmHg',
                  lineColor: colorScheme.secondary,
                ),
              ],
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

    return Scaffold(
      appBar: const ImshAppBar(title: Text('Lab trends')),
      body: optionsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(authFlowErrorMessage(error))),
        data: (options) {
          final effective = selected != null && options.contains(selected)
              ? selected
              : (options.isNotEmpty ? options.first : null);

          if (effective == null) {
            return Center(
              child: Text(
                'No numeric lab analytes available yet.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            );
          }

          final trendAsync = ref.watch(labAnalyteTrendProvider(effective));

          return ListView(
            padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
            children: [
              Text(
                'Analyte',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
              ),
              const Gap(AppDesignTokens.spacingSm),
              DropdownButtonFormField<String>(
                key: ValueKey(effective),
                initialValue: effective,
                items: [
                  for (final option in options)
                    DropdownMenuItem(value: option, child: Text(option)),
                ],
                onChanged: (value) {
                  if (value == null) return;
                  setState(() => _selected = value);
                },
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const Gap(AppDesignTokens.spacingLg),
              trendAsync.when(
                loading: () => const Padding(
                  padding: EdgeInsets.all(AppDesignTokens.spacingXl),
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (error, _) => Text(authFlowErrorMessage(error)),
                data: (points) {
                  final spots = <FlSpot>[
                    for (var i = 0; i < points.length; i++)
                      FlSpot(i.toDouble(), points[i].value),
                  ];
                  final labels = points
                      .map((p) => compactTrendDate(p.at))
                      .toList(growable: false);
                  final unit = points.isNotEmpty ? points.last.unit : null;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        effective,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const Gap(AppDesignTokens.spacingSm),
                      TrendLineChart(spots: spots, labels: labels, unit: unit),
                    ],
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
