import 'dart:convert';

/// Reads the JWT `exp` claim. Returns null when the token has no expiry.
DateTime? accessTokenExpiry(String token) {
  final parts = token.split('.');
  if (parts.length < 2) return null;
  try {
    final decoded = utf8.decode(base64Url.decode(base64Url.normalize(parts[1])));
    final payload = jsonDecode(decoded);
    if (payload is! Map) return null;
    final exp = payload['exp'];
    if (exp is! num) return null;
    return DateTime.fromMillisecondsSinceEpoch(exp.toInt() * 1000, isUtc: true);
  } catch (_) {
    return null;
  }
}

/// True when the access token is already expired, or will expire inside [leeway].
///
/// A token with no readable expiry is treated as still usable. The server
/// remains the authority and a 401 still triggers a refresh.
bool isAccessTokenExpired(
  String token, {
  DateTime? now,
  Duration leeway = const Duration(minutes: 1),
}) {
  final expiry = accessTokenExpiry(token);
  if (expiry == null) return false;
  final clock = (now ?? DateTime.now()).toUtc();
  return !clock.isBefore(expiry.subtract(leeway));
}
