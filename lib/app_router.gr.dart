// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;
import 'package:imsh/src/features/appointments/appointments_screen.dart' as _i3;
import 'package:imsh/src/features/appointments/book_appointment_screen.dart'
    as _i5;
import 'package:imsh/src/features/auth/login_screen.dart' as _i10;
import 'package:imsh/src/features/billing/billing_screen.dart' as _i4;
import 'package:imsh/src/features/family/family_screen.dart' as _i2;
import 'package:imsh/src/features/health_card/health_card_screen.dart' as _i8;
import 'package:imsh/src/features/lab_results/lab_results_screen.dart' as _i9;
import 'package:imsh/src/features/medical_records/medical_records_screen.dart'
    as _i7;
import 'package:imsh/src/features/medications/medications_history_screen.dart'
    as _i11;
import 'package:imsh/src/features/medications/medications_screen.dart' as _i12;
import 'package:imsh/src/features/notifications/notifications_screen.dart'
    as _i13;
import 'package:imsh/src/features/profile/profile_screen.dart' as _i6;
import 'package:imsh/src/features/radiology/radiology_screen.dart' as _i14;
import 'package:imsh/src/features/shell/patient_shell_screen.dart' as _i1;
import 'package:imsh/src/features/splash/splash_screen.dart' as _i15;

/// generated route for
/// [_i1.AccountTabScreen]
class AccountTabRoute extends _i16.PageRouteInfo<void> {
  const AccountTabRoute({List<_i16.PageRouteInfo>? children})
    : super(AccountTabRoute.name, initialChildren: children);

  static const String name = 'AccountTabRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountTabScreen();
    },
  );
}

/// generated route for
/// [_i2.AddFamilyMemberScreen]
class AddFamilyMemberRoute extends _i16.PageRouteInfo<void> {
  const AddFamilyMemberRoute({List<_i16.PageRouteInfo>? children})
    : super(AddFamilyMemberRoute.name, initialChildren: children);

  static const String name = 'AddFamilyMemberRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i2.AddFamilyMemberScreen();
    },
  );
}

/// generated route for
/// [_i3.AppointmentDetailScreen]
class AppointmentDetailRoute
    extends _i16.PageRouteInfo<AppointmentDetailRouteArgs> {
  AppointmentDetailRoute({
    _i17.Key? key,
    required String id,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         AppointmentDetailRoute.name,
         args: AppointmentDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'AppointmentDetailRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<AppointmentDetailRouteArgs>(
        orElse: () =>
            AppointmentDetailRouteArgs(id: pathParams.getString('id')),
      );
      return _i3.AppointmentDetailScreen(key: args.key, id: args.id);
    },
  );
}

class AppointmentDetailRouteArgs {
  const AppointmentDetailRouteArgs({this.key, required this.id});

  final _i17.Key? key;

  final String id;

  @override
  String toString() {
    return 'AppointmentDetailRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AppointmentDetailRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i3.AppointmentsScreen]
class AppointmentsRoute extends _i16.PageRouteInfo<void> {
  const AppointmentsRoute({List<_i16.PageRouteInfo>? children})
    : super(AppointmentsRoute.name, initialChildren: children);

  static const String name = 'AppointmentsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i3.AppointmentsScreen();
    },
  );
}

/// generated route for
/// [_i4.BillDetailScreen]
class BillDetailRoute extends _i16.PageRouteInfo<BillDetailRouteArgs> {
  BillDetailRoute({
    _i17.Key? key,
    required String id,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         BillDetailRoute.name,
         args: BillDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'BillDetailRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<BillDetailRouteArgs>(
        orElse: () => BillDetailRouteArgs(id: pathParams.getString('id')),
      );
      return _i4.BillDetailScreen(key: args.key, id: args.id);
    },
  );
}

class BillDetailRouteArgs {
  const BillDetailRouteArgs({this.key, required this.id});

  final _i17.Key? key;

  final String id;

  @override
  String toString() {
    return 'BillDetailRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BillDetailRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i4.BillsScreen]
class BillsRoute extends _i16.PageRouteInfo<void> {
  const BillsRoute({List<_i16.PageRouteInfo>? children})
    : super(BillsRoute.name, initialChildren: children);

  static const String name = 'BillsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i4.BillsScreen();
    },
  );
}

/// generated route for
/// [_i1.BillsTabScreen]
class BillsTabRoute extends _i16.PageRouteInfo<void> {
  const BillsTabRoute({List<_i16.PageRouteInfo>? children})
    : super(BillsTabRoute.name, initialChildren: children);

  static const String name = 'BillsTabRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i1.BillsTabScreen();
    },
  );
}

