// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedbackDepartment {

 String get id; String get name;
/// Create a copy of FeedbackDepartment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedbackDepartmentCopyWith<FeedbackDepartment> get copyWith => _$FeedbackDepartmentCopyWithImpl<FeedbackDepartment>(this as FeedbackDepartment, _$identity);

  /// Serializes this FeedbackDepartment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbackDepartment&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'FeedbackDepartment(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $FeedbackDepartmentCopyWith<$Res>  {
  factory $FeedbackDepartmentCopyWith(FeedbackDepartment value, $Res Function(FeedbackDepartment) _then) = _$FeedbackDepartmentCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$FeedbackDepartmentCopyWithImpl<$Res>
    implements $FeedbackDepartmentCopyWith<$Res> {
  _$FeedbackDepartmentCopyWithImpl(this._self, this._then);

  final FeedbackDepartment _self;
  final $Res Function(FeedbackDepartment) _then;

/// Create a copy of FeedbackDepartment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FeedbackDepartment].
extension FeedbackDepartmentPatterns on FeedbackDepartment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedbackDepartment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedbackDepartment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedbackDepartment value)  $default,){
final _that = this;
switch (_that) {
case _FeedbackDepartment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedbackDepartment value)?  $default,){
final _that = this;
switch (_that) {
case _FeedbackDepartment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedbackDepartment() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name)  $default,) {final _that = this;
switch (_that) {
case _FeedbackDepartment():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _FeedbackDepartment() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeedbackDepartment implements FeedbackDepartment {
  const _FeedbackDepartment({required this.id, required this.name});
  factory _FeedbackDepartment.fromJson(Map<String, dynamic> json) => _$FeedbackDepartmentFromJson(json);

@override final  String id;
@override final  String name;

/// Create a copy of FeedbackDepartment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedbackDepartmentCopyWith<_FeedbackDepartment> get copyWith => __$FeedbackDepartmentCopyWithImpl<_FeedbackDepartment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeedbackDepartmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedbackDepartment&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'FeedbackDepartment(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$FeedbackDepartmentCopyWith<$Res> implements $FeedbackDepartmentCopyWith<$Res> {
  factory _$FeedbackDepartmentCopyWith(_FeedbackDepartment value, $Res Function(_FeedbackDepartment) _then) = __$FeedbackDepartmentCopyWithImpl;
@override @useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$FeedbackDepartmentCopyWithImpl<$Res>
    implements _$FeedbackDepartmentCopyWith<$Res> {
  __$FeedbackDepartmentCopyWithImpl(this._self, this._then);

  final _FeedbackDepartment _self;
  final $Res Function(_FeedbackDepartment) _then;

/// Create a copy of FeedbackDepartment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_FeedbackDepartment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$FeedbackResponder {

 String get id; String? get firstName; String? get lastName;
/// Create a copy of FeedbackResponder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedbackResponderCopyWith<FeedbackResponder> get copyWith => _$FeedbackResponderCopyWithImpl<FeedbackResponder>(this as FeedbackResponder, _$identity);

  /// Serializes this FeedbackResponder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbackResponder&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName);

@override
String toString() {
  return 'FeedbackResponder(id: $id, firstName: $firstName, lastName: $lastName)';
}


}

/// @nodoc
abstract mixin class $FeedbackResponderCopyWith<$Res>  {
  factory $FeedbackResponderCopyWith(FeedbackResponder value, $Res Function(FeedbackResponder) _then) = _$FeedbackResponderCopyWithImpl;
@useResult
$Res call({
 String id, String? firstName, String? lastName
});




}
/// @nodoc
class _$FeedbackResponderCopyWithImpl<$Res>
    implements $FeedbackResponderCopyWith<$Res> {
  _$FeedbackResponderCopyWithImpl(this._self, this._then);

  final FeedbackResponder _self;
  final $Res Function(FeedbackResponder) _then;

/// Create a copy of FeedbackResponder
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


/// Adds pattern-matching-related methods to [FeedbackResponder].
extension FeedbackResponderPatterns on FeedbackResponder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedbackResponder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedbackResponder() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedbackResponder value)  $default,){
final _that = this;
switch (_that) {
case _FeedbackResponder():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedbackResponder value)?  $default,){
final _that = this;
switch (_that) {
case _FeedbackResponder() when $default != null:
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
case _FeedbackResponder() when $default != null:
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
case _FeedbackResponder():
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
case _FeedbackResponder() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeedbackResponder implements FeedbackResponder {
  const _FeedbackResponder({required this.id, this.firstName, this.lastName});
  factory _FeedbackResponder.fromJson(Map<String, dynamic> json) => _$FeedbackResponderFromJson(json);

@override final  String id;
@override final  String? firstName;
@override final  String? lastName;

/// Create a copy of FeedbackResponder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedbackResponderCopyWith<_FeedbackResponder> get copyWith => __$FeedbackResponderCopyWithImpl<_FeedbackResponder>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeedbackResponderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedbackResponder&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName);

@override
String toString() {
  return 'FeedbackResponder(id: $id, firstName: $firstName, lastName: $lastName)';
}


}

/// @nodoc
abstract mixin class _$FeedbackResponderCopyWith<$Res> implements $FeedbackResponderCopyWith<$Res> {
  factory _$FeedbackResponderCopyWith(_FeedbackResponder value, $Res Function(_FeedbackResponder) _then) = __$FeedbackResponderCopyWithImpl;
@override @useResult
$Res call({
 String id, String? firstName, String? lastName
});




}
/// @nodoc
class __$FeedbackResponderCopyWithImpl<$Res>
    implements _$FeedbackResponderCopyWith<$Res> {
  __$FeedbackResponderCopyWithImpl(this._self, this._then);

  final _FeedbackResponder _self;
  final $Res Function(_FeedbackResponder) _then;

/// Create a copy of FeedbackResponder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = freezed,Object? lastName = freezed,}) {
  return _then(_FeedbackResponder(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PatientFeedback {

 String get id; PatientFeedbackKind get kind; PatientFeedbackStatus get status; String get subject; String get message; FeedbackDepartment? get department; String? get staffResponse; DateTime? get resolvedAt; FeedbackResponder? get respondedBy; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of PatientFeedback
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientFeedbackCopyWith<PatientFeedback> get copyWith => _$PatientFeedbackCopyWithImpl<PatientFeedback>(this as PatientFeedback, _$identity);

  /// Serializes this PatientFeedback to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatientFeedback&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.status, status) || other.status == status)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.message, message) || other.message == message)&&(identical(other.department, department) || other.department == department)&&(identical(other.staffResponse, staffResponse) || other.staffResponse == staffResponse)&&(identical(other.resolvedAt, resolvedAt) || other.resolvedAt == resolvedAt)&&(identical(other.respondedBy, respondedBy) || other.respondedBy == respondedBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,status,subject,message,department,staffResponse,resolvedAt,respondedBy,createdAt,updatedAt);

@override
String toString() {
  return 'PatientFeedback(id: $id, kind: $kind, status: $status, subject: $subject, message: $message, department: $department, staffResponse: $staffResponse, resolvedAt: $resolvedAt, respondedBy: $respondedBy, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PatientFeedbackCopyWith<$Res>  {
  factory $PatientFeedbackCopyWith(PatientFeedback value, $Res Function(PatientFeedback) _then) = _$PatientFeedbackCopyWithImpl;
@useResult
$Res call({
 String id, PatientFeedbackKind kind, PatientFeedbackStatus status, String subject, String message, FeedbackDepartment? department, String? staffResponse, DateTime? resolvedAt, FeedbackResponder? respondedBy, DateTime? createdAt, DateTime? updatedAt
});


$FeedbackDepartmentCopyWith<$Res>? get department;$FeedbackResponderCopyWith<$Res>? get respondedBy;

}
/// @nodoc
class _$PatientFeedbackCopyWithImpl<$Res>
    implements $PatientFeedbackCopyWith<$Res> {
  _$PatientFeedbackCopyWithImpl(this._self, this._then);

  final PatientFeedback _self;
  final $Res Function(PatientFeedback) _then;

/// Create a copy of PatientFeedback
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? status = null,Object? subject = null,Object? message = null,Object? department = freezed,Object? staffResponse = freezed,Object? resolvedAt = freezed,Object? respondedBy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PatientFeedbackKind,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PatientFeedbackStatus,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as FeedbackDepartment?,staffResponse: freezed == staffResponse ? _self.staffResponse : staffResponse // ignore: cast_nullable_to_non_nullable
as String?,resolvedAt: freezed == resolvedAt ? _self.resolvedAt : resolvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,respondedBy: freezed == respondedBy ? _self.respondedBy : respondedBy // ignore: cast_nullable_to_non_nullable
as FeedbackResponder?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of PatientFeedback
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FeedbackDepartmentCopyWith<$Res>? get department {
    if (_self.department == null) {
    return null;
  }

  return $FeedbackDepartmentCopyWith<$Res>(_self.department!, (value) {
    return _then(_self.copyWith(department: value));
  });
}/// Create a copy of PatientFeedback
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FeedbackResponderCopyWith<$Res>? get respondedBy {
    if (_self.respondedBy == null) {
    return null;
  }

  return $FeedbackResponderCopyWith<$Res>(_self.respondedBy!, (value) {
    return _then(_self.copyWith(respondedBy: value));
  });
}
}


/// Adds pattern-matching-related methods to [PatientFeedback].
extension PatientFeedbackPatterns on PatientFeedback {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatientFeedback value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatientFeedback() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatientFeedback value)  $default,){
final _that = this;
switch (_that) {
case _PatientFeedback():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatientFeedback value)?  $default,){
final _that = this;
switch (_that) {
case _PatientFeedback() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  PatientFeedbackKind kind,  PatientFeedbackStatus status,  String subject,  String message,  FeedbackDepartment? department,  String? staffResponse,  DateTime? resolvedAt,  FeedbackResponder? respondedBy,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatientFeedback() when $default != null:
return $default(_that.id,_that.kind,_that.status,_that.subject,_that.message,_that.department,_that.staffResponse,_that.resolvedAt,_that.respondedBy,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  PatientFeedbackKind kind,  PatientFeedbackStatus status,  String subject,  String message,  FeedbackDepartment? department,  String? staffResponse,  DateTime? resolvedAt,  FeedbackResponder? respondedBy,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _PatientFeedback():
return $default(_that.id,_that.kind,_that.status,_that.subject,_that.message,_that.department,_that.staffResponse,_that.resolvedAt,_that.respondedBy,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  PatientFeedbackKind kind,  PatientFeedbackStatus status,  String subject,  String message,  FeedbackDepartment? department,  String? staffResponse,  DateTime? resolvedAt,  FeedbackResponder? respondedBy,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _PatientFeedback() when $default != null:
return $default(_that.id,_that.kind,_that.status,_that.subject,_that.message,_that.department,_that.staffResponse,_that.resolvedAt,_that.respondedBy,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatientFeedback implements PatientFeedback {
  const _PatientFeedback({required this.id, required this.kind, required this.status, required this.subject, required this.message, this.department, this.staffResponse, this.resolvedAt, this.respondedBy, this.createdAt, this.updatedAt});
  factory _PatientFeedback.fromJson(Map<String, dynamic> json) => _$PatientFeedbackFromJson(json);

@override final  String id;
@override final  PatientFeedbackKind kind;
@override final  PatientFeedbackStatus status;
@override final  String subject;
@override final  String message;
@override final  FeedbackDepartment? department;
@override final  String? staffResponse;
@override final  DateTime? resolvedAt;
@override final  FeedbackResponder? respondedBy;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of PatientFeedback
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientFeedbackCopyWith<_PatientFeedback> get copyWith => __$PatientFeedbackCopyWithImpl<_PatientFeedback>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatientFeedbackToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatientFeedback&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.status, status) || other.status == status)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.message, message) || other.message == message)&&(identical(other.department, department) || other.department == department)&&(identical(other.staffResponse, staffResponse) || other.staffResponse == staffResponse)&&(identical(other.resolvedAt, resolvedAt) || other.resolvedAt == resolvedAt)&&(identical(other.respondedBy, respondedBy) || other.respondedBy == respondedBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,status,subject,message,department,staffResponse,resolvedAt,respondedBy,createdAt,updatedAt);

@override
String toString() {
  return 'PatientFeedback(id: $id, kind: $kind, status: $status, subject: $subject, message: $message, department: $department, staffResponse: $staffResponse, resolvedAt: $resolvedAt, respondedBy: $respondedBy, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PatientFeedbackCopyWith<$Res> implements $PatientFeedbackCopyWith<$Res> {
  factory _$PatientFeedbackCopyWith(_PatientFeedback value, $Res Function(_PatientFeedback) _then) = __$PatientFeedbackCopyWithImpl;
@override @useResult
$Res call({
 String id, PatientFeedbackKind kind, PatientFeedbackStatus status, String subject, String message, FeedbackDepartment? department, String? staffResponse, DateTime? resolvedAt, FeedbackResponder? respondedBy, DateTime? createdAt, DateTime? updatedAt
});


@override $FeedbackDepartmentCopyWith<$Res>? get department;@override $FeedbackResponderCopyWith<$Res>? get respondedBy;

}
/// @nodoc
class __$PatientFeedbackCopyWithImpl<$Res>
    implements _$PatientFeedbackCopyWith<$Res> {
  __$PatientFeedbackCopyWithImpl(this._self, this._then);

  final _PatientFeedback _self;
  final $Res Function(_PatientFeedback) _then;

/// Create a copy of PatientFeedback
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? status = null,Object? subject = null,Object? message = null,Object? department = freezed,Object? staffResponse = freezed,Object? resolvedAt = freezed,Object? respondedBy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_PatientFeedback(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PatientFeedbackKind,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PatientFeedbackStatus,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as FeedbackDepartment?,staffResponse: freezed == staffResponse ? _self.staffResponse : staffResponse // ignore: cast_nullable_to_non_nullable
as String?,resolvedAt: freezed == resolvedAt ? _self.resolvedAt : resolvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,respondedBy: freezed == respondedBy ? _self.respondedBy : respondedBy // ignore: cast_nullable_to_non_nullable
as FeedbackResponder?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of PatientFeedback
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FeedbackDepartmentCopyWith<$Res>? get department {
    if (_self.department == null) {
    return null;
  }

  return $FeedbackDepartmentCopyWith<$Res>(_self.department!, (value) {
    return _then(_self.copyWith(department: value));
  });
}/// Create a copy of PatientFeedback
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FeedbackResponderCopyWith<$Res>? get respondedBy {
    if (_self.respondedBy == null) {
    return null;
  }

  return $FeedbackResponderCopyWith<$Res>(_self.respondedBy!, (value) {
    return _then(_self.copyWith(respondedBy: value));
  });
}
}


/// @nodoc
mixin _$PatientFeedbackListResponse {

 List<PatientFeedback> get data; int get total; int get page; int get limit;
/// Create a copy of PatientFeedbackListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientFeedbackListResponseCopyWith<PatientFeedbackListResponse> get copyWith => _$PatientFeedbackListResponseCopyWithImpl<PatientFeedbackListResponse>(this as PatientFeedbackListResponse, _$identity);

  /// Serializes this PatientFeedbackListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatientFeedbackListResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),total,page,limit);

@override
String toString() {
  return 'PatientFeedbackListResponse(data: $data, total: $total, page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $PatientFeedbackListResponseCopyWith<$Res>  {
  factory $PatientFeedbackListResponseCopyWith(PatientFeedbackListResponse value, $Res Function(PatientFeedbackListResponse) _then) = _$PatientFeedbackListResponseCopyWithImpl;
@useResult
$Res call({
 List<PatientFeedback> data, int total, int page, int limit
});




}
/// @nodoc
class _$PatientFeedbackListResponseCopyWithImpl<$Res>
    implements $PatientFeedbackListResponseCopyWith<$Res> {
  _$PatientFeedbackListResponseCopyWithImpl(this._self, this._then);

  final PatientFeedbackListResponse _self;
  final $Res Function(PatientFeedbackListResponse) _then;

/// Create a copy of PatientFeedbackListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? total = null,Object? page = null,Object? limit = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<PatientFeedback>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PatientFeedbackListResponse].
extension PatientFeedbackListResponsePatterns on PatientFeedbackListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatientFeedbackListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatientFeedbackListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatientFeedbackListResponse value)  $default,){
final _that = this;
switch (_that) {
case _PatientFeedbackListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatientFeedbackListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PatientFeedbackListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PatientFeedback> data,  int total,  int page,  int limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatientFeedbackListResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PatientFeedback> data,  int total,  int page,  int limit)  $default,) {final _that = this;
switch (_that) {
case _PatientFeedbackListResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PatientFeedback> data,  int total,  int page,  int limit)?  $default,) {final _that = this;
switch (_that) {
case _PatientFeedbackListResponse() when $default != null:
return $default(_that.data,_that.total,_that.page,_that.limit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatientFeedbackListResponse implements PatientFeedbackListResponse {
  const _PatientFeedbackListResponse({final  List<PatientFeedback> data = const [], this.total = 0, this.page = 1, this.limit = 20}): _data = data;
  factory _PatientFeedbackListResponse.fromJson(Map<String, dynamic> json) => _$PatientFeedbackListResponseFromJson(json);

 final  List<PatientFeedback> _data;
@override@JsonKey() List<PatientFeedback> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey() final  int total;
@override@JsonKey() final  int page;
@override@JsonKey() final  int limit;

/// Create a copy of PatientFeedbackListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientFeedbackListResponseCopyWith<_PatientFeedbackListResponse> get copyWith => __$PatientFeedbackListResponseCopyWithImpl<_PatientFeedbackListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatientFeedbackListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatientFeedbackListResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),total,page,limit);

@override
String toString() {
  return 'PatientFeedbackListResponse(data: $data, total: $total, page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$PatientFeedbackListResponseCopyWith<$Res> implements $PatientFeedbackListResponseCopyWith<$Res> {
  factory _$PatientFeedbackListResponseCopyWith(_PatientFeedbackListResponse value, $Res Function(_PatientFeedbackListResponse) _then) = __$PatientFeedbackListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<PatientFeedback> data, int total, int page, int limit
});




}
/// @nodoc
class __$PatientFeedbackListResponseCopyWithImpl<$Res>
    implements _$PatientFeedbackListResponseCopyWith<$Res> {
  __$PatientFeedbackListResponseCopyWithImpl(this._self, this._then);

  final _PatientFeedbackListResponse _self;
  final $Res Function(_PatientFeedbackListResponse) _then;

/// Create a copy of PatientFeedbackListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? total = null,Object? page = null,Object? limit = null,}) {
  return _then(_PatientFeedbackListResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<PatientFeedback>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CloseFeedbackResponse {

 String get id; PatientFeedbackStatus get status; String? get message;
/// Create a copy of CloseFeedbackResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloseFeedbackResponseCopyWith<CloseFeedbackResponse> get copyWith => _$CloseFeedbackResponseCopyWithImpl<CloseFeedbackResponse>(this as CloseFeedbackResponse, _$identity);

  /// Serializes this CloseFeedbackResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloseFeedbackResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,message);

@override
String toString() {
  return 'CloseFeedbackResponse(id: $id, status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class $CloseFeedbackResponseCopyWith<$Res>  {
  factory $CloseFeedbackResponseCopyWith(CloseFeedbackResponse value, $Res Function(CloseFeedbackResponse) _then) = _$CloseFeedbackResponseCopyWithImpl;
@useResult
$Res call({
 String id, PatientFeedbackStatus status, String? message
});




}
/// @nodoc
class _$CloseFeedbackResponseCopyWithImpl<$Res>
    implements $CloseFeedbackResponseCopyWith<$Res> {
  _$CloseFeedbackResponseCopyWithImpl(this._self, this._then);

  final CloseFeedbackResponse _self;
  final $Res Function(CloseFeedbackResponse) _then;

/// Create a copy of CloseFeedbackResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PatientFeedbackStatus,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CloseFeedbackResponse].
extension CloseFeedbackResponsePatterns on CloseFeedbackResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloseFeedbackResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloseFeedbackResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloseFeedbackResponse value)  $default,){
final _that = this;
switch (_that) {
case _CloseFeedbackResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloseFeedbackResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CloseFeedbackResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  PatientFeedbackStatus status,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloseFeedbackResponse() when $default != null:
return $default(_that.id,_that.status,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  PatientFeedbackStatus status,  String? message)  $default,) {final _that = this;
switch (_that) {
case _CloseFeedbackResponse():
return $default(_that.id,_that.status,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  PatientFeedbackStatus status,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _CloseFeedbackResponse() when $default != null:
return $default(_that.id,_that.status,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloseFeedbackResponse implements CloseFeedbackResponse {
  const _CloseFeedbackResponse({required this.id, required this.status, this.message});
  factory _CloseFeedbackResponse.fromJson(Map<String, dynamic> json) => _$CloseFeedbackResponseFromJson(json);

@override final  String id;
@override final  PatientFeedbackStatus status;
@override final  String? message;

/// Create a copy of CloseFeedbackResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloseFeedbackResponseCopyWith<_CloseFeedbackResponse> get copyWith => __$CloseFeedbackResponseCopyWithImpl<_CloseFeedbackResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloseFeedbackResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloseFeedbackResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,message);

@override
String toString() {
  return 'CloseFeedbackResponse(id: $id, status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class _$CloseFeedbackResponseCopyWith<$Res> implements $CloseFeedbackResponseCopyWith<$Res> {
  factory _$CloseFeedbackResponseCopyWith(_CloseFeedbackResponse value, $Res Function(_CloseFeedbackResponse) _then) = __$CloseFeedbackResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, PatientFeedbackStatus status, String? message
});




}
/// @nodoc
class __$CloseFeedbackResponseCopyWithImpl<$Res>
    implements _$CloseFeedbackResponseCopyWith<$Res> {
  __$CloseFeedbackResponseCopyWithImpl(this._self, this._then);

  final _CloseFeedbackResponse _self;
  final $Res Function(_CloseFeedbackResponse) _then;

/// Create a copy of CloseFeedbackResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? message = freezed,}) {
  return _then(_CloseFeedbackResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PatientFeedbackStatus,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
