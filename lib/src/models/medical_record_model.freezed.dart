// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medical_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EncounterSummary {

 String get id; EncounterType get encounterType; EncounterStatus get status; DateTime get startTime; DateTime? get endTime; String? get chiefComplaint; String? get visitType; String get doctorName; String? get primaryDiagnosis;
/// Create a copy of EncounterSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EncounterSummaryCopyWith<EncounterSummary> get copyWith => _$EncounterSummaryCopyWithImpl<EncounterSummary>(this as EncounterSummary, _$identity);

  /// Serializes this EncounterSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EncounterSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.encounterType, encounterType) || other.encounterType == encounterType)&&(identical(other.status, status) || other.status == status)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.chiefComplaint, chiefComplaint) || other.chiefComplaint == chiefComplaint)&&(identical(other.visitType, visitType) || other.visitType == visitType)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.primaryDiagnosis, primaryDiagnosis) || other.primaryDiagnosis == primaryDiagnosis));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,encounterType,status,startTime,endTime,chiefComplaint,visitType,doctorName,primaryDiagnosis);

@override
String toString() {
  return 'EncounterSummary(id: $id, encounterType: $encounterType, status: $status, startTime: $startTime, endTime: $endTime, chiefComplaint: $chiefComplaint, visitType: $visitType, doctorName: $doctorName, primaryDiagnosis: $primaryDiagnosis)';
}


}

