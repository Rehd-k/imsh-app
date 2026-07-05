import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:imsh/app_router.gr.dart';

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
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.folder_outlined),
              selectedIcon: Icon(Icons.folder),
              label: 'Records',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month_outlined),
              selectedIcon: Icon(Icons.calendar_month),
              label: 'Booking',
            ),
            NavigationDestination(
              icon: Icon(Icons.receipt_long_outlined),
              selectedIcon: Icon(Icons.receipt_long),
              label: 'Billing',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
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
