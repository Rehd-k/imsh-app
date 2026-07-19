import 'package:freezed_annotation/freezed_annotation.dart';

/// Coerces API money values that may arrive as `String` or `num` into `String`.
class ApiAmountConverter implements JsonConverter<String, Object?> {
  const ApiAmountConverter();

  @override
  String fromJson(Object? json) {
    if (json == null) return '0';
    if (json is String) return json;
    if (json is num) return json.toString();
    return json.toString();
  }

  @override
  Object toJson(String object) => object;
}
