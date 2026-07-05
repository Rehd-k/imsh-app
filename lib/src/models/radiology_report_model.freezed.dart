// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radiology_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RadiologyReportSummary {

 String get id; String get scanType; RadiologyModality get modality; DateTime get performedAt; String get radiologistName; String get referringDoctorName; RadiologyReportStatus get status; String? get pdfUrl; String? get dicomUrl; String? get thumbnailUrl;
/// Create a copy of RadiologyReportSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadiologyReportSummaryCopyWith<RadiologyReportSummary> get copyWith => _$RadiologyReportSummaryCopyWithImpl<RadiologyReportSummary>(this as RadiologyReportSummary, _$identity);

  /// Serializes this RadiologyReportSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadiologyReportSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.scanType, scanType) || other.scanType == scanType)&&(identical(other.modality, modality) || other.modality == modality)&&(identical(other.performedAt, performedAt) || other.performedAt == performedAt)&&(identical(other.radiologistName, radiologistName) || other.radiologistName == radiologistName)&&(identical(other.referringDoctorName, referringDoctorName) || other.referringDoctorName == referringDoctorName)&&(identical(other.status, status) || other.status == status)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.dicomUrl, dicomUrl) || other.dicomUrl == dicomUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,scanType,modality,performedAt,radiologistName,referringDoctorName,status,pdfUrl,dicomUrl,thumbnailUrl);

@override
String toString() {
  return 'RadiologyReportSummary(id: $id, scanType: $scanType, modality: $modality, performedAt: $performedAt, radiologistName: $radiologistName, referringDoctorName: $referringDoctorName, status: $status, pdfUrl: $pdfUrl, dicomUrl: $dicomUrl, thumbnailUrl: $thumbnailUrl)';
}


}

