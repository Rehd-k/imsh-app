// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cycle_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CycleSettings {

 int get cycleLengthDays; int get periodLengthDays; bool get isDefault;
/// Create a copy of CycleSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CycleSettingsCopyWith<CycleSettings> get copyWith => _$CycleSettingsCopyWithImpl<CycleSettings>(this as CycleSettings, _$identity);

  /// Serializes this CycleSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CycleSettings&&(identical(other.cycleLengthDays, cycleLengthDays) || other.cycleLengthDays == cycleLengthDays)&&(identical(other.periodLengthDays, periodLengthDays) || other.periodLengthDays == periodLengthDays)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cycleLengthDays,periodLengthDays,isDefault);

@override
String toString() {
  return 'CycleSettings(cycleLengthDays: $cycleLengthDays, periodLengthDays: $periodLengthDays, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class $CycleSettingsCopyWith<$Res>  {
  factory $CycleSettingsCopyWith(CycleSettings value, $Res Function(CycleSettings) _then) = _$CycleSettingsCopyWithImpl;
@useResult
$Res call({
 int cycleLengthDays, int periodLengthDays, bool isDefault
});




}
/// @nodoc
class _$CycleSettingsCopyWithImpl<$Res>
    implements $CycleSettingsCopyWith<$Res> {
  _$CycleSettingsCopyWithImpl(this._self, this._then);

  final CycleSettings _self;
  final $Res Function(CycleSettings) _then;

/// Create a copy of CycleSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cycleLengthDays = null,Object? periodLengthDays = null,Object? isDefault = null,}) {
  return _then(_self.copyWith(
cycleLengthDays: null == cycleLengthDays ? _self.cycleLengthDays : cycleLengthDays // ignore: cast_nullable_to_non_nullable
as int,periodLengthDays: null == periodLengthDays ? _self.periodLengthDays : periodLengthDays // ignore: cast_nullable_to_non_nullable
as int,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CycleSettings].
extension CycleSettingsPatterns on CycleSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CycleSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CycleSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CycleSettings value)  $default,){
final _that = this;
switch (_that) {
case _CycleSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CycleSettings value)?  $default,){
final _that = this;
switch (_that) {
case _CycleSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int cycleLengthDays,  int periodLengthDays,  bool isDefault)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CycleSettings() when $default != null:
return $default(_that.cycleLengthDays,_that.periodLengthDays,_that.isDefault);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int cycleLengthDays,  int periodLengthDays,  bool isDefault)  $default,) {final _that = this;
switch (_that) {
case _CycleSettings():
return $default(_that.cycleLengthDays,_that.periodLengthDays,_that.isDefault);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int cycleLengthDays,  int periodLengthDays,  bool isDefault)?  $default,) {final _that = this;
switch (_that) {
case _CycleSettings() when $default != null:
return $default(_that.cycleLengthDays,_that.periodLengthDays,_that.isDefault);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CycleSettings implements CycleSettings {
  const _CycleSettings({required this.cycleLengthDays, required this.periodLengthDays, this.isDefault = false});
  factory _CycleSettings.fromJson(Map<String, dynamic> json) => _$CycleSettingsFromJson(json);

@override final  int cycleLengthDays;
@override final  int periodLengthDays;
@override@JsonKey() final  bool isDefault;

/// Create a copy of CycleSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CycleSettingsCopyWith<_CycleSettings> get copyWith => __$CycleSettingsCopyWithImpl<_CycleSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CycleSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CycleSettings&&(identical(other.cycleLengthDays, cycleLengthDays) || other.cycleLengthDays == cycleLengthDays)&&(identical(other.periodLengthDays, periodLengthDays) || other.periodLengthDays == periodLengthDays)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cycleLengthDays,periodLengthDays,isDefault);

@override
String toString() {
  return 'CycleSettings(cycleLengthDays: $cycleLengthDays, periodLengthDays: $periodLengthDays, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class _$CycleSettingsCopyWith<$Res> implements $CycleSettingsCopyWith<$Res> {
  factory _$CycleSettingsCopyWith(_CycleSettings value, $Res Function(_CycleSettings) _then) = __$CycleSettingsCopyWithImpl;
@override @useResult
$Res call({
 int cycleLengthDays, int periodLengthDays, bool isDefault
});




}
/// @nodoc
class __$CycleSettingsCopyWithImpl<$Res>
    implements _$CycleSettingsCopyWith<$Res> {
  __$CycleSettingsCopyWithImpl(this._self, this._then);

  final _CycleSettings _self;
  final $Res Function(_CycleSettings) _then;

/// Create a copy of CycleSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cycleLengthDays = null,Object? periodLengthDays = null,Object? isDefault = null,}) {
  return _then(_CycleSettings(
cycleLengthDays: null == cycleLengthDays ? _self.cycleLengthDays : cycleLengthDays // ignore: cast_nullable_to_non_nullable
as int,periodLengthDays: null == periodLengthDays ? _self.periodLengthDays : periodLengthDays // ignore: cast_nullable_to_non_nullable
as int,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$CyclePeriod {

 String get id; String get startDate; String? get endDate; PatientCycleFlow? get flow; String? get notes; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of CyclePeriod
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CyclePeriodCopyWith<CyclePeriod> get copyWith => _$CyclePeriodCopyWithImpl<CyclePeriod>(this as CyclePeriod, _$identity);

  /// Serializes this CyclePeriod to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CyclePeriod&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.flow, flow) || other.flow == flow)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startDate,endDate,flow,notes,createdAt,updatedAt);

@override
String toString() {
  return 'CyclePeriod(id: $id, startDate: $startDate, endDate: $endDate, flow: $flow, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CyclePeriodCopyWith<$Res>  {
  factory $CyclePeriodCopyWith(CyclePeriod value, $Res Function(CyclePeriod) _then) = _$CyclePeriodCopyWithImpl;
@useResult
$Res call({
 String id, String startDate, String? endDate, PatientCycleFlow? flow, String? notes, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$CyclePeriodCopyWithImpl<$Res>
    implements $CyclePeriodCopyWith<$Res> {
  _$CyclePeriodCopyWithImpl(this._self, this._then);

  final CyclePeriod _self;
  final $Res Function(CyclePeriod) _then;

/// Create a copy of CyclePeriod
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startDate = null,Object? endDate = freezed,Object? flow = freezed,Object? notes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,flow: freezed == flow ? _self.flow : flow // ignore: cast_nullable_to_non_nullable
as PatientCycleFlow?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CyclePeriod].
extension CyclePeriodPatterns on CyclePeriod {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CyclePeriod value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CyclePeriod() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CyclePeriod value)  $default,){
final _that = this;
switch (_that) {
case _CyclePeriod():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CyclePeriod value)?  $default,){
final _that = this;
switch (_that) {
case _CyclePeriod() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String startDate,  String? endDate,  PatientCycleFlow? flow,  String? notes,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CyclePeriod() when $default != null:
return $default(_that.id,_that.startDate,_that.endDate,_that.flow,_that.notes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String startDate,  String? endDate,  PatientCycleFlow? flow,  String? notes,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CyclePeriod():
return $default(_that.id,_that.startDate,_that.endDate,_that.flow,_that.notes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String startDate,  String? endDate,  PatientCycleFlow? flow,  String? notes,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CyclePeriod() when $default != null:
return $default(_that.id,_that.startDate,_that.endDate,_that.flow,_that.notes,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CyclePeriod implements CyclePeriod {
  const _CyclePeriod({required this.id, required this.startDate, this.endDate, this.flow, this.notes, this.createdAt, this.updatedAt});
  factory _CyclePeriod.fromJson(Map<String, dynamic> json) => _$CyclePeriodFromJson(json);

@override final  String id;
@override final  String startDate;
@override final  String? endDate;
@override final  PatientCycleFlow? flow;
@override final  String? notes;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of CyclePeriod
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CyclePeriodCopyWith<_CyclePeriod> get copyWith => __$CyclePeriodCopyWithImpl<_CyclePeriod>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CyclePeriodToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CyclePeriod&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.flow, flow) || other.flow == flow)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startDate,endDate,flow,notes,createdAt,updatedAt);

@override
String toString() {
  return 'CyclePeriod(id: $id, startDate: $startDate, endDate: $endDate, flow: $flow, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CyclePeriodCopyWith<$Res> implements $CyclePeriodCopyWith<$Res> {
  factory _$CyclePeriodCopyWith(_CyclePeriod value, $Res Function(_CyclePeriod) _then) = __$CyclePeriodCopyWithImpl;
@override @useResult
$Res call({
 String id, String startDate, String? endDate, PatientCycleFlow? flow, String? notes, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$CyclePeriodCopyWithImpl<$Res>
    implements _$CyclePeriodCopyWith<$Res> {
  __$CyclePeriodCopyWithImpl(this._self, this._then);

  final _CyclePeriod _self;
  final $Res Function(_CyclePeriod) _then;

/// Create a copy of CyclePeriod
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startDate = null,Object? endDate = freezed,Object? flow = freezed,Object? notes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_CyclePeriod(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,flow: freezed == flow ? _self.flow : flow // ignore: cast_nullable_to_non_nullable
as PatientCycleFlow?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$CycleSummaryResponse {

 bool get configured; bool get pregnancyPaused; String? get today; String get headline; int? get cycleDay; int? get daysUntilNext; String? get nextPeriodStart; String? get currentPeriodStart;
/// Create a copy of CycleSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CycleSummaryResponseCopyWith<CycleSummaryResponse> get copyWith => _$CycleSummaryResponseCopyWithImpl<CycleSummaryResponse>(this as CycleSummaryResponse, _$identity);

  /// Serializes this CycleSummaryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CycleSummaryResponse&&(identical(other.configured, configured) || other.configured == configured)&&(identical(other.pregnancyPaused, pregnancyPaused) || other.pregnancyPaused == pregnancyPaused)&&(identical(other.today, today) || other.today == today)&&(identical(other.headline, headline) || other.headline == headline)&&(identical(other.cycleDay, cycleDay) || other.cycleDay == cycleDay)&&(identical(other.daysUntilNext, daysUntilNext) || other.daysUntilNext == daysUntilNext)&&(identical(other.nextPeriodStart, nextPeriodStart) || other.nextPeriodStart == nextPeriodStart)&&(identical(other.currentPeriodStart, currentPeriodStart) || other.currentPeriodStart == currentPeriodStart));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,configured,pregnancyPaused,today,headline,cycleDay,daysUntilNext,nextPeriodStart,currentPeriodStart);

@override
String toString() {
  return 'CycleSummaryResponse(configured: $configured, pregnancyPaused: $pregnancyPaused, today: $today, headline: $headline, cycleDay: $cycleDay, daysUntilNext: $daysUntilNext, nextPeriodStart: $nextPeriodStart, currentPeriodStart: $currentPeriodStart)';
}


}

/// @nodoc
abstract mixin class $CycleSummaryResponseCopyWith<$Res>  {
  factory $CycleSummaryResponseCopyWith(CycleSummaryResponse value, $Res Function(CycleSummaryResponse) _then) = _$CycleSummaryResponseCopyWithImpl;
@useResult
$Res call({
 bool configured, bool pregnancyPaused, String? today, String headline, int? cycleDay, int? daysUntilNext, String? nextPeriodStart, String? currentPeriodStart
});




}
/// @nodoc
class _$CycleSummaryResponseCopyWithImpl<$Res>
    implements $CycleSummaryResponseCopyWith<$Res> {
  _$CycleSummaryResponseCopyWithImpl(this._self, this._then);

  final CycleSummaryResponse _self;
  final $Res Function(CycleSummaryResponse) _then;

/// Create a copy of CycleSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? configured = null,Object? pregnancyPaused = null,Object? today = freezed,Object? headline = null,Object? cycleDay = freezed,Object? daysUntilNext = freezed,Object? nextPeriodStart = freezed,Object? currentPeriodStart = freezed,}) {
  return _then(_self.copyWith(
configured: null == configured ? _self.configured : configured // ignore: cast_nullable_to_non_nullable
as bool,pregnancyPaused: null == pregnancyPaused ? _self.pregnancyPaused : pregnancyPaused // ignore: cast_nullable_to_non_nullable
as bool,today: freezed == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as String?,headline: null == headline ? _self.headline : headline // ignore: cast_nullable_to_non_nullable
as String,cycleDay: freezed == cycleDay ? _self.cycleDay : cycleDay // ignore: cast_nullable_to_non_nullable
as int?,daysUntilNext: freezed == daysUntilNext ? _self.daysUntilNext : daysUntilNext // ignore: cast_nullable_to_non_nullable
as int?,nextPeriodStart: freezed == nextPeriodStart ? _self.nextPeriodStart : nextPeriodStart // ignore: cast_nullable_to_non_nullable
as String?,currentPeriodStart: freezed == currentPeriodStart ? _self.currentPeriodStart : currentPeriodStart // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CycleSummaryResponse].
extension CycleSummaryResponsePatterns on CycleSummaryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CycleSummaryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CycleSummaryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CycleSummaryResponse value)  $default,){
final _that = this;
switch (_that) {
case _CycleSummaryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CycleSummaryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CycleSummaryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool configured,  bool pregnancyPaused,  String? today,  String headline,  int? cycleDay,  int? daysUntilNext,  String? nextPeriodStart,  String? currentPeriodStart)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CycleSummaryResponse() when $default != null:
return $default(_that.configured,_that.pregnancyPaused,_that.today,_that.headline,_that.cycleDay,_that.daysUntilNext,_that.nextPeriodStart,_that.currentPeriodStart);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool configured,  bool pregnancyPaused,  String? today,  String headline,  int? cycleDay,  int? daysUntilNext,  String? nextPeriodStart,  String? currentPeriodStart)  $default,) {final _that = this;
switch (_that) {
case _CycleSummaryResponse():
return $default(_that.configured,_that.pregnancyPaused,_that.today,_that.headline,_that.cycleDay,_that.daysUntilNext,_that.nextPeriodStart,_that.currentPeriodStart);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool configured,  bool pregnancyPaused,  String? today,  String headline,  int? cycleDay,  int? daysUntilNext,  String? nextPeriodStart,  String? currentPeriodStart)?  $default,) {final _that = this;
switch (_that) {
case _CycleSummaryResponse() when $default != null:
return $default(_that.configured,_that.pregnancyPaused,_that.today,_that.headline,_that.cycleDay,_that.daysUntilNext,_that.nextPeriodStart,_that.currentPeriodStart);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CycleSummaryResponse implements CycleSummaryResponse {
  const _CycleSummaryResponse({this.configured = false, this.pregnancyPaused = false, this.today, this.headline = 'Log your last period to start tracking', this.cycleDay, this.daysUntilNext, this.nextPeriodStart, this.currentPeriodStart});
  factory _CycleSummaryResponse.fromJson(Map<String, dynamic> json) => _$CycleSummaryResponseFromJson(json);

@override@JsonKey() final  bool configured;
@override@JsonKey() final  bool pregnancyPaused;
@override final  String? today;
@override@JsonKey() final  String headline;
@override final  int? cycleDay;
@override final  int? daysUntilNext;
@override final  String? nextPeriodStart;
@override final  String? currentPeriodStart;

/// Create a copy of CycleSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CycleSummaryResponseCopyWith<_CycleSummaryResponse> get copyWith => __$CycleSummaryResponseCopyWithImpl<_CycleSummaryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CycleSummaryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CycleSummaryResponse&&(identical(other.configured, configured) || other.configured == configured)&&(identical(other.pregnancyPaused, pregnancyPaused) || other.pregnancyPaused == pregnancyPaused)&&(identical(other.today, today) || other.today == today)&&(identical(other.headline, headline) || other.headline == headline)&&(identical(other.cycleDay, cycleDay) || other.cycleDay == cycleDay)&&(identical(other.daysUntilNext, daysUntilNext) || other.daysUntilNext == daysUntilNext)&&(identical(other.nextPeriodStart, nextPeriodStart) || other.nextPeriodStart == nextPeriodStart)&&(identical(other.currentPeriodStart, currentPeriodStart) || other.currentPeriodStart == currentPeriodStart));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,configured,pregnancyPaused,today,headline,cycleDay,daysUntilNext,nextPeriodStart,currentPeriodStart);

@override
String toString() {
  return 'CycleSummaryResponse(configured: $configured, pregnancyPaused: $pregnancyPaused, today: $today, headline: $headline, cycleDay: $cycleDay, daysUntilNext: $daysUntilNext, nextPeriodStart: $nextPeriodStart, currentPeriodStart: $currentPeriodStart)';
}


}

/// @nodoc
abstract mixin class _$CycleSummaryResponseCopyWith<$Res> implements $CycleSummaryResponseCopyWith<$Res> {
  factory _$CycleSummaryResponseCopyWith(_CycleSummaryResponse value, $Res Function(_CycleSummaryResponse) _then) = __$CycleSummaryResponseCopyWithImpl;
@override @useResult
$Res call({
 bool configured, bool pregnancyPaused, String? today, String headline, int? cycleDay, int? daysUntilNext, String? nextPeriodStart, String? currentPeriodStart
});




}
/// @nodoc
class __$CycleSummaryResponseCopyWithImpl<$Res>
    implements _$CycleSummaryResponseCopyWith<$Res> {
  __$CycleSummaryResponseCopyWithImpl(this._self, this._then);

  final _CycleSummaryResponse _self;
  final $Res Function(_CycleSummaryResponse) _then;

/// Create a copy of CycleSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? configured = null,Object? pregnancyPaused = null,Object? today = freezed,Object? headline = null,Object? cycleDay = freezed,Object? daysUntilNext = freezed,Object? nextPeriodStart = freezed,Object? currentPeriodStart = freezed,}) {
  return _then(_CycleSummaryResponse(
configured: null == configured ? _self.configured : configured // ignore: cast_nullable_to_non_nullable
as bool,pregnancyPaused: null == pregnancyPaused ? _self.pregnancyPaused : pregnancyPaused // ignore: cast_nullable_to_non_nullable
as bool,today: freezed == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as String?,headline: null == headline ? _self.headline : headline // ignore: cast_nullable_to_non_nullable
as String,cycleDay: freezed == cycleDay ? _self.cycleDay : cycleDay // ignore: cast_nullable_to_non_nullable
as int?,daysUntilNext: freezed == daysUntilNext ? _self.daysUntilNext : daysUntilNext // ignore: cast_nullable_to_non_nullable
as int?,nextPeriodStart: freezed == nextPeriodStart ? _self.nextPeriodStart : nextPeriodStart // ignore: cast_nullable_to_non_nullable
as String?,currentPeriodStart: freezed == currentPeriodStart ? _self.currentPeriodStart : currentPeriodStart // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CycleCalendarResponse {

 bool get configured; bool get pregnancyPaused; int get year; int get month; String? get today; CycleSettings get settings; List<CyclePeriod> get periods; List<String> get predictedDays; String get headline; int? get cycleDay; int? get daysUntilNext; String? get nextPeriodStart; String? get currentPeriodStart;
/// Create a copy of CycleCalendarResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CycleCalendarResponseCopyWith<CycleCalendarResponse> get copyWith => _$CycleCalendarResponseCopyWithImpl<CycleCalendarResponse>(this as CycleCalendarResponse, _$identity);

  /// Serializes this CycleCalendarResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CycleCalendarResponse&&(identical(other.configured, configured) || other.configured == configured)&&(identical(other.pregnancyPaused, pregnancyPaused) || other.pregnancyPaused == pregnancyPaused)&&(identical(other.year, year) || other.year == year)&&(identical(other.month, month) || other.month == month)&&(identical(other.today, today) || other.today == today)&&(identical(other.settings, settings) || other.settings == settings)&&const DeepCollectionEquality().equals(other.periods, periods)&&const DeepCollectionEquality().equals(other.predictedDays, predictedDays)&&(identical(other.headline, headline) || other.headline == headline)&&(identical(other.cycleDay, cycleDay) || other.cycleDay == cycleDay)&&(identical(other.daysUntilNext, daysUntilNext) || other.daysUntilNext == daysUntilNext)&&(identical(other.nextPeriodStart, nextPeriodStart) || other.nextPeriodStart == nextPeriodStart)&&(identical(other.currentPeriodStart, currentPeriodStart) || other.currentPeriodStart == currentPeriodStart));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,configured,pregnancyPaused,year,month,today,settings,const DeepCollectionEquality().hash(periods),const DeepCollectionEquality().hash(predictedDays),headline,cycleDay,daysUntilNext,nextPeriodStart,currentPeriodStart);

@override
String toString() {
  return 'CycleCalendarResponse(configured: $configured, pregnancyPaused: $pregnancyPaused, year: $year, month: $month, today: $today, settings: $settings, periods: $periods, predictedDays: $predictedDays, headline: $headline, cycleDay: $cycleDay, daysUntilNext: $daysUntilNext, nextPeriodStart: $nextPeriodStart, currentPeriodStart: $currentPeriodStart)';
}


}

/// @nodoc
abstract mixin class $CycleCalendarResponseCopyWith<$Res>  {
  factory $CycleCalendarResponseCopyWith(CycleCalendarResponse value, $Res Function(CycleCalendarResponse) _then) = _$CycleCalendarResponseCopyWithImpl;
@useResult
$Res call({
 bool configured, bool pregnancyPaused, int year, int month, String? today, CycleSettings settings, List<CyclePeriod> periods, List<String> predictedDays, String headline, int? cycleDay, int? daysUntilNext, String? nextPeriodStart, String? currentPeriodStart
});


$CycleSettingsCopyWith<$Res> get settings;

}
/// @nodoc
class _$CycleCalendarResponseCopyWithImpl<$Res>
    implements $CycleCalendarResponseCopyWith<$Res> {
  _$CycleCalendarResponseCopyWithImpl(this._self, this._then);

  final CycleCalendarResponse _self;
  final $Res Function(CycleCalendarResponse) _then;

/// Create a copy of CycleCalendarResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? configured = null,Object? pregnancyPaused = null,Object? year = null,Object? month = null,Object? today = freezed,Object? settings = null,Object? periods = null,Object? predictedDays = null,Object? headline = null,Object? cycleDay = freezed,Object? daysUntilNext = freezed,Object? nextPeriodStart = freezed,Object? currentPeriodStart = freezed,}) {
  return _then(_self.copyWith(
configured: null == configured ? _self.configured : configured // ignore: cast_nullable_to_non_nullable
as bool,pregnancyPaused: null == pregnancyPaused ? _self.pregnancyPaused : pregnancyPaused // ignore: cast_nullable_to_non_nullable
as bool,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,today: freezed == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as String?,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as CycleSettings,periods: null == periods ? _self.periods : periods // ignore: cast_nullable_to_non_nullable
as List<CyclePeriod>,predictedDays: null == predictedDays ? _self.predictedDays : predictedDays // ignore: cast_nullable_to_non_nullable
as List<String>,headline: null == headline ? _self.headline : headline // ignore: cast_nullable_to_non_nullable
as String,cycleDay: freezed == cycleDay ? _self.cycleDay : cycleDay // ignore: cast_nullable_to_non_nullable
as int?,daysUntilNext: freezed == daysUntilNext ? _self.daysUntilNext : daysUntilNext // ignore: cast_nullable_to_non_nullable
as int?,nextPeriodStart: freezed == nextPeriodStart ? _self.nextPeriodStart : nextPeriodStart // ignore: cast_nullable_to_non_nullable
as String?,currentPeriodStart: freezed == currentPeriodStart ? _self.currentPeriodStart : currentPeriodStart // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CycleCalendarResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CycleSettingsCopyWith<$Res> get settings {
  
  return $CycleSettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}


/// Adds pattern-matching-related methods to [CycleCalendarResponse].
extension CycleCalendarResponsePatterns on CycleCalendarResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CycleCalendarResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CycleCalendarResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CycleCalendarResponse value)  $default,){
final _that = this;
switch (_that) {
case _CycleCalendarResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CycleCalendarResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CycleCalendarResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool configured,  bool pregnancyPaused,  int year,  int month,  String? today,  CycleSettings settings,  List<CyclePeriod> periods,  List<String> predictedDays,  String headline,  int? cycleDay,  int? daysUntilNext,  String? nextPeriodStart,  String? currentPeriodStart)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CycleCalendarResponse() when $default != null:
return $default(_that.configured,_that.pregnancyPaused,_that.year,_that.month,_that.today,_that.settings,_that.periods,_that.predictedDays,_that.headline,_that.cycleDay,_that.daysUntilNext,_that.nextPeriodStart,_that.currentPeriodStart);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool configured,  bool pregnancyPaused,  int year,  int month,  String? today,  CycleSettings settings,  List<CyclePeriod> periods,  List<String> predictedDays,  String headline,  int? cycleDay,  int? daysUntilNext,  String? nextPeriodStart,  String? currentPeriodStart)  $default,) {final _that = this;
switch (_that) {
case _CycleCalendarResponse():
return $default(_that.configured,_that.pregnancyPaused,_that.year,_that.month,_that.today,_that.settings,_that.periods,_that.predictedDays,_that.headline,_that.cycleDay,_that.daysUntilNext,_that.nextPeriodStart,_that.currentPeriodStart);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool configured,  bool pregnancyPaused,  int year,  int month,  String? today,  CycleSettings settings,  List<CyclePeriod> periods,  List<String> predictedDays,  String headline,  int? cycleDay,  int? daysUntilNext,  String? nextPeriodStart,  String? currentPeriodStart)?  $default,) {final _that = this;
switch (_that) {
case _CycleCalendarResponse() when $default != null:
return $default(_that.configured,_that.pregnancyPaused,_that.year,_that.month,_that.today,_that.settings,_that.periods,_that.predictedDays,_that.headline,_that.cycleDay,_that.daysUntilNext,_that.nextPeriodStart,_that.currentPeriodStart);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CycleCalendarResponse implements CycleCalendarResponse {
  const _CycleCalendarResponse({this.configured = false, this.pregnancyPaused = false, required this.year, required this.month, this.today, required this.settings, final  List<CyclePeriod> periods = const [], final  List<String> predictedDays = const [], this.headline = 'Log your last period to start tracking', this.cycleDay, this.daysUntilNext, this.nextPeriodStart, this.currentPeriodStart}): _periods = periods,_predictedDays = predictedDays;
  factory _CycleCalendarResponse.fromJson(Map<String, dynamic> json) => _$CycleCalendarResponseFromJson(json);

@override@JsonKey() final  bool configured;
@override@JsonKey() final  bool pregnancyPaused;
@override final  int year;
@override final  int month;
@override final  String? today;
@override final  CycleSettings settings;
 final  List<CyclePeriod> _periods;
@override@JsonKey() List<CyclePeriod> get periods {
  if (_periods is EqualUnmodifiableListView) return _periods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_periods);
}

 final  List<String> _predictedDays;
@override@JsonKey() List<String> get predictedDays {
  if (_predictedDays is EqualUnmodifiableListView) return _predictedDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_predictedDays);
}

@override@JsonKey() final  String headline;
@override final  int? cycleDay;
@override final  int? daysUntilNext;
@override final  String? nextPeriodStart;
@override final  String? currentPeriodStart;

/// Create a copy of CycleCalendarResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CycleCalendarResponseCopyWith<_CycleCalendarResponse> get copyWith => __$CycleCalendarResponseCopyWithImpl<_CycleCalendarResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CycleCalendarResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CycleCalendarResponse&&(identical(other.configured, configured) || other.configured == configured)&&(identical(other.pregnancyPaused, pregnancyPaused) || other.pregnancyPaused == pregnancyPaused)&&(identical(other.year, year) || other.year == year)&&(identical(other.month, month) || other.month == month)&&(identical(other.today, today) || other.today == today)&&(identical(other.settings, settings) || other.settings == settings)&&const DeepCollectionEquality().equals(other._periods, _periods)&&const DeepCollectionEquality().equals(other._predictedDays, _predictedDays)&&(identical(other.headline, headline) || other.headline == headline)&&(identical(other.cycleDay, cycleDay) || other.cycleDay == cycleDay)&&(identical(other.daysUntilNext, daysUntilNext) || other.daysUntilNext == daysUntilNext)&&(identical(other.nextPeriodStart, nextPeriodStart) || other.nextPeriodStart == nextPeriodStart)&&(identical(other.currentPeriodStart, currentPeriodStart) || other.currentPeriodStart == currentPeriodStart));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,configured,pregnancyPaused,year,month,today,settings,const DeepCollectionEquality().hash(_periods),const DeepCollectionEquality().hash(_predictedDays),headline,cycleDay,daysUntilNext,nextPeriodStart,currentPeriodStart);

@override
String toString() {
  return 'CycleCalendarResponse(configured: $configured, pregnancyPaused: $pregnancyPaused, year: $year, month: $month, today: $today, settings: $settings, periods: $periods, predictedDays: $predictedDays, headline: $headline, cycleDay: $cycleDay, daysUntilNext: $daysUntilNext, nextPeriodStart: $nextPeriodStart, currentPeriodStart: $currentPeriodStart)';
}


}

/// @nodoc
abstract mixin class _$CycleCalendarResponseCopyWith<$Res> implements $CycleCalendarResponseCopyWith<$Res> {
  factory _$CycleCalendarResponseCopyWith(_CycleCalendarResponse value, $Res Function(_CycleCalendarResponse) _then) = __$CycleCalendarResponseCopyWithImpl;
@override @useResult
$Res call({
 bool configured, bool pregnancyPaused, int year, int month, String? today, CycleSettings settings, List<CyclePeriod> periods, List<String> predictedDays, String headline, int? cycleDay, int? daysUntilNext, String? nextPeriodStart, String? currentPeriodStart
});


@override $CycleSettingsCopyWith<$Res> get settings;

}
/// @nodoc
class __$CycleCalendarResponseCopyWithImpl<$Res>
    implements _$CycleCalendarResponseCopyWith<$Res> {
  __$CycleCalendarResponseCopyWithImpl(this._self, this._then);

  final _CycleCalendarResponse _self;
  final $Res Function(_CycleCalendarResponse) _then;

/// Create a copy of CycleCalendarResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? configured = null,Object? pregnancyPaused = null,Object? year = null,Object? month = null,Object? today = freezed,Object? settings = null,Object? periods = null,Object? predictedDays = null,Object? headline = null,Object? cycleDay = freezed,Object? daysUntilNext = freezed,Object? nextPeriodStart = freezed,Object? currentPeriodStart = freezed,}) {
  return _then(_CycleCalendarResponse(
configured: null == configured ? _self.configured : configured // ignore: cast_nullable_to_non_nullable
as bool,pregnancyPaused: null == pregnancyPaused ? _self.pregnancyPaused : pregnancyPaused // ignore: cast_nullable_to_non_nullable
as bool,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,today: freezed == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as String?,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as CycleSettings,periods: null == periods ? _self._periods : periods // ignore: cast_nullable_to_non_nullable
as List<CyclePeriod>,predictedDays: null == predictedDays ? _self._predictedDays : predictedDays // ignore: cast_nullable_to_non_nullable
as List<String>,headline: null == headline ? _self.headline : headline // ignore: cast_nullable_to_non_nullable
as String,cycleDay: freezed == cycleDay ? _self.cycleDay : cycleDay // ignore: cast_nullable_to_non_nullable
as int?,daysUntilNext: freezed == daysUntilNext ? _self.daysUntilNext : daysUntilNext // ignore: cast_nullable_to_non_nullable
as int?,nextPeriodStart: freezed == nextPeriodStart ? _self.nextPeriodStart : nextPeriodStart // ignore: cast_nullable_to_non_nullable
as String?,currentPeriodStart: freezed == currentPeriodStart ? _self.currentPeriodStart : currentPeriodStart // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CycleCalendarResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CycleSettingsCopyWith<$Res> get settings {
  
  return $CycleSettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}

// dart format on
