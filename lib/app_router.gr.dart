// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i23;
import 'package:flutter/material.dart' as _i24;
import 'package:imsh/src/features/appointments/appointments_screen.dart' as _i2;
import 'package:imsh/src/features/appointments/book_appointment_screen.dart'
    as _i4;
import 'package:imsh/src/features/auth/device_pending_screen.dart' as _i7;
import 'package:imsh/src/features/auth/login_screen.dart' as _i16;
import 'package:imsh/src/features/billing/billing_screen.dart' as _i3;
import 'package:imsh/src/features/devices/devices_screen.dart' as _i8;
import 'package:imsh/src/features/emergency/emergency_screens.dart' as _i5;
import 'package:imsh/src/features/family/family_screen.dart' as _i11;
import 'package:imsh/src/features/feedback/feedback_screen.dart' as _i6;
import 'package:imsh/src/features/health/health_content_screens.dart' as _i12;
import 'package:imsh/src/features/health_card/health_card_screen.dart' as _i13;
import 'package:imsh/src/features/lab_results/lab_results_screen.dart' as _i14;
import 'package:imsh/src/features/medical_records/medical_records_screen.dart'
    as _i10;
import 'package:imsh/src/features/medications/medications_history_screen.dart'
    as _i17;
import 'package:imsh/src/features/medications/medications_screen.dart' as _i18;
import 'package:imsh/src/features/notifications/notifications_screen.dart'
    as _i19;
import 'package:imsh/src/features/profile/profile_screen.dart' as _i9;
import 'package:imsh/src/features/radiology/radiology_screen.dart' as _i20;
import 'package:imsh/src/features/shell/patient_shell_screen.dart' as _i1;
import 'package:imsh/src/features/splash/splash_screen.dart' as _i21;
import 'package:imsh/src/features/theatre/theatre_schedules_screen.dart'
    as _i22;
import 'package:imsh/src/features/trends/trend_screens.dart' as _i15;

/// generated route for
/// [_i1.AccountTabScreen]
class AccountTabRoute extends _i23.PageRouteInfo<void> {
  const AccountTabRoute({List<_i23.PageRouteInfo>? children})
    : super(AccountTabRoute.name, initialChildren: children);

  static const String name = 'AccountTabRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountTabScreen();
    },
  );
}

/// generated route for
/// [_i2.AppointmentDetailScreen]
class AppointmentDetailRoute
    extends _i23.PageRouteInfo<AppointmentDetailRouteArgs> {
  AppointmentDetailRoute({
    _i24.Key? key,
    required String id,
    List<_i23.PageRouteInfo>? children,
  }) : super(
         AppointmentDetailRoute.name,
         args: AppointmentDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'AppointmentDetailRoute';

  static _i23.PageInfo page = _i23.PageInfo(
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

  final _i24.Key? key;

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
class AppointmentsRoute extends _i23.PageRouteInfo<void> {
  const AppointmentsRoute({List<_i23.PageRouteInfo>? children})
    : super(AppointmentsRoute.name, initialChildren: children);

  static const String name = 'AppointmentsRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i2.AppointmentsScreen();
    },
  );
}

/// generated route for
/// [_i3.BillDetailScreen]
class BillDetailRoute extends _i23.PageRouteInfo<BillDetailRouteArgs> {
  BillDetailRoute({
    _i24.Key? key,
    required String id,
    List<_i23.PageRouteInfo>? children,
  }) : super(
         BillDetailRoute.name,
         args: BillDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'BillDetailRoute';

  static _i23.PageInfo page = _i23.PageInfo(
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

  final _i24.Key? key;

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
class BillsRoute extends _i23.PageRouteInfo<void> {
  const BillsRoute({List<_i23.PageRouteInfo>? children})
    : super(BillsRoute.name, initialChildren: children);

  static const String name = 'BillsRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i3.BillsScreen();
    },
  );
}

/// generated route for
/// [_i1.BillsTabScreen]
class BillsTabRoute extends _i23.PageRouteInfo<void> {
  const BillsTabRoute({List<_i23.PageRouteInfo>? children})
    : super(BillsTabRoute.name, initialChildren: children);

  static const String name = 'BillsTabRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i1.BillsTabScreen();
    },
  );
}

