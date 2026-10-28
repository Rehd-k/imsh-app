import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:local_auth/local_auth.dart';

/// Fingerprint or face unlock. Desktop and web builds skip it.
class BiometricAuth {
  BiometricAuth._();

  static final LocalAuthentication _auth = LocalAuthentication();

  static Future<bool> canAuthenticate() async {
    if (kIsWeb) return false;
    try {
      if (!Platform.isAndroid && !Platform.isIOS) return false;
      final supported = await _auth.isDeviceSupported();
      if (!supported) return false;
      final enrolled = await _auth.getAvailableBiometrics();
      return enrolled.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  static Future<bool> authenticate() async {
    try {
      return await _auth.authenticate(
        localizedReason: 'Sign in to IMSH',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
    } catch (_) {
      return false;
    }
  }
}
