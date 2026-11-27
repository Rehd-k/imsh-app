import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:imsh/src/core/auth/access_token_expiry.dart';
import 'package:imsh/src/core/auth/session_refresh.dart';

void main() {
  test('access token is expired inside the refresh leeway', () {
    final now = DateTime.utc(2026, 11, 27, 12);
    final almostDue = now.add(const Duration(seconds: 30));
    final token = _jwt(exp: almostDue.millisecondsSinceEpoch ~/ 1000);

    expect(isAccessTokenExpired(token, now: now), isTrue);
  });

  test('access token is usable until the refresh leeway', () {
    final now = DateTime.utc(2026, 11, 27, 12);
    final later = now.add(const Duration(hours: 2));
    final token = _jwt(exp: later.millisecondsSinceEpoch ~/ 1000);

    expect(isAccessTokenExpired(token, now: now), isFalse);
  });

  test('expired access token on an app request can refresh once', () {
    expect(
      shouldAttemptTokenRefresh(
        statusCode: 401,
        path: '/patient-auth/me',
        alreadyRetried: false,
        skipAuthRefresh: false,
      ),
      isTrue,
    );
  });

  test('refresh and device-revoked failures do not refresh again', () {
    expect(
      shouldAttemptTokenRefresh(
        statusCode: 401,
        path: '/patient-auth/refresh',
        alreadyRetried: false,
        skipAuthRefresh: true,
      ),
      isFalse,
    );
    expect(
      shouldAttemptTokenRefresh(
        statusCode: 401,
        path: '/appointments',
        alreadyRetried: true,
        skipAuthRefresh: false,
      ),
      isFalse,
    );
    expect(
      shouldAttemptTokenRefresh(
        statusCode: 401,
        path: '/appointments',
        alreadyRetried: false,
        skipAuthRefresh: false,
        errorCode: 'DEVICE_REVOKED',
      ),
      isFalse,
    );
  });
}

String _jwt({required int exp}) {
  String part(Object value) {
    return base64Url
        .encode(utf8.encode(jsonEncode(value)))
        .replaceAll('=', '');
  }

  return '${part({'alg': 'none'})}.${part({'exp': exp})}.sig';
}
