import 'package:flutter/material.dart';

import '../../../core/responsive.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/medical_record_model.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_empty_state.dart';
import '../../../shared/widgets/imsh_semantic_badge.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';
import 'encounter_status_badge.dart';

class EncounterDetailSections extends StatelessWidget {
  const EncounterDetailSections({super.key, required this.encounter});

  final EncounterDetail encounter;

  static const sectionGap = 12.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _HeaderCard(encounter: encounter),
        if (encounter.vitals != null) ...[
          const SizedBox(height: sectionGap),
          _SectionCard(
            title: 'Vitals',
            icon: Icons.monitor_heart_outlined,
            iconColor: ImshAccentColors.pink,
            child: _VitalsContent(vitals: encounter.vitals!),
          ),
        ],
        if (encounter.diagnoses.isNotEmpty) ...[
          const SizedBox(height: sectionGap),
          _SectionCard(
            title: 'Diagnoses',
            icon: Icons.health_and_safety_outlined,
            iconColor: ImshAccentColors.blue,
            child: _DiagnosesContent(diagnoses: encounter.diagnoses),
          ),
        ],
        if (encounter.prescriptions.isNotEmpty) ...[
          const SizedBox(height: sectionGap),
          _SectionCard(
            title: 'Prescriptions',
            icon: Icons.medication_outlined,
            iconColor: ImshAccentColors.teal,
            child: _PrescriptionsContent(
              prescriptions: encounter.prescriptions,
            ),
          ),
        ],
        if (encounter.soap != null) ...[
          const SizedBox(height: sectionGap),
          _SectionCard(
            title: 'Clinical notes',
            icon: Icons.notes_outlined,
            iconColor: ImshAccentColors.indigo,
            child: _SoapContent(soap: encounter.soap!),
          ),
        ],
        if (_hasFollowUp(encounter)) ...[
          const SizedBox(height: sectionGap),
          _SectionCard(
            title: 'Follow-up',
            icon: Icons.event_repeat_outlined,
            iconColor: ImshAccentColors.amber,
            child: _FollowUpContent(encounter: encounter),
          ),
        ],
      ],
    );
  }

  bool _hasFollowUp(EncounterDetail detail) {
    return (detail.followUpDate?.isNotEmpty ?? false) ||
        (detail.followUpInstructions?.isNotEmpty ?? false) ||
        (detail.referral?.isNotEmpty ?? false);
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({required this.encounter});

  final EncounterDetail encounter;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return _SectionCard(
      title: 'Encounter',
      icon: Icons.folder_shared_outlined,
      iconColor: ImshAccentColors.blue,
      trailing: EncounterStatusBadge(status: encounter.status),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImshEllipsisText(
            text: encounter.encounterType.label,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          ImshEllipsisText(
            text: DateFormatter.fullDate(encounter.startTime),
            style: theme.textTheme.bodySmall?.copyWith(
              color: cs.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const ImshSolidIcon(
                icon: Icons.person_outline,
                color: ImshAccentColors.indigo,
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
                      text: 'Dr. ${encounter.doctorName}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (encounter.visitType?.isNotEmpty == true)
                      ImshEllipsisText(
                        text: encounter.visitType!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          if (encounter.chiefComplaint?.isNotEmpty == true) ...[
            const SizedBox(height: 10),
            Text(
              'Chief complaint',
              style: theme.textTheme.labelMedium?.copyWith(
                color: cs.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 4),
            Text(encounter.chiefComplaint!, style: theme.textTheme.bodyMedium),
          ],
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.child,
    this.icon,
    this.iconColor,
    this.trailing,
  });

  final String title;
  final Widget child;
  final IconData? icon;
  final Color? iconColor;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ImshSurfaceCard(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImshSectionHeader(
            title: title,
            icon: icon,
            iconColor: iconColor,
            trailing: trailing,
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

class _VitalsContent extends StatelessWidget {
  const _VitalsContent({required this.vitals});

  final EncounterVitals vitals;

  @override
  Widget build(BuildContext context) {
    final rows = <(String, String, IconData, Color)>[];

    void add(
      String label,
      Object? value,
      IconData icon,
      Color accent, [
      String suffix = '',
    ]) {
      if (value == null) return;
      rows.add((label, '$value$suffix', icon, accent));
    }

    final bp = _bloodPressure(vitals);
    if (bp != null) {
      rows.add((
        'Blood pressure',
        bp,
        Icons.bloodtype_outlined,
        ImshAccentColors.blue,
      ));
    }
    add(
      'Temperature',
      vitals.temperature,
      Icons.thermostat_outlined,
      ImshAccentColors.amber,
      ' °C',
    );
    add(
      'Pulse',
      vitals.pulseRate,
      Icons.monitor_heart_outlined,
      ImshAccentColors.pink,
      ' bpm',
    );
    add(
      'Respiratory rate',
      vitals.respRate,
      Icons.air,
      ImshAccentColors.teal,
      ' /min',
    );
    add('SpO₂', vitals.spo2, Icons.water_drop_outlined, ImshAccentColors.indigo, '%');
    add('Weight', vitals.weight, Icons.scale_outlined, ImshAccentColors.green, ' kg');
    add('Height', vitals.height, Icons.height, ImshAccentColors.purple, ' cm');
    add('BMI', vitals.bmi, Icons.analytics_outlined, ImshAccentColors.indigo);
    add('Pain score', vitals.painScore, Icons.healing_outlined, ImshAccentColors.amber);
    add(
      'Blood glucose',
      vitals.bloodGlucose,
      Icons.bloodtype_outlined,
      ImshAccentColors.pink,
      ' mmol/L',
    );

    if (vitals.recordedAt != null) {
      rows.add((
        'Recorded',
        DateFormatter.dateTime(vitals.recordedAt!),
        Icons.schedule_outlined,
        ImshAccentColors.indigo,
      ));
    }

    if (rows.isEmpty) {
      return const ImshEmptyState(
        message: 'No vitals recorded for this encounter.',
        icon: Icons.monitor_heart_outlined,
        iconColor: ImshAccentColors.pink,
      );
    }

    return ResponsiveWrapGrid(
      mobileColumns: 1,
      tabletColumns: 2,
      desktopColumns: 2,
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final (label, value, icon, accent) in rows)
          _VitalTile(
            label: label,
            value: value,
            icon: icon,
            accent: accent,
          ),
      ],
    );
  }

  String? _bloodPressure(EncounterVitals vitals) {
    if (vitals.systolic == null && vitals.diastolic == null) return null;
    return '${vitals.systolic ?? '—'}/${vitals.diastolic ?? '—'} mmHg';
  }
}

class _VitalTile extends StatelessWidget {
  const _VitalTile({
    required this.label,
    required this.value,
    required this.icon,
    required this.accent,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color accent;

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
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DiagnosesContent extends StatelessWidget {
  const _DiagnosesContent({required this.diagnoses});

  final List<EncounterDiagnosis> diagnoses;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < diagnoses.length; i++) ...[
          if (i > 0) const SizedBox(height: 8),
          if (diagnoses[i].primaryIcdDescription?.isNotEmpty == true)
            ImshEllipsisText(
              text: diagnoses[i].primaryIcdDescription!,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
            ),
          if (diagnoses[i].primaryIcdCode?.isNotEmpty == true) ...[
            const SizedBox(height: 4),
            ImshEllipsisChip(
              label: diagnoses[i].primaryIcdCode!,
              tone: ImshSemanticTone.neutral,
              maxWidth: 120,
            ),
          ],
          if (diagnoses[i].primaryIcdDescription?.isNotEmpty != true &&
              diagnoses[i].primaryIcdCode?.isNotEmpty != true)
            Text(
              '—',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: cs.onSurfaceVariant,
              ),
            ),
        ],
      ],
    );
  }
}

class _PrescriptionsContent extends StatelessWidget {
  const _PrescriptionsContent({required this.prescriptions});

  final List<EncounterPrescription> prescriptions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < prescriptions.length; i++) ...[
          if (i > 0) const SizedBox(height: 10),
          if (prescriptions[i].items.isNotEmpty)
            ...prescriptions[i].items.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ImshSolidIcon(
                      icon: Icons.medication_outlined,
                      color: ImshAccentColors.teal,
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
                            text: item.drugName,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          ImshEllipsisText(
                            text: [
                              item.dosage,
                              if (item.frequency?.isNotEmpty == true)
                                item.frequency,
                              if (item.duration != null)
                                '${item.duration} days',
                            ].whereType<String>().join(' · '),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: cs.onSurfaceVariant,
                            ),
                          ),
                          if (item.instructions?.isNotEmpty == true)
                            Text(
                              item.instructions!,
                              style: theme.textTheme.bodySmall,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          else if (prescriptions[i].drug?.isNotEmpty == true)
            ImshEllipsisText(
              text:
                  '${prescriptions[i].drug}${prescriptions[i].dosage != null ? ' · ${prescriptions[i].dosage}' : ''}',
              style: theme.textTheme.bodyMedium,
            )
          else
            Text(
              '—',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: cs.onSurfaceVariant,
              ),
            ),
        ],
      ],
    );
  }
}