/// generated route for
/// [_i4.BookAppointmentScreen]
class BookAppointmentRoute
    extends _i23.PageRouteInfo<BookAppointmentRouteArgs> {
  BookAppointmentRoute({
    _i24.Key? key,
    String? appointmentId,
    List<_i23.PageRouteInfo>? children,
  }) : super(
         BookAppointmentRoute.name,
         args: BookAppointmentRouteArgs(key: key, appointmentId: appointmentId),
         rawQueryParams: {'appointmentId': appointmentId},
         initialChildren: children,
       );

  static const String name = 'BookAppointmentRoute';

  static _i23.PageInfo page = _i23.PageInfo(
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

  final _i24.Key? key;

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
class BookingTabRoute extends _i23.PageRouteInfo<void> {
  const BookingTabRoute({List<_i23.PageRouteInfo>? children})
    : super(BookingTabRoute.name, initialChildren: children);

  static const String name = 'BookingTabRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i1.BookingTabScreen();
    },
  );
}

/// generated route for
/// [_i5.CreateEmergencyRequestScreen]
class CreateEmergencyRequestRoute extends _i23.PageRouteInfo<void> {
  const CreateEmergencyRequestRoute({List<_i23.PageRouteInfo>? children})
    : super(CreateEmergencyRequestRoute.name, initialChildren: children);

  static const String name = 'CreateEmergencyRequestRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i5.CreateEmergencyRequestScreen();
    },
  );
}

/// generated route for
/// [_i6.CreateFeedbackScreen]
class CreateFeedbackRoute extends _i23.PageRouteInfo<void> {
  const CreateFeedbackRoute({List<_i23.PageRouteInfo>? children})
    : super(CreateFeedbackRoute.name, initialChildren: children);

  static const String name = 'CreateFeedbackRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i6.CreateFeedbackScreen();
    },
  );
}

/// generated route for
/// [_i7.DevicePendingScreen]
class DevicePendingRoute extends _i23.PageRouteInfo<void> {
  const DevicePendingRoute({List<_i23.PageRouteInfo>? children})
    : super(DevicePendingRoute.name, initialChildren: children);

  static const String name = 'DevicePendingRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i7.DevicePendingScreen();
    },
  );
}

/// generated route for
/// [_i8.DevicesScreen]
class DevicesRoute extends _i23.PageRouteInfo<void> {
  const DevicesRoute({List<_i23.PageRouteInfo>? children})
    : super(DevicesRoute.name, initialChildren: children);

  static const String name = 'DevicesRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i8.DevicesScreen();
    },
  );
}

/// generated route for
/// [_i6.EditFeedbackScreen]
class EditFeedbackRoute extends _i23.PageRouteInfo<EditFeedbackRouteArgs> {
  EditFeedbackRoute({
    _i24.Key? key,
    required String id,
    List<_i23.PageRouteInfo>? children,
  }) : super(
         EditFeedbackRoute.name,
         args: EditFeedbackRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'EditFeedbackRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<EditFeedbackRouteArgs>(
        orElse: () => EditFeedbackRouteArgs(id: pathParams.getString('id')),
      );
      return _i6.EditFeedbackScreen(key: args.key, id: args.id);
    },
  );
}

class EditFeedbackRouteArgs {
  const EditFeedbackRouteArgs({this.key, required this.id});

  final _i24.Key? key;

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
/// [_i9.EditProfileScreen]
class EditProfileRoute extends _i23.PageRouteInfo<void> {
  const EditProfileRoute({List<_i23.PageRouteInfo>? children})
    : super(EditProfileRoute.name, initialChildren: children);

  static const String name = 'EditProfileRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i9.EditProfileScreen();
    },
  );
}

