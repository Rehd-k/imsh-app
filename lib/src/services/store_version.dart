import 'package:pub_semver/pub_semver.dart';

final _semverCore = RegExp(r'^\d+\.\d+\.\d+$');

/// `x.y.z` portion of a version, ignoring a build suffix such as `0.2.0+4`.
String? semverCore(String raw) {
  final core = raw.split('+').first.trim();
  if (!_semverCore.hasMatch(core)) return null;
  return core;
}

/// True when [current] is older than a required [minimum].
///
/// An empty or non-`x.y.z` minimum does not block. An unreadable installed
/// version does not block either, so a bad value cannot lock the app.
bool isBelowMinAppVersion(String current, String? minimum) {
  if (minimum == null || minimum.trim().isEmpty) return false;
  final minCore = semverCore(minimum);
  final currentCore = semverCore(current);
  if (minCore == null || currentCore == null) return false;
  return Version.parse(currentCore) < Version.parse(minCore);
}