/// generated route for
/// [_i5.BookAppointmentScreen]
class BookAppointmentRoute
    extends _i16.PageRouteInfo<BookAppointmentRouteArgs> {
  BookAppointmentRoute({
    _i17.Key? key,
    String? appointmentId,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         BookAppointmentRoute.name,
         args: BookAppointmentRouteArgs(key: key, appointmentId: appointmentId),
         rawQueryParams: {'appointmentId': appointmentId},
         initialChildren: children,
       );

  static const String name = 'BookAppointmentRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<BookAppointmentRouteArgs>(
        orElse: () => BookAppointmentRouteArgs(
          appointmentId: queryParams.optString('appointmentId'),
        ),
      );
      return _i5.BookAppointmentScreen(
        key: args.key,
        appointmentId: args.appointmentId,
      );
    },
  );
}

class BookAppointmentRouteArgs {
  const BookAppointmentRouteArgs({this.key, this.appointmentId});

  final _i17.Key? key;

  final String? appointmentId;

  @override
  String toString() {
    return 'BookAppointmentRouteArgs{key: $key, appointmentId: $appointmentId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BookAppointmentRouteArgs) return false;
    return key == other.key && appointmentId == other.appointmentId;
  }

  @override
  int get hashCode => key.hashCode ^ appointmentId.hashCode;
}

/// generated route for
/// [_i1.BookingTabScreen]
class BookingTabRoute extends _i16.PageRouteInfo<void> {
  const BookingTabRoute({List<_i16.PageRouteInfo>? children})
    : super(BookingTabRoute.name, initialChildren: children);

  static const String name = 'BookingTabRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i1.BookingTabScreen();
    },
  );
}

/// generated route for
/// [_i6.EditProfileScreen]
class EditProfileRoute extends _i16.PageRouteInfo<void> {
  const EditProfileRoute({List<_i16.PageRouteInfo>? children})
    : super(EditProfileRoute.name, initialChildren: children);

  static const String name = 'EditProfileRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i6.EditProfileScreen();
    },
  );
}

/// generated route for
/// [_i7.EncounterDetailScreen]
class EncounterDetailRoute
    extends _i16.PageRouteInfo<EncounterDetailRouteArgs> {
  EncounterDetailRoute({
    _i17.Key? key,
    required String id,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         EncounterDetailRoute.name,
         args: EncounterDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'EncounterDetailRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<EncounterDetailRouteArgs>(
        orElse: () => EncounterDetailRouteArgs(id: pathParams.getString('id')),
      );
      return _i7.EncounterDetailScreen(key: args.key, id: args.id);
    },
  );
}

class EncounterDetailRouteArgs {
  const EncounterDetailRouteArgs({this.key, required this.id});

  final _i17.Key? key;

  final String id;

  @override
  String toString() {
    return 'EncounterDetailRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EncounterDetailRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i2.FamilyAccountsScreen]
class FamilyAccountsRoute extends _i16.PageRouteInfo<void> {
  const FamilyAccountsRoute({List<_i16.PageRouteInfo>? children})
    : super(FamilyAccountsRoute.name, initialChildren: children);

  static const String name = 'FamilyAccountsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i2.FamilyAccountsScreen();
    },
  );
}

/// generated route for
/// [_i8.HealthCardScreen]
class HealthCardRoute extends _i16.PageRouteInfo<void> {
  const HealthCardRoute({List<_i16.PageRouteInfo>? children})
    : super(HealthCardRoute.name, initialChildren: children);

  static const String name = 'HealthCardRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i8.HealthCardScreen();
    },
  );
}

/// generated route for
/// [_i1.HomeTabScreen]
class HomeTabRoute extends _i16.PageRouteInfo<void> {
  const HomeTabRoute({List<_i16.PageRouteInfo>? children})
    : super(HomeTabRoute.name, initialChildren: children);

  static const String name = 'HomeTabRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeTabScreen();
    },
  );
}

/// generated route for
/// [_i9.LabResultDetailScreen]
class LabResultDetailRoute
    extends _i16.PageRouteInfo<LabResultDetailRouteArgs> {
  LabResultDetailRoute({
    _i17.Key? key,
    required String id,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         LabResultDetailRoute.name,
         args: LabResultDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'LabResultDetailRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<LabResultDetailRouteArgs>(
        orElse: () => LabResultDetailRouteArgs(id: pathParams.getString('id')),
      );
      return _i9.LabResultDetailScreen(key: args.key, id: args.id);
    },
  );
}

class LabResultDetailRouteArgs {
  const LabResultDetailRouteArgs({this.key, required this.id});

  final _i17.Key? key;

  final String id;

  @override
  String toString() {
    return 'LabResultDetailRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LabResultDetailRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i9.LabResultsScreen]
class LabResultsRoute extends _i16.PageRouteInfo<void> {
  const LabResultsRoute({List<_i16.PageRouteInfo>? children})
    : super(LabResultsRoute.name, initialChildren: children);

  static const String name = 'LabResultsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i9.LabResultsScreen();
    },
  );
}

/// generated route for
/// [_i10.LoginScreen]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute({List<_i16.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i10.LoginScreen();
    },
  );
}