/// generated route for
/// [_i5.EmergencyRequestDetailScreen]
class EmergencyRequestDetailRoute
    extends _i23.PageRouteInfo<EmergencyRequestDetailRouteArgs> {
  EmergencyRequestDetailRoute({
    _i24.Key? key,
    required String id,
    List<_i23.PageRouteInfo>? children,
  }) : super(
         EmergencyRequestDetailRoute.name,
         args: EmergencyRequestDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'EmergencyRequestDetailRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<EmergencyRequestDetailRouteArgs>(
        orElse: () =>
            EmergencyRequestDetailRouteArgs(id: pathParams.getString('id')),
      );
      return _i5.EmergencyRequestDetailScreen(key: args.key, id: args.id);
    },
  );
}

class EmergencyRequestDetailRouteArgs {
  const EmergencyRequestDetailRouteArgs({this.key, required this.id});

  final _i24.Key? key;

  final String id;

  @override
  String toString() {
    return 'EmergencyRequestDetailRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EmergencyRequestDetailRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i5.EmergencyRequestsScreen]
class EmergencyRequestsRoute extends _i23.PageRouteInfo<void> {
  const EmergencyRequestsRoute({List<_i23.PageRouteInfo>? children})
    : super(EmergencyRequestsRoute.name, initialChildren: children);

  static const String name = 'EmergencyRequestsRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i5.EmergencyRequestsScreen();
    },
  );
}

/// generated route for
/// [_i10.EncounterDetailScreen]
class EncounterDetailRoute
    extends _i23.PageRouteInfo<EncounterDetailRouteArgs> {
  EncounterDetailRoute({
    _i24.Key? key,
    required String id,
    List<_i23.PageRouteInfo>? children,
  }) : super(
         EncounterDetailRoute.name,
         args: EncounterDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'EncounterDetailRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<EncounterDetailRouteArgs>(
        orElse: () => EncounterDetailRouteArgs(id: pathParams.getString('id')),
      );
      return _i10.EncounterDetailScreen(key: args.key, id: args.id);
    },
  );
}

class EncounterDetailRouteArgs {
  const EncounterDetailRouteArgs({this.key, required this.id});

  final _i24.Key? key;

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
/// [_i11.FamilyAccountsScreen]
class FamilyAccountsRoute extends _i23.PageRouteInfo<void> {
  const FamilyAccountsRoute({List<_i23.PageRouteInfo>? children})
    : super(FamilyAccountsRoute.name, initialChildren: children);

  static const String name = 'FamilyAccountsRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i11.FamilyAccountsScreen();
    },
  );
}

/// generated route for
/// [_i6.FeedbackDetailScreen]
class FeedbackDetailRoute extends _i23.PageRouteInfo<FeedbackDetailRouteArgs> {
  FeedbackDetailRoute({
    _i24.Key? key,
    required String id,
    List<_i23.PageRouteInfo>? children,
  }) : super(
         FeedbackDetailRoute.name,
         args: FeedbackDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'FeedbackDetailRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<FeedbackDetailRouteArgs>(
        orElse: () => FeedbackDetailRouteArgs(id: pathParams.getString('id')),
      );
      return _i6.FeedbackDetailScreen(key: args.key, id: args.id);
    },
  );
}

class FeedbackDetailRouteArgs {
  const FeedbackDetailRouteArgs({this.key, required this.id});

  final _i24.Key? key;

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
/// [_i12.HealthCampaignDetailScreen]
class HealthCampaignDetailRoute
    extends _i23.PageRouteInfo<HealthCampaignDetailRouteArgs> {
  HealthCampaignDetailRoute({
    _i24.Key? key,
    required String id,
    List<_i23.PageRouteInfo>? children,
  }) : super(
         HealthCampaignDetailRoute.name,
         args: HealthCampaignDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'HealthCampaignDetailRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<HealthCampaignDetailRouteArgs>(
        orElse: () =>
            HealthCampaignDetailRouteArgs(id: pathParams.getString('id')),
      );
      return _i12.HealthCampaignDetailScreen(key: args.key, id: args.id);
    },
  );
}

