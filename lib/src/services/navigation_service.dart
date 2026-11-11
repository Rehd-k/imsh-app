import 'package:imsh/app_router.dart';

import '../core/auth/remembered_phone.dart';
import '../providers/auth_provider.dart';
import 'patient_auth_service.dart';

class NavigationService {
  NavigationService._();

  static AppRouter? _router;
  static var _configured = false;

  static bool get isConfigured => _configured;

  static AppRouter get router => _router ??= AppRouter();

  /// Chooses the first screen after the opening splash. Later calls are ignored.
  static Future<void> configure(
    PatientAuthState auth, {
    PatientAuthService? authService,
  }) async {
    if (_configured) return;
    _router = AppRouter(
      start: await startFor(auth, authService: authService),
    );
    _configured = true;
  }

  static Future<AppStartRoute> startFor(
    PatientAuthState auth, {
    PatientAuthService? authService,
  }) async {
    if (auth.canAccessApp) return AppStartRoute.shell;

    try {
      final binding = await (authService ?? PatientAuthService()).lookupDevice();
      DeviceBinding.apply(
        verified: binding.verified,
        phoneNumber: binding.phoneNumber,
      );
      if (binding.verified) return AppStartRoute.login;
    } catch (_) {
      DeviceBinding.clear();
    }
    return AppStartRoute.activate;
  }
}
