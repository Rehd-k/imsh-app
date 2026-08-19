// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_content_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HealthContentItem {

 String get id; String get title; String get body; String? get imageUrl; DateTime? get publishedAt; DateTime? get expiresAt; DateTime? get createdAt;
/// Create a copy of HealthContentItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthContentItemCopyWith<HealthContentItem> get copyWith => _$HealthContentItemCopyWithImpl<HealthContentItem>(this as HealthContentItem, _$identity);

  /// Serializes this HealthContentItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthContentItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,body,imageUrl,publishedAt,expiresAt,createdAt);

@override
String toString() {
  return 'HealthContentItem(id: $id, title: $title, body: $body, imageUrl: $imageUrl, publishedAt: $publishedAt, expiresAt: $expiresAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $HealthContentItemCopyWith<$Res>  {
  factory $HealthContentItemCopyWith(HealthContentItem value, $Res Function(HealthContentItem) _then) = _$HealthContentItemCopyWithImpl;
@useResult
$Res call({
 String id, String title, String body, String? imageUrl, DateTime? publishedAt, DateTime? expiresAt, DateTime? createdAt
});




}
/// @nodoc
class _$HealthContentItemCopyWithImpl<$Res>
    implements $HealthContentItemCopyWith<$Res> {
  _$HealthContentItemCopyWithImpl(this._self, this._then);

  final HealthContentItem _self;
  final $Res Function(HealthContentItem) _then;

/// Create a copy of HealthContentItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? body = null,Object? imageUrl = freezed,Object? publishedAt = freezed,Object? expiresAt = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [HealthContentItem].
extension HealthContentItemPatterns on HealthContentItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthContentItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthContentItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthContentItem value)  $default,){
final _that = this;
switch (_that) {
case _HealthContentItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthContentItem value)?  $default,){
final _that = this;
switch (_that) {
case _HealthContentItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String body,  String? imageUrl,  DateTime? publishedAt,  DateTime? expiresAt,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthContentItem() when $default != null:
return $default(_that.id,_that.title,_that.body,_that.imageUrl,_that.publishedAt,_that.expiresAt,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String body,  String? imageUrl,  DateTime? publishedAt,  DateTime? expiresAt,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _HealthContentItem():
return $default(_that.id,_that.title,_that.body,_that.imageUrl,_that.publishedAt,_that.expiresAt,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String body,  String? imageUrl,  DateTime? publishedAt,  DateTime? expiresAt,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _HealthContentItem() when $default != null:
return $default(_that.id,_that.title,_that.body,_that.imageUrl,_that.publishedAt,_that.expiresAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HealthContentItem implements HealthContentItem {
  const _HealthContentItem({required this.id, required this.title, required this.body, this.imageUrl, this.publishedAt, this.expiresAt, this.createdAt});
  factory _HealthContentItem.fromJson(Map<String, dynamic> json) => _$HealthContentItemFromJson(json);

@override final  String id;
@override final  String title;
@override final  String body;
@override final  String? imageUrl;
@override final  DateTime? publishedAt;
@override final  DateTime? expiresAt;
@override final  DateTime? createdAt;

/// Create a copy of HealthContentItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthContentItemCopyWith<_HealthContentItem> get copyWith => __$HealthContentItemCopyWithImpl<_HealthContentItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HealthContentItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthContentItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,body,imageUrl,publishedAt,expiresAt,createdAt);

@override
String toString() {
  return 'HealthContentItem(id: $id, title: $title, body: $body, imageUrl: $imageUrl, publishedAt: $publishedAt, expiresAt: $expiresAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$HealthContentItemCopyWith<$Res> implements $HealthContentItemCopyWith<$Res> {
  factory _$HealthContentItemCopyWith(_HealthContentItem value, $Res Function(_HealthContentItem) _then) = __$HealthContentItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String body, String? imageUrl, DateTime? publishedAt, DateTime? expiresAt, DateTime? createdAt
});




}
/// @nodoc
class __$HealthContentItemCopyWithImpl<$Res>
    implements _$HealthContentItemCopyWith<$Res> {
  __$HealthContentItemCopyWithImpl(this._self, this._then);

  final _HealthContentItem _self;
  final $Res Function(_HealthContentItem) _then;

/// Create a copy of HealthContentItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? body = null,Object? imageUrl = freezed,Object? publishedAt = freezed,Object? expiresAt = freezed,Object? createdAt = freezed,}) {
  return _then(_HealthContentItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$HealthContentListResponse {

 List<HealthContentItem> get data; int get total; int get skip; int get take;
/// Create a copy of HealthContentListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthContentListResponseCopyWith<HealthContentListResponse> get copyWith => _$HealthContentListResponseCopyWithImpl<HealthContentListResponse>(this as HealthContentListResponse, _$identity);

  /// Serializes this HealthContentListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthContentListResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.total, total) || other.total == total)&&(identical(other.skip, skip) || other.skip == skip)&&(identical(other.take, take) || other.take == take));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),total,skip,take);

@override
String toString() {
  return 'HealthContentListResponse(data: $data, total: $total, skip: $skip, take: $take)';
}


}

/// @nodoc
abstract mixin class $HealthContentListResponseCopyWith<$Res>  {
  factory $HealthContentListResponseCopyWith(HealthContentListResponse value, $Res Function(HealthContentListResponse) _then) = _$HealthContentListResponseCopyWithImpl;
@useResult
$Res call({
 List<HealthContentItem> data, int total, int skip, int take
});




}
/// @nodoc
class _$HealthContentListResponseCopyWithImpl<$Res>
    implements $HealthContentListResponseCopyWith<$Res> {
  _$HealthContentListResponseCopyWithImpl(this._self, this._then);

  final HealthContentListResponse _self;
  final $Res Function(HealthContentListResponse) _then;

/// Create a copy of HealthContentListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? total = null,Object? skip = null,Object? take = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<HealthContentItem>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,skip: null == skip ? _self.skip : skip // ignore: cast_nullable_to_non_nullable
as int,take: null == take ? _self.take : take // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HealthContentListResponse].
extension HealthContentListResponsePatterns on HealthContentListResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthContentListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthContentListResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthContentListResponse value)  $default,){
final _that = this;
switch (_that) {
case _HealthContentListResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthContentListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _HealthContentListResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HealthContentItem> data,  int total,  int skip,  int take)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthContentListResponse() when $default != null:
return $default(_that.data,_that.total,_that.skip,_that.take);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HealthContentItem> data,  int total,  int skip,  int take)  $default,) {final _that = this;
switch (_that) {
case _HealthContentListResponse():
return $default(_that.data,_that.total,_that.skip,_that.take);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HealthContentItem> data,  int total,  int skip,  int take)?  $default,) {final _that = this;
switch (_that) {
case _HealthContentListResponse() when $default != null:
return $default(_that.data,_that.total,_that.skip,_that.take);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HealthContentListResponse implements HealthContentListResponse {
  const _HealthContentListResponse({final  List<HealthContentItem> data = const [], this.total = 0, this.skip = 0, this.take = 20}): _data = data;
  factory _HealthContentListResponse.fromJson(Map<String, dynamic> json) => _$HealthContentListResponseFromJson(json);

 final  List<HealthContentItem> _data;
@override@JsonKey() List<HealthContentItem> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey() final  int total;
@override@JsonKey() final  int skip;
@override@JsonKey() final  int take;

/// Create a copy of HealthContentListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthContentListResponseCopyWith<_HealthContentListResponse> get copyWith => __$HealthContentListResponseCopyWithImpl<_HealthContentListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HealthContentListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthContentListResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.total, total) || other.total == total)&&(identical(other.skip, skip) || other.skip == skip)&&(identical(other.take, take) || other.take == take));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),total,skip,take);

@override
String toString() {
  return 'HealthContentListResponse(data: $data, total: $total, skip: $skip, take: $take)';
}


}

/// @nodoc
abstract mixin class _$HealthContentListResponseCopyWith<$Res> implements $HealthContentListResponseCopyWith<$Res> {
  factory _$HealthContentListResponseCopyWith(_HealthContentListResponse value, $Res Function(_HealthContentListResponse) _then) = __$HealthContentListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<HealthContentItem> data, int total, int skip, int take
});




}
/// @nodoc
class __$HealthContentListResponseCopyWithImpl<$Res>
    implements _$HealthContentListResponseCopyWith<$Res> {
  __$HealthContentListResponseCopyWithImpl(this._self, this._then);

  final _HealthContentListResponse _self;
  final $Res Function(_HealthContentListResponse) _then;

/// Create a copy of HealthContentListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? total = null,Object? skip = null,Object? take = null,}) {
  return _then(_HealthContentListResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<HealthContentItem>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,skip: null == skip ? _self.skip : skip // ignore: cast_nullable_to_non_nullable
as int,take: null == take ? _self.take : take // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