class HealthCampaignDetailRouteArgs {
  const HealthCampaignDetailRouteArgs({this.key, required this.id});

  final _i24.Key? key;

  final String id;

  @override
  String toString() {
    return 'HealthCampaignDetailRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HealthCampaignDetailRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i12.HealthCampaignsScreen]
class HealthCampaignsRoute extends _i23.PageRouteInfo<void> {
  const HealthCampaignsRoute({List<_i23.PageRouteInfo>? children})
    : super(HealthCampaignsRoute.name, initialChildren: children);

  static const String name = 'HealthCampaignsRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i12.HealthCampaignsScreen();
    },
  );
}

/// generated route for
/// [_i13.HealthCardScreen]
class HealthCardRoute extends _i23.PageRouteInfo<void> {
  const HealthCardRoute({List<_i23.PageRouteInfo>? children})
    : super(HealthCardRoute.name, initialChildren: children);

  static const String name = 'HealthCardRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i13.HealthCardScreen();
    },
  );
}

/// generated route for
/// [_i12.HealthNewsDetailScreen]
class HealthNewsDetailRoute
    extends _i23.PageRouteInfo<HealthNewsDetailRouteArgs> {
  HealthNewsDetailRoute({
    _i24.Key? key,
    required String id,
    List<_i23.PageRouteInfo>? children,
  }) : super(
         HealthNewsDetailRoute.name,
         args: HealthNewsDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'HealthNewsDetailRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<HealthNewsDetailRouteArgs>(
        orElse: () => HealthNewsDetailRouteArgs(id: pathParams.getString('id')),
      );
      return _i12.HealthNewsDetailScreen(key: args.key, id: args.id);
    },
  );
}

class HealthNewsDetailRouteArgs {
  const HealthNewsDetailRouteArgs({this.key, required this.id});

  final _i24.Key? key;

  final String id;

  @override
  String toString() {
    return 'HealthNewsDetailRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HealthNewsDetailRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i12.HealthNewsScreen]
class HealthNewsRoute extends _i23.PageRouteInfo<void> {
  const HealthNewsRoute({List<_i23.PageRouteInfo>? children})
    : super(HealthNewsRoute.name, initialChildren: children);

  static const String name = 'HealthNewsRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i12.HealthNewsScreen();
    },
  );
}

/// generated route for
/// [_i1.HomeTabScreen]
class HomeTabRoute extends _i23.PageRouteInfo<void> {
  const HomeTabRoute({List<_i23.PageRouteInfo>? children})
    : super(HomeTabRoute.name, initialChildren: children);

  static const String name = 'HomeTabRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeTabScreen();
    },
  );
}

/// generated route for
/// [_i14.LabResultDetailScreen]
class LabResultDetailRoute
    extends _i23.PageRouteInfo<LabResultDetailRouteArgs> {
  LabResultDetailRoute({
    _i24.Key? key,
    required String id,
    List<_i23.PageRouteInfo>? children,
  }) : super(
         LabResultDetailRoute.name,
         args: LabResultDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'LabResultDetailRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<LabResultDetailRouteArgs>(
        orElse: () => LabResultDetailRouteArgs(id: pathParams.getString('id')),
      );
      return _i14.LabResultDetailScreen(key: args.key, id: args.id);
    },
  );
}

class LabResultDetailRouteArgs {
  const LabResultDetailRouteArgs({this.key, required this.id});

  final _i24.Key? key;

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
/// [_i14.LabResultsScreen]
class LabResultsRoute extends _i23.PageRouteInfo<void> {
  const LabResultsRoute({List<_i23.PageRouteInfo>? children})
    : super(LabResultsRoute.name, initialChildren: children);

  static const String name = 'LabResultsRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i14.LabResultsScreen();
    },
  );
}

/// generated route for
/// [_i15.LabTrendScreen]
class LabTrendRoute extends _i23.PageRouteInfo<LabTrendRouteArgs> {
  LabTrendRoute({
    _i24.Key? key,
    String? analyte,
    List<_i23.PageRouteInfo>? children,
  }) : super(
         LabTrendRoute.name,
         args: LabTrendRouteArgs(key: key, analyte: analyte),
         rawQueryParams: {'analyte': analyte},
         initialChildren: children,
       );

