import 'package:flutter/foundation.dart';
import 'package:imsh/app_router.dart';

class NavigationService {
  NavigationService._();

  static final AppRouter _router = AppRouter(initialSplash: !kIsWeb);

  static AppRouter get router => _router;
}
