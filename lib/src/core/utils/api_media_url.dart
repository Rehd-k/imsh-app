import '../../services/api_service.dart';

/// Resolves a relative API media path against the current API base URL.
String? resolveApiMediaUrl(String? url) {
  if (url == null) return null;
  final trimmed = url.trim();
  if (trimmed.isEmpty) return null;
  if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
    return trimmed;
  }
  final base = ApiService().apiBaseUrl;
  if (base.isEmpty) return trimmed;
  if (trimmed.startsWith('/')) return '$base$trimmed';
  return '$base/$trimmed';
}