/// @nodoc
abstract mixin class $RadiologyReportSummaryCopyWith<$Res>  {
  factory $RadiologyReportSummaryCopyWith(RadiologyReportSummary value, $Res Function(RadiologyReportSummary) _then) = _$RadiologyReportSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String scanType, RadiologyModality modality, DateTime performedAt, String radiologistName, String referringDoctorName, RadiologyReportStatus status, String? pdfUrl, String? dicomUrl, String? thumbnailUrl
});




}
/// @nodoc
class _$RadiologyReportSummaryCopyWithImpl<$Res>
    implements $RadiologyReportSummaryCopyWith<$Res> {
  _$RadiologyReportSummaryCopyWithImpl(this._self, this._then);

  final RadiologyReportSummary _self;
  final $Res Function(RadiologyReportSummary) _then;

/// Create a copy of RadiologyReportSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? scanType = null,Object? modality = null,Object? performedAt = null,Object? radiologistName = null,Object? referringDoctorName = null,Object? status = null,Object? pdfUrl = freezed,Object? dicomUrl = freezed,Object? thumbnailUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,scanType: null == scanType ? _self.scanType : scanType // ignore: cast_nullable_to_non_nullable
as String,modality: null == modality ? _self.modality : modality // ignore: cast_nullable_to_non_nullable
as RadiologyModality,performedAt: null == performedAt ? _self.performedAt : performedAt // ignore: cast_nullable_to_non_nullable
as DateTime,radiologistName: null == radiologistName ? _self.radiologistName : radiologistName // ignore: cast_nullable_to_non_nullable
as String,referringDoctorName: null == referringDoctorName ? _self.referringDoctorName : referringDoctorName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RadiologyReportStatus,pdfUrl: freezed == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String?,dicomUrl: freezed == dicomUrl ? _self.dicomUrl : dicomUrl // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RadiologyReportSummary].
extension RadiologyReportSummaryPatterns on RadiologyReportSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RadiologyReportSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RadiologyReportSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RadiologyReportSummary value)  $default,){
final _that = this;
switch (_that) {
case _RadiologyReportSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RadiologyReportSummary value)?  $default,){
final _that = this;
switch (_that) {
case _RadiologyReportSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String scanType,  RadiologyModality modality,  DateTime performedAt,  String radiologistName,  String referringDoctorName,  RadiologyReportStatus status,  String? pdfUrl,  String? dicomUrl,  String? thumbnailUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RadiologyReportSummary() when $default != null:
return $default(_that.id,_that.scanType,_that.modality,_that.performedAt,_that.radiologistName,_that.referringDoctorName,_that.status,_that.pdfUrl,_that.dicomUrl,_that.thumbnailUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String scanType,  RadiologyModality modality,  DateTime performedAt,  String radiologistName,  String referringDoctorName,  RadiologyReportStatus status,  String? pdfUrl,  String? dicomUrl,  String? thumbnailUrl)  $default,) {final _that = this;
switch (_that) {
case _RadiologyReportSummary():
return $default(_that.id,_that.scanType,_that.modality,_that.performedAt,_that.radiologistName,_that.referringDoctorName,_that.status,_that.pdfUrl,_that.dicomUrl,_that.thumbnailUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String scanType,  RadiologyModality modality,  DateTime performedAt,  String radiologistName,  String referringDoctorName,  RadiologyReportStatus status,  String? pdfUrl,  String? dicomUrl,  String? thumbnailUrl)?  $default,) {final _that = this;
switch (_that) {
case _RadiologyReportSummary() when $default != null:
return $default(_that.id,_that.scanType,_that.modality,_that.performedAt,_that.radiologistName,_that.referringDoctorName,_that.status,_that.pdfUrl,_that.dicomUrl,_that.thumbnailUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RadiologyReportSummary implements RadiologyReportSummary {
  const _RadiologyReportSummary({required this.id, required this.scanType, required this.modality, required this.performedAt, required this.radiologistName, required this.referringDoctorName, required this.status, this.pdfUrl, this.dicomUrl, this.thumbnailUrl});
  factory _RadiologyReportSummary.fromJson(Map<String, dynamic> json) => _$RadiologyReportSummaryFromJson(json);

@override final  String id;
@override final  String scanType;
@override final  RadiologyModality modality;
@override final  DateTime performedAt;
@override final  String radiologistName;
@override final  String referringDoctorName;
@override final  RadiologyReportStatus status;
@override final  String? pdfUrl;
@override final  String? dicomUrl;
@override final  String? thumbnailUrl;

/// Create a copy of RadiologyReportSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RadiologyReportSummaryCopyWith<_RadiologyReportSummary> get copyWith => __$RadiologyReportSummaryCopyWithImpl<_RadiologyReportSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RadiologyReportSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RadiologyReportSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.scanType, scanType) || other.scanType == scanType)&&(identical(other.modality, modality) || other.modality == modality)&&(identical(other.performedAt, performedAt) || other.performedAt == performedAt)&&(identical(other.radiologistName, radiologistName) || other.radiologistName == radiologistName)&&(identical(other.referringDoctorName, referringDoctorName) || other.referringDoctorName == referringDoctorName)&&(identical(other.status, status) || other.status == status)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.dicomUrl, dicomUrl) || other.dicomUrl == dicomUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,scanType,modality,performedAt,radiologistName,referringDoctorName,status,pdfUrl,dicomUrl,thumbnailUrl);

@override
String toString() {
  return 'RadiologyReportSummary(id: $id, scanType: $scanType, modality: $modality, performedAt: $performedAt, radiologistName: $radiologistName, referringDoctorName: $referringDoctorName, status: $status, pdfUrl: $pdfUrl, dicomUrl: $dicomUrl, thumbnailUrl: $thumbnailUrl)';
}


}

/// @nodoc
abstract mixin class _$RadiologyReportSummaryCopyWith<$Res> implements $RadiologyReportSummaryCopyWith<$Res> {
  factory _$RadiologyReportSummaryCopyWith(_RadiologyReportSummary value, $Res Function(_RadiologyReportSummary) _then) = __$RadiologyReportSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String scanType, RadiologyModality modality, DateTime performedAt, String radiologistName, String referringDoctorName, RadiologyReportStatus status, String? pdfUrl, String? dicomUrl, String? thumbnailUrl
});




}
/// @nodoc
class __$RadiologyReportSummaryCopyWithImpl<$Res>
    implements _$RadiologyReportSummaryCopyWith<$Res> {
  __$RadiologyReportSummaryCopyWithImpl(this._self, this._then);

  final _RadiologyReportSummary _self;
  final $Res Function(_RadiologyReportSummary) _then;

/// Create a copy of RadiologyReportSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? scanType = null,Object? modality = null,Object? performedAt = null,Object? radiologistName = null,Object? referringDoctorName = null,Object? status = null,Object? pdfUrl = freezed,Object? dicomUrl = freezed,Object? thumbnailUrl = freezed,}) {
  return _then(_RadiologyReportSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,scanType: null == scanType ? _self.scanType : scanType // ignore: cast_nullable_to_non_nullable
as String,modality: null == modality ? _self.modality : modality // ignore: cast_nullable_to_non_nullable
as RadiologyModality,performedAt: null == performedAt ? _self.performedAt : performedAt // ignore: cast_nullable_to_non_nullable
as DateTime,radiologistName: null == radiologistName ? _self.radiologistName : radiologistName // ignore: cast_nullable_to_non_nullable
as String,referringDoctorName: null == referringDoctorName ? _self.referringDoctorName : referringDoctorName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RadiologyReportStatus,pdfUrl: freezed == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String?,dicomUrl: freezed == dicomUrl ? _self.dicomUrl : dicomUrl // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RadiologyStatistics {

 int get totalScans; int get pendingReviews; int get profileCompleteness;
/// Create a copy of RadiologyStatistics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadiologyStatisticsCopyWith<RadiologyStatistics> get copyWith => _$RadiologyStatisticsCopyWithImpl<RadiologyStatistics>(this as RadiologyStatistics, _$identity);

  /// Serializes this RadiologyStatistics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadiologyStatistics&&(identical(other.totalScans, totalScans) || other.totalScans == totalScans)&&(identical(other.pendingReviews, pendingReviews) || other.pendingReviews == pendingReviews)&&(identical(other.profileCompleteness, profileCompleteness) || other.profileCompleteness == profileCompleteness));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalScans,pendingReviews,profileCompleteness);

@override
String toString() {
  return 'RadiologyStatistics(totalScans: $totalScans, pendingReviews: $pendingReviews, profileCompleteness: $profileCompleteness)';
}


}

/// @nodoc
abstract mixin class $RadiologyStatisticsCopyWith<$Res>  {
  factory $RadiologyStatisticsCopyWith(RadiologyStatistics value, $Res Function(RadiologyStatistics) _then) = _$RadiologyStatisticsCopyWithImpl;
@useResult
$Res call({
 int totalScans, int pendingReviews, int profileCompleteness
});




}
/// @nodoc
class _$RadiologyStatisticsCopyWithImpl<$Res>
    implements $RadiologyStatisticsCopyWith<$Res> {
  _$RadiologyStatisticsCopyWithImpl(this._self, this._then);

  final RadiologyStatistics _self;
  final $Res Function(RadiologyStatistics) _then;

/// Create a copy of RadiologyStatistics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalScans = null,Object? pendingReviews = null,Object? profileCompleteness = null,}) {
  return _then(_self.copyWith(
totalScans: null == totalScans ? _self.totalScans : totalScans // ignore: cast_nullable_to_non_nullable
as int,pendingReviews: null == pendingReviews ? _self.pendingReviews : pendingReviews // ignore: cast_nullable_to_non_nullable
as int,profileCompleteness: null == profileCompleteness ? _self.profileCompleteness : profileCompleteness // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RadiologyStatistics].
extension RadiologyStatisticsPatterns on RadiologyStatistics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RadiologyStatistics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RadiologyStatistics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RadiologyStatistics value)  $default,){
final _that = this;
switch (_that) {
case _RadiologyStatistics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RadiologyStatistics value)?  $default,){
final _that = this;
switch (_that) {
case _RadiologyStatistics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalScans,  int pendingReviews,  int profileCompleteness)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RadiologyStatistics() when $default != null:
return $default(_that.totalScans,_that.pendingReviews,_that.profileCompleteness);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalScans,  int pendingReviews,  int profileCompleteness)  $default,) {final _that = this;
switch (_that) {
case _RadiologyStatistics():
return $default(_that.totalScans,_that.pendingReviews,_that.profileCompleteness);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalScans,  int pendingReviews,  int profileCompleteness)?  $default,) {final _that = this;
switch (_that) {
case _RadiologyStatistics() when $default != null:
return $default(_that.totalScans,_that.pendingReviews,_that.profileCompleteness);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RadiologyStatistics implements RadiologyStatistics {
  const _RadiologyStatistics({this.totalScans = 0, this.pendingReviews = 0, this.profileCompleteness = 0});
  factory _RadiologyStatistics.fromJson(Map<String, dynamic> json) => _$RadiologyStatisticsFromJson(json);

@override@JsonKey() final  int totalScans;
@override@JsonKey() final  int pendingReviews;
@override@JsonKey() final  int profileCompleteness;

/// Create a copy of RadiologyStatistics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RadiologyStatisticsCopyWith<_RadiologyStatistics> get copyWith => __$RadiologyStatisticsCopyWithImpl<_RadiologyStatistics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RadiologyStatisticsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RadiologyStatistics&&(identical(other.totalScans, totalScans) || other.totalScans == totalScans)&&(identical(other.pendingReviews, pendingReviews) || other.pendingReviews == pendingReviews)&&(identical(other.profileCompleteness, profileCompleteness) || other.profileCompleteness == profileCompleteness));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalScans,pendingReviews,profileCompleteness);

@override
String toString() {
  return 'RadiologyStatistics(totalScans: $totalScans, pendingReviews: $pendingReviews, profileCompleteness: $profileCompleteness)';
}


}

/// @nodoc
abstract mixin class _$RadiologyStatisticsCopyWith<$Res> implements $RadiologyStatisticsCopyWith<$Res> {
  factory _$RadiologyStatisticsCopyWith(_RadiologyStatistics value, $Res Function(_RadiologyStatistics) _then) = __$RadiologyStatisticsCopyWithImpl;
@override @useResult
$Res call({
 int totalScans, int pendingReviews, int profileCompleteness
});




}
/// @nodoc
class __$RadiologyStatisticsCopyWithImpl<$Res>
    implements _$RadiologyStatisticsCopyWith<$Res> {
  __$RadiologyStatisticsCopyWithImpl(this._self, this._then);

  final _RadiologyStatistics _self;
  final $Res Function(_RadiologyStatistics) _then;

/// Create a copy of RadiologyStatistics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalScans = null,Object? pendingReviews = null,Object? profileCompleteness = null,}) {
  return _then(_RadiologyStatistics(
totalScans: null == totalScans ? _self.totalScans : totalScans // ignore: cast_nullable_to_non_nullable
as int,pendingReviews: null == pendingReviews ? _self.pendingReviews : pendingReviews // ignore: cast_nullable_to_non_nullable
as int,profileCompleteness: null == profileCompleteness ? _self.profileCompleteness : profileCompleteness // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$RadiologyReportListResponse {

 List<RadiologyReportSummary> get data; int get total; int get page; int get limit; RadiologyStatistics get statistics;
/// Create a copy of RadiologyReportListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadiologyReportListResponseCopyWith<RadiologyReportListResponse> get copyWith => _$RadiologyReportListResponseCopyWithImpl<RadiologyReportListResponse>(this as RadiologyReportListResponse, _$identity);

  /// Serializes this RadiologyReportListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadiologyReportListResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.statistics, statistics) || other.statistics == statistics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),total,page,limit,statistics);

@override
String toString() {
  return 'RadiologyReportListResponse(data: $data, total: $total, page: $page, limit: $limit, statistics: $statistics)';
}


}

/// @nodoc
abstract mixin class $RadiologyReportListResponseCopyWith<$Res>  {
  factory $RadiologyReportListResponseCopyWith(RadiologyReportListResponse value, $Res Function(RadiologyReportListResponse) _then) = _$RadiologyReportListResponseCopyWithImpl;
@useResult
$Res call({
 List<RadiologyReportSummary> data, int total, int page, int limit, RadiologyStatistics statistics
});


$RadiologyStatisticsCopyWith<$Res> get statistics;

}
/// @nodoc
class _$RadiologyReportListResponseCopyWithImpl<$Res>
    implements $RadiologyReportListResponseCopyWith<$Res> {
  _$RadiologyReportListResponseCopyWithImpl(this._self, this._then);

  final RadiologyReportListResponse _self;
  final $Res Function(RadiologyReportListResponse) _then;

/// Create a copy of RadiologyReportListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? total = null,Object? page = null,Object? limit = null,Object? statistics = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<RadiologyReportSummary>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,statistics: null == statistics ? _self.statistics : statistics // ignore: cast_nullable_to_non_nullable
as RadiologyStatistics,
  ));
}
/// Create a copy of RadiologyReportListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RadiologyStatisticsCopyWith<$Res> get statistics {
  
  return $RadiologyStatisticsCopyWith<$Res>(_self.statistics, (value) {
    return _then(_self.copyWith(statistics: value));
  });
}
}


/// Adds pattern-matching-related methods to [RadiologyReportListResponse].
extension RadiologyReportListResponsePatterns on RadiologyReportListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RadiologyReportListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RadiologyReportListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RadiologyReportListResponse value)  $default,){
final _that = this;
switch (_that) {
case _RadiologyReportListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RadiologyReportListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RadiologyReportListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<RadiologyReportSummary> data,  int total,  int page,  int limit,  RadiologyStatistics statistics)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RadiologyReportListResponse() when $default != null:
return $default(_that.data,_that.total,_that.page,_that.limit,_that.statistics);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<RadiologyReportSummary> data,  int total,  int page,  int limit,  RadiologyStatistics statistics)  $default,) {final _that = this;
switch (_that) {
case _RadiologyReportListResponse():
return $default(_that.data,_that.total,_that.page,_that.limit,_that.statistics);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<RadiologyReportSummary> data,  int total,  int page,  int limit,  RadiologyStatistics statistics)?  $default,) {final _that = this;
switch (_that) {
case _RadiologyReportListResponse() when $default != null:
return $default(_that.data,_that.total,_that.page,_that.limit,_that.statistics);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RadiologyReportListResponse implements RadiologyReportListResponse {
  const _RadiologyReportListResponse({required final  List<RadiologyReportSummary> data, required this.total, required this.page, required this.limit, required this.statistics}): _data = data;
  factory _RadiologyReportListResponse.fromJson(Map<String, dynamic> json) => _$RadiologyReportListResponseFromJson(json);

 final  List<RadiologyReportSummary> _data;
@override List<RadiologyReportSummary> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  int total;
@override final  int page;
@override final  int limit;
@override final  RadiologyStatistics statistics;

/// Create a copy of RadiologyReportListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RadiologyReportListResponseCopyWith<_RadiologyReportListResponse> get copyWith => __$RadiologyReportListResponseCopyWithImpl<_RadiologyReportListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RadiologyReportListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RadiologyReportListResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.statistics, statistics) || other.statistics == statistics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),total,page,limit,statistics);

@override
String toString() {
  return 'RadiologyReportListResponse(data: $data, total: $total, page: $page, limit: $limit, statistics: $statistics)';
}


}

/// @nodoc
abstract mixin class _$RadiologyReportListResponseCopyWith<$Res> implements $RadiologyReportListResponseCopyWith<$Res> {
  factory _$RadiologyReportListResponseCopyWith(_RadiologyReportListResponse value, $Res Function(_RadiologyReportListResponse) _then) = __$RadiologyReportListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<RadiologyReportSummary> data, int total, int page, int limit, RadiologyStatistics statistics
});


@override $RadiologyStatisticsCopyWith<$Res> get statistics;

}
/// @nodoc
class __$RadiologyReportListResponseCopyWithImpl<$Res>
    implements _$RadiologyReportListResponseCopyWith<$Res> {
  __$RadiologyReportListResponseCopyWithImpl(this._self, this._then);

  final _RadiologyReportListResponse _self;
  final $Res Function(_RadiologyReportListResponse) _then;

/// Create a copy of RadiologyReportListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? total = null,Object? page = null,Object? limit = null,Object? statistics = null,}) {
  return _then(_RadiologyReportListResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<RadiologyReportSummary>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,statistics: null == statistics ? _self.statistics : statistics // ignore: cast_nullable_to_non_nullable
as RadiologyStatistics,
  ));
}

