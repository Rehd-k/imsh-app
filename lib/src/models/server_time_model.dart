/// Response from `GET /server-time`.
class ServerTimePayload {
  const ServerTimePayload({
    required this.iso,
    required this.unixMs,
    this.minAppVersion,
  });

  final String iso;
  final int unixMs;

  /// Oldest IMSH Patient version the hospital still accepts (`x.y.z`).
  /// Missing when every installed build may continue.
  final String? minAppVersion;

  factory ServerTimePayload.fromJson(Map<String, dynamic> json) {
    final unixRaw = json['unixMs'];
    if (unixRaw is! num) {
      throw const FormatException('server-time: unixMs must be a number');
    }
    final isoRaw = json['iso'];
    if (isoRaw is! String || isoRaw.isEmpty) {
      throw const FormatException(
        'server-time: iso must be a non-empty string',
      );
    }
    final minRaw = json['minAppVersion'];
    final minAppVersion = minRaw is String && minRaw.trim().isNotEmpty
        ? minRaw.trim()
        : null;
    return ServerTimePayload(
      iso: isoRaw,
      unixMs: unixRaw.toInt(),
      minAppVersion: minAppVersion,
    );
  }
}
