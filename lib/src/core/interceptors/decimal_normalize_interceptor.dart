import 'package:dio/dio.dart';

import '../utils/api_decimal.dart';

class DecimalNormalizeInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    response.data = normalizeApiDecimals(response.data);
    handler.next(response);
  }
}
