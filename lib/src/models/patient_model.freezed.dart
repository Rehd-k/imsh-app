// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Patient {

 String get id; String? get patientId; String? get cardNo; String? get title; String? get surname; String? get firstName; String? get otherName; DateTime? get dob; String? get gender; String? get email; String? get phoneNumber; String? get addressOfResidence; String? get hmo; String? get avatarUrl;
/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientCopyWith<Patient> get copyWith => _$PatientCopyWithImpl<Patient>(this as Patient, _$identity);

  /// Serializes this Patient to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Patient&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.cardNo, cardNo) || other.cardNo == cardNo)&&(identical(other.title, title) || other.title == title)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.otherName, otherName) || other.otherName == otherName)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.addressOfResidence, addressOfResidence) || other.addressOfResidence == addressOfResidence)&&(identical(other.hmo, hmo) || other.hmo == hmo)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,cardNo,title,surname,firstName,otherName,dob,gender,email,phoneNumber,addressOfResidence,hmo,avatarUrl);

@override
String toString() {
  return 'Patient(id: $id, patientId: $patientId, cardNo: $cardNo, title: $title, surname: $surname, firstName: $firstName, otherName: $otherName, dob: $dob, gender: $gender, email: $email, phoneNumber: $phoneNumber, addressOfResidence: $addressOfResidence, hmo: $hmo, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $PatientCopyWith<$Res>  {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) _then) = _$PatientCopyWithImpl;
@useResult
$Res call({
 String id, String? patientId, String? cardNo, String? title, String? surname, String? firstName, String? otherName, DateTime? dob, String? gender, String? email, String? phoneNumber, String? addressOfResidence, String? hmo, String? avatarUrl
});




}
/// @nodoc
class _$PatientCopyWithImpl<$Res>
    implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._self, this._then);

  final Patient _self;
  final $Res Function(Patient) _then;

/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? patientId = freezed,Object? cardNo = freezed,Object? title = freezed,Object? surname = freezed,Object? firstName = freezed,Object? otherName = freezed,Object? dob = freezed,Object? gender = freezed,Object? email = freezed,Object? phoneNumber = freezed,Object? addressOfResidence = freezed,Object? hmo = freezed,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patientId: freezed == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String?,cardNo: freezed == cardNo ? _self.cardNo : cardNo // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,surname: freezed == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,otherName: freezed == otherName ? _self.otherName : otherName // ignore: cast_nullable_to_non_nullable
as String?,dob: freezed == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as DateTime?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,addressOfResidence: freezed == addressOfResidence ? _self.addressOfResidence : addressOfResidence // ignore: cast_nullable_to_non_nullable
as String?,hmo: freezed == hmo ? _self.hmo : hmo // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Patient].
extension PatientPatterns on Patient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Patient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Patient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Patient value)  $default,){
final _that = this;
switch (_that) {
case _Patient():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Patient value)?  $default,){
final _that = this;
switch (_that) {
case _Patient() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? patientId,  String? cardNo,  String? title,  String? surname,  String? firstName,  String? otherName,  DateTime? dob,  String? gender,  String? email,  String? phoneNumber,  String? addressOfResidence,  String? hmo,  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Patient() when $default != null:
return $default(_that.id,_that.patientId,_that.cardNo,_that.title,_that.surname,_that.firstName,_that.otherName,_that.dob,_that.gender,_that.email,_that.phoneNumber,_that.addressOfResidence,_that.hmo,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? patientId,  String? cardNo,  String? title,  String? surname,  String? firstName,  String? otherName,  DateTime? dob,  String? gender,  String? email,  String? phoneNumber,  String? addressOfResidence,  String? hmo,  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _Patient():
return $default(_that.id,_that.patientId,_that.cardNo,_that.title,_that.surname,_that.firstName,_that.otherName,_that.dob,_that.gender,_that.email,_that.phoneNumber,_that.addressOfResidence,_that.hmo,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? patientId,  String? cardNo,  String? title,  String? surname,  String? firstName,  String? otherName,  DateTime? dob,  String? gender,  String? email,  String? phoneNumber,  String? addressOfResidence,  String? hmo,  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _Patient() when $default != null:
return $default(_that.id,_that.patientId,_that.cardNo,_that.title,_that.surname,_that.firstName,_that.otherName,_that.dob,_that.gender,_that.email,_that.phoneNumber,_that.addressOfResidence,_that.hmo,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Patient implements Patient {
  const _Patient({required this.id, this.patientId, this.cardNo, this.title, this.surname, this.firstName, this.otherName, this.dob, this.gender, this.email, this.phoneNumber, this.addressOfResidence, this.hmo, this.avatarUrl});
  factory _Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);

@override final  String id;
@override final  String? patientId;
@override final  String? cardNo;
@override final  String? title;
@override final  String? surname;
@override final  String? firstName;
@override final  String? otherName;
@override final  DateTime? dob;
@override final  String? gender;
@override final  String? email;
@override final  String? phoneNumber;
@override final  String? addressOfResidence;
@override final  String? hmo;
@override final  String? avatarUrl;

/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientCopyWith<_Patient> get copyWith => __$PatientCopyWithImpl<_Patient>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatientToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Patient&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.cardNo, cardNo) || other.cardNo == cardNo)&&(identical(other.title, title) || other.title == title)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.otherName, otherName) || other.otherName == otherName)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.addressOfResidence, addressOfResidence) || other.addressOfResidence == addressOfResidence)&&(identical(other.hmo, hmo) || other.hmo == hmo)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,cardNo,title,surname,firstName,otherName,dob,gender,email,phoneNumber,addressOfResidence,hmo,avatarUrl);

