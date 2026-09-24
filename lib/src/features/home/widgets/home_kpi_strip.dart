import 'package:flutter/material.dart';

import '../../../core/theme/imsh_accent_colors.dart';
import '../../../helper/currency_formatter.dart';
import '../../../models/invoice_model.dart';
import '../../../models/medical_records_dashboard_model.dart';
import '../../../shared/widgets/imsh_kpi_tile.dart';

/// Dense KPI strip: vitals, meds due today, outstanding balance.
class HomeKpiStrip extends StatelessWidget {
  const HomeKpiStrip({
    super.key,
    required this.vitals,
    required this.medsDueToday,
    required this.billingSummary,
    this.onVitalsTap,
    this.onMedsTap,
    this.onBillingTap,
    this.useSnapStrip = false,
  });

  final LatestVitalsSummary? vitals;
  final int medsDueToday;
  final BillingSummaryResponse billingSummary;
  final VoidCallback? onVitalsTap;
  final VoidCallback? onMedsTap;
  final VoidCallback? onBillingTap;
  final bool useSnapStrip;

  @override
  Widget build(BuildContext context) {
    final pulse = vitals?.pulseRate;
    final bpValue = vitals == null ? '—' : vitals!.bloodPressureDisplay;
    final bpCaption = (vitals?.bloodPressureStatus?.trim().isNotEmpty ?? false)
        ? vitals!.bloodPressureStatus!.trim()
        : 'Latest reading';
    final outstanding = double.tryParse(billingSummary.totalOutstanding) ?? 0;
    final billValue = outstanding > 0
        ? CurrencyFormatter.formatAmount(billingSummary.totalOutstanding)
        : '—';
    final billCaption = outstanding > 0
        ? '${billingSummary.unpaidInvoiceCount} unpaid'
        : 'No balance due';

    final items = [
      ImshKpiItem(
        label: 'Heart rate',
        value: pulse == null ? '—' : '$pulse',
        caption: pulse == null ? 'No reading' : 'bpm',
        icon: Icons.monitor_heart_outlined,
        accent: ImshAccentColors.pink,
        onTap: onVitalsTap,
      ),
      ImshKpiItem(
        label: 'Blood pressure',
        value: bpValue,
        caption: bpCaption,
        icon: Icons.bloodtype_outlined,
        accent: ImshAccentColors.blue,
        onTap: onVitalsTap,
      ),
      ImshKpiItem(
        label: 'Meds today',
        value: medsDueToday > 0 ? '$medsDueToday' : '—',
        caption: medsDueToday > 0 ? 'Doses scheduled' : 'Nothing due',
        icon: Icons.medication_outlined,
        accent: ImshAccentColors.teal,
        onTap: onMedsTap,
      ),
      ImshKpiItem(
        label: 'Outstanding',
        value: billValue,
        caption: billCaption,
        icon: Icons.payments_outlined,
        accent: ImshAccentColors.amber,
        onTap: onBillingTap,
      ),
    ];

    return ImshKpiStrip(items: items, useSnapStrip: useSnapStrip);
  }
}
