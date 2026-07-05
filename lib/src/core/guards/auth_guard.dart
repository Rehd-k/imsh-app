import 'package:auto_route/auto_route.dart';

import '../storage/token_storage.dart';

class AuthGuard extends AutoRouteGuard {
  const AuthGuard();

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final hasToken = await TokenStorage.hasToken();
    if (hasToken) {
      resolver.next(true);
    } else {
      router.replaceAll([const _LoginRouteStub()]);
      resolver.next(false);
    }
  }
}

class _LoginRouteStub extends PageRouteInfo<void> {
  const _LoginRouteStub({List<PageRouteInfo>? children})
    : super('LoginRoute', initialChildren: children);
}