/// Create a copy of RadiologyReportListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RadiologyStatisticsCopyWith<$Res> get statistics {
  
  return $RadiologyStatisticsCopyWith<$Res>(_self.statistics, (value) {
    return _then(_self.copyWith(statistics: value));
  });
}
}


/// @nodoc
mixin _$RadiologyReportDetail {

 String get id; String get scanType; RadiologyModality get modality; DateTime get performedAt; DateTime? get verifiedAt; String get radiologistName; String get referringDoctorName; RadiologyReportStatus get status; String? get pdfUrl; String? get dicomUrl; String? get thumbnailUrl; String? get findings; String? get impression; String? get reportBody;
/// Create a copy of RadiologyReportDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadiologyReportDetailCopyWith<RadiologyReportDetail> get copyWith => _$RadiologyReportDetailCopyWithImpl<RadiologyReportDetail>(this as RadiologyReportDetail, _$identity);

  /// Serializes this RadiologyReportDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadiologyReportDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.scanType, scanType) || other.scanType == scanType)&&(identical(other.modality, modality) || other.modality == modality)&&(identical(other.performedAt, performedAt) || other.performedAt == performedAt)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt)&&(identical(other.radiologistName, radiologistName) || other.radiologistName == radiologistName)&&(identical(other.referringDoctorName, referringDoctorName) || other.referringDoctorName == referringDoctorName)&&(identical(other.status, status) || other.status == status)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.dicomUrl, dicomUrl) || other.dicomUrl == dicomUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.findings, findings) || other.findings == findings)&&(identical(other.impression, impression) || other.impression == impression)&&(identical(other.reportBody, reportBody) || other.reportBody == reportBody));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,scanType,modality,performedAt,verifiedAt,radiologistName,referringDoctorName,status,pdfUrl,dicomUrl,thumbnailUrl,findings,impression,reportBody);

@override
String toString() {
  return 'RadiologyReportDetail(id: $id, scanType: $scanType, modality: $modality, performedAt: $performedAt, verifiedAt: $verifiedAt, radiologistName: $radiologistName, referringDoctorName: $referringDoctorName, status: $status, pdfUrl: $pdfUrl, dicomUrl: $dicomUrl, thumbnailUrl: $thumbnailUrl, findings: $findings, impression: $impression, reportBody: $reportBody)';
}


}

