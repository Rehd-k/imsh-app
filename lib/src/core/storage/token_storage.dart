import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuid/uuid.dart';

/// Handles secure persistence of JWT, FCM token, and stable device key.
class TokenStorage {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  static const _accessTokenKey = 'access_token';
  static const _fcmTokenKey = 'fcm_device_token';
  static const _deviceKeyKey = 'device_key';

  static const _uuid = Uuid();

  static Future<void> saveAccessToken(String token) =>
      _storage.write(key: _accessTokenKey, value: token);

  static Future<String?> getAccessToken() =>
      _storage.read(key: _accessTokenKey);

  static Future<void> deleteAccessToken() =>
      _storage.delete(key: _accessTokenKey);

  static Future<bool> hasToken() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }

  static Future<void> saveFcmToken(String token) =>
      _storage.write(key: _fcmTokenKey, value: token);

  static Future<String?> getFcmToken() => _storage.read(key: _fcmTokenKey);

  static Future<void> deleteFcmToken() => _storage.delete(key: _fcmTokenKey);

  /// Stable per-install UUID. Survives logout; reused on every login.
  static Future<String> getOrCreateDeviceKey() async {
    final existing = await _storage.read(key: _deviceKeyKey);
    if (existing != null && existing.isNotEmpty) return existing;
    final key = _uuid.v4();
    await _storage.write(key: _deviceKeyKey, value: key);
    return key;
  }

  /// Clears JWT only. Keeps [deviceKey] and FCM token unless callers delete them.
  static Future<void> clearAll() => deleteAccessToken();
}
