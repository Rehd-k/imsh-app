import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';

import '../../../core/theme/imsh_accent_colors.dart';
import '../../../models/medication_model.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_empty_state.dart';
import 'prescription_card.dart';

class ActivePrescriptionsSection extends StatelessWidget {
  const ActivePrescriptionsSection({
    super.key,
    required this.prescriptions,
  });

  final List<ActivePrescriptionSummary> prescriptions;

  @override
  Widget build(BuildContext context) {
    if (prescriptions.isEmpty) {
      return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImshSectionHeader(
            title: 'Active prescriptions',
            icon: Icons.medication_outlined,
            iconColor: ImshAccentColors.teal,
          ),
          Gap(10),
          ImshEmptyState(
            message: 'No active medications.',
            icon: Icons.medication_outlined,
            iconColor: ImshAccentColors.teal,
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImshSectionHeader(
          title: 'Active prescriptions',
          icon: Icons.medication_outlined,
          iconColor: ImshAccentColors.teal,
          trailing: TextButton(
            onPressed: () =>
                context.router.push(const MedicationsHistoryRoute()),
            child: const Text('History'),
          ),
        ),
        const Gap(10),
        for (final prescription in prescriptions)
          PrescriptionCard(prescription: prescription),
      ],
    );
  }
}
