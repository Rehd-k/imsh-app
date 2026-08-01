import '../../services/api_service.dart';

const _loopbackHosts = {'localhost', '127.0.0.1', '::1'};

/// Resolves an API media path against the current API base URL.
///
/// Relative paths are joined to [ApiService.apiBaseUrl]. Absolute URLs whose
/// host is loopback (`localhost`, `127.0.0.1`, `::1`) are rewritten onto the
/// live API origin so images work on devices/emulators where localhost is not
/// the API host. Other absolute URLs are left unchanged.
String? resolveApiMediaUrl(String? url) {
  if (url == null) return null;
  final trimmed = url.trim();
  if (trimmed.isEmpty) return null;

  final base = ApiService().apiBaseUrl;
  if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
    return _rewriteLoopbackOrigin(trimmed, base) ?? trimmed;
  }
  if (base.isEmpty) return trimmed;
  if (trimmed.startsWith('/')) return '$base$trimmed';
  return '$base/$trimmed';
}

/// If [url] targets a loopback host and [base] is a usable absolute URL,
/// returns [url] with its origin replaced by [base]'s origin. Otherwise null.
String? _rewriteLoopbackOrigin(String url, String base) {
  if (base.isEmpty) return null;
  final uri = Uri.tryParse(url);
  final baseUri = Uri.tryParse(base);
  if (uri == null || baseUri == null) return null;
  if (!uri.hasScheme || uri.host.isEmpty) return null;
  if (!_loopbackHosts.contains(uri.host.toLowerCase())) return null;
  if (!baseUri.hasScheme || baseUri.host.isEmpty) return null;
  if (_loopbackHosts.contains(baseUri.host.toLowerCase())) return null;

  // Build a new URI so a default base port does not keep the loopback port.
  return Uri(
    scheme: baseUri.scheme,
    host: baseUri.host,
    port: baseUri.hasPort ? baseUri.port : null,
    path: uri.path,
    query: uri.hasQuery ? uri.query : null,
    fragment: uri.hasFragment ? uri.fragment : null,
  ).toString();
}
