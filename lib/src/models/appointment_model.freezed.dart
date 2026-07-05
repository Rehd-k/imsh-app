// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DoctorSummary {

 String get id; String get name; String get specialty; String? get avatarUrl;
/// Create a copy of DoctorSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorSummaryCopyWith<DoctorSummary> get copyWith => _$DoctorSummaryCopyWithImpl<DoctorSummary>(this as DoctorSummary, _$identity);

  /// Serializes this DoctorSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.specialty, specialty) || other.specialty == specialty)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,specialty,avatarUrl);

@override
String toString() {
  return 'DoctorSummary(id: $id, name: $name, specialty: $specialty, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $DoctorSummaryCopyWith<$Res>  {
  factory $DoctorSummaryCopyWith(DoctorSummary value, $Res Function(DoctorSummary) _then) = _$DoctorSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String specialty, String? avatarUrl
});




}
/// @nodoc
class _$DoctorSummaryCopyWithImpl<$Res>
    implements $DoctorSummaryCopyWith<$Res> {
  _$DoctorSummaryCopyWithImpl(this._self, this._then);

  final DoctorSummary _self;
  final $Res Function(DoctorSummary) _then;

/// Create a copy of DoctorSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? specialty = null,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,specialty: null == specialty ? _self.specialty : specialty // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorSummary].
extension DoctorSummaryPatterns on DoctorSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorSummary value)  $default,){
final _that = this;
switch (_that) {
case _DoctorSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorSummary value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String specialty,  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorSummary() when $default != null:
return $default(_that.id,_that.name,_that.specialty,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String specialty,  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _DoctorSummary():
return $default(_that.id,_that.name,_that.specialty,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String specialty,  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _DoctorSummary() when $default != null:
return $default(_that.id,_that.name,_that.specialty,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorSummary implements DoctorSummary {
  const _DoctorSummary({required this.id, required this.name, required this.specialty, this.avatarUrl});
  factory _DoctorSummary.fromJson(Map<String, dynamic> json) => _$DoctorSummaryFromJson(json);

@override final  String id;
@override final  String name;
@override final  String specialty;
@override final  String? avatarUrl;

/// Create a copy of DoctorSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorSummaryCopyWith<_DoctorSummary> get copyWith => __$DoctorSummaryCopyWithImpl<_DoctorSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.specialty, specialty) || other.specialty == specialty)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,specialty,avatarUrl);

@override
String toString() {
  return 'DoctorSummary(id: $id, name: $name, specialty: $specialty, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$DoctorSummaryCopyWith<$Res> implements $DoctorSummaryCopyWith<$Res> {
  factory _$DoctorSummaryCopyWith(_DoctorSummary value, $Res Function(_DoctorSummary) _then) = __$DoctorSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String specialty, String? avatarUrl
});




}
/// @nodoc
class __$DoctorSummaryCopyWithImpl<$Res>
    implements _$DoctorSummaryCopyWith<$Res> {
  __$DoctorSummaryCopyWithImpl(this._self, this._then);

  final _DoctorSummary _self;
  final $Res Function(_DoctorSummary) _then;

/// Create a copy of DoctorSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? specialty = null,Object? avatarUrl = freezed,}) {
  return _then(_DoctorSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,specialty: null == specialty ? _self.specialty : specialty // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AppointmentSummary {

 String get id; AppointmentStatus get status; DateTime get scheduledAt; String get location; DoctorSummary get doctor; bool get canReschedule; bool get canCancel;
/// Create a copy of AppointmentSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentSummaryCopyWith<AppointmentSummary> get copyWith => _$AppointmentSummaryCopyWithImpl<AppointmentSummary>(this as AppointmentSummary, _$identity);

  /// Serializes this AppointmentSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.location, location) || other.location == location)&&(identical(other.doctor, doctor) || other.doctor == doctor)&&(identical(other.canReschedule, canReschedule) || other.canReschedule == canReschedule)&&(identical(other.canCancel, canCancel) || other.canCancel == canCancel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,scheduledAt,location,doctor,canReschedule,canCancel);

@override
String toString() {
  return 'AppointmentSummary(id: $id, status: $status, scheduledAt: $scheduledAt, location: $location, doctor: $doctor, canReschedule: $canReschedule, canCancel: $canCancel)';
}


}

/// @nodoc
abstract mixin class $AppointmentSummaryCopyWith<$Res>  {
  factory $AppointmentSummaryCopyWith(AppointmentSummary value, $Res Function(AppointmentSummary) _then) = _$AppointmentSummaryCopyWithImpl;
@useResult
$Res call({
 String id, AppointmentStatus status, DateTime scheduledAt, String location, DoctorSummary doctor, bool canReschedule, bool canCancel
});


$DoctorSummaryCopyWith<$Res> get doctor;

}
/// @nodoc
class _$AppointmentSummaryCopyWithImpl<$Res>
    implements $AppointmentSummaryCopyWith<$Res> {
  _$AppointmentSummaryCopyWithImpl(this._self, this._then);

  final AppointmentSummary _self;
  final $Res Function(AppointmentSummary) _then;

/// Create a copy of AppointmentSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? scheduledAt = null,Object? location = null,Object? doctor = null,Object? canReschedule = null,Object? canCancel = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AppointmentStatus,scheduledAt: null == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,doctor: null == doctor ? _self.doctor : doctor // ignore: cast_nullable_to_non_nullable
as DoctorSummary,canReschedule: null == canReschedule ? _self.canReschedule : canReschedule // ignore: cast_nullable_to_non_nullable
as bool,canCancel: null == canCancel ? _self.canCancel : canCancel // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of AppointmentSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorSummaryCopyWith<$Res> get doctor {
  
  return $DoctorSummaryCopyWith<$Res>(_self.doctor, (value) {
    return _then(_self.copyWith(doctor: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppointmentSummary].
extension AppointmentSummaryPatterns on AppointmentSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppointmentSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppointmentSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppointmentSummary value)  $default,){
final _that = this;
switch (_that) {
case _AppointmentSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppointmentSummary value)?  $default,){
final _that = this;
switch (_that) {
case _AppointmentSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  AppointmentStatus status,  DateTime scheduledAt,  String location,  DoctorSummary doctor,  bool canReschedule,  bool canCancel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppointmentSummary() when $default != null:
return $default(_that.id,_that.status,_that.scheduledAt,_that.location,_that.doctor,_that.canReschedule,_that.canCancel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  AppointmentStatus status,  DateTime scheduledAt,  String location,  DoctorSummary doctor,  bool canReschedule,  bool canCancel)  $default,) {final _that = this;
switch (_that) {
case _AppointmentSummary():
return $default(_that.id,_that.status,_that.scheduledAt,_that.location,_that.doctor,_that.canReschedule,_that.canCancel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  AppointmentStatus status,  DateTime scheduledAt,  String location,  DoctorSummary doctor,  bool canReschedule,  bool canCancel)?  $default,) {final _that = this;
switch (_that) {
case _AppointmentSummary() when $default != null:
return $default(_that.id,_that.status,_that.scheduledAt,_that.location,_that.doctor,_that.canReschedule,_that.canCancel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppointmentSummary implements AppointmentSummary {
  const _AppointmentSummary({required this.id, required this.status, required this.scheduledAt, required this.location, required this.doctor, this.canReschedule = true, this.canCancel = true});
  factory _AppointmentSummary.fromJson(Map<String, dynamic> json) => _$AppointmentSummaryFromJson(json);

@override final  String id;
@override final  AppointmentStatus status;
@override final  DateTime scheduledAt;
@override final  String location;
@override final  DoctorSummary doctor;
@override@JsonKey() final  bool canReschedule;
@override@JsonKey() final  bool canCancel;

/// Create a copy of AppointmentSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentSummaryCopyWith<_AppointmentSummary> get copyWith => __$AppointmentSummaryCopyWithImpl<_AppointmentSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.location, location) || other.location == location)&&(identical(other.doctor, doctor) || other.doctor == doctor)&&(identical(other.canReschedule, canReschedule) || other.canReschedule == canReschedule)&&(identical(other.canCancel, canCancel) || other.canCancel == canCancel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,scheduledAt,location,doctor,canReschedule,canCancel);

@override
String toString() {
  return 'AppointmentSummary(id: $id, status: $status, scheduledAt: $scheduledAt, location: $location, doctor: $doctor, canReschedule: $canReschedule, canCancel: $canCancel)';
}


}

/// @nodoc
abstract mixin class _$AppointmentSummaryCopyWith<$Res> implements $AppointmentSummaryCopyWith<$Res> {
  factory _$AppointmentSummaryCopyWith(_AppointmentSummary value, $Res Function(_AppointmentSummary) _then) = __$AppointmentSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, AppointmentStatus status, DateTime scheduledAt, String location, DoctorSummary doctor, bool canReschedule, bool canCancel
});


@override $DoctorSummaryCopyWith<$Res> get doctor;

}
/// @nodoc
class __$AppointmentSummaryCopyWithImpl<$Res>
    implements _$AppointmentSummaryCopyWith<$Res> {
  __$AppointmentSummaryCopyWithImpl(this._self, this._then);

  final _AppointmentSummary _self;
  final $Res Function(_AppointmentSummary) _then;

/// Create a copy of AppointmentSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? scheduledAt = null,Object? location = null,Object? doctor = null,Object? canReschedule = null,Object? canCancel = null,}) {
  return _then(_AppointmentSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AppointmentStatus,scheduledAt: null == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,doctor: null == doctor ? _self.doctor : doctor // ignore: cast_nullable_to_non_nullable
as DoctorSummary,canReschedule: null == canReschedule ? _self.canReschedule : canReschedule // ignore: cast_nullable_to_non_nullable
as bool,canCancel: null == canCancel ? _self.canCancel : canCancel // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of AppointmentSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorSummaryCopyWith<$Res> get doctor {
  
  return $DoctorSummaryCopyWith<$Res>(_self.doctor, (value) {
    return _then(_self.copyWith(doctor: value));
  });
}
}


/// @nodoc
mixin _$AppointmentDetail {

 String get id; AppointmentStatus get status; DateTime get scheduledAt; String get location; DoctorSummary get doctor; String? get reason; String? get notes; bool get canReschedule; bool get canCancel; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of AppointmentDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentDetailCopyWith<AppointmentDetail> get copyWith => _$AppointmentDetailCopyWithImpl<AppointmentDetail>(this as AppointmentDetail, _$identity);

  /// Serializes this AppointmentDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.location, location) || other.location == location)&&(identical(other.doctor, doctor) || other.doctor == doctor)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.canReschedule, canReschedule) || other.canReschedule == canReschedule)&&(identical(other.canCancel, canCancel) || other.canCancel == canCancel)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,scheduledAt,location,doctor,reason,notes,canReschedule,canCancel,createdAt,updatedAt);

@override
String toString() {
  return 'AppointmentDetail(id: $id, status: $status, scheduledAt: $scheduledAt, location: $location, doctor: $doctor, reason: $reason, notes: $notes, canReschedule: $canReschedule, canCancel: $canCancel, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AppointmentDetailCopyWith<$Res>  {
  factory $AppointmentDetailCopyWith(AppointmentDetail value, $Res Function(AppointmentDetail) _then) = _$AppointmentDetailCopyWithImpl;
@useResult
$Res call({
 String id, AppointmentStatus status, DateTime scheduledAt, String location, DoctorSummary doctor, String? reason, String? notes, bool canReschedule, bool canCancel, DateTime? createdAt, DateTime? updatedAt
});


$DoctorSummaryCopyWith<$Res> get doctor;

}
/// @nodoc
class _$AppointmentDetailCopyWithImpl<$Res>
    implements $AppointmentDetailCopyWith<$Res> {
  _$AppointmentDetailCopyWithImpl(this._self, this._then);

  final AppointmentDetail _self;
  final $Res Function(AppointmentDetail) _then;

/// Create a copy of AppointmentDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? scheduledAt = null,Object? location = null,Object? doctor = null,Object? reason = freezed,Object? notes = freezed,Object? canReschedule = null,Object? canCancel = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AppointmentStatus,scheduledAt: null == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,doctor: null == doctor ? _self.doctor : doctor // ignore: cast_nullable_to_non_nullable
as DoctorSummary,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,canReschedule: null == canReschedule ? _self.canReschedule : canReschedule // ignore: cast_nullable_to_non_nullable
as bool,canCancel: null == canCancel ? _self.canCancel : canCancel // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of AppointmentDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorSummaryCopyWith<$Res> get doctor {
  
  return $DoctorSummaryCopyWith<$Res>(_self.doctor, (value) {
    return _then(_self.copyWith(doctor: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppointmentDetail].
extension AppointmentDetailPatterns on AppointmentDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppointmentDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppointmentDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppointmentDetail value)  $default,){
final _that = this;
switch (_that) {
case _AppointmentDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppointmentDetail value)?  $default,){
final _that = this;
switch (_that) {
case _AppointmentDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  AppointmentStatus status,  DateTime scheduledAt,  String location,  DoctorSummary doctor,  String? reason,  String? notes,  bool canReschedule,  bool canCancel,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppointmentDetail() when $default != null:
return $default(_that.id,_that.status,_that.scheduledAt,_that.location,_that.doctor,_that.reason,_that.notes,_that.canReschedule,_that.canCancel,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  AppointmentStatus status,  DateTime scheduledAt,  String location,  DoctorSummary doctor,  String? reason,  String? notes,  bool canReschedule,  bool canCancel,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _AppointmentDetail():
return $default(_that.id,_that.status,_that.scheduledAt,_that.location,_that.doctor,_that.reason,_that.notes,_that.canReschedule,_that.canCancel,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  AppointmentStatus status,  DateTime scheduledAt,  String location,  DoctorSummary doctor,  String? reason,  String? notes,  bool canReschedule,  bool canCancel,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _AppointmentDetail() when $default != null:
return $default(_that.id,_that.status,_that.scheduledAt,_that.location,_that.doctor,_that.reason,_that.notes,_that.canReschedule,_that.canCancel,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppointmentDetail implements AppointmentDetail {
  const _AppointmentDetail({required this.id, required this.status, required this.scheduledAt, required this.location, required this.doctor, this.reason, this.notes, this.canReschedule = true, this.canCancel = true, this.createdAt, this.updatedAt});
  factory _AppointmentDetail.fromJson(Map<String, dynamic> json) => _$AppointmentDetailFromJson(json);

@override final  String id;
@override final  AppointmentStatus status;
@override final  DateTime scheduledAt;
@override final  String location;
@override final  DoctorSummary doctor;
@override final  String? reason;
@override final  String? notes;
@override@JsonKey() final  bool canReschedule;
@override@JsonKey() final  bool canCancel;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of AppointmentDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentDetailCopyWith<_AppointmentDetail> get copyWith => __$AppointmentDetailCopyWithImpl<_AppointmentDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.location, location) || other.location == location)&&(identical(other.doctor, doctor) || other.doctor == doctor)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.canReschedule, canReschedule) || other.canReschedule == canReschedule)&&(identical(other.canCancel, canCancel) || other.canCancel == canCancel)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,scheduledAt,location,doctor,reason,notes,canReschedule,canCancel,createdAt,updatedAt);

@override
String toString() {
  return 'AppointmentDetail(id: $id, status: $status, scheduledAt: $scheduledAt, location: $location, doctor: $doctor, reason: $reason, notes: $notes, canReschedule: $canReschedule, canCancel: $canCancel, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AppointmentDetailCopyWith<$Res> implements $AppointmentDetailCopyWith<$Res> {
  factory _$AppointmentDetailCopyWith(_AppointmentDetail value, $Res Function(_AppointmentDetail) _then) = __$AppointmentDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, AppointmentStatus status, DateTime scheduledAt, String location, DoctorSummary doctor, String? reason, String? notes, bool canReschedule, bool canCancel, DateTime? createdAt, DateTime? updatedAt
});


@override $DoctorSummaryCopyWith<$Res> get doctor;

}
/// @nodoc
class __$AppointmentDetailCopyWithImpl<$Res>
    implements _$AppointmentDetailCopyWith<$Res> {
  __$AppointmentDetailCopyWithImpl(this._self, this._then);

  final _AppointmentDetail _self;
  final $Res Function(_AppointmentDetail) _then;

/// Create a copy of AppointmentDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? scheduledAt = null,Object? location = null,Object? doctor = null,Object? reason = freezed,Object? notes = freezed,Object? canReschedule = null,Object? canCancel = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_AppointmentDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AppointmentStatus,scheduledAt: null == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,doctor: null == doctor ? _self.doctor : doctor // ignore: cast_nullable_to_non_nullable
as DoctorSummary,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,canReschedule: null == canReschedule ? _self.canReschedule : canReschedule // ignore: cast_nullable_to_non_nullable
as bool,canCancel: null == canCancel ? _self.canCancel : canCancel // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of AppointmentDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorSummaryCopyWith<$Res> get doctor {
  
  return $DoctorSummaryCopyWith<$Res>(_self.doctor, (value) {
    return _then(_self.copyWith(doctor: value));
  });
}
}


/// @nodoc
mixin _$ConsultationHistoryItem {

 String get id; String get title; String? get providerName; String? get department; DateTime get visitedAt; ConsultationResultStatus get resultStatus;
/// Create a copy of ConsultationHistoryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsultationHistoryItemCopyWith<ConsultationHistoryItem> get copyWith => _$ConsultationHistoryItemCopyWithImpl<ConsultationHistoryItem>(this as ConsultationHistoryItem, _$identity);

  /// Serializes this ConsultationHistoryItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsultationHistoryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.providerName, providerName) || other.providerName == providerName)&&(identical(other.department, department) || other.department == department)&&(identical(other.visitedAt, visitedAt) || other.visitedAt == visitedAt)&&(identical(other.resultStatus, resultStatus) || other.resultStatus == resultStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,providerName,department,visitedAt,resultStatus);

@override
String toString() {
  return 'ConsultationHistoryItem(id: $id, title: $title, providerName: $providerName, department: $department, visitedAt: $visitedAt, resultStatus: $resultStatus)';
}


}

/// @nodoc
abstract mixin class $ConsultationHistoryItemCopyWith<$Res>  {
  factory $ConsultationHistoryItemCopyWith(ConsultationHistoryItem value, $Res Function(ConsultationHistoryItem) _then) = _$ConsultationHistoryItemCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? providerName, String? department, DateTime visitedAt, ConsultationResultStatus resultStatus
});




}
/// @nodoc
class _$ConsultationHistoryItemCopyWithImpl<$Res>
    implements $ConsultationHistoryItemCopyWith<$Res> {
  _$ConsultationHistoryItemCopyWithImpl(this._self, this._then);

  final ConsultationHistoryItem _self;
  final $Res Function(ConsultationHistoryItem) _then;

/// Create a copy of ConsultationHistoryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? providerName = freezed,Object? department = freezed,Object? visitedAt = null,Object? resultStatus = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,providerName: freezed == providerName ? _self.providerName : providerName // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,visitedAt: null == visitedAt ? _self.visitedAt : visitedAt // ignore: cast_nullable_to_non_nullable
as DateTime,resultStatus: null == resultStatus ? _self.resultStatus : resultStatus // ignore: cast_nullable_to_non_nullable
as ConsultationResultStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [ConsultationHistoryItem].
extension ConsultationHistoryItemPatterns on ConsultationHistoryItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsultationHistoryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsultationHistoryItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsultationHistoryItem value)  $default,){
final _that = this;
switch (_that) {
case _ConsultationHistoryItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsultationHistoryItem value)?  $default,){
final _that = this;
switch (_that) {
case _ConsultationHistoryItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? providerName,  String? department,  DateTime visitedAt,  ConsultationResultStatus resultStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsultationHistoryItem() when $default != null:
return $default(_that.id,_that.title,_that.providerName,_that.department,_that.visitedAt,_that.resultStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? providerName,  String? department,  DateTime visitedAt,  ConsultationResultStatus resultStatus)  $default,) {final _that = this;
switch (_that) {
case _ConsultationHistoryItem():
return $default(_that.id,_that.title,_that.providerName,_that.department,_that.visitedAt,_that.resultStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? providerName,  String? department,  DateTime visitedAt,  ConsultationResultStatus resultStatus)?  $default,) {final _that = this;
switch (_that) {
case _ConsultationHistoryItem() when $default != null:
return $default(_that.id,_that.title,_that.providerName,_that.department,_that.visitedAt,_that.resultStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConsultationHistoryItem implements ConsultationHistoryItem {
  const _ConsultationHistoryItem({required this.id, required this.title, this.providerName, this.department, required this.visitedAt, required this.resultStatus});
  factory _ConsultationHistoryItem.fromJson(Map<String, dynamic> json) => _$ConsultationHistoryItemFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? providerName;
@override final  String? department;
@override final  DateTime visitedAt;
@override final  ConsultationResultStatus resultStatus;

/// Create a copy of ConsultationHistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationHistoryItemCopyWith<_ConsultationHistoryItem> get copyWith => __$ConsultationHistoryItemCopyWithImpl<_ConsultationHistoryItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConsultationHistoryItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationHistoryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.providerName, providerName) || other.providerName == providerName)&&(identical(other.department, department) || other.department == department)&&(identical(other.visitedAt, visitedAt) || other.visitedAt == visitedAt)&&(identical(other.resultStatus, resultStatus) || other.resultStatus == resultStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,providerName,department,visitedAt,resultStatus);

@override
String toString() {
  return 'ConsultationHistoryItem(id: $id, title: $title, providerName: $providerName, department: $department, visitedAt: $visitedAt, resultStatus: $resultStatus)';
}


}

/// @nodoc
abstract mixin class _$ConsultationHistoryItemCopyWith<$Res> implements $ConsultationHistoryItemCopyWith<$Res> {
  factory _$ConsultationHistoryItemCopyWith(_ConsultationHistoryItem value, $Res Function(_ConsultationHistoryItem) _then) = __$ConsultationHistoryItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? providerName, String? department, DateTime visitedAt, ConsultationResultStatus resultStatus
});




}
/// @nodoc
class __$ConsultationHistoryItemCopyWithImpl<$Res>
    implements _$ConsultationHistoryItemCopyWith<$Res> {
  __$ConsultationHistoryItemCopyWithImpl(this._self, this._then);

  final _ConsultationHistoryItem _self;
  final $Res Function(_ConsultationHistoryItem) _then;

/// Create a copy of ConsultationHistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? providerName = freezed,Object? department = freezed,Object? visitedAt = null,Object? resultStatus = null,}) {
  return _then(_ConsultationHistoryItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,providerName: freezed == providerName ? _self.providerName : providerName // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,visitedAt: null == visitedAt ? _self.visitedAt : visitedAt // ignore: cast_nullable_to_non_nullable
as DateTime,resultStatus: null == resultStatus ? _self.resultStatus : resultStatus // ignore: cast_nullable_to_non_nullable
as ConsultationResultStatus,
  ));
}


}


/// @nodoc
mixin _$AppointmentsDashboardResponse {

 AppointmentSummary? get nextAppointment; List<AppointmentSummary> get upcomingAppointments; List<ConsultationHistoryItem> get consultationHistory;
/// Create a copy of AppointmentsDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentsDashboardResponseCopyWith<AppointmentsDashboardResponse> get copyWith => _$AppointmentsDashboardResponseCopyWithImpl<AppointmentsDashboardResponse>(this as AppointmentsDashboardResponse, _$identity);

  /// Serializes this AppointmentsDashboardResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentsDashboardResponse&&(identical(other.nextAppointment, nextAppointment) || other.nextAppointment == nextAppointment)&&const DeepCollectionEquality().equals(other.upcomingAppointments, upcomingAppointments)&&const DeepCollectionEquality().equals(other.consultationHistory, consultationHistory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nextAppointment,const DeepCollectionEquality().hash(upcomingAppointments),const DeepCollectionEquality().hash(consultationHistory));

@override
String toString() {
  return 'AppointmentsDashboardResponse(nextAppointment: $nextAppointment, upcomingAppointments: $upcomingAppointments, consultationHistory: $consultationHistory)';
}


}

/// @nodoc
abstract mixin class $AppointmentsDashboardResponseCopyWith<$Res>  {
  factory $AppointmentsDashboardResponseCopyWith(AppointmentsDashboardResponse value, $Res Function(AppointmentsDashboardResponse) _then) = _$AppointmentsDashboardResponseCopyWithImpl;
@useResult
$Res call({
 AppointmentSummary? nextAppointment, List<AppointmentSummary> upcomingAppointments, List<ConsultationHistoryItem> consultationHistory
});


$AppointmentSummaryCopyWith<$Res>? get nextAppointment;

}
/// @nodoc
class _$AppointmentsDashboardResponseCopyWithImpl<$Res>
    implements $AppointmentsDashboardResponseCopyWith<$Res> {
  _$AppointmentsDashboardResponseCopyWithImpl(this._self, this._then);

  final AppointmentsDashboardResponse _self;
  final $Res Function(AppointmentsDashboardResponse) _then;

/// Create a copy of AppointmentsDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nextAppointment = freezed,Object? upcomingAppointments = null,Object? consultationHistory = null,}) {
  return _then(_self.copyWith(
nextAppointment: freezed == nextAppointment ? _self.nextAppointment : nextAppointment // ignore: cast_nullable_to_non_nullable
as AppointmentSummary?,upcomingAppointments: null == upcomingAppointments ? _self.upcomingAppointments : upcomingAppointments // ignore: cast_nullable_to_non_nullable
as List<AppointmentSummary>,consultationHistory: null == consultationHistory ? _self.consultationHistory : consultationHistory // ignore: cast_nullable_to_non_nullable
as List<ConsultationHistoryItem>,
  ));
}
/// Create a copy of AppointmentsDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppointmentSummaryCopyWith<$Res>? get nextAppointment {
    if (_self.nextAppointment == null) {
    return null;
  }

  return $AppointmentSummaryCopyWith<$Res>(_self.nextAppointment!, (value) {
    return _then(_self.copyWith(nextAppointment: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppointmentsDashboardResponse].
extension AppointmentsDashboardResponsePatterns on AppointmentsDashboardResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppointmentsDashboardResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppointmentsDashboardResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppointmentsDashboardResponse value)  $default,){
final _that = this;
switch (_that) {
case _AppointmentsDashboardResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppointmentsDashboardResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AppointmentsDashboardResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppointmentSummary? nextAppointment,  List<AppointmentSummary> upcomingAppointments,  List<ConsultationHistoryItem> consultationHistory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppointmentsDashboardResponse() when $default != null:
return $default(_that.nextAppointment,_that.upcomingAppointments,_that.consultationHistory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppointmentSummary? nextAppointment,  List<AppointmentSummary> upcomingAppointments,  List<ConsultationHistoryItem> consultationHistory)  $default,) {final _that = this;
switch (_that) {
case _AppointmentsDashboardResponse():
return $default(_that.nextAppointment,_that.upcomingAppointments,_that.consultationHistory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppointmentSummary? nextAppointment,  List<AppointmentSummary> upcomingAppointments,  List<ConsultationHistoryItem> consultationHistory)?  $default,) {final _that = this;
switch (_that) {
case _AppointmentsDashboardResponse() when $default != null:
return $default(_that.nextAppointment,_that.upcomingAppointments,_that.consultationHistory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppointmentsDashboardResponse implements AppointmentsDashboardResponse {
  const _AppointmentsDashboardResponse({this.nextAppointment, final  List<AppointmentSummary> upcomingAppointments = const [], final  List<ConsultationHistoryItem> consultationHistory = const []}): _upcomingAppointments = upcomingAppointments,_consultationHistory = consultationHistory;
  factory _AppointmentsDashboardResponse.fromJson(Map<String, dynamic> json) => _$AppointmentsDashboardResponseFromJson(json);

@override final  AppointmentSummary? nextAppointment;
 final  List<AppointmentSummary> _upcomingAppointments;
@override@JsonKey() List<AppointmentSummary> get upcomingAppointments {
  if (_upcomingAppointments is EqualUnmodifiableListView) return _upcomingAppointments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_upcomingAppointments);
}

 final  List<ConsultationHistoryItem> _consultationHistory;
@override@JsonKey() List<ConsultationHistoryItem> get consultationHistory {
  if (_consultationHistory is EqualUnmodifiableListView) return _consultationHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_consultationHistory);
}


/// Create a copy of AppointmentsDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentsDashboardResponseCopyWith<_AppointmentsDashboardResponse> get copyWith => __$AppointmentsDashboardResponseCopyWithImpl<_AppointmentsDashboardResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentsDashboardResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentsDashboardResponse&&(identical(other.nextAppointment, nextAppointment) || other.nextAppointment == nextAppointment)&&const DeepCollectionEquality().equals(other._upcomingAppointments, _upcomingAppointments)&&const DeepCollectionEquality().equals(other._consultationHistory, _consultationHistory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nextAppointment,const DeepCollectionEquality().hash(_upcomingAppointments),const DeepCollectionEquality().hash(_consultationHistory));

@override
String toString() {
  return 'AppointmentsDashboardResponse(nextAppointment: $nextAppointment, upcomingAppointments: $upcomingAppointments, consultationHistory: $consultationHistory)';
}


}

/// @nodoc
abstract mixin class _$AppointmentsDashboardResponseCopyWith<$Res> implements $AppointmentsDashboardResponseCopyWith<$Res> {
  factory _$AppointmentsDashboardResponseCopyWith(_AppointmentsDashboardResponse value, $Res Function(_AppointmentsDashboardResponse) _then) = __$AppointmentsDashboardResponseCopyWithImpl;
@override @useResult
$Res call({
 AppointmentSummary? nextAppointment, List<AppointmentSummary> upcomingAppointments, List<ConsultationHistoryItem> consultationHistory
});


@override $AppointmentSummaryCopyWith<$Res>? get nextAppointment;

}
/// @nodoc
class __$AppointmentsDashboardResponseCopyWithImpl<$Res>
    implements _$AppointmentsDashboardResponseCopyWith<$Res> {
  __$AppointmentsDashboardResponseCopyWithImpl(this._self, this._then);

  final _AppointmentsDashboardResponse _self;
  final $Res Function(_AppointmentsDashboardResponse) _then;

/// Create a copy of AppointmentsDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nextAppointment = freezed,Object? upcomingAppointments = null,Object? consultationHistory = null,}) {
  return _then(_AppointmentsDashboardResponse(
nextAppointment: freezed == nextAppointment ? _self.nextAppointment : nextAppointment // ignore: cast_nullable_to_non_nullable
as AppointmentSummary?,upcomingAppointments: null == upcomingAppointments ? _self._upcomingAppointments : upcomingAppointments // ignore: cast_nullable_to_non_nullable
as List<AppointmentSummary>,consultationHistory: null == consultationHistory ? _self._consultationHistory : consultationHistory // ignore: cast_nullable_to_non_nullable
as List<ConsultationHistoryItem>,
  ));
}

/// Create a copy of AppointmentsDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppointmentSummaryCopyWith<$Res>? get nextAppointment {
    if (_self.nextAppointment == null) {
    return null;
  }

  return $AppointmentSummaryCopyWith<$Res>(_self.nextAppointment!, (value) {
    return _then(_self.copyWith(nextAppointment: value));
  });
}
}


/// @nodoc
mixin _$AppointmentListResponse {

 List<AppointmentSummary> get data; int get total; int get page; int get limit;
/// Create a copy of AppointmentListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentListResponseCopyWith<AppointmentListResponse> get copyWith => _$AppointmentListResponseCopyWithImpl<AppointmentListResponse>(this as AppointmentListResponse, _$identity);

  /// Serializes this AppointmentListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentListResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),total,page,limit);

@override
String toString() {
  return 'AppointmentListResponse(data: $data, total: $total, page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $AppointmentListResponseCopyWith<$Res>  {
  factory $AppointmentListResponseCopyWith(AppointmentListResponse value, $Res Function(AppointmentListResponse) _then) = _$AppointmentListResponseCopyWithImpl;
@useResult
$Res call({
 List<AppointmentSummary> data, int total, int page, int limit
});




}
/// @nodoc
class _$AppointmentListResponseCopyWithImpl<$Res>
    implements $AppointmentListResponseCopyWith<$Res> {
  _$AppointmentListResponseCopyWithImpl(this._self, this._then);

  final AppointmentListResponse _self;
  final $Res Function(AppointmentListResponse) _then;

/// Create a copy of AppointmentListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? total = null,Object? page = null,Object? limit = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<AppointmentSummary>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AppointmentListResponse].
extension AppointmentListResponsePatterns on AppointmentListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppointmentListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppointmentListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppointmentListResponse value)  $default,){
final _that = this;
switch (_that) {
case _AppointmentListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppointmentListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AppointmentListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AppointmentSummary> data,  int total,  int page,  int limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppointmentListResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AppointmentSummary> data,  int total,  int page,  int limit)  $default,) {final _that = this;
switch (_that) {
case _AppointmentListResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AppointmentSummary> data,  int total,  int page,  int limit)?  $default,) {final _that = this;
switch (_that) {
case _AppointmentListResponse() when $default != null:
return $default(_that.data,_that.total,_that.page,_that.limit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppointmentListResponse implements AppointmentListResponse {
  const _AppointmentListResponse({final  List<AppointmentSummary> data = const [], this.total = 0, this.page = 1, this.limit = 20}): _data = data;
  factory _AppointmentListResponse.fromJson(Map<String, dynamic> json) => _$AppointmentListResponseFromJson(json);

 final  List<AppointmentSummary> _data;
@override@JsonKey() List<AppointmentSummary> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey() final  int total;
@override@JsonKey() final  int page;
@override@JsonKey() final  int limit;

/// Create a copy of AppointmentListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentListResponseCopyWith<_AppointmentListResponse> get copyWith => __$AppointmentListResponseCopyWithImpl<_AppointmentListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentListResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),total,page,limit);

@override
String toString() {
  return 'AppointmentListResponse(data: $data, total: $total, page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$AppointmentListResponseCopyWith<$Res> implements $AppointmentListResponseCopyWith<$Res> {
  factory _$AppointmentListResponseCopyWith(_AppointmentListResponse value, $Res Function(_AppointmentListResponse) _then) = __$AppointmentListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<AppointmentSummary> data, int total, int page, int limit
});




}
/// @nodoc
class __$AppointmentListResponseCopyWithImpl<$Res>
    implements _$AppointmentListResponseCopyWith<$Res> {
  __$AppointmentListResponseCopyWithImpl(this._self, this._then);

  final _AppointmentListResponse _self;
  final $Res Function(_AppointmentListResponse) _then;

/// Create a copy of AppointmentListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? total = null,Object? page = null,Object? limit = null,}) {
  return _then(_AppointmentListResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<AppointmentSummary>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CancelAppointmentResponse {

 String get id; AppointmentStatus get status;
/// Create a copy of CancelAppointmentResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CancelAppointmentResponseCopyWith<CancelAppointmentResponse> get copyWith => _$CancelAppointmentResponseCopyWithImpl<CancelAppointmentResponse>(this as CancelAppointmentResponse, _$identity);

  /// Serializes this CancelAppointmentResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelAppointmentResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status);

@override
String toString() {
  return 'CancelAppointmentResponse(id: $id, status: $status)';
}


}

/// @nodoc
abstract mixin class $CancelAppointmentResponseCopyWith<$Res>  {
  factory $CancelAppointmentResponseCopyWith(CancelAppointmentResponse value, $Res Function(CancelAppointmentResponse) _then) = _$CancelAppointmentResponseCopyWithImpl;
@useResult
$Res call({
 String id, AppointmentStatus status
});




}
/// @nodoc
class _$CancelAppointmentResponseCopyWithImpl<$Res>
    implements $CancelAppointmentResponseCopyWith<$Res> {
  _$CancelAppointmentResponseCopyWithImpl(this._self, this._then);

  final CancelAppointmentResponse _self;
  final $Res Function(CancelAppointmentResponse) _then;

/// Create a copy of CancelAppointmentResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AppointmentStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [CancelAppointmentResponse].
extension CancelAppointmentResponsePatterns on CancelAppointmentResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CancelAppointmentResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CancelAppointmentResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CancelAppointmentResponse value)  $default,){
final _that = this;
switch (_that) {
case _CancelAppointmentResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CancelAppointmentResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CancelAppointmentResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  AppointmentStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CancelAppointmentResponse() when $default != null:
return $default(_that.id,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  AppointmentStatus status)  $default,) {final _that = this;
switch (_that) {
case _CancelAppointmentResponse():
return $default(_that.id,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  AppointmentStatus status)?  $default,) {final _that = this;
switch (_that) {
case _CancelAppointmentResponse() when $default != null:
return $default(_that.id,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CancelAppointmentResponse implements CancelAppointmentResponse {
  const _CancelAppointmentResponse({required this.id, required this.status});
  factory _CancelAppointmentResponse.fromJson(Map<String, dynamic> json) => _$CancelAppointmentResponseFromJson(json);

@override final  String id;
@override final  AppointmentStatus status;

/// Create a copy of CancelAppointmentResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CancelAppointmentResponseCopyWith<_CancelAppointmentResponse> get copyWith => __$CancelAppointmentResponseCopyWithImpl<_CancelAppointmentResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CancelAppointmentResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CancelAppointmentResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status);

@override
String toString() {
  return 'CancelAppointmentResponse(id: $id, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CancelAppointmentResponseCopyWith<$Res> implements $CancelAppointmentResponseCopyWith<$Res> {
  factory _$CancelAppointmentResponseCopyWith(_CancelAppointmentResponse value, $Res Function(_CancelAppointmentResponse) _then) = __$CancelAppointmentResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, AppointmentStatus status
});




}
/// @nodoc
class __$CancelAppointmentResponseCopyWithImpl<$Res>
    implements _$CancelAppointmentResponseCopyWith<$Res> {
  __$CancelAppointmentResponseCopyWithImpl(this._self, this._then);

  final _CancelAppointmentResponse _self;
  final $Res Function(_CancelAppointmentResponse) _then;

/// Create a copy of CancelAppointmentResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,}) {
  return _then(_CancelAppointmentResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AppointmentStatus,
  ));
}


}


/// @nodoc
mixin _$AppointmentSpecialty {

 String get id; String get name; String? get description;
/// Create a copy of AppointmentSpecialty
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentSpecialtyCopyWith<AppointmentSpecialty> get copyWith => _$AppointmentSpecialtyCopyWithImpl<AppointmentSpecialty>(this as AppointmentSpecialty, _$identity);

  /// Serializes this AppointmentSpecialty to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentSpecialty&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description);

@override
String toString() {
  return 'AppointmentSpecialty(id: $id, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $AppointmentSpecialtyCopyWith<$Res>  {
  factory $AppointmentSpecialtyCopyWith(AppointmentSpecialty value, $Res Function(AppointmentSpecialty) _then) = _$AppointmentSpecialtyCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description
});




}
/// @nodoc
class _$AppointmentSpecialtyCopyWithImpl<$Res>
    implements $AppointmentSpecialtyCopyWith<$Res> {
  _$AppointmentSpecialtyCopyWithImpl(this._self, this._then);

  final AppointmentSpecialty _self;
  final $Res Function(AppointmentSpecialty) _then;

/// Create a copy of AppointmentSpecialty
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppointmentSpecialty].
extension AppointmentSpecialtyPatterns on AppointmentSpecialty {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppointmentSpecialty value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppointmentSpecialty() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppointmentSpecialty value)  $default,){
final _that = this;
switch (_that) {
case _AppointmentSpecialty():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppointmentSpecialty value)?  $default,){
final _that = this;
switch (_that) {
case _AppointmentSpecialty() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppointmentSpecialty() when $default != null:
return $default(_that.id,_that.name,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description)  $default,) {final _that = this;
switch (_that) {
case _AppointmentSpecialty():
return $default(_that.id,_that.name,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _AppointmentSpecialty() when $default != null:
return $default(_that.id,_that.name,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppointmentSpecialty implements AppointmentSpecialty {
  const _AppointmentSpecialty({required this.id, required this.name, this.description});
  factory _AppointmentSpecialty.fromJson(Map<String, dynamic> json) => _$AppointmentSpecialtyFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;

/// Create a copy of AppointmentSpecialty
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentSpecialtyCopyWith<_AppointmentSpecialty> get copyWith => __$AppointmentSpecialtyCopyWithImpl<_AppointmentSpecialty>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentSpecialtyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentSpecialty&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description);

@override
String toString() {
  return 'AppointmentSpecialty(id: $id, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$AppointmentSpecialtyCopyWith<$Res> implements $AppointmentSpecialtyCopyWith<$Res> {
  factory _$AppointmentSpecialtyCopyWith(_AppointmentSpecialty value, $Res Function(_AppointmentSpecialty) _then) = __$AppointmentSpecialtyCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description
});




}
/// @nodoc
class __$AppointmentSpecialtyCopyWithImpl<$Res>
    implements _$AppointmentSpecialtyCopyWith<$Res> {
  __$AppointmentSpecialtyCopyWithImpl(this._self, this._then);

  final _AppointmentSpecialty _self;
  final $Res Function(_AppointmentSpecialty) _then;

/// Create a copy of AppointmentSpecialty
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,}) {
  return _then(_AppointmentSpecialty(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AppointmentSpecialtyListResponse {

 List<AppointmentSpecialty> get data;
/// Create a copy of AppointmentSpecialtyListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentSpecialtyListResponseCopyWith<AppointmentSpecialtyListResponse> get copyWith => _$AppointmentSpecialtyListResponseCopyWithImpl<AppointmentSpecialtyListResponse>(this as AppointmentSpecialtyListResponse, _$identity);

  /// Serializes this AppointmentSpecialtyListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentSpecialtyListResponse&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'AppointmentSpecialtyListResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class $AppointmentSpecialtyListResponseCopyWith<$Res>  {
  factory $AppointmentSpecialtyListResponseCopyWith(AppointmentSpecialtyListResponse value, $Res Function(AppointmentSpecialtyListResponse) _then) = _$AppointmentSpecialtyListResponseCopyWithImpl;
@useResult
$Res call({
 List<AppointmentSpecialty> data
});




}
/// @nodoc
class _$AppointmentSpecialtyListResponseCopyWithImpl<$Res>
    implements $AppointmentSpecialtyListResponseCopyWith<$Res> {
  _$AppointmentSpecialtyListResponseCopyWithImpl(this._self, this._then);

  final AppointmentSpecialtyListResponse _self;
  final $Res Function(AppointmentSpecialtyListResponse) _then;

/// Create a copy of AppointmentSpecialtyListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<AppointmentSpecialty>,
  ));
}

}


/// Adds pattern-matching-related methods to [AppointmentSpecialtyListResponse].
extension AppointmentSpecialtyListResponsePatterns on AppointmentSpecialtyListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppointmentSpecialtyListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppointmentSpecialtyListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppointmentSpecialtyListResponse value)  $default,){
final _that = this;
switch (_that) {
case _AppointmentSpecialtyListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppointmentSpecialtyListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AppointmentSpecialtyListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AppointmentSpecialty> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppointmentSpecialtyListResponse() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AppointmentSpecialty> data)  $default,) {final _that = this;
switch (_that) {
case _AppointmentSpecialtyListResponse():
return $default(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AppointmentSpecialty> data)?  $default,) {final _that = this;
switch (_that) {
case _AppointmentSpecialtyListResponse() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppointmentSpecialtyListResponse implements AppointmentSpecialtyListResponse {
  const _AppointmentSpecialtyListResponse({final  List<AppointmentSpecialty> data = const []}): _data = data;
  factory _AppointmentSpecialtyListResponse.fromJson(Map<String, dynamic> json) => _$AppointmentSpecialtyListResponseFromJson(json);

 final  List<AppointmentSpecialty> _data;
@override@JsonKey() List<AppointmentSpecialty> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of AppointmentSpecialtyListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentSpecialtyListResponseCopyWith<_AppointmentSpecialtyListResponse> get copyWith => __$AppointmentSpecialtyListResponseCopyWithImpl<_AppointmentSpecialtyListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentSpecialtyListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentSpecialtyListResponse&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'AppointmentSpecialtyListResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class _$AppointmentSpecialtyListResponseCopyWith<$Res> implements $AppointmentSpecialtyListResponseCopyWith<$Res> {
  factory _$AppointmentSpecialtyListResponseCopyWith(_AppointmentSpecialtyListResponse value, $Res Function(_AppointmentSpecialtyListResponse) _then) = __$AppointmentSpecialtyListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<AppointmentSpecialty> data
});




}
/// @nodoc
class __$AppointmentSpecialtyListResponseCopyWithImpl<$Res>
    implements _$AppointmentSpecialtyListResponseCopyWith<$Res> {
  __$AppointmentSpecialtyListResponseCopyWithImpl(this._self, this._then);

  final _AppointmentSpecialtyListResponse _self;
  final $Res Function(_AppointmentSpecialtyListResponse) _then;

/// Create a copy of AppointmentSpecialtyListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_AppointmentSpecialtyListResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<AppointmentSpecialty>,
  ));
}


}


/// @nodoc
mixin _$BookableDoctor {

 String get id; String get name; String get specialty; String? get avatarUrl;
/// Create a copy of BookableDoctor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookableDoctorCopyWith<BookableDoctor> get copyWith => _$BookableDoctorCopyWithImpl<BookableDoctor>(this as BookableDoctor, _$identity);

  /// Serializes this BookableDoctor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookableDoctor&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.specialty, specialty) || other.specialty == specialty)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,specialty,avatarUrl);

@override
String toString() {
  return 'BookableDoctor(id: $id, name: $name, specialty: $specialty, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $BookableDoctorCopyWith<$Res>  {
  factory $BookableDoctorCopyWith(BookableDoctor value, $Res Function(BookableDoctor) _then) = _$BookableDoctorCopyWithImpl;
@useResult
$Res call({
 String id, String name, String specialty, String? avatarUrl
});




}
/// @nodoc
class _$BookableDoctorCopyWithImpl<$Res>
    implements $BookableDoctorCopyWith<$Res> {
  _$BookableDoctorCopyWithImpl(this._self, this._then);

  final BookableDoctor _self;
  final $Res Function(BookableDoctor) _then;

/// Create a copy of BookableDoctor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? specialty = null,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,specialty: null == specialty ? _self.specialty : specialty // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BookableDoctor].
extension BookableDoctorPatterns on BookableDoctor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookableDoctor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookableDoctor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookableDoctor value)  $default,){
final _that = this;
switch (_that) {
case _BookableDoctor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookableDoctor value)?  $default,){
final _that = this;
switch (_that) {
case _BookableDoctor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String specialty,  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookableDoctor() when $default != null:
return $default(_that.id,_that.name,_that.specialty,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String specialty,  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _BookableDoctor():
return $default(_that.id,_that.name,_that.specialty,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String specialty,  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _BookableDoctor() when $default != null:
return $default(_that.id,_that.name,_that.specialty,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookableDoctor implements BookableDoctor {
  const _BookableDoctor({required this.id, required this.name, required this.specialty, this.avatarUrl});
  factory _BookableDoctor.fromJson(Map<String, dynamic> json) => _$BookableDoctorFromJson(json);

@override final  String id;
@override final  String name;
@override final  String specialty;
@override final  String? avatarUrl;

/// Create a copy of BookableDoctor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookableDoctorCopyWith<_BookableDoctor> get copyWith => __$BookableDoctorCopyWithImpl<_BookableDoctor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookableDoctorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookableDoctor&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.specialty, specialty) || other.specialty == specialty)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,specialty,avatarUrl);

@override
String toString() {
  return 'BookableDoctor(id: $id, name: $name, specialty: $specialty, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$BookableDoctorCopyWith<$Res> implements $BookableDoctorCopyWith<$Res> {
  factory _$BookableDoctorCopyWith(_BookableDoctor value, $Res Function(_BookableDoctor) _then) = __$BookableDoctorCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String specialty, String? avatarUrl
});




}
/// @nodoc
class __$BookableDoctorCopyWithImpl<$Res>
    implements _$BookableDoctorCopyWith<$Res> {
  __$BookableDoctorCopyWithImpl(this._self, this._then);

  final _BookableDoctor _self;
  final $Res Function(_BookableDoctor) _then;

/// Create a copy of BookableDoctor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? specialty = null,Object? avatarUrl = freezed,}) {
  return _then(_BookableDoctor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,specialty: null == specialty ? _self.specialty : specialty // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$BookableDoctorListResponse {

 List<BookableDoctor> get data;
/// Create a copy of BookableDoctorListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookableDoctorListResponseCopyWith<BookableDoctorListResponse> get copyWith => _$BookableDoctorListResponseCopyWithImpl<BookableDoctorListResponse>(this as BookableDoctorListResponse, _$identity);

  /// Serializes this BookableDoctorListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookableDoctorListResponse&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'BookableDoctorListResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class $BookableDoctorListResponseCopyWith<$Res>  {
  factory $BookableDoctorListResponseCopyWith(BookableDoctorListResponse value, $Res Function(BookableDoctorListResponse) _then) = _$BookableDoctorListResponseCopyWithImpl;
@useResult
$Res call({
 List<BookableDoctor> data
});




}
/// @nodoc
class _$BookableDoctorListResponseCopyWithImpl<$Res>
    implements $BookableDoctorListResponseCopyWith<$Res> {
  _$BookableDoctorListResponseCopyWithImpl(this._self, this._then);

  final BookableDoctorListResponse _self;
  final $Res Function(BookableDoctorListResponse) _then;

/// Create a copy of BookableDoctorListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<BookableDoctor>,
  ));
}

}


/// Adds pattern-matching-related methods to [BookableDoctorListResponse].
extension BookableDoctorListResponsePatterns on BookableDoctorListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookableDoctorListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookableDoctorListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookableDoctorListResponse value)  $default,){
final _that = this;
switch (_that) {
case _BookableDoctorListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookableDoctorListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BookableDoctorListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<BookableDoctor> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookableDoctorListResponse() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<BookableDoctor> data)  $default,) {final _that = this;
switch (_that) {
case _BookableDoctorListResponse():
return $default(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<BookableDoctor> data)?  $default,) {final _that = this;
switch (_that) {
case _BookableDoctorListResponse() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookableDoctorListResponse implements BookableDoctorListResponse {
  const _BookableDoctorListResponse({final  List<BookableDoctor> data = const []}): _data = data;
  factory _BookableDoctorListResponse.fromJson(Map<String, dynamic> json) => _$BookableDoctorListResponseFromJson(json);

 final  List<BookableDoctor> _data;
@override@JsonKey() List<BookableDoctor> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of BookableDoctorListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookableDoctorListResponseCopyWith<_BookableDoctorListResponse> get copyWith => __$BookableDoctorListResponseCopyWithImpl<_BookableDoctorListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookableDoctorListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookableDoctorListResponse&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'BookableDoctorListResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class _$BookableDoctorListResponseCopyWith<$Res> implements $BookableDoctorListResponseCopyWith<$Res> {
  factory _$BookableDoctorListResponseCopyWith(_BookableDoctorListResponse value, $Res Function(_BookableDoctorListResponse) _then) = __$BookableDoctorListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<BookableDoctor> data
});




}
/// @nodoc
class __$BookableDoctorListResponseCopyWithImpl<$Res>
    implements _$BookableDoctorListResponseCopyWith<$Res> {
  __$BookableDoctorListResponseCopyWithImpl(this._self, this._then);

  final _BookableDoctorListResponse _self;
  final $Res Function(_BookableDoctorListResponse) _then;

/// Create a copy of BookableDoctorListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_BookableDoctorListResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<BookableDoctor>,
  ));
}


}


/// @nodoc
mixin _$AvailabilitySlot {

 DateTime get scheduledAt; bool get available;
/// Create a copy of AvailabilitySlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailabilitySlotCopyWith<AvailabilitySlot> get copyWith => _$AvailabilitySlotCopyWithImpl<AvailabilitySlot>(this as AvailabilitySlot, _$identity);

  /// Serializes this AvailabilitySlot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailabilitySlot&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.available, available) || other.available == available));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,scheduledAt,available);

@override
String toString() {
  return 'AvailabilitySlot(scheduledAt: $scheduledAt, available: $available)';
}


}

/// @nodoc
abstract mixin class $AvailabilitySlotCopyWith<$Res>  {
  factory $AvailabilitySlotCopyWith(AvailabilitySlot value, $Res Function(AvailabilitySlot) _then) = _$AvailabilitySlotCopyWithImpl;
@useResult
$Res call({
 DateTime scheduledAt, bool available
});




}
/// @nodoc
class _$AvailabilitySlotCopyWithImpl<$Res>
    implements $AvailabilitySlotCopyWith<$Res> {
  _$AvailabilitySlotCopyWithImpl(this._self, this._then);

  final AvailabilitySlot _self;
  final $Res Function(AvailabilitySlot) _then;

/// Create a copy of AvailabilitySlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scheduledAt = null,Object? available = null,}) {
  return _then(_self.copyWith(
scheduledAt: null == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AvailabilitySlot].
extension AvailabilitySlotPatterns on AvailabilitySlot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvailabilitySlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvailabilitySlot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvailabilitySlot value)  $default,){
final _that = this;
switch (_that) {
case _AvailabilitySlot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvailabilitySlot value)?  $default,){
final _that = this;
switch (_that) {
case _AvailabilitySlot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime scheduledAt,  bool available)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvailabilitySlot() when $default != null:
return $default(_that.scheduledAt,_that.available);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime scheduledAt,  bool available)  $default,) {final _that = this;
switch (_that) {
case _AvailabilitySlot():
return $default(_that.scheduledAt,_that.available);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime scheduledAt,  bool available)?  $default,) {final _that = this;
switch (_that) {
case _AvailabilitySlot() when $default != null:
return $default(_that.scheduledAt,_that.available);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvailabilitySlot implements AvailabilitySlot {
  const _AvailabilitySlot({required this.scheduledAt, this.available = true});
  factory _AvailabilitySlot.fromJson(Map<String, dynamic> json) => _$AvailabilitySlotFromJson(json);

@override final  DateTime scheduledAt;
@override@JsonKey() final  bool available;

/// Create a copy of AvailabilitySlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvailabilitySlotCopyWith<_AvailabilitySlot> get copyWith => __$AvailabilitySlotCopyWithImpl<_AvailabilitySlot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvailabilitySlotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvailabilitySlot&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.available, available) || other.available == available));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,scheduledAt,available);

@override
String toString() {
  return 'AvailabilitySlot(scheduledAt: $scheduledAt, available: $available)';
}


}

/// @nodoc
abstract mixin class _$AvailabilitySlotCopyWith<$Res> implements $AvailabilitySlotCopyWith<$Res> {
  factory _$AvailabilitySlotCopyWith(_AvailabilitySlot value, $Res Function(_AvailabilitySlot) _then) = __$AvailabilitySlotCopyWithImpl;
@override @useResult
$Res call({
 DateTime scheduledAt, bool available
});




}
/// @nodoc
class __$AvailabilitySlotCopyWithImpl<$Res>
    implements _$AvailabilitySlotCopyWith<$Res> {
  __$AvailabilitySlotCopyWithImpl(this._self, this._then);

  final _AvailabilitySlot _self;
  final $Res Function(_AvailabilitySlot) _then;

/// Create a copy of AvailabilitySlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? scheduledAt = null,Object? available = null,}) {
  return _then(_AvailabilitySlot(
scheduledAt: null == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$AvailabilityResponse {

 String get doctorId; String get date; List<AvailabilitySlot> get slots;
/// Create a copy of AvailabilityResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailabilityResponseCopyWith<AvailabilityResponse> get copyWith => _$AvailabilityResponseCopyWithImpl<AvailabilityResponse>(this as AvailabilityResponse, _$identity);

  /// Serializes this AvailabilityResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailabilityResponse&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other.slots, slots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,date,const DeepCollectionEquality().hash(slots));

@override
String toString() {
  return 'AvailabilityResponse(doctorId: $doctorId, date: $date, slots: $slots)';
}


}

/// @nodoc
abstract mixin class $AvailabilityResponseCopyWith<$Res>  {
  factory $AvailabilityResponseCopyWith(AvailabilityResponse value, $Res Function(AvailabilityResponse) _then) = _$AvailabilityResponseCopyWithImpl;
@useResult
$Res call({
 String doctorId, String date, List<AvailabilitySlot> slots
});




}
/// @nodoc
class _$AvailabilityResponseCopyWithImpl<$Res>
    implements $AvailabilityResponseCopyWith<$Res> {
  _$AvailabilityResponseCopyWithImpl(this._self, this._then);

  final AvailabilityResponse _self;
  final $Res Function(AvailabilityResponse) _then;

/// Create a copy of AvailabilityResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? doctorId = null,Object? date = null,Object? slots = null,}) {
  return _then(_self.copyWith(
doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as List<AvailabilitySlot>,
  ));
}

}


/// Adds pattern-matching-related methods to [AvailabilityResponse].
extension AvailabilityResponsePatterns on AvailabilityResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvailabilityResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvailabilityResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvailabilityResponse value)  $default,){
final _that = this;
switch (_that) {
case _AvailabilityResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvailabilityResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AvailabilityResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String doctorId,  String date,  List<AvailabilitySlot> slots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvailabilityResponse() when $default != null:
return $default(_that.doctorId,_that.date,_that.slots);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String doctorId,  String date,  List<AvailabilitySlot> slots)  $default,) {final _that = this;
switch (_that) {
case _AvailabilityResponse():
return $default(_that.doctorId,_that.date,_that.slots);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String doctorId,  String date,  List<AvailabilitySlot> slots)?  $default,) {final _that = this;
switch (_that) {
case _AvailabilityResponse() when $default != null:
return $default(_that.doctorId,_that.date,_that.slots);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvailabilityResponse implements AvailabilityResponse {
  const _AvailabilityResponse({required this.doctorId, required this.date, final  List<AvailabilitySlot> slots = const []}): _slots = slots;
  factory _AvailabilityResponse.fromJson(Map<String, dynamic> json) => _$AvailabilityResponseFromJson(json);

@override final  String doctorId;
@override final  String date;
 final  List<AvailabilitySlot> _slots;
@override@JsonKey() List<AvailabilitySlot> get slots {
  if (_slots is EqualUnmodifiableListView) return _slots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slots);
}


/// Create a copy of AvailabilityResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvailabilityResponseCopyWith<_AvailabilityResponse> get copyWith => __$AvailabilityResponseCopyWithImpl<_AvailabilityResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvailabilityResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvailabilityResponse&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other._slots, _slots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,date,const DeepCollectionEquality().hash(_slots));

@override
String toString() {
  return 'AvailabilityResponse(doctorId: $doctorId, date: $date, slots: $slots)';
}


}

/// @nodoc
abstract mixin class _$AvailabilityResponseCopyWith<$Res> implements $AvailabilityResponseCopyWith<$Res> {
  factory _$AvailabilityResponseCopyWith(_AvailabilityResponse value, $Res Function(_AvailabilityResponse) _then) = __$AvailabilityResponseCopyWithImpl;
@override @useResult
$Res call({
 String doctorId, String date, List<AvailabilitySlot> slots
});




}
/// @nodoc
class __$AvailabilityResponseCopyWithImpl<$Res>
    implements _$AvailabilityResponseCopyWith<$Res> {
  __$AvailabilityResponseCopyWithImpl(this._self, this._then);

  final _AvailabilityResponse _self;
  final $Res Function(_AvailabilityResponse) _then;

/// Create a copy of AvailabilityResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doctorId = null,Object? date = null,Object? slots = null,}) {
  return _then(_AvailabilityResponse(
doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,slots: null == slots ? _self._slots : slots // ignore: cast_nullable_to_non_nullable
as List<AvailabilitySlot>,
  ));
}


}


/// @nodoc
mixin _$CreateAppointmentRequest {

 String get doctorId; DateTime get scheduledAt; String? get reason;
/// Create a copy of CreateAppointmentRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateAppointmentRequestCopyWith<CreateAppointmentRequest> get copyWith => _$CreateAppointmentRequestCopyWithImpl<CreateAppointmentRequest>(this as CreateAppointmentRequest, _$identity);

  /// Serializes this CreateAppointmentRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateAppointmentRequest&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,scheduledAt,reason);

@override
String toString() {
  return 'CreateAppointmentRequest(doctorId: $doctorId, scheduledAt: $scheduledAt, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $CreateAppointmentRequestCopyWith<$Res>  {
  factory $CreateAppointmentRequestCopyWith(CreateAppointmentRequest value, $Res Function(CreateAppointmentRequest) _then) = _$CreateAppointmentRequestCopyWithImpl;
@useResult
$Res call({
 String doctorId, DateTime scheduledAt, String? reason
});




}
/// @nodoc
class _$CreateAppointmentRequestCopyWithImpl<$Res>
    implements $CreateAppointmentRequestCopyWith<$Res> {
  _$CreateAppointmentRequestCopyWithImpl(this._self, this._then);

  final CreateAppointmentRequest _self;
  final $Res Function(CreateAppointmentRequest) _then;

/// Create a copy of CreateAppointmentRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? doctorId = null,Object? scheduledAt = null,Object? reason = freezed,}) {
  return _then(_self.copyWith(
doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,scheduledAt: null == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateAppointmentRequest].
extension CreateAppointmentRequestPatterns on CreateAppointmentRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateAppointmentRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateAppointmentRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateAppointmentRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateAppointmentRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateAppointmentRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateAppointmentRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String doctorId,  DateTime scheduledAt,  String? reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateAppointmentRequest() when $default != null:
return $default(_that.doctorId,_that.scheduledAt,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String doctorId,  DateTime scheduledAt,  String? reason)  $default,) {final _that = this;
switch (_that) {
case _CreateAppointmentRequest():
return $default(_that.doctorId,_that.scheduledAt,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String doctorId,  DateTime scheduledAt,  String? reason)?  $default,) {final _that = this;
switch (_that) {
case _CreateAppointmentRequest() when $default != null:
return $default(_that.doctorId,_that.scheduledAt,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateAppointmentRequest implements CreateAppointmentRequest {
  const _CreateAppointmentRequest({required this.doctorId, required this.scheduledAt, this.reason});
  factory _CreateAppointmentRequest.fromJson(Map<String, dynamic> json) => _$CreateAppointmentRequestFromJson(json);

@override final  String doctorId;
@override final  DateTime scheduledAt;
@override final  String? reason;

/// Create a copy of CreateAppointmentRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateAppointmentRequestCopyWith<_CreateAppointmentRequest> get copyWith => __$CreateAppointmentRequestCopyWithImpl<_CreateAppointmentRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateAppointmentRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateAppointmentRequest&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,scheduledAt,reason);

@override
String toString() {
  return 'CreateAppointmentRequest(doctorId: $doctorId, scheduledAt: $scheduledAt, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$CreateAppointmentRequestCopyWith<$Res> implements $CreateAppointmentRequestCopyWith<$Res> {
  factory _$CreateAppointmentRequestCopyWith(_CreateAppointmentRequest value, $Res Function(_CreateAppointmentRequest) _then) = __$CreateAppointmentRequestCopyWithImpl;
@override @useResult
$Res call({
 String doctorId, DateTime scheduledAt, String? reason
});




}
/// @nodoc
class __$CreateAppointmentRequestCopyWithImpl<$Res>
    implements _$CreateAppointmentRequestCopyWith<$Res> {
  __$CreateAppointmentRequestCopyWithImpl(this._self, this._then);

  final _CreateAppointmentRequest _self;
  final $Res Function(_CreateAppointmentRequest) _then;

/// Create a copy of CreateAppointmentRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doctorId = null,Object? scheduledAt = null,Object? reason = freezed,}) {
  return _then(_CreateAppointmentRequest(
doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,scheduledAt: null == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UpdateAppointmentRequest {

 DateTime? get scheduledAt; String? get reason;
/// Create a copy of UpdateAppointmentRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAppointmentRequestCopyWith<UpdateAppointmentRequest> get copyWith => _$UpdateAppointmentRequestCopyWithImpl<UpdateAppointmentRequest>(this as UpdateAppointmentRequest, _$identity);

  /// Serializes this UpdateAppointmentRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAppointmentRequest&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,scheduledAt,reason);

@override
String toString() {
  return 'UpdateAppointmentRequest(scheduledAt: $scheduledAt, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $UpdateAppointmentRequestCopyWith<$Res>  {
  factory $UpdateAppointmentRequestCopyWith(UpdateAppointmentRequest value, $Res Function(UpdateAppointmentRequest) _then) = _$UpdateAppointmentRequestCopyWithImpl;
@useResult
$Res call({
 DateTime? scheduledAt, String? reason
});




}
/// @nodoc
class _$UpdateAppointmentRequestCopyWithImpl<$Res>
    implements $UpdateAppointmentRequestCopyWith<$Res> {
  _$UpdateAppointmentRequestCopyWithImpl(this._self, this._then);

  final UpdateAppointmentRequest _self;
  final $Res Function(UpdateAppointmentRequest) _then;

/// Create a copy of UpdateAppointmentRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scheduledAt = freezed,Object? reason = freezed,}) {
  return _then(_self.copyWith(
scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateAppointmentRequest].
extension UpdateAppointmentRequestPatterns on UpdateAppointmentRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateAppointmentRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateAppointmentRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateAppointmentRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateAppointmentRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateAppointmentRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateAppointmentRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? scheduledAt,  String? reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateAppointmentRequest() when $default != null:
return $default(_that.scheduledAt,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? scheduledAt,  String? reason)  $default,) {final _that = this;
switch (_that) {
case _UpdateAppointmentRequest():
return $default(_that.scheduledAt,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? scheduledAt,  String? reason)?  $default,) {final _that = this;
switch (_that) {
case _UpdateAppointmentRequest() when $default != null:
return $default(_that.scheduledAt,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateAppointmentRequest implements UpdateAppointmentRequest {
  const _UpdateAppointmentRequest({this.scheduledAt, this.reason});
  factory _UpdateAppointmentRequest.fromJson(Map<String, dynamic> json) => _$UpdateAppointmentRequestFromJson(json);

@override final  DateTime? scheduledAt;
@override final  String? reason;

/// Create a copy of UpdateAppointmentRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateAppointmentRequestCopyWith<_UpdateAppointmentRequest> get copyWith => __$UpdateAppointmentRequestCopyWithImpl<_UpdateAppointmentRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateAppointmentRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateAppointmentRequest&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,scheduledAt,reason);

@override
String toString() {
  return 'UpdateAppointmentRequest(scheduledAt: $scheduledAt, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$UpdateAppointmentRequestCopyWith<$Res> implements $UpdateAppointmentRequestCopyWith<$Res> {
  factory _$UpdateAppointmentRequestCopyWith(_UpdateAppointmentRequest value, $Res Function(_UpdateAppointmentRequest) _then) = __$UpdateAppointmentRequestCopyWithImpl;
@override @useResult
$Res call({
 DateTime? scheduledAt, String? reason
});




}
/// @nodoc
class __$UpdateAppointmentRequestCopyWithImpl<$Res>
    implements _$UpdateAppointmentRequestCopyWith<$Res> {
  __$UpdateAppointmentRequestCopyWithImpl(this._self, this._then);

  final _UpdateAppointmentRequest _self;
  final $Res Function(_UpdateAppointmentRequest) _then;

/// Create a copy of UpdateAppointmentRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? scheduledAt = freezed,Object? reason = freezed,}) {
  return _then(_UpdateAppointmentRequest(
scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
