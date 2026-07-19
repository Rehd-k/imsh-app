// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i20;
import 'package:imsh/src/features/appointments/appointments_screen.dart' as _i2;
import 'package:imsh/src/features/appointments/book_appointment_screen.dart'
    as _i4;
import 'package:imsh/src/features/auth/device_pending_screen.dart' as _i6;
import 'package:imsh/src/features/auth/login_screen.dart' as _i13;
import 'package:imsh/src/features/billing/billing_screen.dart' as _i3;
import 'package:imsh/src/features/devices/devices_screen.dart' as _i7;
import 'package:imsh/src/features/family/family_screen.dart' as _i10;
import 'package:imsh/src/features/feedback/feedback_screen.dart' as _i5;
import 'package:imsh/src/features/health_card/health_card_screen.dart' as _i11;
import 'package:imsh/src/features/lab_results/lab_results_screen.dart' as _i12;
import 'package:imsh/src/features/medical_records/medical_records_screen.dart'
    as _i9;
import 'package:imsh/src/features/medications/medications_history_screen.dart'
    as _i14;
import 'package:imsh/src/features/medications/medications_screen.dart' as _i15;
import 'package:imsh/src/features/notifications/notifications_screen.dart'
    as _i16;
import 'package:imsh/src/features/profile/profile_screen.dart' as _i8;
import 'package:imsh/src/features/radiology/radiology_screen.dart' as _i17;
import 'package:imsh/src/features/shell/patient_shell_screen.dart' as _i1;
import 'package:imsh/src/features/splash/splash_screen.dart' as _i18;

/// generated route for
/// [_i1.AccountTabScreen]
class AccountTabRoute extends _i19.PageRouteInfo<void> {
  const AccountTabRoute({List<_i19.PageRouteInfo>? children})
    : super(AccountTabRoute.name, initialChildren: children);

  static const String name = 'AccountTabRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountTabScreen();
    },
  );
}

/// generated route for
/// [_i2.AppointmentDetailScreen]
class AppointmentDetailRoute
    extends _i19.PageRouteInfo<AppointmentDetailRouteArgs> {
  AppointmentDetailRoute({
    _i20.Key? key,
    required String id,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         AppointmentDetailRoute.name,
         args: AppointmentDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'AppointmentDetailRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<AppointmentDetailRouteArgs>(
        orElse: () =>
            AppointmentDetailRouteArgs(id: pathParams.getString('id')),
      );
      return _i2.AppointmentDetailScreen(key: args.key, id: args.id);
    },
  );
}

class AppointmentDetailRouteArgs {
  const AppointmentDetailRouteArgs({this.key, required this.id});

  final _i20.Key? key;

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
/// [_i2.AppointmentsScreen]
class AppointmentsRoute extends _i19.PageRouteInfo<void> {
  const AppointmentsRoute({List<_i19.PageRouteInfo>? children})
    : super(AppointmentsRoute.name, initialChildren: children);

  static const String name = 'AppointmentsRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i2.AppointmentsScreen();
    },
  );
}

/// generated route for
/// [_i3.BillDetailScreen]
class BillDetailRoute extends _i19.PageRouteInfo<BillDetailRouteArgs> {
  BillDetailRoute({
    _i20.Key? key,
    required String id,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         BillDetailRoute.name,
         args: BillDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'BillDetailRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<BillDetailRouteArgs>(
        orElse: () => BillDetailRouteArgs(id: pathParams.getString('id')),
      );
      return _i3.BillDetailScreen(key: args.key, id: args.id);
    },
  );
}

class BillDetailRouteArgs {
  const BillDetailRouteArgs({this.key, required this.id});

  final _i20.Key? key;

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
/// [_i3.BillsScreen]
class BillsRoute extends _i19.PageRouteInfo<void> {
  const BillsRoute({List<_i19.PageRouteInfo>? children})
    : super(BillsRoute.name, initialChildren: children);

  static const String name = 'BillsRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i3.BillsScreen();
    },
  );
}

/// generated route for
/// [_i1.BillsTabScreen]
class BillsTabRoute extends _i19.PageRouteInfo<void> {
  const BillsTabRoute({List<_i19.PageRouteInfo>? children})
    : super(BillsTabRoute.name, initialChildren: children);

