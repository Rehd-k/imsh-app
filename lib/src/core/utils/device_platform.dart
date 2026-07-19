import 'dart:io';

import 'package:flutter/foundation.dart';

/// API platform string for patient-auth / devices (`android` | `ios` | `web`).
String patientApiPlatform() {
  if (kIsWeb) return 'web';
  if (Platform.isIOS) return 'ios';
  if (Platform.isAndroid) return 'android';
  return 'android';
}

/// Human-readable label sent as `deviceLabel` on login.
String patientDeviceLabel() {
  if (kIsWeb) return 'Web';
  if (Platform.isIOS) return 'iOS';
  if (Platform.isAndroid) return 'Android';
  return 'Device';
}
