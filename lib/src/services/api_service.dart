import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../config/api_config.dart';
import '../core/interceptors/auth_interceptor.dart';
import '../core/interceptors/decimal_normalize_interceptor.dart';
import '../core/interceptors/error_interceptor.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;

  late final Dio dio;
  String? resolvedBaseUrl;

  String get apiBaseUrl => dio.options.baseUrl;

  ApiService._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: kApiCandidateBaseUrls.first,
        connectTimeout: kApiConnectTimeout,
        receiveTimeout: kApiReceiveTimeout,
        sendTimeout: kApiSendTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll([
      AuthInterceptor(),
      ErrorInterceptor(),
      if (kDebugMode)
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          logPrint: (o) => debugPrint(o.toString()),
        ),
      DecimalNormalizeInterceptor(),
    ]);
  }

  void setBaseUrl(String url) {
    final normalized = url.endsWith('/')
        ? url.substring(0, url.length - 1)
        : url;
    dio.options.baseUrl = normalized;
    resolvedBaseUrl = normalized;
  }
}