class _SoapContent extends StatelessWidget {
  const _SoapContent({required this.soap});

  final EncounterSoap soap;

  @override
  Widget build(BuildContext context) {
    final entries = <(String, String?)>[
      ('Subjective', soap.subjective),
      ('Objective', soap.objective),
      ('Assessment', soap.assessment),
      ('Plan', soap.plan),
    ].where((entry) => entry.$2?.isNotEmpty == true).toList();

    if (entries.isEmpty) {
      return const ImshEmptyState(
        message: 'No clinical notes for this encounter.',
        icon: Icons.notes_outlined,
        iconColor: ImshAccentColors.indigo,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < entries.length; i++) ...[
          if (i > 0) const SizedBox(height: 8),
          _SoapField(label: entries[i].$1, value: entries[i].$2!),
        ],
      ],
    );
  }
}

class _SoapField extends StatelessWidget {
  const _SoapField({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelMedium?.copyWith(
            color: cs.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(value, style: theme.textTheme.bodyMedium),
      ],
    );
  }
}

class _FollowUpContent extends StatelessWidget {
  const _FollowUpContent({required this.encounter});

  final EncounterDetail encounter;

  @override
  Widget build(BuildContext context) {
    final rows = <(String, String, IconData, Color)>[];
    if (encounter.followUpDate?.isNotEmpty == true) {
      rows.add((
        'Date',
        encounter.followUpDate!,
        Icons.event_outlined,
        ImshAccentColors.amber,
      ));
    }
    if (encounter.followUpInstructions?.isNotEmpty == true) {
      rows.add((
        'Instructions',
        encounter.followUpInstructions!,
        Icons.checklist_outlined,
        ImshAccentColors.teal,
      ));
    }
    if (encounter.referral?.isNotEmpty == true) {
      rows.add((
        'Referral',
        encounter.referral!,
        Icons.local_hospital_outlined,
        ImshAccentColors.blue,
      ));
    }
    return _LabelValueList(rows: rows);
  }
}

class _LabelValueList extends StatelessWidget {
  const _LabelValueList({required this.rows});

  final List<(String, String, IconData, Color)> rows;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < rows.length; i++) ...[
          if (i > 0) const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImshSolidIcon(
                icon: rows[i].$3,
                color: rows[i].$4,
                size: 28,
                iconSize: 14,
                radius: 8,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rows[i].$1,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: cs.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      rows[i].$2,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
