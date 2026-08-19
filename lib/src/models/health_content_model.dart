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
  String get excerpt {
    final trimmed = body.trim();
    if (trimmed.length <= 140) return trimmed;
    return '${trimmed.substring(0, 140).trimRight()}…';
  }
}
