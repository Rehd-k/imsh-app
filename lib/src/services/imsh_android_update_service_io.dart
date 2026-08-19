import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pub_semver/pub_semver.dart';

import '../config/api_config.dart';
import 'api_service.dart';

/// Builds URLs for `/imsh-android/*` on the same host as the REST API.
Uri imshAndroidBaseUri() {
  final raw = ApiService().apiBaseUrl.trim();
  final api = Uri.parse(
    raw.isEmpty ? kApiCandidateBaseUrls.first : raw,
  );
  return Uri(
    scheme: api.scheme,
    host: api.host,
    port: api.hasPort ? api.port : null,
    path: '/imsh-android/',
  );
}

/// Public Android-update endpoints (no auth); uses a plain [Dio] without
/// [ApiService] interceptors.
class ImshAndroidUpdateService {
  ImshAndroidUpdateService._();

  static String? lastVersionCheckMessage;
  static void Function()? checkForUpdate;

  static final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(minutes: 10),
      sendTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json,
      validateStatus: (status) => status != null && status < 500,
    ),
  );

  static const _fetchTimeout = Duration(seconds: 30);
  static final _semverCorePattern = RegExp(r'^\d+\.\d+\.\d+$');

  static Uri _uri(String relativePath) => imshAndroidBaseUri().resolve(
        relativePath.replaceFirst(RegExp(r'^/+'), ''),
      );

  static String toSemverCore(String raw) => raw.split('+').first.trim();

  static bool isNewerThan(String latestRaw, String currentRaw) {
    final latestCore = toSemverCore(latestRaw);
    final currentCore = toSemverCore(currentRaw);
    if (!_semverCorePattern.hasMatch(latestCore) ||
        !_semverCorePattern.hasMatch(currentCore)) {
      return false;
    }
    return Version.parse(latestCore) > Version.parse(currentCore);
  }

  /// Latest semver from `GET /imsh-android/update/latest`, or `null` if 404.
  static Future<String?> fetchLatestVersion() async {
    lastVersionCheckMessage = null;
    final uri = _uri('update/latest');
    try {
      final r = await _dio
          .getUri<Map<String, dynamic>>(
            uri,
            options: Options(
              responseType: ResponseType.json,
              receiveTimeout: _fetchTimeout,
              sendTimeout: _fetchTimeout,
            ),
          )
          .timeout(_fetchTimeout);

      if (r.statusCode == 404) {
        return null;
      }
      if (r.statusCode != 200) {
        lastVersionCheckMessage =
            'Update server returned HTTP ${r.statusCode} for ${uri.path}. '
            'Ask your administrator that an Android build is published, or try again later.';
        throw Exception(lastVersionCheckMessage);
      }

      final map = r.data;
      if (map is! Map<String, dynamic>) {
        lastVersionCheckMessage =
            'Update server sent invalid JSON. The API base URL may point at the wrong server.';
        throw Exception(lastVersionCheckMessage);
      }
      final v = map['version'];
      if (v is! String || v.isEmpty) {
        lastVersionCheckMessage =
            'Update server response is missing a "version" field.';
        throw Exception(lastVersionCheckMessage);
      }
      return v;
    } on TimeoutException {
      lastVersionCheckMessage =
          'Connection to the update server timed out after ${_fetchTimeout.inSeconds}s. '
          'Check that the device can reach ${uri.host}${uri.hasPort ? ':${uri.port}' : ''}.';
      throw Exception(lastVersionCheckMessage);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        lastVersionCheckMessage =
            'Connection to the update server timed out. '
            'Check that the device can reach ${uri.host}.';
        throw Exception(lastVersionCheckMessage);
      }
      if (e.type == DioExceptionType.connectionError) {
        lastVersionCheckMessage =
            'No network route to the update server (${uri.host}). '
            'Verify Wi‑Fi and that the API URL in the app is correct.';
        throw Exception(lastVersionCheckMessage);
      }
      lastVersionCheckMessage =
          'Could not reach ${uri.origin}${uri.path} — ${e.message ?? e}';
      throw Exception(lastVersionCheckMessage);
    } catch (e) {
      lastVersionCheckMessage ??=
          'Unexpected error while checking for updates: $e';
      throw Exception(lastVersionCheckMessage);
    }
  }

  static String getBinaryDownloadUrl() => _uri('download/latest').toString();

  /// Downloads the latest APK into app cache. Returns the local file path.
  static Future<String> downloadLatestApk({
    required String version,
    void Function(double progress)? onProgress,
    CancelToken? cancelToken,
  }) async {
    final dir = await getTemporaryDirectory();
    final safe = version.replaceAll(RegExp(r'[^a-zA-Z0-9._-]'), '_');
    final file = File('${dir.path}${Platform.pathSeparator}imsh-$safe.apk');
    if (await file.exists()) {
      await file.delete();
    }

    final uri = _uri('download/latest');
    try {
      await _dio.downloadUri(
        uri,
        file.path,
        cancelToken: cancelToken,
        onReceiveProgress: (received, total) {
          if (total > 0 && onProgress != null) {
            onProgress(received / total);
          }
        },
        options: Options(
          responseType: ResponseType.bytes,
          receiveTimeout: const Duration(minutes: 10),
          headers: {'Accept': '*/*'},
        ),
      );
    } on DioException catch (e) {
      if (await file.exists()) {
        await file.delete().catchError((_) => file);
      }
      throw Exception(
        'Could not download the update. ${e.message ?? e}',
      );
    }

    if (!await file.exists() || await file.length() < 1) {
      throw Exception('Downloaded APK is missing or empty.');
    }
    return file.path;
  }

  static void triggerCheckFromUi() => checkForUpdate?.call();
}
