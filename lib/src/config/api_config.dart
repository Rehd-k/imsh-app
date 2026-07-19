import 'package:flutter/foundation.dart';

import 'env.dart';

/// Candidate API origins probed at startup; the fastest `/server-time` wins.
List<String> get kApiCandidateBaseUrls {
  final fromEnv = Env.apiBaseUrl.trim();
  final candidates = <String>[
    if (fromEnv.isNotEmpty) fromEnv,
    'http://api.imsh.ng',
    'http://localhost:3000',
    'http://192.168.1.180:3000',
    'http://127.0.0.1:3000',
  ];
  return candidates.toSet().toList();
}

const kApiConnectTimeout = Duration(seconds: 15);
const kApiReceiveTimeout = Duration(seconds: 15);
const kApiSendTimeout = Duration(seconds: 15);

void debugLogApi(String message) {
  if (kDebugMode) {
    // ignore: avoid_print
    debugPrint(message);
  }
}
