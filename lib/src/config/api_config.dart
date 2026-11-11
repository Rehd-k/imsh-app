import 'package:flutter/foundation.dart';

import 'env.dart';

/// Candidate API origins probed at startup; the fastest `/server-time` wins.
List<String> get kApiCandidateBaseUrls {
  final fromEnv = Env.apiBaseUrl.trim();
  final candidates = <String>[
    if (fromEnv.isNotEmpty) fromEnv,
    'https://api.imsh.ng',
    'http://192.168.2.120:3000',
    'http://192.168.1.180:3000',
    'http://192.168.2.121:3000',
  ];
  return candidates.toSet().toList();
}

const kApiConnectTimeout = Duration(seconds: 15);
const kApiReceiveTimeout = Duration(seconds: 15);
const kApiSendTimeout = Duration(seconds: 15);

/// Multipart media uploads (emergency video/voice, profile photo).
/// Keep these generous — bad mobile networks + a short clip routinely exceed
/// a couple of minutes, and aborting mid-upload drops the emergency request.
const kApiUploadConnectTimeout = Duration(seconds: 45);
const kApiUploadSendTimeout = Duration(minutes: 10);
const kApiUploadReceiveTimeout = Duration(minutes: 5);

void debugLogApi(String message) {
  if (kDebugMode) {
    // ignore: avoid_print
    debugPrint(message);
  }
}