/// @nodoc
abstract mixin class $EncounterSummaryCopyWith<$Res>  {
  factory $EncounterSummaryCopyWith(EncounterSummary value, $Res Function(EncounterSummary) _then) = _$EncounterSummaryCopyWithImpl;
@useResult
$Res call({
 String id, EncounterType encounterType, EncounterStatus status, DateTime startTime, DateTime? endTime, String? chiefComplaint, String? visitType, String doctorName, String? primaryDiagnosis
});




}
/// @nodoc
class _$EncounterSummaryCopyWithImpl<$Res>
    implements $EncounterSummaryCopyWith<$Res> {
  _$EncounterSummaryCopyWithImpl(this._self, this._then);

  final EncounterSummary _self;
  final $Res Function(EncounterSummary) _then;

/// Create a copy of EncounterSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? encounterType = null,Object? status = null,Object? startTime = null,Object? endTime = freezed,Object? chiefComplaint = freezed,Object? visitType = freezed,Object? doctorName = null,Object? primaryDiagnosis = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,encounterType: null == encounterType ? _self.encounterType : encounterType // ignore: cast_nullable_to_non_nullable
as EncounterType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EncounterStatus,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,chiefComplaint: freezed == chiefComplaint ? _self.chiefComplaint : chiefComplaint // ignore: cast_nullable_to_non_nullable
as String?,visitType: freezed == visitType ? _self.visitType : visitType // ignore: cast_nullable_to_non_nullable
as String?,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,primaryDiagnosis: freezed == primaryDiagnosis ? _self.primaryDiagnosis : primaryDiagnosis // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EncounterSummary].
extension EncounterSummaryPatterns on EncounterSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EncounterSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EncounterSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EncounterSummary value)  $default,){
final _that = this;
switch (_that) {
case _EncounterSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EncounterSummary value)?  $default,){
final _that = this;
switch (_that) {
case _EncounterSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  EncounterType encounterType,  EncounterStatus status,  DateTime startTime,  DateTime? endTime,  String? chiefComplaint,  String? visitType,  String doctorName,  String? primaryDiagnosis)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EncounterSummary() when $default != null:
return $default(_that.id,_that.encounterType,_that.status,_that.startTime,_that.endTime,_that.chiefComplaint,_that.visitType,_that.doctorName,_that.primaryDiagnosis);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  EncounterType encounterType,  EncounterStatus status,  DateTime startTime,  DateTime? endTime,  String? chiefComplaint,  String? visitType,  String doctorName,  String? primaryDiagnosis)  $default,) {final _that = this;
switch (_that) {
case _EncounterSummary():
return $default(_that.id,_that.encounterType,_that.status,_that.startTime,_that.endTime,_that.chiefComplaint,_that.visitType,_that.doctorName,_that.primaryDiagnosis);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  EncounterType encounterType,  EncounterStatus status,  DateTime startTime,  DateTime? endTime,  String? chiefComplaint,  String? visitType,  String doctorName,  String? primaryDiagnosis)?  $default,) {final _that = this;
switch (_that) {
case _EncounterSummary() when $default != null:
return $default(_that.id,_that.encounterType,_that.status,_that.startTime,_that.endTime,_that.chiefComplaint,_that.visitType,_that.doctorName,_that.primaryDiagnosis);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EncounterSummary implements EncounterSummary {
  const _EncounterSummary({required this.id, required this.encounterType, required this.status, required this.startTime, this.endTime, this.chiefComplaint, this.visitType, required this.doctorName, this.primaryDiagnosis});
  factory _EncounterSummary.fromJson(Map<String, dynamic> json) => _$EncounterSummaryFromJson(json);

@override final  String id;
@override final  EncounterType encounterType;
@override final  EncounterStatus status;
@override final  DateTime startTime;
@override final  DateTime? endTime;
@override final  String? chiefComplaint;
@override final  String? visitType;
@override final  String doctorName;
@override final  String? primaryDiagnosis;

/// Create a copy of EncounterSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EncounterSummaryCopyWith<_EncounterSummary> get copyWith => __$EncounterSummaryCopyWithImpl<_EncounterSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EncounterSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EncounterSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.encounterType, encounterType) || other.encounterType == encounterType)&&(identical(other.status, status) || other.status == status)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.chiefComplaint, chiefComplaint) || other.chiefComplaint == chiefComplaint)&&(identical(other.visitType, visitType) || other.visitType == visitType)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.primaryDiagnosis, primaryDiagnosis) || other.primaryDiagnosis == primaryDiagnosis));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,encounterType,status,startTime,endTime,chiefComplaint,visitType,doctorName,primaryDiagnosis);

@override
String toString() {
  return 'EncounterSummary(id: $id, encounterType: $encounterType, status: $status, startTime: $startTime, endTime: $endTime, chiefComplaint: $chiefComplaint, visitType: $visitType, doctorName: $doctorName, primaryDiagnosis: $primaryDiagnosis)';
}


}

/// @nodoc
abstract mixin class _$EncounterSummaryCopyWith<$Res> implements $EncounterSummaryCopyWith<$Res> {
  factory _$EncounterSummaryCopyWith(_EncounterSummary value, $Res Function(_EncounterSummary) _then) = __$EncounterSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, EncounterType encounterType, EncounterStatus status, DateTime startTime, DateTime? endTime, String? chiefComplaint, String? visitType, String doctorName, String? primaryDiagnosis
});




}
/// @nodoc
class __$EncounterSummaryCopyWithImpl<$Res>
    implements _$EncounterSummaryCopyWith<$Res> {
  __$EncounterSummaryCopyWithImpl(this._self, this._then);

  final _EncounterSummary _self;
  final $Res Function(_EncounterSummary) _then;

/// Create a copy of EncounterSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? encounterType = null,Object? status = null,Object? startTime = null,Object? endTime = freezed,Object? chiefComplaint = freezed,Object? visitType = freezed,Object? doctorName = null,Object? primaryDiagnosis = freezed,}) {
  return _then(_EncounterSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,encounterType: null == encounterType ? _self.encounterType : encounterType // ignore: cast_nullable_to_non_nullable
as EncounterType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EncounterStatus,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,chiefComplaint: freezed == chiefComplaint ? _self.chiefComplaint : chiefComplaint // ignore: cast_nullable_to_non_nullable
as String?,visitType: freezed == visitType ? _self.visitType : visitType // ignore: cast_nullable_to_non_nullable
as String?,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,primaryDiagnosis: freezed == primaryDiagnosis ? _self.primaryDiagnosis : primaryDiagnosis // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$EncounterListResponse {

 List<EncounterSummary> get data; int get total; int get page; int get limit;
/// Create a copy of EncounterListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EncounterListResponseCopyWith<EncounterListResponse> get copyWith => _$EncounterListResponseCopyWithImpl<EncounterListResponse>(this as EncounterListResponse, _$identity);

  /// Serializes this EncounterListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EncounterListResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),total,page,limit);

@override
String toString() {
  return 'EncounterListResponse(data: $data, total: $total, page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $EncounterListResponseCopyWith<$Res>  {
  factory $EncounterListResponseCopyWith(EncounterListResponse value, $Res Function(EncounterListResponse) _then) = _$EncounterListResponseCopyWithImpl;
@useResult
$Res call({
 List<EncounterSummary> data, int total, int page, int limit
});




}
/// @nodoc
class _$EncounterListResponseCopyWithImpl<$Res>
    implements $EncounterListResponseCopyWith<$Res> {
  _$EncounterListResponseCopyWithImpl(this._self, this._then);

  final EncounterListResponse _self;
  final $Res Function(EncounterListResponse) _then;

/// Create a copy of EncounterListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? total = null,Object? page = null,Object? limit = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<EncounterSummary>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [EncounterListResponse].
extension EncounterListResponsePatterns on EncounterListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EncounterListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EncounterListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EncounterListResponse value)  $default,){
final _that = this;
switch (_that) {
case _EncounterListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EncounterListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _EncounterListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<EncounterSummary> data,  int total,  int page,  int limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EncounterListResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<EncounterSummary> data,  int total,  int page,  int limit)  $default,) {final _that = this;
switch (_that) {
case _EncounterListResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<EncounterSummary> data,  int total,  int page,  int limit)?  $default,) {final _that = this;
switch (_that) {
case _EncounterListResponse() when $default != null:
return $default(_that.data,_that.total,_that.page,_that.limit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EncounterListResponse implements EncounterListResponse {
  const _EncounterListResponse({required final  List<EncounterSummary> data, required this.total, required this.page, required this.limit}): _data = data;
  factory _EncounterListResponse.fromJson(Map<String, dynamic> json) => _$EncounterListResponseFromJson(json);

 final  List<EncounterSummary> _data;
@override List<EncounterSummary> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  int total;
@override final  int page;
@override final  int limit;

/// Create a copy of EncounterListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EncounterListResponseCopyWith<_EncounterListResponse> get copyWith => __$EncounterListResponseCopyWithImpl<_EncounterListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EncounterListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EncounterListResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),total,page,limit);

@override
String toString() {
  return 'EncounterListResponse(data: $data, total: $total, page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$EncounterListResponseCopyWith<$Res> implements $EncounterListResponseCopyWith<$Res> {
  factory _$EncounterListResponseCopyWith(_EncounterListResponse value, $Res Function(_EncounterListResponse) _then) = __$EncounterListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<EncounterSummary> data, int total, int page, int limit
});




}
/// @nodoc
class __$EncounterListResponseCopyWithImpl<$Res>
    implements _$EncounterListResponseCopyWith<$Res> {
  __$EncounterListResponseCopyWithImpl(this._self, this._then);

  final _EncounterListResponse _self;
  final $Res Function(_EncounterListResponse) _then;

/// Create a copy of EncounterListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? total = null,Object? page = null,Object? limit = null,}) {
  return _then(_EncounterListResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<EncounterSummary>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$EncounterVitals {

 int? get systolic; int? get diastolic; double? get temperature; double? get height; double? get weight; double? get bmi; int? get pulseRate; int? get respRate; double? get spo2; int? get painScore; double? get bloodGlucose; DateTime? get recordedAt;
/// Create a copy of EncounterVitals
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EncounterVitalsCopyWith<EncounterVitals> get copyWith => _$EncounterVitalsCopyWithImpl<EncounterVitals>(this as EncounterVitals, _$identity);

  /// Serializes this EncounterVitals to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EncounterVitals&&(identical(other.systolic, systolic) || other.systolic == systolic)&&(identical(other.diastolic, diastolic) || other.diastolic == diastolic)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.height, height) || other.height == height)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.bmi, bmi) || other.bmi == bmi)&&(identical(other.pulseRate, pulseRate) || other.pulseRate == pulseRate)&&(identical(other.respRate, respRate) || other.respRate == respRate)&&(identical(other.spo2, spo2) || other.spo2 == spo2)&&(identical(other.painScore, painScore) || other.painScore == painScore)&&(identical(other.bloodGlucose, bloodGlucose) || other.bloodGlucose == bloodGlucose)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,systolic,diastolic,temperature,height,weight,bmi,pulseRate,respRate,spo2,painScore,bloodGlucose,recordedAt);

@override
String toString() {
  return 'EncounterVitals(systolic: $systolic, diastolic: $diastolic, temperature: $temperature, height: $height, weight: $weight, bmi: $bmi, pulseRate: $pulseRate, respRate: $respRate, spo2: $spo2, painScore: $painScore, bloodGlucose: $bloodGlucose, recordedAt: $recordedAt)';
}


}

/// @nodoc
abstract mixin class $EncounterVitalsCopyWith<$Res>  {
  factory $EncounterVitalsCopyWith(EncounterVitals value, $Res Function(EncounterVitals) _then) = _$EncounterVitalsCopyWithImpl;
@useResult
$Res call({
 int? systolic, int? diastolic, double? temperature, double? height, double? weight, double? bmi, int? pulseRate, int? respRate, double? spo2, int? painScore, double? bloodGlucose, DateTime? recordedAt
});




}
/// @nodoc
class _$EncounterVitalsCopyWithImpl<$Res>
    implements $EncounterVitalsCopyWith<$Res> {
  _$EncounterVitalsCopyWithImpl(this._self, this._then);

  final EncounterVitals _self;
  final $Res Function(EncounterVitals) _then;

/// Create a copy of EncounterVitals
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? systolic = freezed,Object? diastolic = freezed,Object? temperature = freezed,Object? height = freezed,Object? weight = freezed,Object? bmi = freezed,Object? pulseRate = freezed,Object? respRate = freezed,Object? spo2 = freezed,Object? painScore = freezed,Object? bloodGlucose = freezed,Object? recordedAt = freezed,}) {
  return _then(_self.copyWith(
systolic: freezed == systolic ? _self.systolic : systolic // ignore: cast_nullable_to_non_nullable
as int?,diastolic: freezed == diastolic ? _self.diastolic : diastolic // ignore: cast_nullable_to_non_nullable
as int?,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,bmi: freezed == bmi ? _self.bmi : bmi // ignore: cast_nullable_to_non_nullable
as double?,pulseRate: freezed == pulseRate ? _self.pulseRate : pulseRate // ignore: cast_nullable_to_non_nullable
as int?,respRate: freezed == respRate ? _self.respRate : respRate // ignore: cast_nullable_to_non_nullable
as int?,spo2: freezed == spo2 ? _self.spo2 : spo2 // ignore: cast_nullable_to_non_nullable
as double?,painScore: freezed == painScore ? _self.painScore : painScore // ignore: cast_nullable_to_non_nullable
as int?,bloodGlucose: freezed == bloodGlucose ? _self.bloodGlucose : bloodGlucose // ignore: cast_nullable_to_non_nullable
as double?,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [EncounterVitals].
extension EncounterVitalsPatterns on EncounterVitals {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EncounterVitals value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EncounterVitals() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EncounterVitals value)  $default,){
final _that = this;
switch (_that) {
case _EncounterVitals():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EncounterVitals value)?  $default,){
final _that = this;
switch (_that) {
case _EncounterVitals() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? systolic,  int? diastolic,  double? temperature,  double? height,  double? weight,  double? bmi,  int? pulseRate,  int? respRate,  double? spo2,  int? painScore,  double? bloodGlucose,  DateTime? recordedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EncounterVitals() when $default != null:
return $default(_that.systolic,_that.diastolic,_that.temperature,_that.height,_that.weight,_that.bmi,_that.pulseRate,_that.respRate,_that.spo2,_that.painScore,_that.bloodGlucose,_that.recordedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? systolic,  int? diastolic,  double? temperature,  double? height,  double? weight,  double? bmi,  int? pulseRate,  int? respRate,  double? spo2,  int? painScore,  double? bloodGlucose,  DateTime? recordedAt)  $default,) {final _that = this;
switch (_that) {
case _EncounterVitals():
return $default(_that.systolic,_that.diastolic,_that.temperature,_that.height,_that.weight,_that.bmi,_that.pulseRate,_that.respRate,_that.spo2,_that.painScore,_that.bloodGlucose,_that.recordedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? systolic,  int? diastolic,  double? temperature,  double? height,  double? weight,  double? bmi,  int? pulseRate,  int? respRate,  double? spo2,  int? painScore,  double? bloodGlucose,  DateTime? recordedAt)?  $default,) {final _that = this;
switch (_that) {
case _EncounterVitals() when $default != null:
return $default(_that.systolic,_that.diastolic,_that.temperature,_that.height,_that.weight,_that.bmi,_that.pulseRate,_that.respRate,_that.spo2,_that.painScore,_that.bloodGlucose,_that.recordedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EncounterVitals implements EncounterVitals {
  const _EncounterVitals({this.systolic, this.diastolic, this.temperature, this.height, this.weight, this.bmi, this.pulseRate, this.respRate, this.spo2, this.painScore, this.bloodGlucose, this.recordedAt});
  factory _EncounterVitals.fromJson(Map<String, dynamic> json) => _$EncounterVitalsFromJson(json);

@override final  int? systolic;
@override final  int? diastolic;
@override final  double? temperature;
@override final  double? height;
@override final  double? weight;
@override final  double? bmi;
@override final  int? pulseRate;
@override final  int? respRate;
@override final  double? spo2;
@override final  int? painScore;
@override final  double? bloodGlucose;
@override final  DateTime? recordedAt;

/// Create a copy of EncounterVitals
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EncounterVitalsCopyWith<_EncounterVitals> get copyWith => __$EncounterVitalsCopyWithImpl<_EncounterVitals>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EncounterVitalsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EncounterVitals&&(identical(other.systolic, systolic) || other.systolic == systolic)&&(identical(other.diastolic, diastolic) || other.diastolic == diastolic)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.height, height) || other.height == height)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.bmi, bmi) || other.bmi == bmi)&&(identical(other.pulseRate, pulseRate) || other.pulseRate == pulseRate)&&(identical(other.respRate, respRate) || other.respRate == respRate)&&(identical(other.spo2, spo2) || other.spo2 == spo2)&&(identical(other.painScore, painScore) || other.painScore == painScore)&&(identical(other.bloodGlucose, bloodGlucose) || other.bloodGlucose == bloodGlucose)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,systolic,diastolic,temperature,height,weight,bmi,pulseRate,respRate,spo2,painScore,bloodGlucose,recordedAt);

@override
String toString() {
  return 'EncounterVitals(systolic: $systolic, diastolic: $diastolic, temperature: $temperature, height: $height, weight: $weight, bmi: $bmi, pulseRate: $pulseRate, respRate: $respRate, spo2: $spo2, painScore: $painScore, bloodGlucose: $bloodGlucose, recordedAt: $recordedAt)';
}


}

/// @nodoc
abstract mixin class _$EncounterVitalsCopyWith<$Res> implements $EncounterVitalsCopyWith<$Res> {
  factory _$EncounterVitalsCopyWith(_EncounterVitals value, $Res Function(_EncounterVitals) _then) = __$EncounterVitalsCopyWithImpl;
@override @useResult
$Res call({
 int? systolic, int? diastolic, double? temperature, double? height, double? weight, double? bmi, int? pulseRate, int? respRate, double? spo2, int? painScore, double? bloodGlucose, DateTime? recordedAt
});




}
/// @nodoc
class __$EncounterVitalsCopyWithImpl<$Res>
    implements _$EncounterVitalsCopyWith<$Res> {
  __$EncounterVitalsCopyWithImpl(this._self, this._then);

  final _EncounterVitals _self;
  final $Res Function(_EncounterVitals) _then;

/// Create a copy of EncounterVitals
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? systolic = freezed,Object? diastolic = freezed,Object? temperature = freezed,Object? height = freezed,Object? weight = freezed,Object? bmi = freezed,Object? pulseRate = freezed,Object? respRate = freezed,Object? spo2 = freezed,Object? painScore = freezed,Object? bloodGlucose = freezed,Object? recordedAt = freezed,}) {
  return _then(_EncounterVitals(
systolic: freezed == systolic ? _self.systolic : systolic // ignore: cast_nullable_to_non_nullable
as int?,diastolic: freezed == diastolic ? _self.diastolic : diastolic // ignore: cast_nullable_to_non_nullable
as int?,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,bmi: freezed == bmi ? _self.bmi : bmi // ignore: cast_nullable_to_non_nullable
as double?,pulseRate: freezed == pulseRate ? _self.pulseRate : pulseRate // ignore: cast_nullable_to_non_nullable
as int?,respRate: freezed == respRate ? _self.respRate : respRate // ignore: cast_nullable_to_non_nullable
as int?,spo2: freezed == spo2 ? _self.spo2 : spo2 // ignore: cast_nullable_to_non_nullable
as double?,painScore: freezed == painScore ? _self.painScore : painScore // ignore: cast_nullable_to_non_nullable
as int?,bloodGlucose: freezed == bloodGlucose ? _self.bloodGlucose : bloodGlucose // ignore: cast_nullable_to_non_nullable
as double?,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$EncounterDiagnosis {

 String? get primaryIcdCode; String? get primaryIcdDescription; Object? get secondaryDiagnoses;
/// Create a copy of EncounterDiagnosis
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EncounterDiagnosisCopyWith<EncounterDiagnosis> get copyWith => _$EncounterDiagnosisCopyWithImpl<EncounterDiagnosis>(this as EncounterDiagnosis, _$identity);

  /// Serializes this EncounterDiagnosis to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EncounterDiagnosis&&(identical(other.primaryIcdCode, primaryIcdCode) || other.primaryIcdCode == primaryIcdCode)&&(identical(other.primaryIcdDescription, primaryIcdDescription) || other.primaryIcdDescription == primaryIcdDescription)&&const DeepCollectionEquality().equals(other.secondaryDiagnoses, secondaryDiagnoses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,primaryIcdCode,primaryIcdDescription,const DeepCollectionEquality().hash(secondaryDiagnoses));

@override
String toString() {
  return 'EncounterDiagnosis(primaryIcdCode: $primaryIcdCode, primaryIcdDescription: $primaryIcdDescription, secondaryDiagnoses: $secondaryDiagnoses)';
}


}

/// @nodoc
abstract mixin class $EncounterDiagnosisCopyWith<$Res>  {
  factory $EncounterDiagnosisCopyWith(EncounterDiagnosis value, $Res Function(EncounterDiagnosis) _then) = _$EncounterDiagnosisCopyWithImpl;
@useResult
$Res call({
 String? primaryIcdCode, String? primaryIcdDescription, Object? secondaryDiagnoses
});




}
/// @nodoc
class _$EncounterDiagnosisCopyWithImpl<$Res>
    implements $EncounterDiagnosisCopyWith<$Res> {
  _$EncounterDiagnosisCopyWithImpl(this._self, this._then);

  final EncounterDiagnosis _self;
  final $Res Function(EncounterDiagnosis) _then;

/// Create a copy of EncounterDiagnosis
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? primaryIcdCode = freezed,Object? primaryIcdDescription = freezed,Object? secondaryDiagnoses = freezed,}) {
  return _then(_self.copyWith(
primaryIcdCode: freezed == primaryIcdCode ? _self.primaryIcdCode : primaryIcdCode // ignore: cast_nullable_to_non_nullable
as String?,primaryIcdDescription: freezed == primaryIcdDescription ? _self.primaryIcdDescription : primaryIcdDescription // ignore: cast_nullable_to_non_nullable
as String?,secondaryDiagnoses: freezed == secondaryDiagnoses ? _self.secondaryDiagnoses : secondaryDiagnoses ,
  ));
}

}


/// Adds pattern-matching-related methods to [EncounterDiagnosis].
extension EncounterDiagnosisPatterns on EncounterDiagnosis {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EncounterDiagnosis value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EncounterDiagnosis() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EncounterDiagnosis value)  $default,){
final _that = this;
switch (_that) {
case _EncounterDiagnosis():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EncounterDiagnosis value)?  $default,){
final _that = this;
switch (_that) {
case _EncounterDiagnosis() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? primaryIcdCode,  String? primaryIcdDescription,  Object? secondaryDiagnoses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EncounterDiagnosis() when $default != null:
return $default(_that.primaryIcdCode,_that.primaryIcdDescription,_that.secondaryDiagnoses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? primaryIcdCode,  String? primaryIcdDescription,  Object? secondaryDiagnoses)  $default,) {final _that = this;
switch (_that) {
case _EncounterDiagnosis():
return $default(_that.primaryIcdCode,_that.primaryIcdDescription,_that.secondaryDiagnoses);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? primaryIcdCode,  String? primaryIcdDescription,  Object? secondaryDiagnoses)?  $default,) {final _that = this;
switch (_that) {
case _EncounterDiagnosis() when $default != null:
return $default(_that.primaryIcdCode,_that.primaryIcdDescription,_that.secondaryDiagnoses);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EncounterDiagnosis implements EncounterDiagnosis {
  const _EncounterDiagnosis({this.primaryIcdCode, this.primaryIcdDescription, this.secondaryDiagnoses});
  factory _EncounterDiagnosis.fromJson(Map<String, dynamic> json) => _$EncounterDiagnosisFromJson(json);

@override final  String? primaryIcdCode;
@override final  String? primaryIcdDescription;
@override final  Object? secondaryDiagnoses;

/// Create a copy of EncounterDiagnosis
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EncounterDiagnosisCopyWith<_EncounterDiagnosis> get copyWith => __$EncounterDiagnosisCopyWithImpl<_EncounterDiagnosis>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EncounterDiagnosisToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EncounterDiagnosis&&(identical(other.primaryIcdCode, primaryIcdCode) || other.primaryIcdCode == primaryIcdCode)&&(identical(other.primaryIcdDescription, primaryIcdDescription) || other.primaryIcdDescription == primaryIcdDescription)&&const DeepCollectionEquality().equals(other.secondaryDiagnoses, secondaryDiagnoses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,primaryIcdCode,primaryIcdDescription,const DeepCollectionEquality().hash(secondaryDiagnoses));

@override
String toString() {
  return 'EncounterDiagnosis(primaryIcdCode: $primaryIcdCode, primaryIcdDescription: $primaryIcdDescription, secondaryDiagnoses: $secondaryDiagnoses)';
}


}

/// @nodoc
abstract mixin class _$EncounterDiagnosisCopyWith<$Res> implements $EncounterDiagnosisCopyWith<$Res> {
  factory _$EncounterDiagnosisCopyWith(_EncounterDiagnosis value, $Res Function(_EncounterDiagnosis) _then) = __$EncounterDiagnosisCopyWithImpl;
@override @useResult
$Res call({
 String? primaryIcdCode, String? primaryIcdDescription, Object? secondaryDiagnoses
});




}
/// @nodoc
class __$EncounterDiagnosisCopyWithImpl<$Res>
    implements _$EncounterDiagnosisCopyWith<$Res> {
  __$EncounterDiagnosisCopyWithImpl(this._self, this._then);

  final _EncounterDiagnosis _self;
  final $Res Function(_EncounterDiagnosis) _then;

/// Create a copy of EncounterDiagnosis
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? primaryIcdCode = freezed,Object? primaryIcdDescription = freezed,Object? secondaryDiagnoses = freezed,}) {
  return _then(_EncounterDiagnosis(
primaryIcdCode: freezed == primaryIcdCode ? _self.primaryIcdCode : primaryIcdCode // ignore: cast_nullable_to_non_nullable
as String?,primaryIcdDescription: freezed == primaryIcdDescription ? _self.primaryIcdDescription : primaryIcdDescription // ignore: cast_nullable_to_non_nullable
as String?,secondaryDiagnoses: freezed == secondaryDiagnoses ? _self.secondaryDiagnoses : secondaryDiagnoses ,
  ));
}


}


/// @nodoc
mixin _$EncounterPrescriptionItem {

 String get drugName; String get dosage; String? get frequency; int? get duration; String? get instructions;
/// Create a copy of EncounterPrescriptionItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EncounterPrescriptionItemCopyWith<EncounterPrescriptionItem> get copyWith => _$EncounterPrescriptionItemCopyWithImpl<EncounterPrescriptionItem>(this as EncounterPrescriptionItem, _$identity);

  /// Serializes this EncounterPrescriptionItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EncounterPrescriptionItem&&(identical(other.drugName, drugName) || other.drugName == drugName)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.instructions, instructions) || other.instructions == instructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,drugName,dosage,frequency,duration,instructions);

@override
String toString() {
  return 'EncounterPrescriptionItem(drugName: $drugName, dosage: $dosage, frequency: $frequency, duration: $duration, instructions: $instructions)';
}


}

/// @nodoc
abstract mixin class $EncounterPrescriptionItemCopyWith<$Res>  {
  factory $EncounterPrescriptionItemCopyWith(EncounterPrescriptionItem value, $Res Function(EncounterPrescriptionItem) _then) = _$EncounterPrescriptionItemCopyWithImpl;
@useResult
$Res call({
 String drugName, String dosage, String? frequency, int? duration, String? instructions
});




}
/// @nodoc
class _$EncounterPrescriptionItemCopyWithImpl<$Res>
    implements $EncounterPrescriptionItemCopyWith<$Res> {
  _$EncounterPrescriptionItemCopyWithImpl(this._self, this._then);

  final EncounterPrescriptionItem _self;
  final $Res Function(EncounterPrescriptionItem) _then;

/// Create a copy of EncounterPrescriptionItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? drugName = null,Object? dosage = null,Object? frequency = freezed,Object? duration = freezed,Object? instructions = freezed,}) {
  return _then(_self.copyWith(
drugName: null == drugName ? _self.drugName : drugName // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,frequency: freezed == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EncounterPrescriptionItem].
extension EncounterPrescriptionItemPatterns on EncounterPrescriptionItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EncounterPrescriptionItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EncounterPrescriptionItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EncounterPrescriptionItem value)  $default,){
final _that = this;
switch (_that) {
case _EncounterPrescriptionItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EncounterPrescriptionItem value)?  $default,){
final _that = this;
switch (_that) {
case _EncounterPrescriptionItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String drugName,  String dosage,  String? frequency,  int? duration,  String? instructions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EncounterPrescriptionItem() when $default != null:
return $default(_that.drugName,_that.dosage,_that.frequency,_that.duration,_that.instructions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String drugName,  String dosage,  String? frequency,  int? duration,  String? instructions)  $default,) {final _that = this;
switch (_that) {
case _EncounterPrescriptionItem():
return $default(_that.drugName,_that.dosage,_that.frequency,_that.duration,_that.instructions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String drugName,  String dosage,  String? frequency,  int? duration,  String? instructions)?  $default,) {final _that = this;
switch (_that) {
case _EncounterPrescriptionItem() when $default != null:
return $default(_that.drugName,_that.dosage,_that.frequency,_that.duration,_that.instructions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EncounterPrescriptionItem implements EncounterPrescriptionItem {
  const _EncounterPrescriptionItem({required this.drugName, required this.dosage, this.frequency, this.duration, this.instructions});
  factory _EncounterPrescriptionItem.fromJson(Map<String, dynamic> json) => _$EncounterPrescriptionItemFromJson(json);

@override final  String drugName;
@override final  String dosage;
@override final  String? frequency;
@override final  int? duration;
@override final  String? instructions;

/// Create a copy of EncounterPrescriptionItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EncounterPrescriptionItemCopyWith<_EncounterPrescriptionItem> get copyWith => __$EncounterPrescriptionItemCopyWithImpl<_EncounterPrescriptionItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EncounterPrescriptionItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EncounterPrescriptionItem&&(identical(other.drugName, drugName) || other.drugName == drugName)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.instructions, instructions) || other.instructions == instructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,drugName,dosage,frequency,duration,instructions);

@override
String toString() {
  return 'EncounterPrescriptionItem(drugName: $drugName, dosage: $dosage, frequency: $frequency, duration: $duration, instructions: $instructions)';
}


}

/// @nodoc
abstract mixin class _$EncounterPrescriptionItemCopyWith<$Res> implements $EncounterPrescriptionItemCopyWith<$Res> {
  factory _$EncounterPrescriptionItemCopyWith(_EncounterPrescriptionItem value, $Res Function(_EncounterPrescriptionItem) _then) = __$EncounterPrescriptionItemCopyWithImpl;
@override @useResult
$Res call({
 String drugName, String dosage, String? frequency, int? duration, String? instructions
});




}
/// @nodoc
class __$EncounterPrescriptionItemCopyWithImpl<$Res>
    implements _$EncounterPrescriptionItemCopyWith<$Res> {
  __$EncounterPrescriptionItemCopyWithImpl(this._self, this._then);

  final _EncounterPrescriptionItem _self;
  final $Res Function(_EncounterPrescriptionItem) _then;

/// Create a copy of EncounterPrescriptionItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? drugName = null,Object? dosage = null,Object? frequency = freezed,Object? duration = freezed,Object? instructions = freezed,}) {
  return _then(_EncounterPrescriptionItem(
drugName: null == drugName ? _self.drugName : drugName // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,frequency: freezed == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$EncounterPrescription {

 String get id; String? get drug; String? get dosage; String? get notes; DateTime? get startDate; DateTime? get endDate; List<EncounterPrescriptionItem> get items;
/// Create a copy of EncounterPrescription
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EncounterPrescriptionCopyWith<EncounterPrescription> get copyWith => _$EncounterPrescriptionCopyWithImpl<EncounterPrescription>(this as EncounterPrescription, _$identity);

  /// Serializes this EncounterPrescription to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EncounterPrescription&&(identical(other.id, id) || other.id == id)&&(identical(other.drug, drug) || other.drug == drug)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,drug,dosage,notes,startDate,endDate,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'EncounterPrescription(id: $id, drug: $drug, dosage: $dosage, notes: $notes, startDate: $startDate, endDate: $endDate, items: $items)';
}


}

/// @nodoc
abstract mixin class $EncounterPrescriptionCopyWith<$Res>  {
  factory $EncounterPrescriptionCopyWith(EncounterPrescription value, $Res Function(EncounterPrescription) _then) = _$EncounterPrescriptionCopyWithImpl;
@useResult
$Res call({
 String id, String? drug, String? dosage, String? notes, DateTime? startDate, DateTime? endDate, List<EncounterPrescriptionItem> items
});




}
/// @nodoc
class _$EncounterPrescriptionCopyWithImpl<$Res>
    implements $EncounterPrescriptionCopyWith<$Res> {
  _$EncounterPrescriptionCopyWithImpl(this._self, this._then);

  final EncounterPrescription _self;
  final $Res Function(EncounterPrescription) _then;

/// Create a copy of EncounterPrescription
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? drug = freezed,Object? dosage = freezed,Object? notes = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? items = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,drug: freezed == drug ? _self.drug : drug // ignore: cast_nullable_to_non_nullable
as String?,dosage: freezed == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<EncounterPrescriptionItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [EncounterPrescription].
extension EncounterPrescriptionPatterns on EncounterPrescription {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EncounterPrescription value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EncounterPrescription() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EncounterPrescription value)  $default,){
final _that = this;
switch (_that) {
case _EncounterPrescription():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EncounterPrescription value)?  $default,){
final _that = this;
switch (_that) {
case _EncounterPrescription() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? drug,  String? dosage,  String? notes,  DateTime? startDate,  DateTime? endDate,  List<EncounterPrescriptionItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EncounterPrescription() when $default != null:
return $default(_that.id,_that.drug,_that.dosage,_that.notes,_that.startDate,_that.endDate,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? drug,  String? dosage,  String? notes,  DateTime? startDate,  DateTime? endDate,  List<EncounterPrescriptionItem> items)  $default,) {final _that = this;
switch (_that) {
case _EncounterPrescription():
return $default(_that.id,_that.drug,_that.dosage,_that.notes,_that.startDate,_that.endDate,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? drug,  String? dosage,  String? notes,  DateTime? startDate,  DateTime? endDate,  List<EncounterPrescriptionItem> items)?  $default,) {final _that = this;
switch (_that) {
case _EncounterPrescription() when $default != null:
return $default(_that.id,_that.drug,_that.dosage,_that.notes,_that.startDate,_that.endDate,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EncounterPrescription implements EncounterPrescription {
  const _EncounterPrescription({required this.id, this.drug, this.dosage, this.notes, this.startDate, this.endDate, final  List<EncounterPrescriptionItem> items = const []}): _items = items;
  factory _EncounterPrescription.fromJson(Map<String, dynamic> json) => _$EncounterPrescriptionFromJson(json);

@override final  String id;
@override final  String? drug;
@override final  String? dosage;
@override final  String? notes;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
 final  List<EncounterPrescriptionItem> _items;
@override@JsonKey() List<EncounterPrescriptionItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of EncounterPrescription
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EncounterPrescriptionCopyWith<_EncounterPrescription> get copyWith => __$EncounterPrescriptionCopyWithImpl<_EncounterPrescription>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EncounterPrescriptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EncounterPrescription&&(identical(other.id, id) || other.id == id)&&(identical(other.drug, drug) || other.drug == drug)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,drug,dosage,notes,startDate,endDate,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'EncounterPrescription(id: $id, drug: $drug, dosage: $dosage, notes: $notes, startDate: $startDate, endDate: $endDate, items: $items)';
}


}

/// @nodoc
abstract mixin class _$EncounterPrescriptionCopyWith<$Res> implements $EncounterPrescriptionCopyWith<$Res> {
  factory _$EncounterPrescriptionCopyWith(_EncounterPrescription value, $Res Function(_EncounterPrescription) _then) = __$EncounterPrescriptionCopyWithImpl;
@override @useResult
$Res call({
 String id, String? drug, String? dosage, String? notes, DateTime? startDate, DateTime? endDate, List<EncounterPrescriptionItem> items
});




}
/// @nodoc
class __$EncounterPrescriptionCopyWithImpl<$Res>
    implements _$EncounterPrescriptionCopyWith<$Res> {
  __$EncounterPrescriptionCopyWithImpl(this._self, this._then);

  final _EncounterPrescription _self;
  final $Res Function(_EncounterPrescription) _then;

/// Create a copy of EncounterPrescription
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? drug = freezed,Object? dosage = freezed,Object? notes = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? items = null,}) {
  return _then(_EncounterPrescription(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,drug: freezed == drug ? _self.drug : drug // ignore: cast_nullable_to_non_nullable
as String?,dosage: freezed == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<EncounterPrescriptionItem>,
  ));
}


}


/// @nodoc
mixin _$EncounterSoap {

 String? get subjective; String? get objective; String? get assessment; String? get plan;
/// Create a copy of EncounterSoap
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EncounterSoapCopyWith<EncounterSoap> get copyWith => _$EncounterSoapCopyWithImpl<EncounterSoap>(this as EncounterSoap, _$identity);

  /// Serializes this EncounterSoap to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EncounterSoap&&(identical(other.subjective, subjective) || other.subjective == subjective)&&(identical(other.objective, objective) || other.objective == objective)&&(identical(other.assessment, assessment) || other.assessment == assessment)&&(identical(other.plan, plan) || other.plan == plan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subjective,objective,assessment,plan);

@override
String toString() {
  return 'EncounterSoap(subjective: $subjective, objective: $objective, assessment: $assessment, plan: $plan)';
}


}

/// @nodoc
abstract mixin class $EncounterSoapCopyWith<$Res>  {
  factory $EncounterSoapCopyWith(EncounterSoap value, $Res Function(EncounterSoap) _then) = _$EncounterSoapCopyWithImpl;
@useResult
$Res call({
 String? subjective, String? objective, String? assessment, String? plan
});




}
/// @nodoc
class _$EncounterSoapCopyWithImpl<$Res>
    implements $EncounterSoapCopyWith<$Res> {
  _$EncounterSoapCopyWithImpl(this._self, this._then);

  final EncounterSoap _self;
  final $Res Function(EncounterSoap) _then;

/// Create a copy of EncounterSoap
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subjective = freezed,Object? objective = freezed,Object? assessment = freezed,Object? plan = freezed,}) {
  return _then(_self.copyWith(
subjective: freezed == subjective ? _self.subjective : subjective // ignore: cast_nullable_to_non_nullable
as String?,objective: freezed == objective ? _self.objective : objective // ignore: cast_nullable_to_non_nullable
as String?,assessment: freezed == assessment ? _self.assessment : assessment // ignore: cast_nullable_to_non_nullable
as String?,plan: freezed == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EncounterSoap].
extension EncounterSoapPatterns on EncounterSoap {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EncounterSoap value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EncounterSoap() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EncounterSoap value)  $default,){
final _that = this;
switch (_that) {
case _EncounterSoap():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EncounterSoap value)?  $default,){
final _that = this;
switch (_that) {
case _EncounterSoap() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? subjective,  String? objective,  String? assessment,  String? plan)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EncounterSoap() when $default != null:
return $default(_that.subjective,_that.objective,_that.assessment,_that.plan);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? subjective,  String? objective,  String? assessment,  String? plan)  $default,) {final _that = this;
switch (_that) {
case _EncounterSoap():
return $default(_that.subjective,_that.objective,_that.assessment,_that.plan);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? subjective,  String? objective,  String? assessment,  String? plan)?  $default,) {final _that = this;
switch (_that) {
case _EncounterSoap() when $default != null:
return $default(_that.subjective,_that.objective,_that.assessment,_that.plan);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EncounterSoap implements EncounterSoap {
  const _EncounterSoap({this.subjective, this.objective, this.assessment, this.plan});
  factory _EncounterSoap.fromJson(Map<String, dynamic> json) => _$EncounterSoapFromJson(json);

@override final  String? subjective;
@override final  String? objective;
@override final  String? assessment;
@override final  String? plan;

/// Create a copy of EncounterSoap
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EncounterSoapCopyWith<_EncounterSoap> get copyWith => __$EncounterSoapCopyWithImpl<_EncounterSoap>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EncounterSoapToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EncounterSoap&&(identical(other.subjective, subjective) || other.subjective == subjective)&&(identical(other.objective, objective) || other.objective == objective)&&(identical(other.assessment, assessment) || other.assessment == assessment)&&(identical(other.plan, plan) || other.plan == plan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subjective,objective,assessment,plan);

@override
String toString() {
  return 'EncounterSoap(subjective: $subjective, objective: $objective, assessment: $assessment, plan: $plan)';
}


}

/// @nodoc
abstract mixin class _$EncounterSoapCopyWith<$Res> implements $EncounterSoapCopyWith<$Res> {
  factory _$EncounterSoapCopyWith(_EncounterSoap value, $Res Function(_EncounterSoap) _then) = __$EncounterSoapCopyWithImpl;
@override @useResult
$Res call({
 String? subjective, String? objective, String? assessment, String? plan
});




}
/// @nodoc
class __$EncounterSoapCopyWithImpl<$Res>
    implements _$EncounterSoapCopyWith<$Res> {
  __$EncounterSoapCopyWithImpl(this._self, this._then);

  final _EncounterSoap _self;
  final $Res Function(_EncounterSoap) _then;

/// Create a copy of EncounterSoap
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subjective = freezed,Object? objective = freezed,Object? assessment = freezed,Object? plan = freezed,}) {
  return _then(_EncounterSoap(
subjective: freezed == subjective ? _self.subjective : subjective // ignore: cast_nullable_to_non_nullable
as String?,objective: freezed == objective ? _self.objective : objective // ignore: cast_nullable_to_non_nullable
as String?,assessment: freezed == assessment ? _self.assessment : assessment // ignore: cast_nullable_to_non_nullable
as String?,plan: freezed == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$EncounterDetail {

 String get id; EncounterType get encounterType; EncounterStatus get status; DateTime get startTime; DateTime? get endTime; String? get chiefComplaint; String? get visitType; String get doctorName; String? get primaryDiagnosis; EncounterVitals? get vitals; List<EncounterDiagnosis> get diagnoses; List<EncounterPrescription> get prescriptions; EncounterSoap? get soap; String? get followUpDate; String? get followUpInstructions; String? get referral;
/// Create a copy of EncounterDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EncounterDetailCopyWith<EncounterDetail> get copyWith => _$EncounterDetailCopyWithImpl<EncounterDetail>(this as EncounterDetail, _$identity);

  /// Serializes this EncounterDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EncounterDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.encounterType, encounterType) || other.encounterType == encounterType)&&(identical(other.status, status) || other.status == status)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.chiefComplaint, chiefComplaint) || other.chiefComplaint == chiefComplaint)&&(identical(other.visitType, visitType) || other.visitType == visitType)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.primaryDiagnosis, primaryDiagnosis) || other.primaryDiagnosis == primaryDiagnosis)&&(identical(other.vitals, vitals) || other.vitals == vitals)&&const DeepCollectionEquality().equals(other.diagnoses, diagnoses)&&const DeepCollectionEquality().equals(other.prescriptions, prescriptions)&&(identical(other.soap, soap) || other.soap == soap)&&(identical(other.followUpDate, followUpDate) || other.followUpDate == followUpDate)&&(identical(other.followUpInstructions, followUpInstructions) || other.followUpInstructions == followUpInstructions)&&(identical(other.referral, referral) || other.referral == referral));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,encounterType,status,startTime,endTime,chiefComplaint,visitType,doctorName,primaryDiagnosis,vitals,const DeepCollectionEquality().hash(diagnoses),const DeepCollectionEquality().hash(prescriptions),soap,followUpDate,followUpInstructions,referral);

@override
String toString() {
  return 'EncounterDetail(id: $id, encounterType: $encounterType, status: $status, startTime: $startTime, endTime: $endTime, chiefComplaint: $chiefComplaint, visitType: $visitType, doctorName: $doctorName, primaryDiagnosis: $primaryDiagnosis, vitals: $vitals, diagnoses: $diagnoses, prescriptions: $prescriptions, soap: $soap, followUpDate: $followUpDate, followUpInstructions: $followUpInstructions, referral: $referral)';
}


}

/// @nodoc
abstract mixin class $EncounterDetailCopyWith<$Res>  {
  factory $EncounterDetailCopyWith(EncounterDetail value, $Res Function(EncounterDetail) _then) = _$EncounterDetailCopyWithImpl;
@useResult
$Res call({
 String id, EncounterType encounterType, EncounterStatus status, DateTime startTime, DateTime? endTime, String? chiefComplaint, String? visitType, String doctorName, String? primaryDiagnosis, EncounterVitals? vitals, List<EncounterDiagnosis> diagnoses, List<EncounterPrescription> prescriptions, EncounterSoap? soap, String? followUpDate, String? followUpInstructions, String? referral
});


$EncounterVitalsCopyWith<$Res>? get vitals;$EncounterSoapCopyWith<$Res>? get soap;

}
/// @nodoc
class _$EncounterDetailCopyWithImpl<$Res>
    implements $EncounterDetailCopyWith<$Res> {
  _$EncounterDetailCopyWithImpl(this._self, this._then);

  final EncounterDetail _self;
  final $Res Function(EncounterDetail) _then;

/// Create a copy of EncounterDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? encounterType = null,Object? status = null,Object? startTime = null,Object? endTime = freezed,Object? chiefComplaint = freezed,Object? visitType = freezed,Object? doctorName = null,Object? primaryDiagnosis = freezed,Object? vitals = freezed,Object? diagnoses = null,Object? prescriptions = null,Object? soap = freezed,Object? followUpDate = freezed,Object? followUpInstructions = freezed,Object? referral = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,encounterType: null == encounterType ? _self.encounterType : encounterType // ignore: cast_nullable_to_non_nullable
as EncounterType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EncounterStatus,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,chiefComplaint: freezed == chiefComplaint ? _self.chiefComplaint : chiefComplaint // ignore: cast_nullable_to_non_nullable
as String?,visitType: freezed == visitType ? _self.visitType : visitType // ignore: cast_nullable_to_non_nullable
as String?,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,primaryDiagnosis: freezed == primaryDiagnosis ? _self.primaryDiagnosis : primaryDiagnosis // ignore: cast_nullable_to_non_nullable
as String?,vitals: freezed == vitals ? _self.vitals : vitals // ignore: cast_nullable_to_non_nullable
as EncounterVitals?,diagnoses: null == diagnoses ? _self.diagnoses : diagnoses // ignore: cast_nullable_to_non_nullable
as List<EncounterDiagnosis>,prescriptions: null == prescriptions ? _self.prescriptions : prescriptions // ignore: cast_nullable_to_non_nullable
as List<EncounterPrescription>,soap: freezed == soap ? _self.soap : soap // ignore: cast_nullable_to_non_nullable
as EncounterSoap?,followUpDate: freezed == followUpDate ? _self.followUpDate : followUpDate // ignore: cast_nullable_to_non_nullable
as String?,followUpInstructions: freezed == followUpInstructions ? _self.followUpInstructions : followUpInstructions // ignore: cast_nullable_to_non_nullable
as String?,referral: freezed == referral ? _self.referral : referral // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of EncounterDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EncounterVitalsCopyWith<$Res>? get vitals {
    if (_self.vitals == null) {
    return null;
  }

  return $EncounterVitalsCopyWith<$Res>(_self.vitals!, (value) {
    return _then(_self.copyWith(vitals: value));
  });
}/// Create a copy of EncounterDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EncounterSoapCopyWith<$Res>? get soap {
    if (_self.soap == null) {
    return null;
  }

  return $EncounterSoapCopyWith<$Res>(_self.soap!, (value) {
    return _then(_self.copyWith(soap: value));
  });
}
}


/// Adds pattern-matching-related methods to [EncounterDetail].
extension EncounterDetailPatterns on EncounterDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EncounterDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EncounterDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EncounterDetail value)  $default,){
final _that = this;
switch (_that) {
case _EncounterDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EncounterDetail value)?  $default,){
final _that = this;
switch (_that) {
case _EncounterDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  EncounterType encounterType,  EncounterStatus status,  DateTime startTime,  DateTime? endTime,  String? chiefComplaint,  String? visitType,  String doctorName,  String? primaryDiagnosis,  EncounterVitals? vitals,  List<EncounterDiagnosis> diagnoses,  List<EncounterPrescription> prescriptions,  EncounterSoap? soap,  String? followUpDate,  String? followUpInstructions,  String? referral)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EncounterDetail() when $default != null:
return $default(_that.id,_that.encounterType,_that.status,_that.startTime,_that.endTime,_that.chiefComplaint,_that.visitType,_that.doctorName,_that.primaryDiagnosis,_that.vitals,_that.diagnoses,_that.prescriptions,_that.soap,_that.followUpDate,_that.followUpInstructions,_that.referral);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  EncounterType encounterType,  EncounterStatus status,  DateTime startTime,  DateTime? endTime,  String? chiefComplaint,  String? visitType,  String doctorName,  String? primaryDiagnosis,  EncounterVitals? vitals,  List<EncounterDiagnosis> diagnoses,  List<EncounterPrescription> prescriptions,  EncounterSoap? soap,  String? followUpDate,  String? followUpInstructions,  String? referral)  $default,) {final _that = this;
switch (_that) {
case _EncounterDetail():
return $default(_that.id,_that.encounterType,_that.status,_that.startTime,_that.endTime,_that.chiefComplaint,_that.visitType,_that.doctorName,_that.primaryDiagnosis,_that.vitals,_that.diagnoses,_that.prescriptions,_that.soap,_that.followUpDate,_that.followUpInstructions,_that.referral);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  EncounterType encounterType,  EncounterStatus status,  DateTime startTime,  DateTime? endTime,  String? chiefComplaint,  String? visitType,  String doctorName,  String? primaryDiagnosis,  EncounterVitals? vitals,  List<EncounterDiagnosis> diagnoses,  List<EncounterPrescription> prescriptions,  EncounterSoap? soap,  String? followUpDate,  String? followUpInstructions,  String? referral)?  $default,) {final _that = this;
switch (_that) {
case _EncounterDetail() when $default != null:
return $default(_that.id,_that.encounterType,_that.status,_that.startTime,_that.endTime,_that.chiefComplaint,_that.visitType,_that.doctorName,_that.primaryDiagnosis,_that.vitals,_that.diagnoses,_that.prescriptions,_that.soap,_that.followUpDate,_that.followUpInstructions,_that.referral);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EncounterDetail implements EncounterDetail {
  const _EncounterDetail({required this.id, required this.encounterType, required this.status, required this.startTime, this.endTime, this.chiefComplaint, this.visitType, required this.doctorName, this.primaryDiagnosis, this.vitals, final  List<EncounterDiagnosis> diagnoses = const [], final  List<EncounterPrescription> prescriptions = const [], this.soap, this.followUpDate, this.followUpInstructions, this.referral}): _diagnoses = diagnoses,_prescriptions = prescriptions;
  factory _EncounterDetail.fromJson(Map<String, dynamic> json) => _$EncounterDetailFromJson(json);

@override final  String id;
@override final  EncounterType encounterType;
@override final  EncounterStatus status;
@override final  DateTime startTime;
@override final  DateTime? endTime;
@override final  String? chiefComplaint;
@override final  String? visitType;
@override final  String doctorName;
@override final  String? primaryDiagnosis;
@override final  EncounterVitals? vitals;
 final  List<EncounterDiagnosis> _diagnoses;
@override@JsonKey() List<EncounterDiagnosis> get diagnoses {
  if (_diagnoses is EqualUnmodifiableListView) return _diagnoses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_diagnoses);
}

 final  List<EncounterPrescription> _prescriptions;
@override@JsonKey() List<EncounterPrescription> get prescriptions {
  if (_prescriptions is EqualUnmodifiableListView) return _prescriptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_prescriptions);
}

@override final  EncounterSoap? soap;
@override final  String? followUpDate;
@override final  String? followUpInstructions;
@override final  String? referral;

/// Create a copy of EncounterDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EncounterDetailCopyWith<_EncounterDetail> get copyWith => __$EncounterDetailCopyWithImpl<_EncounterDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EncounterDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EncounterDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.encounterType, encounterType) || other.encounterType == encounterType)&&(identical(other.status, status) || other.status == status)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.chiefComplaint, chiefComplaint) || other.chiefComplaint == chiefComplaint)&&(identical(other.visitType, visitType) || other.visitType == visitType)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.primaryDiagnosis, primaryDiagnosis) || other.primaryDiagnosis == primaryDiagnosis)&&(identical(other.vitals, vitals) || other.vitals == vitals)&&const DeepCollectionEquality().equals(other._diagnoses, _diagnoses)&&const DeepCollectionEquality().equals(other._prescriptions, _prescriptions)&&(identical(other.soap, soap) || other.soap == soap)&&(identical(other.followUpDate, followUpDate) || other.followUpDate == followUpDate)&&(identical(other.followUpInstructions, followUpInstructions) || other.followUpInstructions == followUpInstructions)&&(identical(other.referral, referral) || other.referral == referral));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,encounterType,status,startTime,endTime,chiefComplaint,visitType,doctorName,primaryDiagnosis,vitals,const DeepCollectionEquality().hash(_diagnoses),const DeepCollectionEquality().hash(_prescriptions),soap,followUpDate,followUpInstructions,referral);

@override
String toString() {
  return 'EncounterDetail(id: $id, encounterType: $encounterType, status: $status, startTime: $startTime, endTime: $endTime, chiefComplaint: $chiefComplaint, visitType: $visitType, doctorName: $doctorName, primaryDiagnosis: $primaryDiagnosis, vitals: $vitals, diagnoses: $diagnoses, prescriptions: $prescriptions, soap: $soap, followUpDate: $followUpDate, followUpInstructions: $followUpInstructions, referral: $referral)';
}


}

/// @nodoc
abstract mixin class _$EncounterDetailCopyWith<$Res> implements $EncounterDetailCopyWith<$Res> {
  factory _$EncounterDetailCopyWith(_EncounterDetail value, $Res Function(_EncounterDetail) _then) = __$EncounterDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, EncounterType encounterType, EncounterStatus status, DateTime startTime, DateTime? endTime, String? chiefComplaint, String? visitType, String doctorName, String? primaryDiagnosis, EncounterVitals? vitals, List<EncounterDiagnosis> diagnoses, List<EncounterPrescription> prescriptions, EncounterSoap? soap, String? followUpDate, String? followUpInstructions, String? referral
});


@override $EncounterVitalsCopyWith<$Res>? get vitals;@override $EncounterSoapCopyWith<$Res>? get soap;

}
/// @nodoc
class __$EncounterDetailCopyWithImpl<$Res>
    implements _$EncounterDetailCopyWith<$Res> {
  __$EncounterDetailCopyWithImpl(this._self, this._then);

  final _EncounterDetail _self;
  final $Res Function(_EncounterDetail) _then;

/// Create a copy of EncounterDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? encounterType = null,Object? status = null,Object? startTime = null,Object? endTime = freezed,Object? chiefComplaint = freezed,Object? visitType = freezed,Object? doctorName = null,Object? primaryDiagnosis = freezed,Object? vitals = freezed,Object? diagnoses = null,Object? prescriptions = null,Object? soap = freezed,Object? followUpDate = freezed,Object? followUpInstructions = freezed,Object? referral = freezed,}) {
  return _then(_EncounterDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,encounterType: null == encounterType ? _self.encounterType : encounterType // ignore: cast_nullable_to_non_nullable
as EncounterType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EncounterStatus,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,chiefComplaint: freezed == chiefComplaint ? _self.chiefComplaint : chiefComplaint // ignore: cast_nullable_to_non_nullable
as String?,visitType: freezed == visitType ? _self.visitType : visitType // ignore: cast_nullable_to_non_nullable
as String?,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,primaryDiagnosis: freezed == primaryDiagnosis ? _self.primaryDiagnosis : primaryDiagnosis // ignore: cast_nullable_to_non_nullable
as String?,vitals: freezed == vitals ? _self.vitals : vitals // ignore: cast_nullable_to_non_nullable
as EncounterVitals?,diagnoses: null == diagnoses ? _self._diagnoses : diagnoses // ignore: cast_nullable_to_non_nullable
as List<EncounterDiagnosis>,prescriptions: null == prescriptions ? _self._prescriptions : prescriptions // ignore: cast_nullable_to_non_nullable
as List<EncounterPrescription>,soap: freezed == soap ? _self.soap : soap // ignore: cast_nullable_to_non_nullable
as EncounterSoap?,followUpDate: freezed == followUpDate ? _self.followUpDate : followUpDate // ignore: cast_nullable_to_non_nullable
as String?,followUpInstructions: freezed == followUpInstructions ? _self.followUpInstructions : followUpInstructions // ignore: cast_nullable_to_non_nullable
as String?,referral: freezed == referral ? _self.referral : referral // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of EncounterDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EncounterVitalsCopyWith<$Res>? get vitals {
    if (_self.vitals == null) {
    return null;
  }

  return $EncounterVitalsCopyWith<$Res>(_self.vitals!, (value) {
    return _then(_self.copyWith(vitals: value));
  });
}/// Create a copy of EncounterDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EncounterSoapCopyWith<$Res>? get soap {
    if (_self.soap == null) {
    return null;
  }

  return $EncounterSoapCopyWith<$Res>(_self.soap!, (value) {
    return _then(_self.copyWith(soap: value));
  });
}
}

// dart format on
