import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:printing/printing.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/family_model.dart';
import '../../../models/medical_records_dashboard_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/family_provider.dart';
import '../../../providers/medical_records_provider.dart';
import '../../../providers/service_providers.dart';
import '../../../shared/widgets/family_subject_banner.dart';
import '../../../shared/widgets/imsh_sliver_app_bar.dart';
import '../pdf/diagnoses_pdf.dart';

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
            SliverToBoxAdapter(child: FamilySubjectBanner()),
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
            const SliverToBoxAdapter(child: FamilySubjectBanner()),
            SliverFillRemaining(
              hasScrollBody: false,
              child: _ErrorState(
                message: authFlowErrorMessage(error),
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
              const SliverToBoxAdapter(child: FamilySubjectBanner()),
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
                    _SectionHeader(
                      title: 'Past Diagnoses',
                      source: 'From diagnoses entered by your doctor',
                      actionLabel: 'Download PDF',
                      onAction: () => _downloadDiagnosesPdf(context, ref),
                    ),
                    const Gap(8),
                    ...dashboard.recentDiagnoses
                        .take(2)
                        .map(
                          (diagnosis) => _DiagnosisItem(
                            diagnosis: diagnosis,
                            onTap: () => _openDiagnosesModal(context, ref),
                          ),
                        ),
                    if (dashboard.recentDiagnoses.isEmpty)
                      const _EmptySectionText('No diagnoses on file.'),
                    if (dashboard.recentDiagnoses.isNotEmpty)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () => _openDiagnosesModal(context, ref),
                          child: const Text('View all diagnoses'),
                        ),
                      ),
                    const Gap(24),
                    const _SectionHeader(
                      title: 'Immunization Record',
                      source: 'Recorded by nursing and medical records staff',
                    ),
                    const Gap(8),
                    _ImmunizationGrid(immunizations: dashboard.immunizations),
                    const Gap(24),
                    const _SectionHeader(
                      title: 'Recent Lab Results',
                      source: 'From your latest laboratory reports',
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
        border: Border(left: BorderSide(color: colorScheme.error, width: 4)),
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
            const _EmptySectionText('No known allergies.')
          else
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: allergies
                  .where((item) => item.name.isNotEmpty)
                  .map(
                    (item) => _Tag(
                      text: item.severity?.trim().isNotEmpty == true
                          ? '${item.name} (${_titleCaseStatus(item.severity!)})'
                          : item.name,
                    ),
                  )
                  .toList(),
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
            style: TextStyle(fontSize: 11, color: colorScheme.onSurfaceVariant),
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
    this.onAction,
  });

  final String title;
  final String source;
  final String? actionLabel;
  final VoidCallback? onAction;

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
          TextButton(
            onPressed: onAction,
            child: Text(
              actionLabel!,
              style: TextStyle(
                color: colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}

class _DiagnosisItem extends StatelessWidget {
  const _DiagnosisItem({required this.diagnosis, this.onTap});

  final DashboardDiagnosis diagnosis;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: colorScheme.surfaceContainerLowest,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(color: colorScheme.outlineVariant),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.all(12),
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
                        diagnosis.title.isNotEmpty
                            ? diagnosis.title
                            : 'Diagnosis',
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
                          if (diagnosis.icdCode?.trim().isNotEmpty == true) ...[
                            _StatusPill(text: diagnosis.icdCode!),
                            const Gap(8),
                          ],
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
                Icon(Icons.chevron_right, color: colorScheme.onSurfaceVariant),
              ],
            ),
          ),
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
      return const _EmptySectionText('No immunizations on file.');
    }

    final preview = immunizations.take(2).toList();
    return Row(
      children: [
        for (var i = 0; i < preview.length; i++) ...[
          Expanded(child: _ImmunizationCard(item: preview[i])),
          if (i < preview.length - 1) const Gap(10),
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
        style: TextStyle(fontSize: 11, color: colorScheme.onSurfaceVariant),
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
            style: TextStyle(fontSize: 12, color: colorScheme.onSurfaceVariant),
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
    final statusKey = row.status.toLowerCase();
    if (statusKey == 'high' || statusKey == 'critical') {
      statusColor = colorScheme.error;
    } else if (statusKey == 'low' || statusKey == 'pending') {
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
      status: _titleCaseStatus(
        summary.status?.trim().isNotEmpty == true ? summary.status! : 'NORMAL',
      ),
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
      style: TextStyle(color: colorScheme.onSurfaceVariant, fontSize: 12),
    );
  }
}

String _monthYear(DateTime date) {
  final label = DateFormatter.medicalDate(date);
  final parts = label.split(' ');
  if (parts.length < 3) return label;
  return '${parts[1]} ${parts[2]}';
}

String _titleCaseStatus(String value) {
  final trimmed = value.trim();
  if (trimmed.isEmpty) return 'Normal';
  return '${trimmed[0].toUpperCase()}${trimmed.substring(1).toLowerCase()}';
}

String _recordsPatientName(WidgetRef ref) {
  final family = ref.read(familyViewProvider).selected;
  if (family != null && family.displayName.trim().isNotEmpty) {
    return family.displayName.trim();
  }
  final patient = ref.read(patientAuthProvider).patient;
  final parts = [
    patient?.title,
    patient?.surname,
    patient?.firstName,
    patient?.otherName,
  ].whereType<String>().map((s) => s.trim()).where((s) => s.isNotEmpty);
  final name = parts.join(' ').trim();
  return name.isEmpty ? 'Patient' : name;
}

Future<List<DashboardDiagnosis>> _loadAllDiagnoses(WidgetRef ref) async {
  final service = ref.read(medicalRecordServiceProvider);
  final forPatientId = ref.read(familyViewProvider).forPatientId;
  final diagnoses = await service.listDiagnoses(forPatientId: forPatientId);
  if (diagnoses.isNotEmpty) return diagnoses;
  return ref
      .read(medicalRecordsDashboardProvider)
      .maybeWhen(
        data: (dashboard) => dashboard.recentDiagnoses,
        orElse: () => const <DashboardDiagnosis>[],
      );
}

Future<void> _openDiagnosesModal(BuildContext context, WidgetRef ref) async {
  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (_) => const Center(child: CircularProgressIndicator()),
  );
  try {
    final diagnoses = await _loadAllDiagnoses(ref);
    if (!context.mounted) return;
    Navigator.of(context).pop();
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Past diagnoses',
                  style: Theme.of(
                    sheetContext,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                ),
                const Gap(12),
                if (diagnoses.isEmpty)
                  const _EmptySectionText('No diagnoses on file.')
                else
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.sizeOf(sheetContext).height * 0.55,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: diagnoses.length,
                      itemBuilder: (context, index) =>
                          _DiagnosisItem(diagnosis: diagnoses[index]),
                    ),
                  ),
                const Gap(8),
                FilledButton.icon(
                  onPressed: () {
                    Navigator.of(sheetContext).pop();
                    _downloadDiagnosesPdf(context, ref, diagnoses: diagnoses);
                  },
                  icon: const Icon(Icons.picture_as_pdf_outlined),
                  label: const Text('Download PDF'),
                ),
              ],
            ),
          ),
        );
      },
    );
  } catch (e) {
    if (!context.mounted) return;
    Navigator.of(context).pop();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(authFlowErrorMessage(e))));
  }
}

Future<void> _downloadDiagnosesPdf(
  BuildContext context,
  WidgetRef ref, {
  List<DashboardDiagnosis>? diagnoses,
}) async {
  try {
    final items = diagnoses ?? await _loadAllDiagnoses(ref);
    final patient = ref.read(patientAuthProvider).patient;
    final bytes = await buildDiagnosesPdf(
      patientName: _recordsPatientName(ref),
      hospitalNumber: patient?.patientId,
      diagnoses: items,
    );
    await Printing.sharePdf(bytes: bytes, filename: 'past-diagnoses.pdf');
  } catch (e) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(authFlowErrorMessage(e))));
  }
}
