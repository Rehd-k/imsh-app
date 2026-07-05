// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lab_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LabResultSummary {

 String get id; LabOrderStatus get status; DateTime get orderedAt; DateTime? get completedAt; String get doctorName; List<String> get testNames; LabSummaryStatus get summaryStatus;
/// Create a copy of LabResultSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabResultSummaryCopyWith<LabResultSummary> get copyWith => _$LabResultSummaryCopyWithImpl<LabResultSummary>(this as LabResultSummary, _$identity);

  /// Serializes this LabResultSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabResultSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.orderedAt, orderedAt) || other.orderedAt == orderedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&const DeepCollectionEquality().equals(other.testNames, testNames)&&(identical(other.summaryStatus, summaryStatus) || other.summaryStatus == summaryStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,orderedAt,completedAt,doctorName,const DeepCollectionEquality().hash(testNames),summaryStatus);

@override
String toString() {
  return 'LabResultSummary(id: $id, status: $status, orderedAt: $orderedAt, completedAt: $completedAt, doctorName: $doctorName, testNames: $testNames, summaryStatus: $summaryStatus)';
}


}

/// @nodoc
abstract mixin class $LabResultSummaryCopyWith<$Res>  {
  factory $LabResultSummaryCopyWith(LabResultSummary value, $Res Function(LabResultSummary) _then) = _$LabResultSummaryCopyWithImpl;
@useResult
$Res call({
 String id, LabOrderStatus status, DateTime orderedAt, DateTime? completedAt, String doctorName, List<String> testNames, LabSummaryStatus summaryStatus
});




}
/// @nodoc
class _$LabResultSummaryCopyWithImpl<$Res>
    implements $LabResultSummaryCopyWith<$Res> {
  _$LabResultSummaryCopyWithImpl(this._self, this._then);

  final LabResultSummary _self;
  final $Res Function(LabResultSummary) _then;

/// Create a copy of LabResultSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? orderedAt = null,Object? completedAt = freezed,Object? doctorName = null,Object? testNames = null,Object? summaryStatus = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LabOrderStatus,orderedAt: null == orderedAt ? _self.orderedAt : orderedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,testNames: null == testNames ? _self.testNames : testNames // ignore: cast_nullable_to_non_nullable
as List<String>,summaryStatus: null == summaryStatus ? _self.summaryStatus : summaryStatus // ignore: cast_nullable_to_non_nullable
as LabSummaryStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [LabResultSummary].
extension LabResultSummaryPatterns on LabResultSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LabResultSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LabResultSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LabResultSummary value)  $default,){
final _that = this;
switch (_that) {
case _LabResultSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LabResultSummary value)?  $default,){
final _that = this;
switch (_that) {
case _LabResultSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LabOrderStatus status,  DateTime orderedAt,  DateTime? completedAt,  String doctorName,  List<String> testNames,  LabSummaryStatus summaryStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LabResultSummary() when $default != null:
return $default(_that.id,_that.status,_that.orderedAt,_that.completedAt,_that.doctorName,_that.testNames,_that.summaryStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LabOrderStatus status,  DateTime orderedAt,  DateTime? completedAt,  String doctorName,  List<String> testNames,  LabSummaryStatus summaryStatus)  $default,) {final _that = this;
switch (_that) {
case _LabResultSummary():
return $default(_that.id,_that.status,_that.orderedAt,_that.completedAt,_that.doctorName,_that.testNames,_that.summaryStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LabOrderStatus status,  DateTime orderedAt,  DateTime? completedAt,  String doctorName,  List<String> testNames,  LabSummaryStatus summaryStatus)?  $default,) {final _that = this;
switch (_that) {
case _LabResultSummary() when $default != null:
return $default(_that.id,_that.status,_that.orderedAt,_that.completedAt,_that.doctorName,_that.testNames,_that.summaryStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LabResultSummary implements LabResultSummary {
  const _LabResultSummary({required this.id, required this.status, required this.orderedAt, this.completedAt, required this.doctorName, final  List<String> testNames = const [], required this.summaryStatus}): _testNames = testNames;
  factory _LabResultSummary.fromJson(Map<String, dynamic> json) => _$LabResultSummaryFromJson(json);

@override final  String id;
@override final  LabOrderStatus status;
@override final  DateTime orderedAt;
@override final  DateTime? completedAt;
@override final  String doctorName;
 final  List<String> _testNames;
@override@JsonKey() List<String> get testNames {
  if (_testNames is EqualUnmodifiableListView) return _testNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_testNames);
}

@override final  LabSummaryStatus summaryStatus;

/// Create a copy of LabResultSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LabResultSummaryCopyWith<_LabResultSummary> get copyWith => __$LabResultSummaryCopyWithImpl<_LabResultSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LabResultSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LabResultSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.orderedAt, orderedAt) || other.orderedAt == orderedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&const DeepCollectionEquality().equals(other._testNames, _testNames)&&(identical(other.summaryStatus, summaryStatus) || other.summaryStatus == summaryStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,orderedAt,completedAt,doctorName,const DeepCollectionEquality().hash(_testNames),summaryStatus);

@override
String toString() {
  return 'LabResultSummary(id: $id, status: $status, orderedAt: $orderedAt, completedAt: $completedAt, doctorName: $doctorName, testNames: $testNames, summaryStatus: $summaryStatus)';
}


}

/// @nodoc
abstract mixin class _$LabResultSummaryCopyWith<$Res> implements $LabResultSummaryCopyWith<$Res> {
  factory _$LabResultSummaryCopyWith(_LabResultSummary value, $Res Function(_LabResultSummary) _then) = __$LabResultSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, LabOrderStatus status, DateTime orderedAt, DateTime? completedAt, String doctorName, List<String> testNames, LabSummaryStatus summaryStatus
});




}
/// @nodoc
class __$LabResultSummaryCopyWithImpl<$Res>
    implements _$LabResultSummaryCopyWith<$Res> {
  __$LabResultSummaryCopyWithImpl(this._self, this._then);

  final _LabResultSummary _self;
  final $Res Function(_LabResultSummary) _then;

/// Create a copy of LabResultSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? orderedAt = null,Object? completedAt = freezed,Object? doctorName = null,Object? testNames = null,Object? summaryStatus = null,}) {
  return _then(_LabResultSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LabOrderStatus,orderedAt: null == orderedAt ? _self.orderedAt : orderedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,testNames: null == testNames ? _self._testNames : testNames // ignore: cast_nullable_to_non_nullable
as List<String>,summaryStatus: null == summaryStatus ? _self.summaryStatus : summaryStatus // ignore: cast_nullable_to_non_nullable
as LabSummaryStatus,
  ));
}


}


