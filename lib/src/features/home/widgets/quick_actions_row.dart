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
    required this.onCheckIn,
  });

  final VoidCallback onPayBill;
  final VoidCallback onCheckIn;

  static const _columns = 4;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final imshTheme = context.imshTheme;
    final actions = _buildActions(
      context,
      onPayBill: onPayBill,
      onCheckIn: onCheckIn,
      primary: colorScheme.primary,
      onPrimary: colorScheme.onPrimary,
      highlight: imshTheme.primaryHighlight,
      muted: colorScheme.surfaceContainerHigh,
      mutedForeground: colorScheme.onSurfaceVariant,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDesignTokens.containerPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Quick actions',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          const Gap(AppDesignTokens.spacingMd),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: actions.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _columns,
              mainAxisSpacing: AppDesignTokens.spacingMd,
              crossAxisSpacing: AppDesignTokens.spacingSm,
              mainAxisExtent: 96,
            ),
            itemBuilder: (context, index) {
              final action = actions[index];
              return _QuickAction(
                icon: action.icon,
                label: action.label,
                backgroundColor: action.backgroundColor,
                foregroundColor: action.foregroundColor,
                onTap: action.onTap,
              );
            },
          ),
        ],
      ),
    );
  }

  List<_QuickActionData> _buildActions(
    BuildContext context, {
    required VoidCallback onPayBill,
    required VoidCallback onCheckIn,
    required Color primary,
    required Color onPrimary,
    required Color highlight,
    required Color muted,
    required Color mutedForeground,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return [
      _QuickActionData(
        icon: Icons.emergency_outlined,
        label: 'Emergency',
        backgroundColor: colorScheme.error,
        foregroundColor: colorScheme.onError,
        onTap: () => context.router.push(const EmergencyRequestsRoute()),
      ),
      _QuickActionData(
        icon: Icons.login_outlined,
        label: 'Self check-in',
        backgroundColor: primary,
        foregroundColor: onPrimary,
        onTap: onCheckIn,
      ),
      _QuickActionData(
        icon: Icons.calendar_month_outlined,
        label: 'Request appointment',
        backgroundColor: primary,
        foregroundColor: onPrimary,
        onTap: () => context.router.push(BookAppointmentRoute()),
      ),
      _QuickActionData(
        icon: Icons.badge_outlined,
        label: 'Health card',
        backgroundColor: highlight,
        foregroundColor: primary,
        onTap: () => context.router.push(const HealthCardRoute()),
      ),
      _QuickActionData(
        icon: Icons.water_drop_outlined,
        label: 'Cycle',
        backgroundColor: highlight,
        foregroundColor: primary,
        onTap: () => context.router.push(const CycleTrackerRoute()),
      ),
      _QuickActionData(
        icon: Icons.medication_outlined,
        label: 'Medications',
        backgroundColor: highlight,
        foregroundColor: primary,
        onTap: () => context.router.push(const MedicationsRoute()),
      ),
      _QuickActionData(
        icon: Icons.science_outlined,
        label: 'Lab results',
        backgroundColor: muted,
        foregroundColor: mutedForeground,
        onTap: () => context.router.push(const LabResultsRoute()),
      ),
      _QuickActionData(
        icon: Icons.photo_outlined,
        label: 'Radiology',
        backgroundColor: muted,
        foregroundColor: mutedForeground,
        onTap: () => context.router.push(const RadiologyReportsRoute()),
      ),
      _QuickActionData(
        icon: Icons.payments_outlined,
        label: 'Pay bill',
        backgroundColor: muted,
        foregroundColor: mutedForeground,
        onTap: onPayBill,
      ),
      _QuickActionData(
        icon: Icons.notifications_outlined,
        label: 'Notifications',
        backgroundColor: muted,
        foregroundColor: mutedForeground,
        onTap: () => context.router.push(const NotificationsRoute()),
      ),
      _QuickActionData(
        icon: Icons.forum_outlined,
        label: 'Feedback',
        backgroundColor: muted,
        foregroundColor: mutedForeground,
        onTap: () => context.router.push(const PatientFeedbackRoute()),
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
