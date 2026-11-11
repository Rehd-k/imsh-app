import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_content_model.freezed.dart';
part 'health_content_model.g.dart';

@freezed
abstract class HealthContentItem with _$HealthContentItem {
  const factory HealthContentItem({
    required String id,
    required String title,
    required String body,
    String? imageUrl,
    DateTime? publishedAt,
    DateTime? expiresAt,
    DateTime? createdAt,
  }) = _HealthContentItem;

  factory HealthContentItem.fromJson(Map<String, dynamic> json) =>
      _$HealthContentItemFromJson(json);
}

@freezed
abstract class HealthContentListResponse with _$HealthContentListResponse {
  const factory HealthContentListResponse({
    @Default([]) List<HealthContentItem> data,
    @Default(0) int total,
    @Default(0) int skip,
    @Default(20) int take,
  }) = _HealthContentListResponse;

  factory HealthContentListResponse.fromJson(Map<String, dynamic> json) =>
      _$HealthContentListResponseFromJson(json);
}

extension HealthContentItemDisplay on HealthContentItem {
  bool get hasTitle => title.trim().isNotEmpty;

  bool get hasBody => body.trim().isNotEmpty;

  bool get hasImage => imageUrl != null && imageUrl!.trim().isNotEmpty;

  /// Published items stay visible until [expiresAt]. Null means they do not expire.
  bool get isCurrent {
    final expiry = expiresAt;
    if (expiry == null) return true;
    return expiry.isAfter(DateTime.now());
  }

  String get excerpt {
    final trimmed = body.trim();
    if (trimmed.length <= 140) return trimmed;
    return '${trimmed.substring(0, 140).trimRight()}…';
  }

  String get displayTitle => hasTitle ? title.trim() : 'Infographic';
}
