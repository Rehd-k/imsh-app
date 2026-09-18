import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../models/medical_records_dashboard_model.dart';

class VitalsSummaryRow extends StatelessWidget {
  const VitalsSummaryRow({super.key, required this.vitals});

  final LatestVitalsSummary? vitals;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDesignTokens.containerPadding,
      ),
      child: Row(
        children: [
          Expanded(child: _HeartRateCard(pulseRate: vitals?.pulseRate)),
          const Gap(AppDesignTokens.spacingMd),
          Expanded(
            child: _BloodPressureCard(
              systolic: vitals?.systolic,
              diastolic: vitals?.diastolic,
              status: vitals?.bloodPressureStatus,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeartRateCard extends StatelessWidget {
  const _HeartRateCard({required this.pulseRate});

  final int? pulseRate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;
    final hasValue = pulseRate != null;
    final displayValue = hasValue ? '$pulseRate' : '—';
    final semanticLabel = hasValue
        ? 'Heart rate $pulseRate beats per minute'
        : 'Heart rate unavailable';

    return Semantics(
      label: semanticLabel,
      child: ExcludeSemantics(
        child: _VitalCardShell(
          icon: Icons.monitor_heart_outlined,
          label: 'Heart rate',
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                displayValue,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (hasValue) ...[
                const Gap(4),
                Text(
                  'bpm',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _BloodPressureCard extends StatelessWidget {
  const _BloodPressureCard({
    required this.systolic,
    required this.diastolic,
    this.status,
  });

  final int? systolic;
  final int? diastolic;
  final String? status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;
    final hasValue = systolic != null || diastolic != null;
    final displayValue = hasValue
        ? (systolic != null && diastolic != null
              ? '$systolic/$diastolic'
              : systolic != null
              ? '$systolic/—'
              : '—/$diastolic')
        : '—';
    final semanticLabel = !hasValue
        ? 'Blood pressure unavailable'
        : status != null && status!.isNotEmpty
        ? 'Blood pressure $displayValue, $status'
        : 'Blood pressure $displayValue';

    return Semantics(
      label: semanticLabel,
      child: ExcludeSemantics(
        child: _VitalCardShell(
          icon: Icons.bloodtype_outlined,
          label: 'Blood pressure',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                displayValue,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (status != null && status!.isNotEmpty) ...[
                const Gap(AppDesignTokens.spacingSm),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDesignTokens.spacingSm,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: context.imshTheme.primaryHighlight,
                    borderRadius: BorderRadius.circular(
                      AppDesignTokens.radiusSm,
                    ),
                  ),
                  child: Text(
                    status!,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _VitalCardShell extends StatelessWidget {
  const _VitalCardShell({
    required this.icon,
    required this.label,
    required this.child,
  });

  final IconData icon;
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return Container(
      padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
        border: Border.all(color: colorScheme.outlineVariant),
        boxShadow: context.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: colorScheme.onSurfaceVariant),
              const Gap(AppDesignTokens.spacingXs),
              Expanded(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const Gap(AppDesignTokens.spacingSm),
          child,
        ],
      ),
    );
  }
}
