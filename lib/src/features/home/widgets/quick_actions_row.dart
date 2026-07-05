import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';

class QuickActionsRow extends StatelessWidget {
  const QuickActionsRow({
    super.key,
    required this.onPayBill,
    required this.onOpenAppointments,
  });

  final VoidCallback onPayBill;
  final VoidCallback onOpenAppointments;

  static const _itemWidth = 72.0;
  static const _carouselHeight = 92.0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final imshTheme = context.imshTheme;
    final actions = _buildActions(
      context,
      onPayBill: onPayBill,
      onOpenAppointments: onOpenAppointments,
      primary: colorScheme.primary,
      onPrimary: colorScheme.onPrimary,
      highlight: imshTheme.primaryHighlight,
      muted: colorScheme.surfaceContainerHigh,
      mutedForeground: colorScheme.onSurfaceVariant,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDesignTokens.containerPadding,
          ),
          child: Text(
            'Quick Actions',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        const Gap(AppDesignTokens.spacingMd),
        SizedBox(
          height: _carouselHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: AppDesignTokens.containerPadding,
            ),
            itemCount: actions.length,
            separatorBuilder: (_, __) =>
                const Gap(AppDesignTokens.spacingMd),
            itemBuilder: (context, index) {
              final action = actions[index];
              return SizedBox(
                width: _itemWidth,
                child: _QuickAction(
                  icon: action.icon,
                  label: action.label,
                  backgroundColor: action.backgroundColor,
                  foregroundColor: action.foregroundColor,
                  onTap: action.onTap,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  List<_QuickActionData> _buildActions(
    BuildContext context, {
    required VoidCallback onPayBill,
    required VoidCallback onOpenAppointments,
    required Color primary,
    required Color onPrimary,
    required Color highlight,
    required Color muted,
    required Color mutedForeground,
  }) {
    return [
      _QuickActionData(
        icon: Icons.calendar_month_outlined,
        label: 'Book Appt',
        backgroundColor: primary,
        foregroundColor: onPrimary,
        onTap: () => context.router.push(BookAppointmentRoute()),
      ),
      _QuickActionData(
        icon: Icons.event_outlined,
        label: 'Appointments',
        backgroundColor: highlight,
        foregroundColor: primary,
        onTap: onOpenAppointments,
      ),
      _QuickActionData(
        icon: Icons.medication_outlined,
        label: 'Medications',
        backgroundColor: highlight,
        foregroundColor: primary,
        onTap: () => context.router.push(const MedicationsRoute()),
      ),
      _QuickActionData(
        icon: Icons.replay_outlined,
        label: 'Order Refill',
        backgroundColor: highlight,
        foregroundColor: primary,
        onTap: () => context.router.push(const MedicationsRoute()),
      ),
      _QuickActionData(
        icon: Icons.payments_outlined,
        label: 'Pay Bill',
        backgroundColor: muted,
        foregroundColor: mutedForeground,
        onTap: onPayBill,
      ),
      _QuickActionData(
        icon: Icons.how_to_reg_outlined,
        label: 'Self Check-in',
        backgroundColor: muted,
        foregroundColor: mutedForeground,
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Self check-in is coming soon.')),
          );
        },
      ),
      _QuickActionData(
        icon: Icons.science_outlined,
        label: 'Lab Results',
        backgroundColor: muted,
        foregroundColor: mutedForeground,
        onTap: () => context.router.push(const LabResultsRoute()),
      ),
      _QuickActionData(
        icon: Icons.medical_information_outlined,
        label: 'Radiology',
        backgroundColor: muted,
        foregroundColor: mutedForeground,
        onTap: () => context.router.push(const RadiologyReportsRoute()),
      ),
      _QuickActionData(
        icon: Icons.notifications_outlined,
        label: 'Notifications',
        backgroundColor: muted,
        foregroundColor: mutedForeground,
        onTap: () => context.router.push(const NotificationsRoute()),
      ),
      _QuickActionData(
        icon: Icons.qr_code_2_outlined,
        label: 'Health Card',
        backgroundColor: muted,
        foregroundColor: mutedForeground,
        onTap: () => context.router.push(const HealthCardRoute()),
      ),
      _QuickActionData(
        icon: Icons.family_restroom_outlined,
        label: 'Family',
        backgroundColor: muted,
        foregroundColor: mutedForeground,
        onTap: () => context.router.push(const FamilyAccountsRoute()),
      ),
    ];
  }
}

class _QuickActionData {
  const _QuickActionData({
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback onTap;
}

class _QuickAction extends StatelessWidget {
  const _QuickAction({
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: foregroundColor, size: 26),
          ),
          const Gap(AppDesignTokens.spacingSm),
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w500,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}
