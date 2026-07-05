import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../helper/date_formatter.dart';
import '../../../models/medical_record_model.dart';
import 'encounter_status_badge.dart';

class EncounterDetailSections extends StatelessWidget {
  const EncounterDetailSections({super.key, required this.encounter});

  final EncounterDetail encounter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _HeaderCard(encounter: encounter),
        if (encounter.vitals != null) ...[
          const Gap(AppDesignTokens.spacingMd),
          _SectionCard(
            title: 'Vitals',
            child: _VitalsContent(vitals: encounter.vitals!),
          ),
        ],
        if (encounter.diagnoses.isNotEmpty) ...[
          const Gap(AppDesignTokens.spacingMd),
          _SectionCard(
            title: 'Diagnoses',
            child: _DiagnosesContent(diagnoses: encounter.diagnoses),
          ),
        ],
        if (encounter.prescriptions.isNotEmpty) ...[
          const Gap(AppDesignTokens.spacingMd),
          _SectionCard(
            title: 'Prescriptions',
            child: _PrescriptionsContent(
              prescriptions: encounter.prescriptions,
            ),
          ),
        ],
        if (encounter.soap != null) ...[
          const Gap(AppDesignTokens.spacingMd),
          _SectionCard(
            title: 'Clinical notes',
            child: _SoapContent(soap: encounter.soap!),
          ),
        ],
        if (_hasFollowUp(encounter)) ...[
          const Gap(AppDesignTokens.spacingMd),
          _SectionCard(
            title: 'Follow-up',
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
    final colorScheme = context.colorScheme;

    return _SectionCard(
      title: 'Encounter',
      trailing: EncounterStatusBadge(status: encounter.status),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            encounter.encounterType.label,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(AppDesignTokens.spacingXs),
          Text(
            DateFormatter.fullDate(encounter.startTime),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap(AppDesignTokens.spacingSm),
          Text(
            'Dr. ${encounter.doctorName}',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          if (encounter.visitType?.isNotEmpty == true) ...[
            const Gap(AppDesignTokens.spacingXs),
            Text(
              encounter.visitType!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
          if (encounter.chiefComplaint?.isNotEmpty == true) ...[
            const Gap(AppDesignTokens.spacingMd),
            Text(
              'Chief complaint',
              style: theme.textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const Gap(AppDesignTokens.spacingXs),
            Text(
              encounter.chiefComplaint!,
              style: theme.textTheme.bodyMedium,
            ),
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
    this.trailing,
  });

  final String title;
  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return Container(
      width: double.infinity,
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
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
          const Gap(AppDesignTokens.spacingMd),
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
    final rows = <(String, String)>[];

    void add(String label, Object? value, [String suffix = '']) {
      if (value == null) return;
      rows.add((label, '$value$suffix'));
    }

    add('Blood pressure', _bloodPressure(vitals));
    add('Temperature', vitals.temperature, ' °C');
    add('Pulse', vitals.pulseRate, ' bpm');
    add('Respiratory rate', vitals.respRate, ' /min');
    add('SpO₂', vitals.spo2, '%');
    add('Weight', vitals.weight, ' kg');
    add('Height', vitals.height, ' cm');
    add('BMI', vitals.bmi);
    add('Pain score', vitals.painScore);
    add('Blood glucose', vitals.bloodGlucose, ' mmol/L');

    if (vitals.recordedAt != null) {
      rows.add((
        'Recorded',
        DateFormatter.dateTime(vitals.recordedAt!),
      ));
    }

    return _LabelValueList(rows: rows);
  }

  String? _bloodPressure(EncounterVitals vitals) {
    if (vitals.systolic == null && vitals.diastolic == null) return null;
    return '${vitals.systolic ?? '—'}/${vitals.diastolic ?? '—'} mmHg';
  }
}

class _DiagnosesContent extends StatelessWidget {
  const _DiagnosesContent({required this.diagnoses});

  final List<EncounterDiagnosis> diagnoses;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final diagnosis in diagnoses) ...[
          if (diagnosis.primaryIcdDescription?.isNotEmpty == true)
            Text(
              diagnosis.primaryIcdDescription!,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          if (diagnosis.primaryIcdCode?.isNotEmpty == true)
            Padding(
              padding: const EdgeInsets.only(top: AppDesignTokens.spacingXs),
              child: Text(
                diagnosis.primaryIcdCode!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          if (diagnosis != diagnoses.last)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: AppDesignTokens.spacingSm),
              child: Divider(height: 1),
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
    final colorScheme = context.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final prescription in prescriptions) ...[
          if (prescription.items.isNotEmpty)
            ...prescription.items.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: AppDesignTokens.spacingSm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.drugName,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      [
                        item.dosage,
                        if (item.frequency?.isNotEmpty == true) item.frequency,
                        if (item.duration != null) '${item.duration} days',
                      ].whereType<String>().join(' · '),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
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
            )
          else if (prescription.drug?.isNotEmpty == true)
            Padding(
              padding: const EdgeInsets.only(bottom: AppDesignTokens.spacingSm),
              child: Text(
                '${prescription.drug}${prescription.dosage != null ? ' · ${prescription.dosage}' : ''}',
                style: theme.textTheme.bodyMedium,
              ),
            ),
          if (prescription != prescriptions.last)
            const Divider(height: AppDesignTokens.spacingMd),
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final (label, value) in entries) ...[
          _SoapField(label: label, value: value!),
          if ((label, value) != entries.last)
            const Gap(AppDesignTokens.spacingSm),
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
    final colorScheme = context.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const Gap(AppDesignTokens.spacingXs),
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
    final rows = <(String, String)>[];
    if (encounter.followUpDate?.isNotEmpty == true) {
      rows.add(('Date', encounter.followUpDate!));
    }
    if (encounter.followUpInstructions?.isNotEmpty == true) {
      rows.add(('Instructions', encounter.followUpInstructions!));
    }
    if (encounter.referral?.isNotEmpty == true) {
      rows.add(('Referral', encounter.referral!));
    }
    return _LabelValueList(rows: rows);
  }
}

class _LabelValueList extends StatelessWidget {
  const _LabelValueList({required this.rows});

  final List<(String, String)> rows;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final (label, value) in rows) ...[
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap(AppDesignTokens.spacingXs),
          Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          if ((label, value) != rows.last)
            const Gap(AppDesignTokens.spacingSm),
        ],
      ],
    );
  }
}
