import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imsh/app_router.gr.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../providers/appointments_provider.dart';
import '../../../shared/widgets/imsh_page_header.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';

class AppointmentsPageHeader extends ConsumerWidget {
  const AppointmentsPageHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ImshPageHeader(
      title: 'Appointments',
      subtitle: 'Request visits and track confirmation status',
      icon: Icons.calendar_month_outlined,
      iconColor: ImshAccentColors.teal,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Tooltip(
            message: 'Theatre schedule',
            child: InkWell(
              onTap: () =>
                  context.router.push(const TheatreSchedulesRoute()),
              borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
              child: const ImshSolidIcon(
                icon: Icons.local_hospital_outlined,
                color: ImshAccentColors.purple,
                size: 34,
                iconSize: 18,
                radius: AppDesignTokens.radiusMd,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Tooltip(
            message: 'Request appointment',
            child: InkWell(
              onTap: () {
                ref.read(bookingWizardProvider.notifier).reset();
                context.router.push(BookAppointmentRoute());
              },
              borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
              child: const ImshSolidIcon(
                icon: Icons.add_rounded,
                color: ImshAccentColors.blue,
                size: 34,
                iconSize: 18,
                radius: AppDesignTokens.radiusMd,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
