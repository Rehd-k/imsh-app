import 'package:dio/dio.dart';

/// Stub for platforms without `dart:io` (e.g. web).
class ImshAndroidUpdateService {
  ImshAndroidUpdateService._();

  static String? lastVersionCheckMessage;
  static void Function()? checkForUpdate;

  static String toSemverCore(String raw) => raw.split('+').first.trim();

  static bool isNewerThan(String latestRaw, String currentRaw) => false;

  static Future<String?> fetchLatestVersion() async => null;

  static String getBinaryDownloadUrl() => '';

  static Future<String> downloadLatestApk({
    required String version,
    void Function(double progress)? onProgress,
    CancelToken? cancelToken,
  }) async {
    throw UnsupportedError('APK updates are only supported on Android');
  }

  static void triggerCheckFromUi() => checkForUpdate?.call();
}
