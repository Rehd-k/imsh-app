import 'package:flutter_test/flutter_test.dart';
import 'package:imsh/src/models/server_time_model.dart';
import 'package:imsh/src/services/store_version.dart';

void main() {
  test('blocks only versions older than the minimum', () {
    expect(isBelowMinAppVersion('0.1.1', '0.2.0'), isTrue);
    expect(isBelowMinAppVersion('0.2.0', '0.2.0'), isFalse);
    expect(isBelowMinAppVersion('0.2.1', '0.2.0'), isFalse);
  });

  test('reads an optional minimum from server-time', () {
    final payload = ServerTimePayload.fromJson({
      'iso': '2026-01-01T00:00:00.000Z',
      'unixMs': 1,
      'minAppVersion': ' 0.2.0 ',
    });
    expect(payload.minAppVersion, '0.2.0');

    final open = ServerTimePayload.fromJson({
      'iso': '2026-01-01T00:00:00.000Z',
      'unixMs': 1,
    });
    expect(open.minAppVersion, isNull);
  });

  test('ignores a build number and a missing minimum', () {
    expect(isBelowMinAppVersion('0.1.1+12', '0.2.0'), isTrue);
    expect(isBelowMinAppVersion('0.1.1', null), isFalse);
    expect(isBelowMinAppVersion('0.1.1', ''), isFalse);
    expect(isBelowMinAppVersion('0.1.1', 'latest'), isFalse);
  });
}
