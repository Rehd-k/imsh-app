// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emergency_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmergencyResponder {

 String get id; String? get firstName; String? get lastName;
/// Create a copy of EmergencyResponder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmergencyResponderCopyWith<EmergencyResponder> get copyWith => _$EmergencyResponderCopyWithImpl<EmergencyResponder>(this as EmergencyResponder, _$identity);

  /// Serializes this EmergencyResponder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmergencyResponder&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName);

@override
String toString() {
  return 'EmergencyResponder(id: $id, firstName: $firstName, lastName: $lastName)';
}


}

/// @nodoc
abstract mixin class $EmergencyResponderCopyWith<$Res>  {
  factory $EmergencyResponderCopyWith(EmergencyResponder value, $Res Function(EmergencyResponder) _then) = _$EmergencyResponderCopyWithImpl;
@useResult
$Res call({
 String id, String? firstName, String? lastName
});




}
/// @nodoc
class _$EmergencyResponderCopyWithImpl<$Res>
    implements $EmergencyResponderCopyWith<$Res> {
  _$EmergencyResponderCopyWithImpl(this._self, this._then);

  final EmergencyResponder _self;
  final $Res Function(EmergencyResponder) _then;

/// Create a copy of EmergencyResponder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = freezed,Object? lastName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EmergencyResponder].
extension EmergencyResponderPatterns on EmergencyResponder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmergencyResponder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmergencyResponder() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmergencyResponder value)  $default,){
final _that = this;
switch (_that) {
case _EmergencyResponder():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmergencyResponder value)?  $default,){
final _that = this;
switch (_that) {
case _EmergencyResponder() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? firstName,  String? lastName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmergencyResponder() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? firstName,  String? lastName)  $default,) {final _that = this;
switch (_that) {
case _EmergencyResponder():
return $default(_that.id,_that.firstName,_that.lastName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? firstName,  String? lastName)?  $default,) {final _that = this;
switch (_that) {
case _EmergencyResponder() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmergencyResponder implements EmergencyResponder {
  const _EmergencyResponder({required this.id, this.firstName, this.lastName});
  factory _EmergencyResponder.fromJson(Map<String, dynamic> json) => _$EmergencyResponderFromJson(json);

@override final  String id;
@override final  String? firstName;
@override final  String? lastName;

/// Create a copy of EmergencyResponder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmergencyResponderCopyWith<_EmergencyResponder> get copyWith => __$EmergencyResponderCopyWithImpl<_EmergencyResponder>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmergencyResponderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmergencyResponder&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName);

@override
String toString() {
  return 'EmergencyResponder(id: $id, firstName: $firstName, lastName: $lastName)';
}


}

/// @nodoc
abstract mixin class _$EmergencyResponderCopyWith<$Res> implements $EmergencyResponderCopyWith<$Res> {
  factory _$EmergencyResponderCopyWith(_EmergencyResponder value, $Res Function(_EmergencyResponder) _then) = __$EmergencyResponderCopyWithImpl;
@override @useResult
$Res call({
 String id, String? firstName, String? lastName
});




}
/// @nodoc
class __$EmergencyResponderCopyWithImpl<$Res>
    implements _$EmergencyResponderCopyWith<$Res> {
  __$EmergencyResponderCopyWithImpl(this._self, this._then);

  final _EmergencyResponder _self;
  final $Res Function(_EmergencyResponder) _then;

/// Create a copy of EmergencyResponder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = freezed,Object? lastName = freezed,}) {
  return _then(_EmergencyResponder(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$EmergencyRequest {

 String get id; EmergencyRequestStatus get status; double get latitude; double get longitude; double? get accuracyMeters; String? get addressText; String? get description; String? get voiceUrl; String? get videoUrl; String? get staffNote; EmergencyResponder? get respondedBy; DateTime? get acknowledgedAt; DateTime? get dispatchedAt; DateTime? get closedAt; DateTime? get cancelledAt; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of EmergencyRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmergencyRequestCopyWith<EmergencyRequest> get copyWith => _$EmergencyRequestCopyWithImpl<EmergencyRequest>(this as EmergencyRequest, _$identity);

  /// Serializes this EmergencyRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmergencyRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.accuracyMeters, accuracyMeters) || other.accuracyMeters == accuracyMeters)&&(identical(other.addressText, addressText) || other.addressText == addressText)&&(identical(other.description, description) || other.description == description)&&(identical(other.voiceUrl, voiceUrl) || other.voiceUrl == voiceUrl)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.staffNote, staffNote) || other.staffNote == staffNote)&&(identical(other.respondedBy, respondedBy) || other.respondedBy == respondedBy)&&(identical(other.acknowledgedAt, acknowledgedAt) || other.acknowledgedAt == acknowledgedAt)&&(identical(other.dispatchedAt, dispatchedAt) || other.dispatchedAt == dispatchedAt)&&(identical(other.closedAt, closedAt) || other.closedAt == closedAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,latitude,longitude,accuracyMeters,addressText,description,voiceUrl,videoUrl,staffNote,respondedBy,acknowledgedAt,dispatchedAt,closedAt,cancelledAt,createdAt,updatedAt);

@override
String toString() {
  return 'EmergencyRequest(id: $id, status: $status, latitude: $latitude, longitude: $longitude, accuracyMeters: $accuracyMeters, addressText: $addressText, description: $description, voiceUrl: $voiceUrl, videoUrl: $videoUrl, staffNote: $staffNote, respondedBy: $respondedBy, acknowledgedAt: $acknowledgedAt, dispatchedAt: $dispatchedAt, closedAt: $closedAt, cancelledAt: $cancelledAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $EmergencyRequestCopyWith<$Res>  {
  factory $EmergencyRequestCopyWith(EmergencyRequest value, $Res Function(EmergencyRequest) _then) = _$EmergencyRequestCopyWithImpl;
@useResult
$Res call({
 String id, EmergencyRequestStatus status, double latitude, double longitude, double? accuracyMeters, String? addressText, String? description, String? voiceUrl, String? videoUrl, String? staffNote, EmergencyResponder? respondedBy, DateTime? acknowledgedAt, DateTime? dispatchedAt, DateTime? closedAt, DateTime? cancelledAt, DateTime? createdAt, DateTime? updatedAt
});


$EmergencyResponderCopyWith<$Res>? get respondedBy;

}
/// @nodoc
class _$EmergencyRequestCopyWithImpl<$Res>
    implements $EmergencyRequestCopyWith<$Res> {
  _$EmergencyRequestCopyWithImpl(this._self, this._then);

  final EmergencyRequest _self;
  final $Res Function(EmergencyRequest) _then;

/// Create a copy of EmergencyRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? latitude = null,Object? longitude = null,Object? accuracyMeters = freezed,Object? addressText = freezed,Object? description = freezed,Object? voiceUrl = freezed,Object? videoUrl = freezed,Object? staffNote = freezed,Object? respondedBy = freezed,Object? acknowledgedAt = freezed,Object? dispatchedAt = freezed,Object? closedAt = freezed,Object? cancelledAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EmergencyRequestStatus,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,accuracyMeters: freezed == accuracyMeters ? _self.accuracyMeters : accuracyMeters // ignore: cast_nullable_to_non_nullable
as double?,addressText: freezed == addressText ? _self.addressText : addressText // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,voiceUrl: freezed == voiceUrl ? _self.voiceUrl : voiceUrl // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,staffNote: freezed == staffNote ? _self.staffNote : staffNote // ignore: cast_nullable_to_non_nullable
as String?,respondedBy: freezed == respondedBy ? _self.respondedBy : respondedBy // ignore: cast_nullable_to_non_nullable
as EmergencyResponder?,acknowledgedAt: freezed == acknowledgedAt ? _self.acknowledgedAt : acknowledgedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dispatchedAt: freezed == dispatchedAt ? _self.dispatchedAt : dispatchedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,closedAt: freezed == closedAt ? _self.closedAt : closedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of EmergencyRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmergencyResponderCopyWith<$Res>? get respondedBy {
    if (_self.respondedBy == null) {
    return null;
  }

  return $EmergencyResponderCopyWith<$Res>(_self.respondedBy!, (value) {
    return _then(_self.copyWith(respondedBy: value));
  });
}
}


/// Adds pattern-matching-related methods to [EmergencyRequest].
extension EmergencyRequestPatterns on EmergencyRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmergencyRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmergencyRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmergencyRequest value)  $default,){
final _that = this;
switch (_that) {
case _EmergencyRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmergencyRequest value)?  $default,){
final _that = this;
switch (_that) {
case _EmergencyRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  EmergencyRequestStatus status,  double latitude,  double longitude,  double? accuracyMeters,  String? addressText,  String? description,  String? voiceUrl,  String? videoUrl,  String? staffNote,  EmergencyResponder? respondedBy,  DateTime? acknowledgedAt,  DateTime? dispatchedAt,  DateTime? closedAt,  DateTime? cancelledAt,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmergencyRequest() when $default != null:
return $default(_that.id,_that.status,_that.latitude,_that.longitude,_that.accuracyMeters,_that.addressText,_that.description,_that.voiceUrl,_that.videoUrl,_that.staffNote,_that.respondedBy,_that.acknowledgedAt,_that.dispatchedAt,_that.closedAt,_that.cancelledAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  EmergencyRequestStatus status,  double latitude,  double longitude,  double? accuracyMeters,  String? addressText,  String? description,  String? voiceUrl,  String? videoUrl,  String? staffNote,  EmergencyResponder? respondedBy,  DateTime? acknowledgedAt,  DateTime? dispatchedAt,  DateTime? closedAt,  DateTime? cancelledAt,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _EmergencyRequest():
return $default(_that.id,_that.status,_that.latitude,_that.longitude,_that.accuracyMeters,_that.addressText,_that.description,_that.voiceUrl,_that.videoUrl,_that.staffNote,_that.respondedBy,_that.acknowledgedAt,_that.dispatchedAt,_that.closedAt,_that.cancelledAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  EmergencyRequestStatus status,  double latitude,  double longitude,  double? accuracyMeters,  String? addressText,  String? description,  String? voiceUrl,  String? videoUrl,  String? staffNote,  EmergencyResponder? respondedBy,  DateTime? acknowledgedAt,  DateTime? dispatchedAt,  DateTime? closedAt,  DateTime? cancelledAt,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _EmergencyRequest() when $default != null:
return $default(_that.id,_that.status,_that.latitude,_that.longitude,_that.accuracyMeters,_that.addressText,_that.description,_that.voiceUrl,_that.videoUrl,_that.staffNote,_that.respondedBy,_that.acknowledgedAt,_that.dispatchedAt,_that.closedAt,_that.cancelledAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmergencyRequest implements EmergencyRequest {
  const _EmergencyRequest({required this.id, required this.status, required this.latitude, required this.longitude, this.accuracyMeters, this.addressText, this.description, this.voiceUrl, this.videoUrl, this.staffNote, this.respondedBy, this.acknowledgedAt, this.dispatchedAt, this.closedAt, this.cancelledAt, this.createdAt, this.updatedAt});
  factory _EmergencyRequest.fromJson(Map<String, dynamic> json) => _$EmergencyRequestFromJson(json);

@override final  String id;
@override final  EmergencyRequestStatus status;
@override final  double latitude;
@override final  double longitude;
@override final  double? accuracyMeters;
@override final  String? addressText;
@override final  String? description;
@override final  String? voiceUrl;
@override final  String? videoUrl;
@override final  String? staffNote;
@override final  EmergencyResponder? respondedBy;
@override final  DateTime? acknowledgedAt;
@override final  DateTime? dispatchedAt;
@override final  DateTime? closedAt;
@override final  DateTime? cancelledAt;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of EmergencyRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmergencyRequestCopyWith<_EmergencyRequest> get copyWith => __$EmergencyRequestCopyWithImpl<_EmergencyRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmergencyRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmergencyRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.accuracyMeters, accuracyMeters) || other.accuracyMeters == accuracyMeters)&&(identical(other.addressText, addressText) || other.addressText == addressText)&&(identical(other.description, description) || other.description == description)&&(identical(other.voiceUrl, voiceUrl) || other.voiceUrl == voiceUrl)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.staffNote, staffNote) || other.staffNote == staffNote)&&(identical(other.respondedBy, respondedBy) || other.respondedBy == respondedBy)&&(identical(other.acknowledgedAt, acknowledgedAt) || other.acknowledgedAt == acknowledgedAt)&&(identical(other.dispatchedAt, dispatchedAt) || other.dispatchedAt == dispatchedAt)&&(identical(other.closedAt, closedAt) || other.closedAt == closedAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,latitude,longitude,accuracyMeters,addressText,description,voiceUrl,videoUrl,staffNote,respondedBy,acknowledgedAt,dispatchedAt,closedAt,cancelledAt,createdAt,updatedAt);

@override
String toString() {
  return 'EmergencyRequest(id: $id, status: $status, latitude: $latitude, longitude: $longitude, accuracyMeters: $accuracyMeters, addressText: $addressText, description: $description, voiceUrl: $voiceUrl, videoUrl: $videoUrl, staffNote: $staffNote, respondedBy: $respondedBy, acknowledgedAt: $acknowledgedAt, dispatchedAt: $dispatchedAt, closedAt: $closedAt, cancelledAt: $cancelledAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$EmergencyRequestCopyWith<$Res> implements $EmergencyRequestCopyWith<$Res> {
  factory _$EmergencyRequestCopyWith(_EmergencyRequest value, $Res Function(_EmergencyRequest) _then) = __$EmergencyRequestCopyWithImpl;
@override @useResult
$Res call({
 String id, EmergencyRequestStatus status, double latitude, double longitude, double? accuracyMeters, String? addressText, String? description, String? voiceUrl, String? videoUrl, String? staffNote, EmergencyResponder? respondedBy, DateTime? acknowledgedAt, DateTime? dispatchedAt, DateTime? closedAt, DateTime? cancelledAt, DateTime? createdAt, DateTime? updatedAt
});


@override $EmergencyResponderCopyWith<$Res>? get respondedBy;

}
/// @nodoc
class __$EmergencyRequestCopyWithImpl<$Res>
    implements _$EmergencyRequestCopyWith<$Res> {
  __$EmergencyRequestCopyWithImpl(this._self, this._then);

  final _EmergencyRequest _self;
  final $Res Function(_EmergencyRequest) _then;

/// Create a copy of EmergencyRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? latitude = null,Object? longitude = null,Object? accuracyMeters = freezed,Object? addressText = freezed,Object? description = freezed,Object? voiceUrl = freezed,Object? videoUrl = freezed,Object? staffNote = freezed,Object? respondedBy = freezed,Object? acknowledgedAt = freezed,Object? dispatchedAt = freezed,Object? closedAt = freezed,Object? cancelledAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_EmergencyRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EmergencyRequestStatus,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,accuracyMeters: freezed == accuracyMeters ? _self.accuracyMeters : accuracyMeters // ignore: cast_nullable_to_non_nullable
as double?,addressText: freezed == addressText ? _self.addressText : addressText // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,voiceUrl: freezed == voiceUrl ? _self.voiceUrl : voiceUrl // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,staffNote: freezed == staffNote ? _self.staffNote : staffNote // ignore: cast_nullable_to_non_nullable
as String?,respondedBy: freezed == respondedBy ? _self.respondedBy : respondedBy // ignore: cast_nullable_to_non_nullable
as EmergencyResponder?,acknowledgedAt: freezed == acknowledgedAt ? _self.acknowledgedAt : acknowledgedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dispatchedAt: freezed == dispatchedAt ? _self.dispatchedAt : dispatchedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,closedAt: freezed == closedAt ? _self.closedAt : closedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of EmergencyRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmergencyResponderCopyWith<$Res>? get respondedBy {
    if (_self.respondedBy == null) {
    return null;
  }

  return $EmergencyResponderCopyWith<$Res>(_self.respondedBy!, (value) {
    return _then(_self.copyWith(respondedBy: value));
  });
}
}


/// @nodoc
mixin _$EmergencyRequestListResponse {

 List<EmergencyRequest> get data; int get total; int get page; int get limit;
/// Create a copy of EmergencyRequestListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmergencyRequestListResponseCopyWith<EmergencyRequestListResponse> get copyWith => _$EmergencyRequestListResponseCopyWithImpl<EmergencyRequestListResponse>(this as EmergencyRequestListResponse, _$identity);

  /// Serializes this EmergencyRequestListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmergencyRequestListResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),total,page,limit);

@override
String toString() {
  return 'EmergencyRequestListResponse(data: $data, total: $total, page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $EmergencyRequestListResponseCopyWith<$Res>  {
  factory $EmergencyRequestListResponseCopyWith(EmergencyRequestListResponse value, $Res Function(EmergencyRequestListResponse) _then) = _$EmergencyRequestListResponseCopyWithImpl;
@useResult
$Res call({
 List<EmergencyRequest> data, int total, int page, int limit
});




}
/// @nodoc
class _$EmergencyRequestListResponseCopyWithImpl<$Res>
    implements $EmergencyRequestListResponseCopyWith<$Res> {
  _$EmergencyRequestListResponseCopyWithImpl(this._self, this._then);

  final EmergencyRequestListResponse _self;
  final $Res Function(EmergencyRequestListResponse) _then;

/// Create a copy of EmergencyRequestListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? total = null,Object? page = null,Object? limit = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<EmergencyRequest>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [EmergencyRequestListResponse].
extension EmergencyRequestListResponsePatterns on EmergencyRequestListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmergencyRequestListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmergencyRequestListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmergencyRequestListResponse value)  $default,){
final _that = this;
switch (_that) {
case _EmergencyRequestListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmergencyRequestListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _EmergencyRequestListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<EmergencyRequest> data,  int total,  int page,  int limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmergencyRequestListResponse() when $default != null:
return $default(_that.data,_that.total,_that.page,_that.limit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<EmergencyRequest> data,  int total,  int page,  int limit)  $default,) {final _that = this;
switch (_that) {
case _EmergencyRequestListResponse():
return $default(_that.data,_that.total,_that.page,_that.limit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<EmergencyRequest> data,  int total,  int page,  int limit)?  $default,) {final _that = this;
switch (_that) {
case _EmergencyRequestListResponse() when $default != null:
return $default(_that.data,_that.total,_that.page,_that.limit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmergencyRequestListResponse implements EmergencyRequestListResponse {
  const _EmergencyRequestListResponse({final  List<EmergencyRequest> data = const [], this.total = 0, this.page = 1, this.limit = 20}): _data = data;
  factory _EmergencyRequestListResponse.fromJson(Map<String, dynamic> json) => _$EmergencyRequestListResponseFromJson(json);

 final  List<EmergencyRequest> _data;
@override@JsonKey() List<EmergencyRequest> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey() final  int total;
@override@JsonKey() final  int page;
@override@JsonKey() final  int limit;

/// Create a copy of EmergencyRequestListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmergencyRequestListResponseCopyWith<_EmergencyRequestListResponse> get copyWith => __$EmergencyRequestListResponseCopyWithImpl<_EmergencyRequestListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmergencyRequestListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmergencyRequestListResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),total,page,limit);

@override
String toString() {
  return 'EmergencyRequestListResponse(data: $data, total: $total, page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$EmergencyRequestListResponseCopyWith<$Res> implements $EmergencyRequestListResponseCopyWith<$Res> {
  factory _$EmergencyRequestListResponseCopyWith(_EmergencyRequestListResponse value, $Res Function(_EmergencyRequestListResponse) _then) = __$EmergencyRequestListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<EmergencyRequest> data, int total, int page, int limit
});




}
/// @nodoc
class __$EmergencyRequestListResponseCopyWithImpl<$Res>
    implements _$EmergencyRequestListResponseCopyWith<$Res> {
  __$EmergencyRequestListResponseCopyWithImpl(this._self, this._then);

  final _EmergencyRequestListResponse _self;
  final $Res Function(_EmergencyRequestListResponse) _then;

/// Create a copy of EmergencyRequestListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? total = null,Object? page = null,Object? limit = null,}) {
  return _then(_EmergencyRequestListResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<EmergencyRequest>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
