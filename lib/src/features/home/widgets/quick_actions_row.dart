import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:imsh/app_router.gr.dart';
import 'package:imsh/src/core/navigation/zoom_from_source.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';
import '../../../shared/widgets/imsh_surface_card.dart';

class _QuickAction {
  const _QuickAction({
    required this.icon,
    required this.label,
    required this.accent,
    this.route,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final Color accent;
  final PageRouteInfo<dynamic>? route;
  final VoidCallback? onTap;
}

/// Quick actions — list rail on desktop, compact wrap on smaller viewports.
class HomeQuickActions extends StatelessWidget {
  const HomeQuickActions({
    super.key,
    required this.onPayBill,
    required this.onCheckIn,
    this.fillHeight = false,
    this.asRail = false,
  });

  final VoidCallback onPayBill;
  final VoidCallback onCheckIn;
  final bool fillHeight;
  final bool asRail;

  List<_QuickAction> _actions() {
    return [
      _QuickAction(
        icon: Icons.emergency_outlined,
        label: 'Emergency',
        accent: const Color(0xFFDC2626),
        route: const EmergencyRequestsRoute(),
      ),
      _QuickAction(
        icon: Icons.login_outlined,
        label: 'Self check-in',
        accent: ImshAccentColors.blue,
        onTap: onCheckIn,
      ),
      _QuickAction(
        icon: Icons.calendar_month_outlined,
        label: 'Request visit',
        accent: ImshAccentColors.teal,
        route: BookAppointmentRoute(),
      ),
      _QuickAction(
        icon: Icons.badge_outlined,
        label: 'Health card',
        accent: ImshAccentColors.purple,
        route: const HealthCardRoute(),
      ),
      _QuickAction(
        icon: Icons.medication_outlined,
        label: 'Medications',
        accent: ImshAccentColors.indigo,
        route: const MedicationsRoute(),
      ),
      _QuickAction(
        icon: Icons.science_outlined,
        label: 'Lab results',
        accent: ImshAccentColors.blue,
        route: const LabResultsRoute(),
      ),
      _QuickAction(
        icon: Icons.photo_outlined,
        label: 'Radiology',
        accent: ImshAccentColors.teal,
        route: const RadiologyReportsRoute(),
      ),
      _QuickAction(
        icon: Icons.payments_outlined,
        label: 'Pay bill',
        accent: ImshAccentColors.amber,
        onTap: onPayBill,
      ),
      _QuickAction(
        icon: Icons.water_drop_outlined,
        label: 'Cycle',
        accent: ImshAccentColors.pink,
        route: const CycleTrackerRoute(),
      ),
      _QuickAction(
        icon: Icons.family_restroom_outlined,
        label: 'Family',
        accent: ImshAccentColors.purple,
        route: const FamilyAccountsRoute(),
      ),
      _QuickAction(
        icon: Icons.notifications_outlined,
        label: 'Notifications',
        accent: ImshAccentColors.indigo,
        route: const NotificationsRoute(),
      ),
      _QuickAction(
        icon: Icons.forum_outlined,
        label: 'Feedback',
        accent: ImshAccentColors.green,
        route: const PatientFeedbackRoute(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final actions = _actions();

    final header = Row(
      children: [
        const ImshSolidIcon(
          icon: Icons.flash_on,
          color: ImshAccentColors.amber,
          size: 26,
          iconSize: 14,
          radius: 7,
        ),
        const SizedBox(width: 8),
        Text(
          'Quick Actions',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );

    if (asRail) {
      final list = ListView.separated(
        shrinkWrap: !fillHeight,
        physics: fillHeight
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        itemCount: actions.length,
        separatorBuilder: (_, _) => const SizedBox(height: 6),
        itemBuilder: (context, i) {
          final a = actions[i];
          return _RailActionTile(action: a);
        },
      );

      return ImshSurfaceCard(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            header,
            const SizedBox(height: 12),
            if (fillHeight) Expanded(child: list) else list,
          ],
        ),
      );
    }

    return ImshSurfaceCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          header,
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (context, constraints) {
              final cols = constraints.maxWidth < 400 ? 3 : 4;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: actions.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 72,
                ),
                itemBuilder: (context, i) {
                  final a = actions[i];
                  return _CompactActionTile(action: a);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _RailActionTile extends StatelessWidget {
  const _RailActionTile({required this.action});

  final _QuickAction action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final radius = BorderRadius.circular(AppDesignTokens.radiusMd);

    return _TilePress(
      onTap: () => _openQuickAction(context, action),
      child: Material(
        color: cs.surfaceContainerLow,
        borderRadius: radius,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            children: [
              ImshSolidIcon(
                icon: action.icon,
                color: action.accent,
                size: 28,
                iconSize: 15,
                radius: 7,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ImshEllipsisText(
                  text: action.label,
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: 18,
                color: cs.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CompactActionTile extends StatelessWidget {
  const _CompactActionTile({required this.action});

  final _QuickAction action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _TilePress(
      onTap: () => _openQuickAction(context, action),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImshSolidIcon(
            icon: action.icon,
            color: action.accent,
            size: 36,
            iconSize: 18,
            radius: AppDesignTokens.radiusSm,
          ),
          const SizedBox(height: 6),
          ImshEllipsisText(
            text: action.label,
            align: TextAlign.center,
            maxLines: 2,
            style: theme.textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w600,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}

void _openQuickAction(BuildContext context, _QuickAction action) {
  final route = action.route;
  if (route != null) {
    ZoomSource.capture(context);
    context.router.push(route);
    return;
  }
  action.onTap?.call();
}

class _TilePress extends StatefulWidget {
  const _TilePress({required this.onTap, required this.child});

  final VoidCallback onTap;
  final Widget child;

  @override
  State<_TilePress> createState() => _TilePressState();
}

class _TilePressState extends State<_TilePress> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _pressed ? 0.96 : 1,
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOutCubic,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => setState(() => _pressed = true),
        onTapCancel: () => setState(() => _pressed = false),
        onTap: () {
          setState(() => _pressed = false);
          widget.onTap();
        },
        child: widget.child,
      ),
    );
  }
}

/// Backward-compatible alias used by older call sites / skeletons.
class QuickActionsRow extends StatelessWidget {
  const QuickActionsRow({
    super.key,
    required this.onPayBill,
    required this.onCheckIn,
  });

  final VoidCallback onPayBill;
  final VoidCallback onCheckIn;

  @override
  Widget build(BuildContext context) {
    return HomeQuickActions(onPayBill: onPayBill, onCheckIn: onCheckIn);
  }
}
