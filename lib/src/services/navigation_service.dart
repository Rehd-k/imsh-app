import 'package:imsh/app_router.dart';

import '../providers/auth_provider.dart';

class NavigationService {
  NavigationService._();

  static AppRouter? _router;

  static AppRouter get router => _router ??= AppRouter();

  /// Chooses the first screen after the opening splash. Later calls are ignored.
  static void configure(PatientAuthState auth) {
    _router ??= AppRouter(start: startFor(auth));
  }

  static AppStartRoute startFor(PatientAuthState auth) {
    if (auth.canAccessApp) return AppStartRoute.shell;
    if (auth.isAuthenticated && auth.isDevicePending) {
      return AppStartRoute.devicePending;
    }
    return AppStartRoute.login;
  }
}
