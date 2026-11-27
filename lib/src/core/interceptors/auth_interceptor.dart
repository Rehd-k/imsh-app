import 'package:dio/dio.dart';

import '../auth/session_refresh.dart';
import '../storage/token_storage.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra[skipAuthRefreshExtra] == true) {
      options.headers.remove('Authorization');
      handler.next(options);
      return;
    }
    final token = await TokenStorage.getAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