  static const String name = 'LabTrendRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<LabTrendRouteArgs>(
        orElse: () =>
            LabTrendRouteArgs(analyte: queryParams.optString('analyte')),
      );
      return _i15.LabTrendScreen(key: args.key, analyte: args.analyte);
    },
  );
}

class LabTrendRouteArgs {
  const LabTrendRouteArgs({this.key, this.analyte});

  final _i24.Key? key;

  final String? analyte;

  @override
  String toString() {
    return 'LabTrendRouteArgs{key: $key, analyte: $analyte}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LabTrendRouteArgs) return false;
    return key == other.key && analyte == other.analyte;
  }

  @override
  int get hashCode => key.hashCode ^ analyte.hashCode;
}

/// generated route for
/// [_i16.LoginScreen]
class LoginRoute extends _i23.PageRouteInfo<void> {
  const LoginRoute({List<_i23.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i16.LoginScreen();
    },
  );
}

/// generated route for
/// [_i10.MedicalRecordsScreen]
class MedicalRecordsRoute extends _i23.PageRouteInfo<void> {
  const MedicalRecordsRoute({List<_i23.PageRouteInfo>? children})
    : super(MedicalRecordsRoute.name, initialChildren: children);

  static const String name = 'MedicalRecordsRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i10.MedicalRecordsScreen();
    },
  );
}

/// generated route for
/// [_i17.MedicationsHistoryScreen]
class MedicationsHistoryRoute extends _i23.PageRouteInfo<void> {
  const MedicationsHistoryRoute({List<_i23.PageRouteInfo>? children})
    : super(MedicationsHistoryRoute.name, initialChildren: children);

  static const String name = 'MedicationsHistoryRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i17.MedicationsHistoryScreen();
    },
  );
}

/// generated route for
/// [_i18.MedicationsScreen]
class MedicationsRoute extends _i23.PageRouteInfo<void> {
  const MedicationsRoute({List<_i23.PageRouteInfo>? children})
    : super(MedicationsRoute.name, initialChildren: children);

  static const String name = 'MedicationsRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i18.MedicationsScreen();
    },
  );
}

/// generated route for
/// [_i19.NotificationsScreen]
class NotificationsRoute extends _i23.PageRouteInfo<void> {
  const NotificationsRoute({List<_i23.PageRouteInfo>? children})
    : super(NotificationsRoute.name, initialChildren: children);

  static const String name = 'NotificationsRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i19.NotificationsScreen();
    },
  );
}

/// generated route for
/// [_i6.PatientFeedbackScreen]
class PatientFeedbackRoute extends _i23.PageRouteInfo<void> {
  const PatientFeedbackRoute({List<_i23.PageRouteInfo>? children})
    : super(PatientFeedbackRoute.name, initialChildren: children);

  static const String name = 'PatientFeedbackRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i6.PatientFeedbackScreen();
    },
  );
}

/// generated route for
/// [_i1.PatientShellScreen]
class PatientShellRoute extends _i23.PageRouteInfo<void> {
  const PatientShellRoute({List<_i23.PageRouteInfo>? children})
    : super(PatientShellRoute.name, initialChildren: children);

  static const String name = 'PatientShellRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i1.PatientShellScreen();
    },
  );
}

/// generated route for
/// [_i9.ProfileScreen]
class ProfileRoute extends _i23.PageRouteInfo<void> {
  const ProfileRoute({List<_i23.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i9.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i20.RadiologyDetailScreen]
class RadiologyDetailRoute
    extends _i23.PageRouteInfo<RadiologyDetailRouteArgs> {
  RadiologyDetailRoute({
    _i24.Key? key,
    required String id,
    List<_i23.PageRouteInfo>? children,
  }) : super(
         RadiologyDetailRoute.name,
         args: RadiologyDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'RadiologyDetailRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<RadiologyDetailRouteArgs>(
        orElse: () => RadiologyDetailRouteArgs(id: pathParams.getString('id')),
      );
      return _i20.RadiologyDetailScreen(key: args.key, id: args.id);
    },
  );
}