  static const String name = 'BillsTabRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i1.BillsTabScreen();
    },
  );
}

/// generated route for
/// [_i4.BookAppointmentScreen]
class BookAppointmentRoute
    extends _i19.PageRouteInfo<BookAppointmentRouteArgs> {
  BookAppointmentRoute({
    _i20.Key? key,
    String? appointmentId,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         BookAppointmentRoute.name,
         args: BookAppointmentRouteArgs(key: key, appointmentId: appointmentId),
         rawQueryParams: {'appointmentId': appointmentId},
         initialChildren: children,
       );

  static const String name = 'BookAppointmentRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<BookAppointmentRouteArgs>(
        orElse: () => BookAppointmentRouteArgs(
          appointmentId: queryParams.optString('appointmentId'),
        ),
      );
      return _i4.BookAppointmentScreen(
        key: args.key,
        appointmentId: args.appointmentId,
      );
    },
  );
}

class BookAppointmentRouteArgs {
  const BookAppointmentRouteArgs({this.key, this.appointmentId});

  final _i20.Key? key;

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
class BookingTabRoute extends _i19.PageRouteInfo<void> {
  const BookingTabRoute({List<_i19.PageRouteInfo>? children})
    : super(BookingTabRoute.name, initialChildren: children);

  static const String name = 'BookingTabRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i1.BookingTabScreen();
    },
  );
}

/// generated route for
/// [_i5.CreateFeedbackScreen]
class CreateFeedbackRoute extends _i19.PageRouteInfo<void> {
  const CreateFeedbackRoute({List<_i19.PageRouteInfo>? children})
    : super(CreateFeedbackRoute.name, initialChildren: children);

  static const String name = 'CreateFeedbackRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i5.CreateFeedbackScreen();
    },
  );
}

/// generated route for
/// [_i6.DevicePendingScreen]
class DevicePendingRoute extends _i19.PageRouteInfo<void> {
  const DevicePendingRoute({List<_i19.PageRouteInfo>? children})
    : super(DevicePendingRoute.name, initialChildren: children);

  static const String name = 'DevicePendingRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i6.DevicePendingScreen();
    },
  );
}

/// generated route for
/// [_i7.DevicesScreen]
class DevicesRoute extends _i19.PageRouteInfo<void> {
  const DevicesRoute({List<_i19.PageRouteInfo>? children})
    : super(DevicesRoute.name, initialChildren: children);

  static const String name = 'DevicesRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i7.DevicesScreen();
    },
  );
}

/// generated route for
/// [_i5.EditFeedbackScreen]
class EditFeedbackRoute extends _i19.PageRouteInfo<EditFeedbackRouteArgs> {
  EditFeedbackRoute({
    _i20.Key? key,
    required String id,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         EditFeedbackRoute.name,
         args: EditFeedbackRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'EditFeedbackRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<EditFeedbackRouteArgs>(
        orElse: () => EditFeedbackRouteArgs(id: pathParams.getString('id')),
      );
      return _i5.EditFeedbackScreen(key: args.key, id: args.id);
    },
  );
}

class EditFeedbackRouteArgs {
  const EditFeedbackRouteArgs({this.key, required this.id});

  final _i20.Key? key;

  final String id;

  @override
  String toString() {
    return 'EditFeedbackRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EditFeedbackRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i8.EditProfileScreen]
class EditProfileRoute extends _i19.PageRouteInfo<void> {
  const EditProfileRoute({List<_i19.PageRouteInfo>? children})
    : super(EditProfileRoute.name, initialChildren: children);

  static const String name = 'EditProfileRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i8.EditProfileScreen();
    },
  );
}

/// generated route for
/// [_i9.EncounterDetailScreen]
class EncounterDetailRoute
    extends _i19.PageRouteInfo<EncounterDetailRouteArgs> {
  EncounterDetailRoute({
    _i20.Key? key,
    required String id,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         EncounterDetailRoute.name,
         args: EncounterDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'EncounterDetailRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<EncounterDetailRouteArgs>(
        orElse: () => EncounterDetailRouteArgs(id: pathParams.getString('id')),
      );
      return _i9.EncounterDetailScreen(key: args.key, id: args.id);
    },
  );
}

