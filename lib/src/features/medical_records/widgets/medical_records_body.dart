import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imsh/app_router.gr.dart';
import 'package:printing/printing.dart';

import '../../../core/responsive.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/medical_records_dashboard_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/family_provider.dart';
import '../../../providers/medical_records_provider.dart';
import '../../../providers/service_providers.dart';
import '../../../shared/widgets/family_subject_banner.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_error_panel.dart';
import '../../../shared/widgets/imsh_kpi_tile.dart';
import '../../../shared/widgets/imsh_page_header.dart';
import '../../../shared/widgets/imsh_semantic_badge.dart';
import '../../../shared/widgets/imsh_sliver_app_bar.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';
import '../pdf/diagnoses_pdf.dart';

class MedicalRecordsBody extends ConsumerWidget {
  const MedicalRecordsBody({super.key});

  static const sectionGap = 12.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(medicalRecordsDashboardProvider);

    return dashboardAsync.when(
      loading: () => const _RecordsLoading(),
      error: (error, _) => _RecordsError(
        message: authFlowErrorMessage(error),
        onRetry: () => ref.invalidate(medicalRecordsDashboardProvider),
      ),
      data: (dashboard) => RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(medicalRecordsDashboardProvider);
          await ref.read(medicalRecordsDashboardProvider.future);
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            const ImshSliverAppBar(),
            const SliverToBoxAdapter(child: FamilySubjectBanner()),
            SliverFillRemaining(
              hasScrollBody: true,
              child: ResponsiveBody(
                center: false,
                bottomPadding: 24,
                builder: (context, bp) {
                  final showRail = bp.isDesktop;
                  final useSnapKpis = bp.maxWidth < 520;

                  final main = _RecordsMainColumn(
                    dashboard: dashboard,
                    useSnapKpis: useSnapKpis,
                    showInlineSideSections: !showRail,
                    onDownloadPdf: () => _downloadDiagnosesPdf(context, ref),
                    onOpenDiagnoses: () => _openDiagnosesModal(context, ref),
                    onViewLabs: () =>
                        context.router.push(const LabResultsRoute()),
                  );

                  if (!showRail) {
                    return SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: main,
                    );
                  }

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 9,
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: main,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 3,
                        child: _RecordsSideRail(dashboard: dashboard),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecordsMainColumn extends StatelessWidget {
  const _RecordsMainColumn({
    required this.dashboard,
    required this.useSnapKpis,
    required this.showInlineSideSections,
    required this.onDownloadPdf,
    required this.onOpenDiagnoses,
    required this.onViewLabs,
  });

  final MedicalRecordsDashboardResponse dashboard;
  final bool useSnapKpis;
  final bool showInlineSideSections;
  final VoidCallback onDownloadPdf;
  final VoidCallback onOpenDiagnoses;
  final VoidCallback onViewLabs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ImshPageHeader(
          title: 'Medical Records',
          subtitle: 'Allergies, diagnoses, immunizations, and labs.',
          icon: Icons.folder_shared_outlined,
          iconColor: ImshAccentColors.blue,
          trailing: IconButton(
            tooltip: 'Download diagnoses PDF',
            onPressed: onDownloadPdf,
            icon: const Icon(Icons.picture_as_pdf_outlined),
          ),
        ),
        const SizedBox(height: 10),
        _RecordsKpiStrip(dashboard: dashboard, useSnapStrip: useSnapKpis),
        const SizedBox(height: MedicalRecordsBody.sectionGap),
        const _SearchField(),
        const SizedBox(height: MedicalRecordsBody.sectionGap),
        _CriticalAllergiesCard(allergies: dashboard.allergies),
        const SizedBox(height: MedicalRecordsBody.sectionGap),
        _DiagnosesSection(
          diagnoses: dashboard.recentDiagnoses,
          onOpenAll: onOpenDiagnoses,
          onDownloadPdf: onDownloadPdf,
        ),
        if (showInlineSideSections) ...[
          const SizedBox(height: MedicalRecordsBody.sectionGap),
          _ProfileMetricsCard(
            bloodType: dashboard.bloodType,
            heightCm: dashboard.heightCm,
            weightKg: dashboard.weightKg,
          ),
          const SizedBox(height: MedicalRecordsBody.sectionGap),
          _ImmunizationsSection(immunizations: dashboard.immunizations),
        ],
        const SizedBox(height: MedicalRecordsBody.sectionGap),
        _LabResultsSection(
          labs: dashboard.recentLabResults,
          onViewAll: onViewLabs,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class _RecordsSideRail extends StatelessWidget {
  const _RecordsSideRail({required this.dashboard});

  final MedicalRecordsDashboardResponse dashboard;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _ProfileMetricsCard(
          bloodType: dashboard.bloodType,
          heightCm: dashboard.heightCm,
          weightKg: dashboard.weightKg,
        ),
        const SizedBox(height: MedicalRecordsBody.sectionGap),
        Expanded(
          child: ImshSurfaceCard(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ImshSectionHeader(
                  title: 'Immunizations',
                  icon: Icons.vaccines_outlined,
                  iconColor: ImshAccentColors.teal,
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: dashboard.immunizations.isEmpty
                      ? const _CompactEmpty('No immunizations on file.')
                      : ListView.separated(
                          itemCount: dashboard.immunizations.length,
                          separatorBuilder: (_, _) => const SizedBox(height: 6),
                          itemBuilder: (context, index) => _ImmunizationTile(
                            item: dashboard.immunizations[index],
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _RecordsKpiStrip extends StatelessWidget {
  const _RecordsKpiStrip({
    required this.dashboard,
    this.useSnapStrip = false,
  });

  final MedicalRecordsDashboardResponse dashboard;
  final bool useSnapStrip;

  @override
  Widget build(BuildContext context) {
    final allergies = dashboard.allergies
        .where((a) => a.name.trim().isNotEmpty)
        .length;
    final vitals = dashboard.latestVitals;
    final pulse = vitals?.pulseRate;
    final bpValue = vitals == null ? '—' : vitals.bloodPressureDisplay;
    final bpCaption =
        (vitals?.bloodPressureStatus?.trim().isNotEmpty ?? false)
            ? vitals!.bloodPressureStatus!.trim()
            : (vitals?.hasBloodPressure ?? false)
                ? 'Latest reading'
                : 'No reading';
    final diagnoses = dashboard.recentDiagnoses.length;

    final items = [
      ImshKpiItem(
        label: 'Allergies',
        value: allergies > 0 ? '$allergies' : '—',
        caption: allergies > 0 ? 'On file' : 'None recorded',
        icon: Icons.warning_amber_rounded,
        accent: ImshAccentColors.amber,
      ),
      ImshKpiItem(
        label: 'Blood pressure',
        value: bpValue,
        caption: bpCaption,
        icon: Icons.bloodtype_outlined,
        accent: ImshAccentColors.blue,
      ),
      ImshKpiItem(
        label: 'Heart rate',
        value: pulse == null ? '—' : '$pulse',
        caption: pulse == null ? 'No reading' : 'bpm',
        icon: Icons.monitor_heart_outlined,
        accent: ImshAccentColors.pink,
      ),
      ImshKpiItem(
        label: 'Diagnoses',
        value: diagnoses > 0 ? '$diagnoses' : '—',
        caption: diagnoses > 0 ? 'Recent' : 'None on file',
        icon: Icons.medical_information_outlined,
        accent: ImshAccentColors.indigo,
      ),
    ];

    return ImshKpiStrip(items: items, useSnapStrip: useSnapStrip);
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return ImshSurfaceCard(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          ImshSolidIcon(
            icon: Icons.search,
            color: ImshAccentColors.indigo,
            size: 28,
            iconSize: 14,
            radius: 8,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Search diagnoses, immunizations, or labs',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: cs.onSurfaceVariant,
              ),
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
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final known = allergies.where((a) => a.name.trim().isNotEmpty).toList();

    return ImshSurfaceCard(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImshSectionHeader(
            title: 'Critical allergies',
            icon: Icons.warning_amber_rounded,
            iconColor: ImshAccentColors.amber,
          ),
          const SizedBox(height: 8),
          if (known.isEmpty)
            Text(
              'No known allergies.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: cs.onSurfaceVariant,
              ),
            )
          else
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: known
                  .map(
                    (item) => ImshEllipsisChip(
                      label: item.severity?.trim().isNotEmpty == true
                          ? '${item.name} (${_titleCaseStatus(item.severity!)})'
                          : item.name,
                      tone: ImshSemanticTone.error,
                      maxWidth: 220,
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }
}

class _ProfileMetricsCard extends StatelessWidget {
  const _ProfileMetricsCard({
    required this.bloodType,
    required this.heightCm,
    required this.weightKg,
  });

  final String? bloodType;
  final double? heightCm;
  final double? weightKg;

  @override
  Widget build(BuildContext context) {
    String metric(Object? value, String unit) {
      if (value == null) return '—';
      if (value is num) return '${value.toStringAsFixed(0)} $unit';
      if (value is String && value.trim().isNotEmpty) return '$value $unit';
      return '—';
    }

    return ImshSurfaceCard(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ImshSectionHeader(
            title: 'Profile metrics',
            icon: Icons.monitor_weight_outlined,
            iconColor: ImshAccentColors.purple,
          ),
          const SizedBox(height: 8),
          _MetricRow(
            icon: Icons.bloodtype_outlined,
            accent: ImshAccentColors.pink,
            label: 'Blood type',
            value: bloodType?.trim().isNotEmpty == true ? bloodType! : '—',
          ),
          const SizedBox(height: 6),
          _MetricRow(
            icon: Icons.height,
            accent: ImshAccentColors.teal,
            label: 'Height',
            value: metric(heightCm, 'cm'),
          ),
          const SizedBox(height: 6),
          _MetricRow(
            icon: Icons.scale_outlined,
            accent: ImshAccentColors.green,
            label: 'Weight',
            value: metric(weightKg, 'kg'),
          ),
        ],
      ),
    );
  }
}

class _MetricRow extends StatelessWidget {
  const _MetricRow({
    required this.icon,
    required this.accent,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final Color accent;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Row(
      children: [
        ImshSolidIcon(
          icon: icon,
          color: accent,
          size: 28,
          iconSize: 14,
          radius: 8,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImshEllipsisText(
                text: label,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: cs.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ImshEllipsisText(
                text: value,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DiagnosesSection extends StatelessWidget {
  const _DiagnosesSection({
    required this.diagnoses,
    required this.onOpenAll,
    required this.onDownloadPdf,
  });

  final List<DashboardDiagnosis> diagnoses;
  final VoidCallback onOpenAll;
  final VoidCallback onDownloadPdf;

  @override
  Widget build(BuildContext context) {
    final preview = diagnoses.take(2).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ImshSectionHeader(
          title: 'Past diagnoses',
          icon: Icons.health_and_safety_outlined,
          iconColor: ImshAccentColors.blue,
          trailing: TextButton(
            onPressed: onDownloadPdf,
            child: const Text('PDF'),
          ),
        ),
        const SizedBox(height: 8),
        if (preview.isEmpty)
          const ImshSurfaceCard(
            padding: EdgeInsets.all(10),
            child: _CompactEmpty('No diagnoses on file.'),
          )
        else ...[
          for (var i = 0; i < preview.length; i++) ...[
            if (i > 0) const SizedBox(height: 6),
            _DiagnosisItem(diagnosis: preview[i], onTap: onOpenAll),
          ],
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: onOpenAll,
              child: const Text('View all diagnoses'),
            ),
          ),
        ],
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
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return ImshSurfaceCard(
      padding: const EdgeInsets.all(10),
      onTap: onTap,
      child: Row(
        children: [
          const ImshSolidIcon(
            icon: Icons.health_and_safety_outlined,
            color: ImshAccentColors.indigo,
            size: 32,
            iconSize: 16,
            radius: 8,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImshEllipsisText(
                  text: diagnosis.title.isNotEmpty
                      ? diagnosis.title
                      : 'Diagnosis',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                ImshEllipsisText(
                  text: diagnosis.doctorName.isNotEmpty
                      ? 'Dr. ${diagnosis.doctorName}'
                      : 'Diagnosing doctor unavailable',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
                if (diagnosis.specialty?.trim().isNotEmpty == true) ...[
                  const SizedBox(height: 2),
                  ImshEllipsisText(
                    text: diagnosis.specialty!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: cs.onSurfaceVariant,
                      fontSize: 12,
                    ),
                  ),
                ],
                const SizedBox(height: 6),
                Row(
                  children: [
                    if (diagnosis.icdCode?.trim().isNotEmpty == true) ...[
                      ImshEllipsisChip(
                        label: diagnosis.icdCode!,
                        tone: ImshSemanticTone.neutral,
                        maxWidth: 100,
                      ),
                      const SizedBox(width: 8),
                    ],
                    Flexible(
                      child: ImshEllipsisText(
                        text: diagnosis.diagnosedAt == null
                            ? '—'
                            : _monthYear(diagnosis.diagnosedAt!),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: cs.onSurfaceVariant,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
        ],
      ),
    );
  }
}

class _ImmunizationsSection extends StatelessWidget {
  const _ImmunizationsSection({required this.immunizations});

  final List<DashboardImmunization> immunizations;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const ImshSectionHeader(
          title: 'Immunization record',
          icon: Icons.vaccines_outlined,
          iconColor: ImshAccentColors.teal,
        ),
        const SizedBox(height: 8),
        if (immunizations.isEmpty)
          const ImshSurfaceCard(
            padding: EdgeInsets.all(10),
            child: _CompactEmpty('No immunizations on file.'),
          )
        else
          LayoutBuilder(
            builder: (context, constraints) {
              final sideBySide = constraints.maxWidth >= 520;
              final preview = immunizations.take(2).toList();
              if (!sideBySide) {
                return Column(
                  children: [
                    for (var i = 0; i < preview.length; i++) ...[
                      if (i > 0) const SizedBox(height: 6),
                      _ImmunizationTile(item: preview[i]),
                    ],
                  ],
                );
              }
              return Row(
                children: [
                  for (var i = 0; i < preview.length; i++) ...[
                    if (i > 0) const SizedBox(width: 8),
                    Expanded(child: _ImmunizationTile(item: preview[i])),
                  ],
                ],
              );
            },
          ),
      ],
    );
  }
}

class _ImmunizationTile extends StatelessWidget {
  const _ImmunizationTile({required this.item});

  final DashboardImmunization item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return ImshSurfaceCard(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ImshSolidIcon(
            icon: Icons.vaccines_outlined,
            color: ImshAccentColors.teal,
            size: 30,
            iconSize: 16,
            radius: 8,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImshEllipsisText(
                  text: item.vaccineName.isNotEmpty
                      ? item.vaccineName
                      : 'Immunization',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (item.detail?.trim().isNotEmpty == true) ...[
                  const SizedBox(height: 2),
                  ImshEllipsisText(
                    text: item.detail!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                ],
                const SizedBox(height: 4),
                ImshEllipsisText(
                  text: item.date == null
                      ? '—'
                      : DateFormatter.medicalDate(item.date!),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: cs.onSurfaceVariant,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LabResultsSection extends StatelessWidget {
  const _LabResultsSection({
    required this.labs,
    required this.onViewAll,
  });

  final List<DashboardLabResult> labs;
  final VoidCallback onViewAll;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rows = labs.take(3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ImshSectionHeader(
          title: 'Recent lab results',
          icon: Icons.science_outlined,
          iconColor: ImshAccentColors.purple,
          trailing: TextButton(
            onPressed: onViewAll,
            child: const Text('View all'),
          ),
        ),
        const SizedBox(height: 8),
        ImshSurfaceCard(
          padding: const EdgeInsets.all(10),
          child: rows.isEmpty
              ? const _CompactEmpty('No lab results returned by backend.')
              : Column(
                  children: [
                    for (var i = 0; i < rows.length; i++) ...[
                      if (i > 0) const SizedBox(height: 6),
                      _LabRowTile(row: rows[i]),
                    ],
                    const SizedBox(height: 4),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: onViewAll,
                        child: Text(
                          'View all lab history',
                          style: theme.textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}

class _LabRowTile extends StatelessWidget {
  const _LabRowTile({required this.row});

  final DashboardLabResult row;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final status = row.status?.trim().isNotEmpty == true
        ? _titleCaseStatus(row.status!)
        : 'Normal';
    final statusKey = status.toLowerCase();
    final tone = statusKey == 'high' || statusKey == 'critical'
        ? ImshSemanticTone.error
        : statusKey == 'low' || statusKey == 'pending'
            ? ImshSemanticTone.warning
            : ImshSemanticTone.success;

    return Row(
      children: [
        const ImshSolidIcon(
          icon: Icons.biotech_outlined,
          color: ImshAccentColors.blue,
          size: 28,
          iconSize: 14,
          radius: 8,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImshEllipsisText(
                text: row.testName.isNotEmpty ? row.testName : '—',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              ImshEllipsisText(
                text: [
                  row.result?.trim().isNotEmpty == true ? row.result! : '—',
                  if (row.referenceRange?.trim().isNotEmpty == true)
                    'Range ${row.referenceRange}',
                ].join(' · '),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: cs.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        ImshEllipsisChip(label: status, tone: tone, maxWidth: 90),
      ],
    );
  }
}

class _CompactEmpty extends StatelessWidget {
  const _CompactEmpty(this.message);

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        message,
        style: theme.textTheme.bodySmall?.copyWith(
          color: cs.onSurfaceVariant,
        ),
      ),
    );
  }
}

class _RecordsLoading extends StatelessWidget {
  const _RecordsLoading();

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      slivers: [
        ImshSliverAppBar(),
        SliverToBoxAdapter(child: FamilySubjectBanner()),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: CircularProgressIndicator()),
        ),
      ],
    );
  }
}

class _RecordsError extends StatelessWidget {
  const _RecordsError({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        const ImshSliverAppBar(),
        const SliverToBoxAdapter(child: FamilySubjectBanner()),
        SliverFillRemaining(
          hasScrollBody: false,
          child: ImshErrorPanel(message: message, onRetry: onRetry),
        ),
      ],
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
        final maxW = AppBreakpoints.of(sheetContext).dialogWidth(sheetContext);
        return SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxW),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const ImshSectionHeader(
                      title: 'Past diagnoses',
                      icon: Icons.health_and_safety_outlined,
                      iconColor: ImshAccentColors.blue,
                    ),
                    const SizedBox(height: 12),
                    if (diagnoses.isEmpty)
                      const _CompactEmpty('No diagnoses on file.')
                    else
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight:
                              MediaQuery.sizeOf(sheetContext).height * 0.55,
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: diagnoses.length,
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: 6),
                          itemBuilder: (context, index) =>
                              _DiagnosisItem(diagnosis: diagnoses[index]),
                        ),
                      ),
                    const SizedBox(height: 8),
                    FilledButton.icon(
                      onPressed: () {
                        Navigator.of(sheetContext).pop();
                        _downloadDiagnosesPdf(
                          context,
                          ref,
                          diagnoses: diagnoses,
                        );
                      },
                      icon: const Icon(Icons.picture_as_pdf_outlined),
                      label: const Text('Download PDF'),
                    ),
                  ],
                ),
              ),
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
