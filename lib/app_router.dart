import 'package:auto_route/auto_route.dart';
import 'package:imsh/app_router.gr.dart';
import 'package:imsh/src/core/guards/auth_guard.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter({this.initialSplash = false});

  final bool initialSplash;

  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: SplashRoute.page,
      path: '/splash',
      initial: initialSplash,
    ),
    AutoRoute(
      page: LoginRoute.page,
      path: '/login',
      initial: !initialSplash,
    ),
    AutoRoute(page: SessionExpiredRoute.page, path: '/session-expired'),

    AutoRoute(
      page: PatientShellRoute.page,
      path: '/',
      guards: const [AuthGuard()],
      children: [
        AutoRoute(page: HomeTabRoute.page, initial: true),
        AutoRoute(page: RecordsTabRoute.page),
        AutoRoute(page: BookingTabRoute.page),
        AutoRoute(page: BillsTabRoute.page),
        AutoRoute(page: AccountTabRoute.page),
      ],
    ),

    AutoRoute(page: AppointmentsRoute.page, path: '/appointments'),
    AutoRoute(page: AppointmentDetailRoute.page, path: '/appointments/:id'),
    AutoRoute(page: BookAppointmentRoute.page, path: '/appointments/book'),

    AutoRoute(page: LabResultsRoute.page, path: '/lab-results'),
    AutoRoute(page: LabResultDetailRoute.page, path: '/lab-results/:id'),

    AutoRoute(page: RadiologyReportsRoute.page, path: '/radiology'),
    AutoRoute(page: RadiologyDetailRoute.page, path: '/radiology/:id'),

    AutoRoute(page: MedicalRecordsRoute.page, path: '/medical-records'),
    AutoRoute(page: EncounterDetailRoute.page, path: '/medical-records/:id'),

    AutoRoute(page: MedicationsRoute.page, path: '/medications'),
    AutoRoute(page: MedicationsHistoryRoute.page, path: '/medications/history'),

    AutoRoute(page: BillsRoute.page, path: '/bills'),
    AutoRoute(page: BillDetailRoute.page, path: '/bills/:id'),
    AutoRoute(page: ReceiptViewerRoute.page, path: '/receipts/:id'),

    AutoRoute(page: NotificationsRoute.page, path: '/notifications'),
    AutoRoute(page: FamilyAccountsRoute.page, path: '/family'),
    AutoRoute(page: AddFamilyMemberRoute.page, path: '/family/add'),

    AutoRoute(page: HealthCardRoute.page, path: '/health-card'),
    AutoRoute(page: ProfileRoute.page, path: '/profile'),
    AutoRoute(page: EditProfileRoute.page, path: '/profile/edit'),
  ];
}