class EncounterDetailRouteArgs {
  const EncounterDetailRouteArgs({this.key, required this.id});

  final _i20.Key? key;

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
/// [_i10.FamilyAccountsScreen]
class FamilyAccountsRoute extends _i19.PageRouteInfo<void> {
  const FamilyAccountsRoute({List<_i19.PageRouteInfo>? children})
    : super(FamilyAccountsRoute.name, initialChildren: children);

  static const String name = 'FamilyAccountsRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i10.FamilyAccountsScreen();
    },
  );
}

/// generated route for
/// [_i5.FeedbackDetailScreen]
class FeedbackDetailRoute extends _i19.PageRouteInfo<FeedbackDetailRouteArgs> {
  FeedbackDetailRoute({
    _i20.Key? key,
    required String id,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         FeedbackDetailRoute.name,
         args: FeedbackDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'FeedbackDetailRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<FeedbackDetailRouteArgs>(
        orElse: () => FeedbackDetailRouteArgs(id: pathParams.getString('id')),
      );
      return _i5.FeedbackDetailScreen(key: args.key, id: args.id);
    },
  );
}

class FeedbackDetailRouteArgs {
  const FeedbackDetailRouteArgs({this.key, required this.id});

  final _i20.Key? key;

  final String id;

  @override
  String toString() {
    return 'FeedbackDetailRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FeedbackDetailRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i11.HealthCardScreen]
class HealthCardRoute extends _i19.PageRouteInfo<void> {
  const HealthCardRoute({List<_i19.PageRouteInfo>? children})
    : super(HealthCardRoute.name, initialChildren: children);

  static const String name = 'HealthCardRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i11.HealthCardScreen();
    },
  );
}

/// generated route for
/// [_i1.HomeTabScreen]
class HomeTabRoute extends _i19.PageRouteInfo<void> {
  const HomeTabRoute({List<_i19.PageRouteInfo>? children})
    : super(HomeTabRoute.name, initialChildren: children);

  static const String name = 'HomeTabRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeTabScreen();
    },
  );
}

/// generated route for
/// [_i12.LabResultDetailScreen]
class LabResultDetailRoute
    extends _i19.PageRouteInfo<LabResultDetailRouteArgs> {
  LabResultDetailRoute({
    _i20.Key? key,
    required String id,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         LabResultDetailRoute.name,
         args: LabResultDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'LabResultDetailRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<LabResultDetailRouteArgs>(
        orElse: () => LabResultDetailRouteArgs(id: pathParams.getString('id')),
      );
      return _i12.LabResultDetailScreen(key: args.key, id: args.id);
    },
  );
}

class LabResultDetailRouteArgs {
  const LabResultDetailRouteArgs({this.key, required this.id});

  final _i20.Key? key;

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
/// [_i12.LabResultsScreen]
class LabResultsRoute extends _i19.PageRouteInfo<void> {
  const LabResultsRoute({List<_i19.PageRouteInfo>? children})
    : super(LabResultsRoute.name, initialChildren: children);

  static const String name = 'LabResultsRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i12.LabResultsScreen();
    },
  );
}

/// generated route for
/// [_i13.LoginScreen]
class LoginRoute extends _i19.PageRouteInfo<void> {
  const LoginRoute({List<_i19.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i13.LoginScreen();
    },
  );
}

/// generated route for
/// [_i9.MedicalRecordsScreen]
class MedicalRecordsRoute extends _i19.PageRouteInfo<void> {
  const MedicalRecordsRoute({List<_i19.PageRouteInfo>? children})
    : super(MedicalRecordsRoute.name, initialChildren: children);

  static const String name = 'MedicalRecordsRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i9.MedicalRecordsScreen();
    },
  );
}

/// generated route for
/// [_i14.MedicationsHistoryScreen]
class MedicationsHistoryRoute extends _i19.PageRouteInfo<void> {
  const MedicationsHistoryRoute({List<_i19.PageRouteInfo>? children})
    : super(MedicationsHistoryRoute.name, initialChildren: children);

  static const String name = 'MedicationsHistoryRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i14.MedicationsHistoryScreen();
    },
  );
}

/// generated route for
/// [_i15.MedicationsScreen]
class MedicationsRoute extends _i19.PageRouteInfo<void> {
  const MedicationsRoute({List<_i19.PageRouteInfo>? children})
    : super(MedicationsRoute.name, initialChildren: children);

