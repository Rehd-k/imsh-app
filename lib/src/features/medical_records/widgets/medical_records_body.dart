import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/medical_records_dashboard_model.dart';
import '../../../providers/medical_records_provider.dart';
import '../../../shared/widgets/imsh_sliver_app_bar.dart';

class MedicalRecordsBody extends ConsumerWidget {
  const MedicalRecordsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(medicalRecordsDashboardProvider);

    return RefreshIndicator(
      onRefresh: () async => ref.invalidate(medicalRecordsDashboardProvider),
      child: dashboardAsync.when(
        loading: () => const CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          slivers: [
            ImshSliverAppBar(),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
        error: (error, _) => CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            const ImshSliverAppBar(),
            SliverFillRemaining(
              hasScrollBody: false,
              child: _ErrorState(
                message: error.toString(),
                onRetry: () => ref.invalidate(medicalRecordsDashboardProvider),
              ),
            ),
          ],
        ),
        data: (dashboard) {
          final theme = Theme.of(context);
          final colorScheme = context.colorScheme;

          return CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              const ImshSliverAppBar(),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 48),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    Text(
                      'Medical Records',
                      style: theme.textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: colorScheme.primary,
                      ),
                    ),
                    const Gap(16),
                    const _SearchField(),
                    const Gap(16),
                    _CriticalAllergiesCard(allergies: dashboard.allergies),
                    const Gap(16),
                    _VitalsCard(
                      bloodType: dashboard.bloodType,
                      heightCm: dashboard.heightCm,
                      weightKg: dashboard.weightKg,
                    ),
                    const Gap(24),
                    const _SectionHeader(
                      title: 'Past Diagnoses',
                      source: 'From API: /patient/medical-records/dashboard',
                      actionLabel: 'Download PDF',
                    ),
                    const Gap(8),
                    ...dashboard.recentDiagnoses
                        .take(2)
                        .map((diagnosis) => _DiagnosisItem(diagnosis: diagnosis)),
                    if (dashboard.recentDiagnoses.isEmpty)
                      const _EmptySectionText('No diagnoses returned by backend.'),
                    const Gap(24),
                    const _SectionHeader(
                      title: 'Immunization Record',
                      source: 'From API: /patient/medical-records/dashboard',
                    ),
                    const Gap(8),
                    _ImmunizationGrid(immunizations: dashboard.immunizations),
                    const Gap(24),
                    const _SectionHeader(
                      title: 'Recent Lab Results',
                      source: 'From API: /patient/medical-records/dashboard',
                    ),
                    const Gap(8),
                    _LabResultsCard(labs: dashboard.recentLabResults),
                  ]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        border: Border.all(color: colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: colorScheme.onSurfaceVariant),
          const Gap(8),
          Expanded(
            child: Text(
              'Search diagnoses, immunizations, or labs',
              style: TextStyle(color: colorScheme.onSurfaceVariant),
            ),
          ),
        ],
      ),
    );
  }
}

class _CriticalAllergiesCard extends StatelessWidget {
  const _CriticalAllergiesCard({required this.allergies});

  final List<DashboardAllergy> allergies;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(12),
        border: Border(
          left: BorderSide(color: colorScheme.error, width: 4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: colorScheme.error),
              const Gap(4),
              Text(
                'Critical Allergies',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.error,
                ),
              ),
            ],
          ),
          const Gap(10),
          if (allergies.isEmpty)
            const _EmptySectionText('No allergy data returned by backend.')
          else
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: allergies
                  .where((item) => item.name.isNotEmpty)
                  .map((item) => _Tag(text: item.name))
                  .toList(),
            ),
          const Gap(6),
          Text(
            'Source: /patient/medical-records/dashboard',
            style: TextStyle(
              fontSize: 11,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _VitalsCard extends StatelessWidget {
  const _VitalsCard({
    required this.bloodType,
    required this.heightCm,
    required this.weightKg,
  });

  final String? bloodType;
  final double? heightCm;
  final double? weightKg;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    String metric(Object? value, String unit) {
      if (value == null) return '-- $unit';
      if (value is num) return '${value.toStringAsFixed(0)} $unit';
      if (value is String && value.trim().isNotEmpty) return '$value $unit';
      return '-- $unit';
    }

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _Metric(
                  label: 'Blood Type',
                  value: bloodType?.trim().isNotEmpty == true
                      ? bloodType!
                      : '--',
                ),
              ),
              _divider(colorScheme.outlineVariant),
              Expanded(
                child: _Metric(label: 'Height', value: metric(heightCm, 'cm')),
              ),
              _divider(colorScheme.outlineVariant),
              Expanded(
                child: _Metric(label: 'Weight', value: metric(weightKg, 'kg')),
              ),
            ],
          ),
          Text(
            'Source: /patient/medical-records/dashboard',
            style: TextStyle(
              fontSize: 11,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider(Color color) {
    return Container(
      width: 1,
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      color: color,
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.source,
    this.actionLabel,
  });

  final String title;
  final String source;
  final String? actionLabel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                source,
                style: TextStyle(
                  fontSize: 11,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        if (actionLabel != null)
          Text(
            actionLabel!,
            style: TextStyle(
              color: colorScheme.primaryContainer,
              fontWeight: FontWeight.w600,
            ),
          ),
      ],
    );
  }
}

class _DiagnosisItem extends StatelessWidget {
  const _DiagnosisItem({required this.diagnosis});