/// @nodoc
mixin _$LabResultListResponse {

 List<LabResultSummary> get data; int get total; int get page; int get limit;
/// Create a copy of LabResultListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabResultListResponseCopyWith<LabResultListResponse> get copyWith => _$LabResultListResponseCopyWithImpl<LabResultListResponse>(this as LabResultListResponse, _$identity);

  /// Serializes this LabResultListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabResultListResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),total,page,limit);

@override
String toString() {
  return 'LabResultListResponse(data: $data, total: $total, page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $LabResultListResponseCopyWith<$Res>  {
  factory $LabResultListResponseCopyWith(LabResultListResponse value, $Res Function(LabResultListResponse) _then) = _$LabResultListResponseCopyWithImpl;
@useResult
$Res call({
 List<LabResultSummary> data, int total, int page, int limit
});




}
/// @nodoc
class _$LabResultListResponseCopyWithImpl<$Res>
    implements $LabResultListResponseCopyWith<$Res> {
  _$LabResultListResponseCopyWithImpl(this._self, this._then);

  final LabResultListResponse _self;
  final $Res Function(LabResultListResponse) _then;

/// Create a copy of LabResultListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? total = null,Object? page = null,Object? limit = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<LabResultSummary>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LabResultListResponse].
extension LabResultListResponsePatterns on LabResultListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LabResultListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LabResultListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LabResultListResponse value)  $default,){
final _that = this;
switch (_that) {
case _LabResultListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LabResultListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LabResultListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<LabResultSummary> data,  int total,  int page,  int limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LabResultListResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<LabResultSummary> data,  int total,  int page,  int limit)  $default,) {final _that = this;
switch (_that) {
case _LabResultListResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<LabResultSummary> data,  int total,  int page,  int limit)?  $default,) {final _that = this;
switch (_that) {
case _LabResultListResponse() when $default != null:
return $default(_that.data,_that.total,_that.page,_that.limit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LabResultListResponse implements LabResultListResponse {
  const _LabResultListResponse({required final  List<LabResultSummary> data, required this.total, required this.page, required this.limit}): _data = data;
  factory _LabResultListResponse.fromJson(Map<String, dynamic> json) => _$LabResultListResponseFromJson(json);

 final  List<LabResultSummary> _data;
@override List<LabResultSummary> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  int total;
@override final  int page;
@override final  int limit;

/// Create a copy of LabResultListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LabResultListResponseCopyWith<_LabResultListResponse> get copyWith => __$LabResultListResponseCopyWithImpl<_LabResultListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LabResultListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LabResultListResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),total,page,limit);

@override
String toString() {
  return 'LabResultListResponse(data: $data, total: $total, page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$LabResultListResponseCopyWith<$Res> implements $LabResultListResponseCopyWith<$Res> {
  factory _$LabResultListResponseCopyWith(_LabResultListResponse value, $Res Function(_LabResultListResponse) _then) = __$LabResultListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<LabResultSummary> data, int total, int page, int limit
});




}
/// @nodoc
class __$LabResultListResponseCopyWithImpl<$Res>
    implements _$LabResultListResponseCopyWith<$Res> {
  __$LabResultListResponseCopyWithImpl(this._self, this._then);

  final _LabResultListResponse _self;
  final $Res Function(_LabResultListResponse) _then;

/// Create a copy of LabResultListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? total = null,Object? page = null,Object? limit = null,}) {
  return _then(_LabResultListResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<LabResultSummary>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$LabResultLine {

 String get label; String get value; String? get unit; String? get referenceRange; LabAbnormalFlag? get abnormalFlag; bool get isCritical;
/// Create a copy of LabResultLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabResultLineCopyWith<LabResultLine> get copyWith => _$LabResultLineCopyWithImpl<LabResultLine>(this as LabResultLine, _$identity);

  /// Serializes this LabResultLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabResultLine&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.referenceRange, referenceRange) || other.referenceRange == referenceRange)&&(identical(other.abnormalFlag, abnormalFlag) || other.abnormalFlag == abnormalFlag)&&(identical(other.isCritical, isCritical) || other.isCritical == isCritical));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,value,unit,referenceRange,abnormalFlag,isCritical);

@override
String toString() {
  return 'LabResultLine(label: $label, value: $value, unit: $unit, referenceRange: $referenceRange, abnormalFlag: $abnormalFlag, isCritical: $isCritical)';
}


}

/// @nodoc
abstract mixin class $LabResultLineCopyWith<$Res>  {
  factory $LabResultLineCopyWith(LabResultLine value, $Res Function(LabResultLine) _then) = _$LabResultLineCopyWithImpl;
@useResult
$Res call({
 String label, String value, String? unit, String? referenceRange, LabAbnormalFlag? abnormalFlag, bool isCritical
});




}
/// @nodoc
class _$LabResultLineCopyWithImpl<$Res>
    implements $LabResultLineCopyWith<$Res> {
  _$LabResultLineCopyWithImpl(this._self, this._then);

  final LabResultLine _self;
  final $Res Function(LabResultLine) _then;

/// Create a copy of LabResultLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? value = null,Object? unit = freezed,Object? referenceRange = freezed,Object? abnormalFlag = freezed,Object? isCritical = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,referenceRange: freezed == referenceRange ? _self.referenceRange : referenceRange // ignore: cast_nullable_to_non_nullable
as String?,abnormalFlag: freezed == abnormalFlag ? _self.abnormalFlag : abnormalFlag // ignore: cast_nullable_to_non_nullable
as LabAbnormalFlag?,isCritical: null == isCritical ? _self.isCritical : isCritical // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LabResultLine].
extension LabResultLinePatterns on LabResultLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LabResultLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LabResultLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LabResultLine value)  $default,){
final _that = this;
switch (_that) {
case _LabResultLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LabResultLine value)?  $default,){
final _that = this;
switch (_that) {
case _LabResultLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String value,  String? unit,  String? referenceRange,  LabAbnormalFlag? abnormalFlag,  bool isCritical)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LabResultLine() when $default != null:
return $default(_that.label,_that.value,_that.unit,_that.referenceRange,_that.abnormalFlag,_that.isCritical);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String value,  String? unit,  String? referenceRange,  LabAbnormalFlag? abnormalFlag,  bool isCritical)  $default,) {final _that = this;
switch (_that) {
case _LabResultLine():
return $default(_that.label,_that.value,_that.unit,_that.referenceRange,_that.abnormalFlag,_that.isCritical);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String value,  String? unit,  String? referenceRange,  LabAbnormalFlag? abnormalFlag,  bool isCritical)?  $default,) {final _that = this;
switch (_that) {
case _LabResultLine() when $default != null:
return $default(_that.label,_that.value,_that.unit,_that.referenceRange,_that.abnormalFlag,_that.isCritical);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LabResultLine implements LabResultLine {
  const _LabResultLine({required this.label, required this.value, this.unit, this.referenceRange, this.abnormalFlag, this.isCritical = false});
  factory _LabResultLine.fromJson(Map<String, dynamic> json) => _$LabResultLineFromJson(json);

@override final  String label;
@override final  String value;
@override final  String? unit;
@override final  String? referenceRange;
@override final  LabAbnormalFlag? abnormalFlag;
@override@JsonKey() final  bool isCritical;

/// Create a copy of LabResultLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LabResultLineCopyWith<_LabResultLine> get copyWith => __$LabResultLineCopyWithImpl<_LabResultLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LabResultLineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LabResultLine&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.referenceRange, referenceRange) || other.referenceRange == referenceRange)&&(identical(other.abnormalFlag, abnormalFlag) || other.abnormalFlag == abnormalFlag)&&(identical(other.isCritical, isCritical) || other.isCritical == isCritical));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,value,unit,referenceRange,abnormalFlag,isCritical);

@override
String toString() {
  return 'LabResultLine(label: $label, value: $value, unit: $unit, referenceRange: $referenceRange, abnormalFlag: $abnormalFlag, isCritical: $isCritical)';
}


}

/// @nodoc
abstract mixin class _$LabResultLineCopyWith<$Res> implements $LabResultLineCopyWith<$Res> {
  factory _$LabResultLineCopyWith(_LabResultLine value, $Res Function(_LabResultLine) _then) = __$LabResultLineCopyWithImpl;
@override @useResult
$Res call({
 String label, String value, String? unit, String? referenceRange, LabAbnormalFlag? abnormalFlag, bool isCritical
});




}
/// @nodoc
class __$LabResultLineCopyWithImpl<$Res>
    implements _$LabResultLineCopyWith<$Res> {
  __$LabResultLineCopyWithImpl(this._self, this._then);

  final _LabResultLine _self;
  final $Res Function(_LabResultLine) _then;

/// Create a copy of LabResultLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? value = null,Object? unit = freezed,Object? referenceRange = freezed,Object? abnormalFlag = freezed,Object? isCritical = null,}) {
  return _then(_LabResultLine(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,referenceRange: freezed == referenceRange ? _self.referenceRange : referenceRange // ignore: cast_nullable_to_non_nullable
as String?,abnormalFlag: freezed == abnormalFlag ? _self.abnormalFlag : abnormalFlag // ignore: cast_nullable_to_non_nullable
as LabAbnormalFlag?,isCritical: null == isCritical ? _self.isCritical : isCritical // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$LabResultPanel {

 String get testName; String get status; List<LabResultLine> get results;
/// Create a copy of LabResultPanel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabResultPanelCopyWith<LabResultPanel> get copyWith => _$LabResultPanelCopyWithImpl<LabResultPanel>(this as LabResultPanel, _$identity);

  /// Serializes this LabResultPanel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabResultPanel&&(identical(other.testName, testName) || other.testName == testName)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,testName,status,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'LabResultPanel(testName: $testName, status: $status, results: $results)';
}


}

/// @nodoc
abstract mixin class $LabResultPanelCopyWith<$Res>  {
  factory $LabResultPanelCopyWith(LabResultPanel value, $Res Function(LabResultPanel) _then) = _$LabResultPanelCopyWithImpl;
@useResult
$Res call({
 String testName, String status, List<LabResultLine> results
});




}
/// @nodoc
class _$LabResultPanelCopyWithImpl<$Res>
    implements $LabResultPanelCopyWith<$Res> {
  _$LabResultPanelCopyWithImpl(this._self, this._then);

  final LabResultPanel _self;
  final $Res Function(LabResultPanel) _then;

/// Create a copy of LabResultPanel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? testName = null,Object? status = null,Object? results = null,}) {
  return _then(_self.copyWith(
testName: null == testName ? _self.testName : testName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<LabResultLine>,
  ));
}

}


/// Adds pattern-matching-related methods to [LabResultPanel].
extension LabResultPanelPatterns on LabResultPanel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LabResultPanel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LabResultPanel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LabResultPanel value)  $default,){
final _that = this;
switch (_that) {
case _LabResultPanel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LabResultPanel value)?  $default,){
final _that = this;
switch (_that) {
case _LabResultPanel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String testName,  String status,  List<LabResultLine> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LabResultPanel() when $default != null:
return $default(_that.testName,_that.status,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String testName,  String status,  List<LabResultLine> results)  $default,) {final _that = this;
switch (_that) {
case _LabResultPanel():
return $default(_that.testName,_that.status,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String testName,  String status,  List<LabResultLine> results)?  $default,) {final _that = this;
switch (_that) {
case _LabResultPanel() when $default != null:
return $default(_that.testName,_that.status,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LabResultPanel implements LabResultPanel {
  const _LabResultPanel({required this.testName, required this.status, final  List<LabResultLine> results = const []}): _results = results;
  factory _LabResultPanel.fromJson(Map<String, dynamic> json) => _$LabResultPanelFromJson(json);

@override final  String testName;
@override final  String status;
 final  List<LabResultLine> _results;
@override@JsonKey() List<LabResultLine> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of LabResultPanel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LabResultPanelCopyWith<_LabResultPanel> get copyWith => __$LabResultPanelCopyWithImpl<_LabResultPanel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LabResultPanelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LabResultPanel&&(identical(other.testName, testName) || other.testName == testName)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,testName,status,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'LabResultPanel(testName: $testName, status: $status, results: $results)';
}


}

/// @nodoc
abstract mixin class _$LabResultPanelCopyWith<$Res> implements $LabResultPanelCopyWith<$Res> {
  factory _$LabResultPanelCopyWith(_LabResultPanel value, $Res Function(_LabResultPanel) _then) = __$LabResultPanelCopyWithImpl;
@override @useResult
$Res call({
 String testName, String status, List<LabResultLine> results
});




}
/// @nodoc
class __$LabResultPanelCopyWithImpl<$Res>
    implements _$LabResultPanelCopyWith<$Res> {
  __$LabResultPanelCopyWithImpl(this._self, this._then);

  final _LabResultPanel _self;
  final $Res Function(_LabResultPanel) _then;

/// Create a copy of LabResultPanel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? testName = null,Object? status = null,Object? results = null,}) {
  return _then(_LabResultPanel(
testName: null == testName ? _self.testName : testName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<LabResultLine>,
  ));
}


}


/// @nodoc
mixin _$LabResultDetail {

 String get id; LabOrderStatus get status; DateTime get orderedAt; DateTime? get completedAt; DateTime? get verifiedAt; String get doctorName; String? get pdfUrl; List<LabResultPanel> get panels;
/// Create a copy of LabResultDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabResultDetailCopyWith<LabResultDetail> get copyWith => _$LabResultDetailCopyWithImpl<LabResultDetail>(this as LabResultDetail, _$identity);

  /// Serializes this LabResultDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabResultDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.orderedAt, orderedAt) || other.orderedAt == orderedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&const DeepCollectionEquality().equals(other.panels, panels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,orderedAt,completedAt,verifiedAt,doctorName,pdfUrl,const DeepCollectionEquality().hash(panels));

@override
String toString() {
  return 'LabResultDetail(id: $id, status: $status, orderedAt: $orderedAt, completedAt: $completedAt, verifiedAt: $verifiedAt, doctorName: $doctorName, pdfUrl: $pdfUrl, panels: $panels)';
}


}

/// @nodoc
abstract mixin class $LabResultDetailCopyWith<$Res>  {
  factory $LabResultDetailCopyWith(LabResultDetail value, $Res Function(LabResultDetail) _then) = _$LabResultDetailCopyWithImpl;
@useResult
$Res call({
 String id, LabOrderStatus status, DateTime orderedAt, DateTime? completedAt, DateTime? verifiedAt, String doctorName, String? pdfUrl, List<LabResultPanel> panels
});




}
/// @nodoc
class _$LabResultDetailCopyWithImpl<$Res>
    implements $LabResultDetailCopyWith<$Res> {
  _$LabResultDetailCopyWithImpl(this._self, this._then);

  final LabResultDetail _self;
  final $Res Function(LabResultDetail) _then;

/// Create a copy of LabResultDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? orderedAt = null,Object? completedAt = freezed,Object? verifiedAt = freezed,Object? doctorName = null,Object? pdfUrl = freezed,Object? panels = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LabOrderStatus,orderedAt: null == orderedAt ? _self.orderedAt : orderedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,pdfUrl: freezed == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String?,panels: null == panels ? _self.panels : panels // ignore: cast_nullable_to_non_nullable
as List<LabResultPanel>,
  ));
}

}


/// Adds pattern-matching-related methods to [LabResultDetail].
extension LabResultDetailPatterns on LabResultDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LabResultDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LabResultDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LabResultDetail value)  $default,){
final _that = this;
switch (_that) {
case _LabResultDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LabResultDetail value)?  $default,){
final _that = this;
switch (_that) {
case _LabResultDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LabOrderStatus status,  DateTime orderedAt,  DateTime? completedAt,  DateTime? verifiedAt,  String doctorName,  String? pdfUrl,  List<LabResultPanel> panels)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LabResultDetail() when $default != null:
return $default(_that.id,_that.status,_that.orderedAt,_that.completedAt,_that.verifiedAt,_that.doctorName,_that.pdfUrl,_that.panels);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LabOrderStatus status,  DateTime orderedAt,  DateTime? completedAt,  DateTime? verifiedAt,  String doctorName,  String? pdfUrl,  List<LabResultPanel> panels)  $default,) {final _that = this;
switch (_that) {
case _LabResultDetail():
return $default(_that.id,_that.status,_that.orderedAt,_that.completedAt,_that.verifiedAt,_that.doctorName,_that.pdfUrl,_that.panels);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LabOrderStatus status,  DateTime orderedAt,  DateTime? completedAt,  DateTime? verifiedAt,  String doctorName,  String? pdfUrl,  List<LabResultPanel> panels)?  $default,) {final _that = this;
switch (_that) {
case _LabResultDetail() when $default != null:
return $default(_that.id,_that.status,_that.orderedAt,_that.completedAt,_that.verifiedAt,_that.doctorName,_that.pdfUrl,_that.panels);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LabResultDetail implements LabResultDetail {
  const _LabResultDetail({required this.id, required this.status, required this.orderedAt, this.completedAt, this.verifiedAt, required this.doctorName, this.pdfUrl, final  List<LabResultPanel> panels = const []}): _panels = panels;
  factory _LabResultDetail.fromJson(Map<String, dynamic> json) => _$LabResultDetailFromJson(json);

@override final  String id;
@override final  LabOrderStatus status;
@override final  DateTime orderedAt;
@override final  DateTime? completedAt;
@override final  DateTime? verifiedAt;
@override final  String doctorName;
@override final  String? pdfUrl;
 final  List<LabResultPanel> _panels;
@override@JsonKey() List<LabResultPanel> get panels {
  if (_panels is EqualUnmodifiableListView) return _panels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_panels);
}


/// Create a copy of LabResultDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LabResultDetailCopyWith<_LabResultDetail> get copyWith => __$LabResultDetailCopyWithImpl<_LabResultDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LabResultDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LabResultDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.orderedAt, orderedAt) || other.orderedAt == orderedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&const DeepCollectionEquality().equals(other._panels, _panels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,orderedAt,completedAt,verifiedAt,doctorName,pdfUrl,const DeepCollectionEquality().hash(_panels));

@override
String toString() {
  return 'LabResultDetail(id: $id, status: $status, orderedAt: $orderedAt, completedAt: $completedAt, verifiedAt: $verifiedAt, doctorName: $doctorName, pdfUrl: $pdfUrl, panels: $panels)';
}


}

/// @nodoc
abstract mixin class _$LabResultDetailCopyWith<$Res> implements $LabResultDetailCopyWith<$Res> {
  factory _$LabResultDetailCopyWith(_LabResultDetail value, $Res Function(_LabResultDetail) _then) = __$LabResultDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, LabOrderStatus status, DateTime orderedAt, DateTime? completedAt, DateTime? verifiedAt, String doctorName, String? pdfUrl, List<LabResultPanel> panels
});




}
/// @nodoc
class __$LabResultDetailCopyWithImpl<$Res>
    implements _$LabResultDetailCopyWith<$Res> {
  __$LabResultDetailCopyWithImpl(this._self, this._then);

  final _LabResultDetail _self;
  final $Res Function(_LabResultDetail) _then;

/// Create a copy of LabResultDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? orderedAt = null,Object? completedAt = freezed,Object? verifiedAt = freezed,Object? doctorName = null,Object? pdfUrl = freezed,Object? panels = null,}) {
  return _then(_LabResultDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LabOrderStatus,orderedAt: null == orderedAt ? _self.orderedAt : orderedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,pdfUrl: freezed == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String?,panels: null == panels ? _self._panels : panels // ignore: cast_nullable_to_non_nullable
as List<LabResultPanel>,
  ));
}


}

// dart format on