/// @nodoc
abstract mixin class $RadiologyReportDetailCopyWith<$Res>  {
  factory $RadiologyReportDetailCopyWith(RadiologyReportDetail value, $Res Function(RadiologyReportDetail) _then) = _$RadiologyReportDetailCopyWithImpl;
@useResult
$Res call({
 String id, String scanType, RadiologyModality modality, DateTime performedAt, DateTime? verifiedAt, String radiologistName, String referringDoctorName, RadiologyReportStatus status, String? pdfUrl, String? dicomUrl, String? thumbnailUrl, String? findings, String? impression, String? reportBody
});




}
/// @nodoc
class _$RadiologyReportDetailCopyWithImpl<$Res>
    implements $RadiologyReportDetailCopyWith<$Res> {
  _$RadiologyReportDetailCopyWithImpl(this._self, this._then);

  final RadiologyReportDetail _self;
  final $Res Function(RadiologyReportDetail) _then;

/// Create a copy of RadiologyReportDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? scanType = null,Object? modality = null,Object? performedAt = null,Object? verifiedAt = freezed,Object? radiologistName = null,Object? referringDoctorName = null,Object? status = null,Object? pdfUrl = freezed,Object? dicomUrl = freezed,Object? thumbnailUrl = freezed,Object? findings = freezed,Object? impression = freezed,Object? reportBody = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,scanType: null == scanType ? _self.scanType : scanType // ignore: cast_nullable_to_non_nullable
as String,modality: null == modality ? _self.modality : modality // ignore: cast_nullable_to_non_nullable
as RadiologyModality,performedAt: null == performedAt ? _self.performedAt : performedAt // ignore: cast_nullable_to_non_nullable
as DateTime,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,radiologistName: null == radiologistName ? _self.radiologistName : radiologistName // ignore: cast_nullable_to_non_nullable
as String,referringDoctorName: null == referringDoctorName ? _self.referringDoctorName : referringDoctorName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RadiologyReportStatus,pdfUrl: freezed == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String?,dicomUrl: freezed == dicomUrl ? _self.dicomUrl : dicomUrl // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,findings: freezed == findings ? _self.findings : findings // ignore: cast_nullable_to_non_nullable
as String?,impression: freezed == impression ? _self.impression : impression // ignore: cast_nullable_to_non_nullable
as String?,reportBody: freezed == reportBody ? _self.reportBody : reportBody // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RadiologyReportDetail].
extension RadiologyReportDetailPatterns on RadiologyReportDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RadiologyReportDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RadiologyReportDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RadiologyReportDetail value)  $default,){
final _that = this;
switch (_that) {
case _RadiologyReportDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RadiologyReportDetail value)?  $default,){
final _that = this;
switch (_that) {
case _RadiologyReportDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String scanType,  RadiologyModality modality,  DateTime performedAt,  DateTime? verifiedAt,  String radiologistName,  String referringDoctorName,  RadiologyReportStatus status,  String? pdfUrl,  String? dicomUrl,  String? thumbnailUrl,  String? findings,  String? impression,  String? reportBody)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RadiologyReportDetail() when $default != null:
return $default(_that.id,_that.scanType,_that.modality,_that.performedAt,_that.verifiedAt,_that.radiologistName,_that.referringDoctorName,_that.status,_that.pdfUrl,_that.dicomUrl,_that.thumbnailUrl,_that.findings,_that.impression,_that.reportBody);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String scanType,  RadiologyModality modality,  DateTime performedAt,  DateTime? verifiedAt,  String radiologistName,  String referringDoctorName,  RadiologyReportStatus status,  String? pdfUrl,  String? dicomUrl,  String? thumbnailUrl,  String? findings,  String? impression,  String? reportBody)  $default,) {final _that = this;
switch (_that) {
case _RadiologyReportDetail():
return $default(_that.id,_that.scanType,_that.modality,_that.performedAt,_that.verifiedAt,_that.radiologistName,_that.referringDoctorName,_that.status,_that.pdfUrl,_that.dicomUrl,_that.thumbnailUrl,_that.findings,_that.impression,_that.reportBody);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String scanType,  RadiologyModality modality,  DateTime performedAt,  DateTime? verifiedAt,  String radiologistName,  String referringDoctorName,  RadiologyReportStatus status,  String? pdfUrl,  String? dicomUrl,  String? thumbnailUrl,  String? findings,  String? impression,  String? reportBody)?  $default,) {final _that = this;
switch (_that) {
case _RadiologyReportDetail() when $default != null:
return $default(_that.id,_that.scanType,_that.modality,_that.performedAt,_that.verifiedAt,_that.radiologistName,_that.referringDoctorName,_that.status,_that.pdfUrl,_that.dicomUrl,_that.thumbnailUrl,_that.findings,_that.impression,_that.reportBody);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RadiologyReportDetail implements RadiologyReportDetail {
  const _RadiologyReportDetail({required this.id, required this.scanType, required this.modality, required this.performedAt, this.verifiedAt, required this.radiologistName, required this.referringDoctorName, required this.status, this.pdfUrl, this.dicomUrl, this.thumbnailUrl, this.findings, this.impression, this.reportBody});
  factory _RadiologyReportDetail.fromJson(Map<String, dynamic> json) => _$RadiologyReportDetailFromJson(json);

@override final  String id;
@override final  String scanType;
@override final  RadiologyModality modality;
@override final  DateTime performedAt;
@override final  DateTime? verifiedAt;
@override final  String radiologistName;
@override final  String referringDoctorName;
@override final  RadiologyReportStatus status;
@override final  String? pdfUrl;
@override final  String? dicomUrl;
@override final  String? thumbnailUrl;
@override final  String? findings;
@override final  String? impression;
@override final  String? reportBody;

/// Create a copy of RadiologyReportDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RadiologyReportDetailCopyWith<_RadiologyReportDetail> get copyWith => __$RadiologyReportDetailCopyWithImpl<_RadiologyReportDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RadiologyReportDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RadiologyReportDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.scanType, scanType) || other.scanType == scanType)&&(identical(other.modality, modality) || other.modality == modality)&&(identical(other.performedAt, performedAt) || other.performedAt == performedAt)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt)&&(identical(other.radiologistName, radiologistName) || other.radiologistName == radiologistName)&&(identical(other.referringDoctorName, referringDoctorName) || other.referringDoctorName == referringDoctorName)&&(identical(other.status, status) || other.status == status)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.dicomUrl, dicomUrl) || other.dicomUrl == dicomUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.findings, findings) || other.findings == findings)&&(identical(other.impression, impression) || other.impression == impression)&&(identical(other.reportBody, reportBody) || other.reportBody == reportBody));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,scanType,modality,performedAt,verifiedAt,radiologistName,referringDoctorName,status,pdfUrl,dicomUrl,thumbnailUrl,findings,impression,reportBody);

@override
String toString() {
  return 'RadiologyReportDetail(id: $id, scanType: $scanType, modality: $modality, performedAt: $performedAt, verifiedAt: $verifiedAt, radiologistName: $radiologistName, referringDoctorName: $referringDoctorName, status: $status, pdfUrl: $pdfUrl, dicomUrl: $dicomUrl, thumbnailUrl: $thumbnailUrl, findings: $findings, impression: $impression, reportBody: $reportBody)';
}


}

/// @nodoc
abstract mixin class _$RadiologyReportDetailCopyWith<$Res> implements $RadiologyReportDetailCopyWith<$Res> {
  factory _$RadiologyReportDetailCopyWith(_RadiologyReportDetail value, $Res Function(_RadiologyReportDetail) _then) = __$RadiologyReportDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String scanType, RadiologyModality modality, DateTime performedAt, DateTime? verifiedAt, String radiologistName, String referringDoctorName, RadiologyReportStatus status, String? pdfUrl, String? dicomUrl, String? thumbnailUrl, String? findings, String? impression, String? reportBody
});




}
/// @nodoc
class __$RadiologyReportDetailCopyWithImpl<$Res>
    implements _$RadiologyReportDetailCopyWith<$Res> {
  __$RadiologyReportDetailCopyWithImpl(this._self, this._then);

  final _RadiologyReportDetail _self;
  final $Res Function(_RadiologyReportDetail) _then;

/// Create a copy of RadiologyReportDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? scanType = null,Object? modality = null,Object? performedAt = null,Object? verifiedAt = freezed,Object? radiologistName = null,Object? referringDoctorName = null,Object? status = null,Object? pdfUrl = freezed,Object? dicomUrl = freezed,Object? thumbnailUrl = freezed,Object? findings = freezed,Object? impression = freezed,Object? reportBody = freezed,}) {
  return _then(_RadiologyReportDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,scanType: null == scanType ? _self.scanType : scanType // ignore: cast_nullable_to_non_nullable
as String,modality: null == modality ? _self.modality : modality // ignore: cast_nullable_to_non_nullable
as RadiologyModality,performedAt: null == performedAt ? _self.performedAt : performedAt // ignore: cast_nullable_to_non_nullable
as DateTime,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,radiologistName: null == radiologistName ? _self.radiologistName : radiologistName // ignore: cast_nullable_to_non_nullable
as String,referringDoctorName: null == referringDoctorName ? _self.referringDoctorName : referringDoctorName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RadiologyReportStatus,pdfUrl: freezed == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String?,dicomUrl: freezed == dicomUrl ? _self.dicomUrl : dicomUrl // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,findings: freezed == findings ? _self.findings : findings // ignore: cast_nullable_to_non_nullable
as String?,impression: freezed == impression ? _self.impression : impression // ignore: cast_nullable_to_non_nullable
as String?,reportBody: freezed == reportBody ? _self.reportBody : reportBody // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