  final DashboardDiagnosis diagnosis;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerLowest,
          border: Border.all(color: colorScheme.outlineVariant),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: colorScheme.primary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.health_and_safety,
                color: colorScheme.primary,
              ),
            ),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    diagnosis.title.isNotEmpty ? diagnosis.title : 'Diagnosis',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    diagnosis.doctorName.isNotEmpty
                        ? 'Diagnosed by Dr. ${diagnosis.doctorName}'
                        : 'Diagnosing doctor unavailable',
                    style: TextStyle(
                      color: colorScheme.onSurfaceVariant,
                      fontSize: 13,
                    ),
                  ),
                  if (diagnosis.specialty?.trim().isNotEmpty == true)
                    Text(
                      diagnosis.specialty!,
                      style: TextStyle(
                        color: colorScheme.onSurfaceVariant,
                        fontSize: 12,
                      ),
                    ),
                  const Gap(6),
                  Row(
                    children: [
                      _StatusPill(text: diagnosis.status ?? 'Unknown'),
                      const Gap(8),
                      Text(
                        diagnosis.diagnosedAt == null
                            ? '--'
                            : _monthYear(diagnosis.diagnosedAt!),
                        style: TextStyle(
                          color: colorScheme.onSurfaceVariant,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}

class _ImmunizationGrid extends StatelessWidget {
  const _ImmunizationGrid({required this.immunizations});

  final List<DashboardImmunization> immunizations;

  @override
  Widget build(BuildContext context) {
    if (immunizations.isEmpty) {
      return const _EmptySectionText(
        'No immunization data returned by backend.',
      );
    }

    return Row(
      children: [
        for (var i = 0; i < immunizations.take(2).length; i++) ...[
          Expanded(child: _ImmunizationCard(item: immunizations[i])),
          if (i == 0) const Gap(10),
        ],
      ],
    );
  }
}

class _LabResultsCard extends StatelessWidget {
  const _LabResultsCard({required this.labs});

  final List<DashboardLabResult> labs;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final rows = labs.take(3).map(_LabRow.fromSummary).toList();

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        children: [
          const _LabHeader(),
          for (final row in rows) _LabDataRow(row: row),
          if (rows.isEmpty)
            const Padding(
              padding: EdgeInsets.all(10),
              child: _EmptySectionText('No lab results returned by backend.'),
            ),
          Divider(height: 1, color: colorScheme.outlineVariant),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              'View All Lab History',
              style: TextStyle(
                color: colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(AppDesignTokens.spacing2xl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 48, color: theme.colorScheme.error),
          const Gap(AppDesignTokens.spacingMd),
          Text(
            message,
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const Gap(AppDesignTokens.spacingMd),
          FilledButton(onPressed: onRetry, child: const Text('Try again')),
        ],
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const Gap(2),
        Text(
          value,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: colorScheme.primary,
          ),
        ),
      ],
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: colorScheme.error,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          color: colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

class _ImmunizationCard extends StatelessWidget {
  const _ImmunizationCard({required this.item});

  final DashboardImmunization item;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.vaccines_outlined, color: colorScheme.primary),
          const Gap(6),
          Text(
            item.vaccineName.isNotEmpty ? item.vaccineName : 'Immunization',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          if (item.detail?.trim().isNotEmpty == true) ...[
            const Gap(2),
            Text(
              item.detail!,
              style: TextStyle(
                fontSize: 12,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
          const Gap(8),
          Text(
            item.date == null ? '--' : DateFormatter.medicalDate(item.date!),
            style: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _LabHeader extends StatelessWidget {
  const _LabHeader();

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontWeight: FontWeight.w600, fontSize: 12);
    return const Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(child: Text('Test Name', style: style)),
          Expanded(child: Text('Result', style: style)),
          Expanded(child: Text('Range', style: style)),
          Expanded(child: Text('Status', style: style)),
        ],
      ),
    );
  }
}

class _LabDataRow extends StatelessWidget {
  const _LabDataRow({required this.row});

  final _LabRow row;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final imsh = context.imshTheme;

    var statusColor = imsh.onSuccessContainer;
    if (row.status == 'High' || row.status == 'Critical') {
      statusColor = colorScheme.error;
    } else if (row.status == 'Pending') {
      statusColor = imsh.onWarningContainer;
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: colorScheme.outlineVariant)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(row.testName, style: const TextStyle(fontSize: 12)),
          ),
          Expanded(
            child: Text(row.result, style: const TextStyle(fontSize: 12)),
          ),
          Expanded(
            child: Text(row.range, style: const TextStyle(fontSize: 12)),
          ),
          Expanded(
            child: Text(
              row.status,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: statusColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LabRow {
  const _LabRow({
    required this.testName,
    required this.result,
    required this.range,
    required this.status,
  });

  final String testName;
  final String result;
  final String range;
  final String status;

  factory _LabRow.fromSummary(DashboardLabResult summary) {
    return _LabRow(
      testName: summary.testName.isNotEmpty ? summary.testName : '--',
      result: summary.result?.trim().isNotEmpty == true
          ? summary.result!
          : '--',
      range: summary.referenceRange?.trim().isNotEmpty == true
          ? summary.referenceRange!
          : '--',
      status: summary.status?.trim().isNotEmpty == true
          ? summary.status!
          : '--',
    );
  }
}

class _EmptySectionText extends StatelessWidget {
  const _EmptySectionText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Text(
      text,
      style: TextStyle(
        color: colorScheme.onSurfaceVariant,
        fontSize: 12,
      ),
    );
  }
}

String _monthYear(DateTime date) {
  final label = DateFormatter.medicalDate(date);
  final parts = label.split(' ');
  if (parts.length < 3) return label;
  return '${parts[1]} ${parts[2]}';
}
