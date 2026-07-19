import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../errors/app_exception.dart';

const networkErrorTips = <String>[
  'Check your internet or Wi‑Fi connection',
  'Tap Try again in a moment',
  'Fully close and reopen the app',
  'If the problem continues, contact hospital support',
];

bool isNetworkRelatedError(Object error) {
  final resolved = _unwrap(error);
  if (resolved is NetworkException || resolved is TimeoutException) {
    return true;
  }
  if (resolved is DioException) {
    switch (resolved.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.unknown:
      case DioExceptionType.badCertificate:
        return true;
      case DioExceptionType.badResponse:
      case DioExceptionType.cancel:
        return false;
    }
  }
  return false;
}

String userFacingErrorMessage(Object error) {
  final resolved = _unwrap(error);

  if (resolved is NetworkException) {
    return resolved.message;
  }
  if (resolved is TimeoutException) {
    return resolved.message;
  }
  if (resolved is AppException) {
    return resolved.message;
  }
  if (resolved is DioException) {
    final inner = resolved.error;
    if (inner is AppException) return inner.message;
    if (isNetworkRelatedError(resolved)) {
      return const NetworkException().message;
    }
  }
  if (error is String) return error;

  const fallback = 'Something went wrong. Please try again.';
  if (kDebugMode) {
    return '$fallback\n$resolved';
  }
  return fallback;
}

Object _unwrap(Object error) {
  if (error is DioException && error.error != null) {
    return error.error!;
  }
  return error;
}