@override
String toString() {
  return 'Patient(id: $id, patientId: $patientId, cardNo: $cardNo, title: $title, surname: $surname, firstName: $firstName, otherName: $otherName, dob: $dob, gender: $gender, email: $email, phoneNumber: $phoneNumber, addressOfResidence: $addressOfResidence, hmo: $hmo, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$PatientCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$PatientCopyWith(_Patient value, $Res Function(_Patient) _then) = __$PatientCopyWithImpl;
@override @useResult
$Res call({
 String id, String? patientId, String? cardNo, String? title, String? surname, String? firstName, String? otherName, DateTime? dob, String? gender, String? email, String? phoneNumber, String? addressOfResidence, String? hmo, String? avatarUrl
});




}
/// @nodoc
class __$PatientCopyWithImpl<$Res>
    implements _$PatientCopyWith<$Res> {
  __$PatientCopyWithImpl(this._self, this._then);

  final _Patient _self;
  final $Res Function(_Patient) _then;

/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? patientId = freezed,Object? cardNo = freezed,Object? title = freezed,Object? surname = freezed,Object? firstName = freezed,Object? otherName = freezed,Object? dob = freezed,Object? gender = freezed,Object? email = freezed,Object? phoneNumber = freezed,Object? addressOfResidence = freezed,Object? hmo = freezed,Object? avatarUrl = freezed,}) {
  return _then(_Patient(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patientId: freezed == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String?,cardNo: freezed == cardNo ? _self.cardNo : cardNo // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,surname: freezed == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,otherName: freezed == otherName ? _self.otherName : otherName // ignore: cast_nullable_to_non_nullable
as String?,dob: freezed == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as DateTime?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,addressOfResidence: freezed == addressOfResidence ? _self.addressOfResidence : addressOfResidence // ignore: cast_nullable_to_non_nullable
as String?,hmo: freezed == hmo ? _self.hmo : hmo // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PatientLoginResponse {

 String get accessToken; Patient get patient; PatientDevice get device;
/// Create a copy of PatientLoginResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientLoginResponseCopyWith<PatientLoginResponse> get copyWith => _$PatientLoginResponseCopyWithImpl<PatientLoginResponse>(this as PatientLoginResponse, _$identity);

  /// Serializes this PatientLoginResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatientLoginResponse&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.patient, patient) || other.patient == patient)&&(identical(other.device, device) || other.device == device));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,patient,device);

@override
String toString() {
  return 'PatientLoginResponse(accessToken: $accessToken, patient: $patient, device: $device)';
}


}

/// @nodoc
abstract mixin class $PatientLoginResponseCopyWith<$Res>  {
  factory $PatientLoginResponseCopyWith(PatientLoginResponse value, $Res Function(PatientLoginResponse) _then) = _$PatientLoginResponseCopyWithImpl;
@useResult
$Res call({
 String accessToken, Patient patient, PatientDevice device
});


$PatientCopyWith<$Res> get patient;$PatientDeviceCopyWith<$Res> get device;

}
/// @nodoc
class _$PatientLoginResponseCopyWithImpl<$Res>
    implements $PatientLoginResponseCopyWith<$Res> {
  _$PatientLoginResponseCopyWithImpl(this._self, this._then);

  final PatientLoginResponse _self;
  final $Res Function(PatientLoginResponse) _then;

/// Create a copy of PatientLoginResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? patient = null,Object? device = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,patient: null == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as Patient,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as PatientDevice,
  ));
}
/// Create a copy of PatientLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatientCopyWith<$Res> get patient {
  
  return $PatientCopyWith<$Res>(_self.patient, (value) {
    return _then(_self.copyWith(patient: value));
  });
}/// Create a copy of PatientLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatientDeviceCopyWith<$Res> get device {
  
  return $PatientDeviceCopyWith<$Res>(_self.device, (value) {
    return _then(_self.copyWith(device: value));
  });
}
}


