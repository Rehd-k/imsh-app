// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HealthContentItem _$HealthContentItemFromJson(Map<String, dynamic> json) =>
    _HealthContentItem(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      imageUrl: json['imageUrl'] as String?,
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$HealthContentItemToJson(_HealthContentItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'imageUrl': instance.imageUrl,
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_HealthContentListResponse _$HealthContentListResponseFromJson(
  Map<String, dynamic> json,
) => _HealthContentListResponse(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => HealthContentItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  total: (json['total'] as num?)?.toInt() ?? 0,
  skip: (json['skip'] as num?)?.toInt() ?? 0,
  take: (json['take'] as num?)?.toInt() ?? 20,
);

Map<String, dynamic> _$HealthContentListResponseToJson(
  _HealthContentListResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'total': instance.total,
  'skip': instance.skip,
  'take': instance.take,
};