  static const String name = 'MedicationsRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i15.MedicationsScreen();
    },
  );
}

/// generated route for
/// [_i16.NotificationsScreen]
class NotificationsRoute extends _i19.PageRouteInfo<void> {
  const NotificationsRoute({List<_i19.PageRouteInfo>? children})
    : super(NotificationsRoute.name, initialChildren: children);

  static const String name = 'NotificationsRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i16.NotificationsScreen();
    },
  );
}

/// generated route for
/// [_i5.PatientFeedbackScreen]
class PatientFeedbackRoute extends _i19.PageRouteInfo<void> {
  const PatientFeedbackRoute({List<_i19.PageRouteInfo>? children})
    : super(PatientFeedbackRoute.name, initialChildren: children);

  static const String name = 'PatientFeedbackRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i5.PatientFeedbackScreen();
    },
  );
}

/// generated route for
/// [_i1.PatientShellScreen]
class PatientShellRoute extends _i19.PageRouteInfo<void> {
  const PatientShellRoute({List<_i19.PageRouteInfo>? children})
    : super(PatientShellRoute.name, initialChildren: children);

  static const String name = 'PatientShellRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i1.PatientShellScreen();
    },
  );
}

/// generated route for
/// [_i8.ProfileScreen]
class ProfileRoute extends _i19.PageRouteInfo<void> {
  const ProfileRoute({List<_i19.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i8.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i17.RadiologyDetailScreen]
class RadiologyDetailRoute
    extends _i19.PageRouteInfo<RadiologyDetailRouteArgs> {
  RadiologyDetailRoute({
    _i20.Key? key,
    required String id,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         RadiologyDetailRoute.name,
         args: RadiologyDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'RadiologyDetailRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<RadiologyDetailRouteArgs>(
        orElse: () => RadiologyDetailRouteArgs(id: pathParams.getString('id')),
      );
      return _i17.RadiologyDetailScreen(key: args.key, id: args.id);
    },
  );
}

class RadiologyDetailRouteArgs {
  const RadiologyDetailRouteArgs({this.key, required this.id});

  final _i20.Key? key;

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
/// [_i17.RadiologyReportsScreen]
class RadiologyReportsRoute extends _i19.PageRouteInfo<void> {
  const RadiologyReportsRoute({List<_i19.PageRouteInfo>? children})
    : super(RadiologyReportsRoute.name, initialChildren: children);

  static const String name = 'RadiologyReportsRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i17.RadiologyReportsScreen();
    },
  );
}

/// generated route for
/// [_i3.ReceiptViewerScreen]
class ReceiptViewerRoute extends _i19.PageRouteInfo<ReceiptViewerRouteArgs> {
  ReceiptViewerRoute({
    _i20.Key? key,
    required String id,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         ReceiptViewerRoute.name,
         args: ReceiptViewerRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'ReceiptViewerRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ReceiptViewerRouteArgs>(
        orElse: () => ReceiptViewerRouteArgs(id: pathParams.getString('id')),
      );
      return _i3.ReceiptViewerScreen(key: args.key, id: args.id);
    },
  );
}

class ReceiptViewerRouteArgs {
  const ReceiptViewerRouteArgs({this.key, required this.id});

  final _i20.Key? key;

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
class RecordsTabRoute extends _i19.PageRouteInfo<void> {
  const RecordsTabRoute({List<_i19.PageRouteInfo>? children})
    : super(RecordsTabRoute.name, initialChildren: children);

  static const String name = 'RecordsTabRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i1.RecordsTabScreen();
    },
  );
}

/// generated route for
/// [_i13.SessionExpiredScreen]
class SessionExpiredRoute extends _i19.PageRouteInfo<void> {
  const SessionExpiredRoute({List<_i19.PageRouteInfo>? children})
    : super(SessionExpiredRoute.name, initialChildren: children);

  static const String name = 'SessionExpiredRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i13.SessionExpiredScreen();
    },
  );
}

/// generated route for
/// [_i18.SplashScreen]
class SplashRoute extends _i19.PageRouteInfo<void> {
  const SplashRoute({List<_i19.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i18.SplashScreen();
    },
  );
}
