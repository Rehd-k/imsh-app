import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:imsh/app_router.gr.dart';

import '../../core/theme/imsh_accent_colors.dart';
import '../appointments/widgets/appointments_body.dart';
import '../billing/widgets/billing_body.dart';
import '../home/widgets/home_body.dart';
import '../medical_records/widgets/medical_records_body.dart';
import '../profile/widgets/profile_body.dart';

@RoutePage()
class PatientShellScreen extends StatelessWidget {
  const PatientShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return AutoTabsScaffold(
      routes: const [
        HomeTabRoute(),
        RecordsTabRoute(),
        BookingTabRoute(),
        BillsTabRoute(),
        AccountTabRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return NavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: tabsRouter.setActiveIndex,
          indicatorColor: cs.primary.withValues(alpha: 0.12),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined, color: ImshAccentColors.indigo),
              selectedIcon: Icon(Icons.home, color: ImshAccentColors.indigo),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.folder_outlined, color: ImshAccentColors.blue),
              selectedIcon: Icon(Icons.folder, color: ImshAccentColors.blue),
              label: 'Records',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.calendar_month_outlined,
                color: ImshAccentColors.teal,
              ),
              selectedIcon: Icon(
                Icons.calendar_month,
                color: ImshAccentColors.teal,
              ),
              label: 'Booking',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.receipt_long_outlined,
                color: ImshAccentColors.amber,
              ),
              selectedIcon: Icon(
                Icons.receipt_long,
                color: ImshAccentColors.amber,
              ),
              label: 'Billing',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline, color: ImshAccentColors.purple),
              selectedIcon: Icon(Icons.person, color: ImshAccentColors.purple),
              label: 'Account',
            ),
          ],
        );
      },
    );
  }
}

@RoutePage()
class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBody(),
    );
  }
}

@RoutePage()
class RecordsTabScreen extends StatelessWidget {
  const RecordsTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MedicalRecordsBody(),
    );
  }
}

@RoutePage()
class BookingTabScreen extends StatelessWidget {
  const BookingTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AppointmentsBody(),
    );
  }
}

@RoutePage()
class BillsTabScreen extends StatelessWidget {
  const BillsTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BillingBody(),
    );
  }
}

@RoutePage()
class AccountTabScreen extends StatelessWidget {
  const AccountTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfileBody(includeSliverAppBar: true),
    );
  }
}