class RadiologyDetailRouteArgs {
  const RadiologyDetailRouteArgs({this.key, required this.id});

  final _i24.Key? key;

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
/// [_i20.RadiologyReportsScreen]
class RadiologyReportsRoute extends _i23.PageRouteInfo<void> {
  const RadiologyReportsRoute({List<_i23.PageRouteInfo>? children})
    : super(RadiologyReportsRoute.name, initialChildren: children);

  static const String name = 'RadiologyReportsRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i20.RadiologyReportsScreen();
    },
  );
}

/// generated route for
/// [_i3.ReceiptViewerScreen]
class ReceiptViewerRoute extends _i23.PageRouteInfo<ReceiptViewerRouteArgs> {
  ReceiptViewerRoute({
    _i24.Key? key,
    required String id,
    List<_i23.PageRouteInfo>? children,
  }) : super(
         ReceiptViewerRoute.name,
         args: ReceiptViewerRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'ReceiptViewerRoute';

  static _i23.PageInfo page = _i23.PageInfo(
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

  final _i24.Key? key;

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
class RecordsTabRoute extends _i23.PageRouteInfo<void> {
  const RecordsTabRoute({List<_i23.PageRouteInfo>? children})
    : super(RecordsTabRoute.name, initialChildren: children);

  static const String name = 'RecordsTabRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i1.RecordsTabScreen();
    },
  );
}

/// generated route for
/// [_i16.SessionExpiredScreen]
class SessionExpiredRoute extends _i23.PageRouteInfo<void> {
  const SessionExpiredRoute({List<_i23.PageRouteInfo>? children})
    : super(SessionExpiredRoute.name, initialChildren: children);

  static const String name = 'SessionExpiredRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i16.SessionExpiredScreen();
    },
  );
}

/// generated route for
/// [_i21.SplashScreen]
class SplashRoute extends _i23.PageRouteInfo<void> {
  const SplashRoute({List<_i23.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i21.SplashScreen();
    },
  );
}

/// generated route for
/// [_i22.TheatreScheduleDetailScreen]
class TheatreScheduleDetailRoute
    extends _i23.PageRouteInfo<TheatreScheduleDetailRouteArgs> {
  TheatreScheduleDetailRoute({
    _i24.Key? key,
    required String id,
    List<_i23.PageRouteInfo>? children,
  }) : super(
         TheatreScheduleDetailRoute.name,
         args: TheatreScheduleDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'TheatreScheduleDetailRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<TheatreScheduleDetailRouteArgs>(
        orElse: () =>
            TheatreScheduleDetailRouteArgs(id: pathParams.getString('id')),
      );
      return _i22.TheatreScheduleDetailScreen(key: args.key, id: args.id);
    },
  );
}

class TheatreScheduleDetailRouteArgs {
  const TheatreScheduleDetailRouteArgs({this.key, required this.id});

  final _i24.Key? key;

  final String id;

  @override
  String toString() {
    return 'TheatreScheduleDetailRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TheatreScheduleDetailRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i22.TheatreSchedulesScreen]
class TheatreSchedulesRoute extends _i23.PageRouteInfo<void> {
  const TheatreSchedulesRoute({List<_i23.PageRouteInfo>? children})
    : super(TheatreSchedulesRoute.name, initialChildren: children);

  static const String name = 'TheatreSchedulesRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i22.TheatreSchedulesScreen();
    },
  );
}

/// generated route for
/// [_i15.VitalsTrendScreen]
class VitalsTrendRoute extends _i23.PageRouteInfo<void> {
  const VitalsTrendRoute({List<_i23.PageRouteInfo>? children})
    : super(VitalsTrendRoute.name, initialChildren: children);

  static const String name = 'VitalsTrendRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i15.VitalsTrendScreen();
    },
  );
}