/// generated route for
/// [_i7.MedicalRecordsScreen]
class MedicalRecordsRoute extends _i16.PageRouteInfo<void> {
  const MedicalRecordsRoute({List<_i16.PageRouteInfo>? children})
    : super(MedicalRecordsRoute.name, initialChildren: children);

  static const String name = 'MedicalRecordsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i7.MedicalRecordsScreen();
    },
  );
}

/// generated route for
/// [_i11.MedicationsHistoryScreen]
class MedicationsHistoryRoute extends _i16.PageRouteInfo<void> {
  const MedicationsHistoryRoute({List<_i16.PageRouteInfo>? children})
    : super(MedicationsHistoryRoute.name, initialChildren: children);

  static const String name = 'MedicationsHistoryRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i11.MedicationsHistoryScreen();
    },
  );
}

/// generated route for
/// [_i12.MedicationsScreen]
class MedicationsRoute extends _i16.PageRouteInfo<void> {
  const MedicationsRoute({List<_i16.PageRouteInfo>? children})
    : super(MedicationsRoute.name, initialChildren: children);

  static const String name = 'MedicationsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i12.MedicationsScreen();
    },
  );
}

/// generated route for
/// [_i13.NotificationsScreen]
class NotificationsRoute extends _i16.PageRouteInfo<void> {
  const NotificationsRoute({List<_i16.PageRouteInfo>? children})
    : super(NotificationsRoute.name, initialChildren: children);

  static const String name = 'NotificationsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i13.NotificationsScreen();
    },
  );
}

/// generated route for
/// [_i1.PatientShellScreen]
class PatientShellRoute extends _i16.PageRouteInfo<void> {
  const PatientShellRoute({List<_i16.PageRouteInfo>? children})
    : super(PatientShellRoute.name, initialChildren: children);

  static const String name = 'PatientShellRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i1.PatientShellScreen();
    },
  );
}

/// generated route for
/// [_i6.ProfileScreen]
class ProfileRoute extends _i16.PageRouteInfo<void> {
  const ProfileRoute({List<_i16.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i6.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i14.RadiologyDetailScreen]
class RadiologyDetailRoute
    extends _i16.PageRouteInfo<RadiologyDetailRouteArgs> {
  RadiologyDetailRoute({
    _i17.Key? key,
    required String id,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         RadiologyDetailRoute.name,
         args: RadiologyDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'RadiologyDetailRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<RadiologyDetailRouteArgs>(
        orElse: () => RadiologyDetailRouteArgs(id: pathParams.getString('id')),
      );
      return _i14.RadiologyDetailScreen(key: args.key, id: args.id);
    },
  );
}

class RadiologyDetailRouteArgs {
  const RadiologyDetailRouteArgs({this.key, required this.id});

  final _i17.Key? key;

  final String id;

  @override
  String toString() {
    return 'RadiologyDetailRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RadiologyDetailRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i14.RadiologyReportsScreen]
class RadiologyReportsRoute extends _i16.PageRouteInfo<void> {
  const RadiologyReportsRoute({List<_i16.PageRouteInfo>? children})
    : super(RadiologyReportsRoute.name, initialChildren: children);

  static const String name = 'RadiologyReportsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i14.RadiologyReportsScreen();
    },
  );
}

/// generated route for
/// [_i4.ReceiptViewerScreen]
class ReceiptViewerRoute extends _i16.PageRouteInfo<ReceiptViewerRouteArgs> {
  ReceiptViewerRoute({
    _i17.Key? key,
    required String id,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         ReceiptViewerRoute.name,
         args: ReceiptViewerRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'ReceiptViewerRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ReceiptViewerRouteArgs>(
        orElse: () => ReceiptViewerRouteArgs(id: pathParams.getString('id')),
      );
      return _i4.ReceiptViewerScreen(key: args.key, id: args.id);
    },
  );
}

class ReceiptViewerRouteArgs {
  const ReceiptViewerRouteArgs({this.key, required this.id});

  final _i17.Key? key;

  final String id;

  @override
  String toString() {
    return 'ReceiptViewerRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ReceiptViewerRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i1.RecordsTabScreen]
class RecordsTabRoute extends _i16.PageRouteInfo<void> {
  const RecordsTabRoute({List<_i16.PageRouteInfo>? children})
    : super(RecordsTabRoute.name, initialChildren: children);

  static const String name = 'RecordsTabRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i1.RecordsTabScreen();
    },
  );
}

/// generated route for
/// [_i10.SessionExpiredScreen]
class SessionExpiredRoute extends _i16.PageRouteInfo<void> {
  const SessionExpiredRoute({List<_i16.PageRouteInfo>? children})
    : super(SessionExpiredRoute.name, initialChildren: children);

  static const String name = 'SessionExpiredRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i10.SessionExpiredScreen();
    },
  );
}

/// generated route for
/// [_i15.SplashScreen]
class SplashRoute extends _i16.PageRouteInfo<void> {
  const SplashRoute({List<_i16.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i15.SplashScreen();
    },
  );
}
