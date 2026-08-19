import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../shared/widgets/imsh_page_header.dart';

class AppointmentsPageHeader extends StatelessWidget {
  const AppointmentsPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const ImshPageHeader(
          title: 'My Appointments',
          subtitle: 'Request visits and track confirmation status',
        ),
        const Gap(AppDesignTokens.spacingMd),
        Row(
          children: [
            Expanded(
              child: FilledButton.icon(
                onPressed: () => context.router.push(BookAppointmentRoute()),
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Request appointment'),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: () =>
                context.router.push(const TheatreSchedulesRoute()),
            icon: const Icon(Icons.local_hospital_outlined, size: 18),
            label: const Text('Theatre schedule'),
          ),
        ),
      ],
    );
  }
}
