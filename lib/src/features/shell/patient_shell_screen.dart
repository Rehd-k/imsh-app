import 'package:auto_route/auto_route.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:imsh/app_router.gr.dart';

import '../../core/theme/imsh_accent_colors.dart';
import '../appointments/widgets/appointments_body.dart';
import '../billing/widgets/billing_body.dart';
import '../home/widgets/home_body.dart';
import '../medical_records/widgets/medical_records_body.dart';
import '../onboarding/onboarding_anchor.dart';
import '../onboarding/onboarding_tips.dart';
import '../profile/widgets/profile_body.dart';

@RoutePage()
class PatientShellScreen extends StatelessWidget {
  const PatientShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return AutoTabsScaffold(
      backgroundColor: cs.surface,
      homeIndex: 2,
      routes: const [
        RecordsTabRoute(),
        BookingTabRoute(),
        HomeTabRoute(),
        BillsTabRoute(),
        AccountTabRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        final index = tabsRouter.activeIndex;
        return ColoredBox(
          color: cs.surfaceContainerLowest,
          child: SafeArea(
            top: false,
            child: CurvedNavigationBar(
              index: index,
              color: cs.surfaceContainerLowest,
              buttonBackgroundColor: cs.primary,
              backgroundColor: cs.surface,
              animationCurve: Curves.easeOutCubic,
              animationDuration: const Duration(milliseconds: 320),
              onTap: tabsRouter.setActiveIndex,
              items: [
                _ShellNavIcon(
                  icon: Icons.folder_outlined,
                  selectedIcon: Icons.folder,
                  accent: ImshAccentColors.blue,
                  selected: index == 0,
                  selectedColor: cs.onPrimary,
                  label: 'Records',
                ),
                _ShellNavIcon(
                  icon: Icons.calendar_month_outlined,
                  selectedIcon: Icons.calendar_month,
                  accent: ImshAccentColors.teal,
                  selected: index == 1,
                  selectedColor: cs.onPrimary,
                  label: 'Booking',
                ),
                OnboardingAnchor(
                  tip: OnboardingTip.home,
                  deferWhileViewingFamily: true,
                  child: _ShellNavIcon(
                    icon: Icons.home_outlined,
                    selectedIcon: Icons.home,
                    accent: ImshAccentColors.indigo,
                    selected: index == 2,
                    selectedColor: cs.onPrimary,
                    label: 'Home',
                  ),
                ),
                _ShellNavIcon(
                  icon: Icons.receipt_long_outlined,
                  selectedIcon: Icons.receipt_long,
                  accent: ImshAccentColors.amber,
                  selected: index == 3,
                  selectedColor: cs.onPrimary,
                  label: 'Billing',
                ),
                _ShellNavIcon(
                  icon: Icons.person_outline,
                  selectedIcon: Icons.person,
                  accent: ImshAccentColors.purple,
                  selected: index == 4,
                  selectedColor: cs.onPrimary,
                  label: 'Account',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ShellNavIcon extends StatelessWidget {
  const _ShellNavIcon({
    required this.icon,
    required this.selectedIcon,
    required this.accent,
    required this.selected,
    required this.selectedColor,
    required this.label,
  });

  final IconData icon;
  final IconData selectedIcon;
  final Color accent;
  final bool selected;
  final Color selectedColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      child: Icon(
        selected ? selectedIcon : icon,
        size: 26,
        color: selected ? selectedColor : accent,
        semanticLabel: label,
      ),
    );
  }
}

@RoutePage()
class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomeBody());
  }
}

@RoutePage()
class RecordsTabScreen extends StatelessWidget {
  const RecordsTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MedicalRecordsBody());
  }
}

@RoutePage()
class BookingTabScreen extends StatelessWidget {
  const BookingTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AppointmentsBody());
  }
}

@RoutePage()
class BillsTabScreen extends StatelessWidget {
  const BillsTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: BillingBody());
  }
}

@RoutePage()
class AccountTabScreen extends StatelessWidget {
  const AccountTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ProfileBody(includeSliverAppBar: true));
  }
}