/// Adds pattern-matching-related methods to [PatientLoginResponse].
extension PatientLoginResponsePatterns on PatientLoginResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatientLoginResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatientLoginResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatientLoginResponse value)  $default,){
final _that = this;
switch (_that) {
case _PatientLoginResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatientLoginResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PatientLoginResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accessToken,  Patient patient,  PatientDevice device)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatientLoginResponse() when $default != null:
return $default(_that.accessToken,_that.patient,_that.device);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accessToken,  Patient patient,  PatientDevice device)  $default,) {final _that = this;
switch (_that) {
case _PatientLoginResponse():
return $default(_that.accessToken,_that.patient,_that.device);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accessToken,  Patient patient,  PatientDevice device)?  $default,) {final _that = this;
switch (_that) {
case _PatientLoginResponse() when $default != null:
return $default(_that.accessToken,_that.patient,_that.device);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatientLoginResponse implements PatientLoginResponse {
  const _PatientLoginResponse({required this.accessToken, required this.patient, required this.device});
  factory _PatientLoginResponse.fromJson(Map<String, dynamic> json) => _$PatientLoginResponseFromJson(json);

@override final  String accessToken;
@override final  Patient patient;
@override final  PatientDevice device;

/// Create a copy of PatientLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientLoginResponseCopyWith<_PatientLoginResponse> get copyWith => __$PatientLoginResponseCopyWithImpl<_PatientLoginResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatientLoginResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatientLoginResponse&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.patient, patient) || other.patient == patient)&&(identical(other.device, device) || other.device == device));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,patient,device);

@override
String toString() {
  return 'PatientLoginResponse(accessToken: $accessToken, patient: $patient, device: $device)';
}


}

/// @nodoc
abstract mixin class _$PatientLoginResponseCopyWith<$Res> implements $PatientLoginResponseCopyWith<$Res> {
  factory _$PatientLoginResponseCopyWith(_PatientLoginResponse value, $Res Function(_PatientLoginResponse) _then) = __$PatientLoginResponseCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, Patient patient, PatientDevice device
});


@override $PatientCopyWith<$Res> get patient;@override $PatientDeviceCopyWith<$Res> get device;

}
/// @nodoc
class __$PatientLoginResponseCopyWithImpl<$Res>
    implements _$PatientLoginResponseCopyWith<$Res> {
  __$PatientLoginResponseCopyWithImpl(this._self, this._then);

  final _PatientLoginResponse _self;
  final $Res Function(_PatientLoginResponse) _then;

/// Create a copy of PatientLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? patient = null,Object? device = null,}) {
  return _then(_PatientLoginResponse(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,patient: null == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as Patient,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as PatientDevice,
  ));
}

/// Create a copy of PatientLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatientCopyWith<$Res> get patient {
  
  return $PatientCopyWith<$Res>(_self.patient, (value) {
    return _then(_self.copyWith(patient: value));
  });
}/// Create a copy of PatientLoginResponse
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
