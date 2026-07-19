// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatientDevice {

 String get id; PatientDeviceStatus get status; String? get platform; String? get deviceLabel; bool? get isCurrent; DateTime? get createdAt; DateTime? get approvedAt;
/// Create a copy of PatientDevice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientDeviceCopyWith<PatientDevice> get copyWith => _$PatientDeviceCopyWithImpl<PatientDevice>(this as PatientDevice, _$identity);

  /// Serializes this PatientDevice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatientDevice&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.deviceLabel, deviceLabel) || other.deviceLabel == deviceLabel)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.approvedAt, approvedAt) || other.approvedAt == approvedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,platform,deviceLabel,isCurrent,createdAt,approvedAt);

@override
String toString() {
  return 'PatientDevice(id: $id, status: $status, platform: $platform, deviceLabel: $deviceLabel, isCurrent: $isCurrent, createdAt: $createdAt, approvedAt: $approvedAt)';
}


}

/// @nodoc
abstract mixin class $PatientDeviceCopyWith<$Res>  {
  factory $PatientDeviceCopyWith(PatientDevice value, $Res Function(PatientDevice) _then) = _$PatientDeviceCopyWithImpl;
@useResult
$Res call({
 String id, PatientDeviceStatus status, String? platform, String? deviceLabel, bool? isCurrent, DateTime? createdAt, DateTime? approvedAt
});




}
/// @nodoc
class _$PatientDeviceCopyWithImpl<$Res>
    implements $PatientDeviceCopyWith<$Res> {
  _$PatientDeviceCopyWithImpl(this._self, this._then);

  final PatientDevice _self;
  final $Res Function(PatientDevice) _then;

/// Create a copy of PatientDevice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? platform = freezed,Object? deviceLabel = freezed,Object? isCurrent = freezed,Object? createdAt = freezed,Object? approvedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PatientDeviceStatus,platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String?,deviceLabel: freezed == deviceLabel ? _self.deviceLabel : deviceLabel // ignore: cast_nullable_to_non_nullable
as String?,isCurrent: freezed == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PatientDevice].
extension PatientDevicePatterns on PatientDevice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatientDevice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatientDevice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatientDevice value)  $default,){
final _that = this;
switch (_that) {
case _PatientDevice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatientDevice value)?  $default,){
final _that = this;
switch (_that) {
case _PatientDevice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  PatientDeviceStatus status,  String? platform,  String? deviceLabel,  bool? isCurrent,  DateTime? createdAt,  DateTime? approvedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatientDevice() when $default != null:
return $default(_that.id,_that.status,_that.platform,_that.deviceLabel,_that.isCurrent,_that.createdAt,_that.approvedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  PatientDeviceStatus status,  String? platform,  String? deviceLabel,  bool? isCurrent,  DateTime? createdAt,  DateTime? approvedAt)  $default,) {final _that = this;
switch (_that) {
case _PatientDevice():
return $default(_that.id,_that.status,_that.platform,_that.deviceLabel,_that.isCurrent,_that.createdAt,_that.approvedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  PatientDeviceStatus status,  String? platform,  String? deviceLabel,  bool? isCurrent,  DateTime? createdAt,  DateTime? approvedAt)?  $default,) {final _that = this;
switch (_that) {
case _PatientDevice() when $default != null:
return $default(_that.id,_that.status,_that.platform,_that.deviceLabel,_that.isCurrent,_that.createdAt,_that.approvedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatientDevice implements PatientDevice {
  const _PatientDevice({required this.id, required this.status, this.platform, this.deviceLabel, this.isCurrent, this.createdAt, this.approvedAt});
  factory _PatientDevice.fromJson(Map<String, dynamic> json) => _$PatientDeviceFromJson(json);

@override final  String id;
@override final  PatientDeviceStatus status;
@override final  String? platform;
@override final  String? deviceLabel;
@override final  bool? isCurrent;
@override final  DateTime? createdAt;
@override final  DateTime? approvedAt;

/// Create a copy of PatientDevice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientDeviceCopyWith<_PatientDevice> get copyWith => __$PatientDeviceCopyWithImpl<_PatientDevice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatientDeviceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatientDevice&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.deviceLabel, deviceLabel) || other.deviceLabel == deviceLabel)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.approvedAt, approvedAt) || other.approvedAt == approvedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,platform,deviceLabel,isCurrent,createdAt,approvedAt);

@override
String toString() {
  return 'PatientDevice(id: $id, status: $status, platform: $platform, deviceLabel: $deviceLabel, isCurrent: $isCurrent, createdAt: $createdAt, approvedAt: $approvedAt)';
}


}

/// @nodoc
abstract mixin class _$PatientDeviceCopyWith<$Res> implements $PatientDeviceCopyWith<$Res> {
  factory _$PatientDeviceCopyWith(_PatientDevice value, $Res Function(_PatientDevice) _then) = __$PatientDeviceCopyWithImpl;
@override @useResult
$Res call({
 String id, PatientDeviceStatus status, String? platform, String? deviceLabel, bool? isCurrent, DateTime? createdAt, DateTime? approvedAt
});




}
/// @nodoc
class __$PatientDeviceCopyWithImpl<$Res>
    implements _$PatientDeviceCopyWith<$Res> {
  __$PatientDeviceCopyWithImpl(this._self, this._then);

  final _PatientDevice _self;
  final $Res Function(_PatientDevice) _then;

/// Create a copy of PatientDevice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? platform = freezed,Object? deviceLabel = freezed,Object? isCurrent = freezed,Object? createdAt = freezed,Object? approvedAt = freezed,}) {
  return _then(_PatientDevice(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PatientDeviceStatus,platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String?,deviceLabel: freezed == deviceLabel ? _self.deviceLabel : deviceLabel // ignore: cast_nullable_to_non_nullable
as String?,isCurrent: freezed == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$DeviceStatusResponse {

 PatientDevice get device;
/// Create a copy of DeviceStatusResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceStatusResponseCopyWith<DeviceStatusResponse> get copyWith => _$DeviceStatusResponseCopyWithImpl<DeviceStatusResponse>(this as DeviceStatusResponse, _$identity);

  /// Serializes this DeviceStatusResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceStatusResponse&&(identical(other.device, device) || other.device == device));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,device);

@override
String toString() {
  return 'DeviceStatusResponse(device: $device)';
}


}

/// @nodoc
abstract mixin class $DeviceStatusResponseCopyWith<$Res>  {
  factory $DeviceStatusResponseCopyWith(DeviceStatusResponse value, $Res Function(DeviceStatusResponse) _then) = _$DeviceStatusResponseCopyWithImpl;
@useResult
$Res call({
 PatientDevice device
});


$PatientDeviceCopyWith<$Res> get device;

}
/// @nodoc
class _$DeviceStatusResponseCopyWithImpl<$Res>
    implements $DeviceStatusResponseCopyWith<$Res> {
  _$DeviceStatusResponseCopyWithImpl(this._self, this._then);

  final DeviceStatusResponse _self;
  final $Res Function(DeviceStatusResponse) _then;

/// Create a copy of DeviceStatusResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? device = null,}) {
  return _then(_self.copyWith(
device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as PatientDevice,
  ));
}
/// Create a copy of DeviceStatusResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatientDeviceCopyWith<$Res> get device {
  
  return $PatientDeviceCopyWith<$Res>(_self.device, (value) {
    return _then(_self.copyWith(device: value));
  });
}
}


/// Adds pattern-matching-related methods to [DeviceStatusResponse].
extension DeviceStatusResponsePatterns on DeviceStatusResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceStatusResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceStatusResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceStatusResponse value)  $default,){
final _that = this;
switch (_that) {
case _DeviceStatusResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceStatusResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceStatusResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PatientDevice device)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceStatusResponse() when $default != null:
return $default(_that.device);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PatientDevice device)  $default,) {final _that = this;
switch (_that) {
case _DeviceStatusResponse():
return $default(_that.device);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PatientDevice device)?  $default,) {final _that = this;
switch (_that) {
case _DeviceStatusResponse() when $default != null:
return $default(_that.device);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceStatusResponse implements DeviceStatusResponse {
  const _DeviceStatusResponse({required this.device});
  factory _DeviceStatusResponse.fromJson(Map<String, dynamic> json) => _$DeviceStatusResponseFromJson(json);

@override final  PatientDevice device;

/// Create a copy of DeviceStatusResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceStatusResponseCopyWith<_DeviceStatusResponse> get copyWith => __$DeviceStatusResponseCopyWithImpl<_DeviceStatusResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceStatusResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceStatusResponse&&(identical(other.device, device) || other.device == device));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,device);

@override
String toString() {
  return 'DeviceStatusResponse(device: $device)';
}


}

/// @nodoc
abstract mixin class _$DeviceStatusResponseCopyWith<$Res> implements $DeviceStatusResponseCopyWith<$Res> {
  factory _$DeviceStatusResponseCopyWith(_DeviceStatusResponse value, $Res Function(_DeviceStatusResponse) _then) = __$DeviceStatusResponseCopyWithImpl;
@override @useResult
$Res call({
 PatientDevice device
});


@override $PatientDeviceCopyWith<$Res> get device;

}
/// @nodoc
class __$DeviceStatusResponseCopyWithImpl<$Res>
    implements _$DeviceStatusResponseCopyWith<$Res> {
  __$DeviceStatusResponseCopyWithImpl(this._self, this._then);

  final _DeviceStatusResponse _self;
  final $Res Function(_DeviceStatusResponse) _then;

/// Create a copy of DeviceStatusResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? device = null,}) {
  return _then(_DeviceStatusResponse(
device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as PatientDevice,
  ));
}

/// Create a copy of DeviceStatusResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatientDeviceCopyWith<$Res> get device {
  
  return $PatientDeviceCopyWith<$Res>(_self.device, (value) {
    return _then(_self.copyWith(device: value));
  });
}
}

// dart format on
