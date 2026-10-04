// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medication_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MedicationDoseSummary {

 String get id; String get prescriptionItemId; String get drugName; String get dosage; String? get instructions; DateTime get scheduledAt; MedicationDoseStatus get status;
/// Create a copy of MedicationDoseSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedicationDoseSummaryCopyWith<MedicationDoseSummary> get copyWith => _$MedicationDoseSummaryCopyWithImpl<MedicationDoseSummary>(this as MedicationDoseSummary, _$identity);

  /// Serializes this MedicationDoseSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MedicationDoseSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedicationDoseSummary&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.prescriptionItemId, _this.prescriptionItemId) || other.prescriptionItemId == _this.prescriptionItemId)&&(identical(other.drugName, _this.drugName) || other.drugName == _this.drugName)&&(identical(other.dosage, _this.dosage) || other.dosage == _this.dosage)&&(identical(other.instructions, _this.instructions) || other.instructions == _this.instructions)&&(identical(other.scheduledAt, _this.scheduledAt) || other.scheduledAt == _this.scheduledAt)&&(identical(other.status, _this.status) || other.status == _this.status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MedicationDoseSummary;
  return Object.hash(runtimeType,_this.id,_this.prescriptionItemId,_this.drugName,_this.dosage,_this.instructions,_this.scheduledAt,_this.status);
}

@override
String toString() {
  final _this = this as MedicationDoseSummary;
  return 'MedicationDoseSummary(id: ${_this.id}, prescriptionItemId: ${_this.prescriptionItemId}, drugName: ${_this.drugName}, dosage: ${_this.dosage}, instructions: ${_this.instructions}, scheduledAt: ${_this.scheduledAt}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $MedicationDoseSummaryCopyWith<$Res>  {
  factory $MedicationDoseSummaryCopyWith(MedicationDoseSummary value, $Res Function(MedicationDoseSummary) _then) = _$MedicationDoseSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String prescriptionItemId, String drugName, String dosage, String? instructions, DateTime scheduledAt, MedicationDoseStatus status
});




}
/// @nodoc
class _$MedicationDoseSummaryCopyWithImpl<$Res>
    implements $MedicationDoseSummaryCopyWith<$Res> {
  _$MedicationDoseSummaryCopyWithImpl(this._self, this._then);

  final MedicationDoseSummary _self;
  final $Res Function(MedicationDoseSummary) _then;

/// Create a copy of MedicationDoseSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? prescriptionItemId = null,Object? drugName = null,Object? dosage = null,Object? instructions = freezed,Object? scheduledAt = null,Object? status = null,}) {
  return _then(MedicationDoseSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,prescriptionItemId: null == prescriptionItemId ? _self.prescriptionItemId : prescriptionItemId // ignore: cast_nullable_to_non_nullable
as String,drugName: null == drugName ? _self.drugName : drugName // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,scheduledAt: null == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MedicationDoseStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [MedicationDoseSummary].
extension MedicationDoseSummaryPatterns on MedicationDoseSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedicationDoseSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedicationDoseSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedicationDoseSummary value)  $default,){
final _that = this;
switch (_that) {
case _MedicationDoseSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedicationDoseSummary value)?  $default,){
final _that = this;
switch (_that) {
case _MedicationDoseSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String prescriptionItemId,  String drugName,  String dosage,  String? instructions,  DateTime scheduledAt,  MedicationDoseStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedicationDoseSummary() when $default != null:
return $default(_that.id,_that.prescriptionItemId,_that.drugName,_that.dosage,_that.instructions,_that.scheduledAt,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String prescriptionItemId,  String drugName,  String dosage,  String? instructions,  DateTime scheduledAt,  MedicationDoseStatus status)  $default,) {final _that = this;
switch (_that) {
case _MedicationDoseSummary():
return $default(_that.id,_that.prescriptionItemId,_that.drugName,_that.dosage,_that.instructions,_that.scheduledAt,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String prescriptionItemId,  String drugName,  String dosage,  String? instructions,  DateTime scheduledAt,  MedicationDoseStatus status)?  $default,) {final _that = this;
switch (_that) {
case _MedicationDoseSummary() when $default != null:
return $default(_that.id,_that.prescriptionItemId,_that.drugName,_that.dosage,_that.instructions,_that.scheduledAt,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedicationDoseSummary implements MedicationDoseSummary {
  const _MedicationDoseSummary({required this.id, required this.prescriptionItemId, required this.drugName, required this.dosage, this.instructions, required this.scheduledAt, required this.status});
  factory _MedicationDoseSummary.fromJson(Map<String, dynamic> json) => _$MedicationDoseSummaryFromJson(json);

@override final  String id;
@override final  String prescriptionItemId;
@override final  String drugName;
@override final  String dosage;
@override final  String? instructions;
@override final  DateTime scheduledAt;
@override final  MedicationDoseStatus status;

/// Create a copy of MedicationDoseSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedicationDoseSummaryCopyWith<_MedicationDoseSummary> get copyWith => __$MedicationDoseSummaryCopyWithImpl<_MedicationDoseSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedicationDoseSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedicationDoseSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.prescriptionItemId, prescriptionItemId) || other.prescriptionItemId == prescriptionItemId)&&(identical(other.drugName, drugName) || other.drugName == drugName)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,prescriptionItemId,drugName,dosage,instructions,scheduledAt,status);
}

@override
String toString() {
    return 'MedicationDoseSummary(id: $id, prescriptionItemId: $prescriptionItemId, drugName: $drugName, dosage: $dosage, instructions: $instructions, scheduledAt: $scheduledAt, status: $status)';
}


}

/// @nodoc
abstract mixin class _$MedicationDoseSummaryCopyWith<$Res> implements $MedicationDoseSummaryCopyWith<$Res> {
  factory _$MedicationDoseSummaryCopyWith(_MedicationDoseSummary value, $Res Function(_MedicationDoseSummary) _then) = __$MedicationDoseSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String prescriptionItemId, String drugName, String dosage, String? instructions, DateTime scheduledAt, MedicationDoseStatus status
});




}
/// @nodoc
class __$MedicationDoseSummaryCopyWithImpl<$Res>
    implements _$MedicationDoseSummaryCopyWith<$Res> {
  __$MedicationDoseSummaryCopyWithImpl(this._self, this._then);

  final _MedicationDoseSummary _self;
  final $Res Function(_MedicationDoseSummary) _then;

/// Create a copy of MedicationDoseSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? prescriptionItemId = null,Object? drugName = null,Object? dosage = null,Object? instructions = freezed,Object? scheduledAt = null,Object? status = null,}) {
  return _then(_MedicationDoseSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,prescriptionItemId: null == prescriptionItemId ? _self.prescriptionItemId : prescriptionItemId // ignore: cast_nullable_to_non_nullable
as String,drugName: null == drugName ? _self.drugName : drugName // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,scheduledAt: null == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MedicationDoseStatus,
  ));
}


}


/// @nodoc
mixin _$MedicationScheduleEntry {

 String get id; String get prescriptionItemId; MedicationTimeOfDay get timeOfDay; String get drugName; String get dosage; DateTime get scheduledAt; MedicationDoseStatus get status;
/// Create a copy of MedicationScheduleEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedicationScheduleEntryCopyWith<MedicationScheduleEntry> get copyWith => _$MedicationScheduleEntryCopyWithImpl<MedicationScheduleEntry>(this as MedicationScheduleEntry, _$identity);

  /// Serializes this MedicationScheduleEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MedicationScheduleEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedicationScheduleEntry&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.prescriptionItemId, _this.prescriptionItemId) || other.prescriptionItemId == _this.prescriptionItemId)&&(identical(other.timeOfDay, _this.timeOfDay) || other.timeOfDay == _this.timeOfDay)&&(identical(other.drugName, _this.drugName) || other.drugName == _this.drugName)&&(identical(other.dosage, _this.dosage) || other.dosage == _this.dosage)&&(identical(other.scheduledAt, _this.scheduledAt) || other.scheduledAt == _this.scheduledAt)&&(identical(other.status, _this.status) || other.status == _this.status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MedicationScheduleEntry;
  return Object.hash(runtimeType,_this.id,_this.prescriptionItemId,_this.timeOfDay,_this.drugName,_this.dosage,_this.scheduledAt,_this.status);
}

@override
String toString() {
  final _this = this as MedicationScheduleEntry;
  return 'MedicationScheduleEntry(id: ${_this.id}, prescriptionItemId: ${_this.prescriptionItemId}, timeOfDay: ${_this.timeOfDay}, drugName: ${_this.drugName}, dosage: ${_this.dosage}, scheduledAt: ${_this.scheduledAt}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $MedicationScheduleEntryCopyWith<$Res>  {
  factory $MedicationScheduleEntryCopyWith(MedicationScheduleEntry value, $Res Function(MedicationScheduleEntry) _then) = _$MedicationScheduleEntryCopyWithImpl;
@useResult
$Res call({
 String id, String prescriptionItemId, MedicationTimeOfDay timeOfDay, String drugName, String dosage, DateTime scheduledAt, MedicationDoseStatus status
});




}
/// @nodoc
class _$MedicationScheduleEntryCopyWithImpl<$Res>
    implements $MedicationScheduleEntryCopyWith<$Res> {
  _$MedicationScheduleEntryCopyWithImpl(this._self, this._then);

  final MedicationScheduleEntry _self;
  final $Res Function(MedicationScheduleEntry) _then;

/// Create a copy of MedicationScheduleEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? prescriptionItemId = null,Object? timeOfDay = null,Object? drugName = null,Object? dosage = null,Object? scheduledAt = null,Object? status = null,}) {
  return _then(MedicationScheduleEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,prescriptionItemId: null == prescriptionItemId ? _self.prescriptionItemId : prescriptionItemId // ignore: cast_nullable_to_non_nullable
as String,timeOfDay: null == timeOfDay ? _self.timeOfDay : timeOfDay // ignore: cast_nullable_to_non_nullable
as MedicationTimeOfDay,drugName: null == drugName ? _self.drugName : drugName // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,scheduledAt: null == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MedicationDoseStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [MedicationScheduleEntry].
extension MedicationScheduleEntryPatterns on MedicationScheduleEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedicationScheduleEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedicationScheduleEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedicationScheduleEntry value)  $default,){
final _that = this;
switch (_that) {
case _MedicationScheduleEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedicationScheduleEntry value)?  $default,){
final _that = this;
switch (_that) {
case _MedicationScheduleEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String prescriptionItemId,  MedicationTimeOfDay timeOfDay,  String drugName,  String dosage,  DateTime scheduledAt,  MedicationDoseStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedicationScheduleEntry() when $default != null:
return $default(_that.id,_that.prescriptionItemId,_that.timeOfDay,_that.drugName,_that.dosage,_that.scheduledAt,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String prescriptionItemId,  MedicationTimeOfDay timeOfDay,  String drugName,  String dosage,  DateTime scheduledAt,  MedicationDoseStatus status)  $default,) {final _that = this;
switch (_that) {
case _MedicationScheduleEntry():
return $default(_that.id,_that.prescriptionItemId,_that.timeOfDay,_that.drugName,_that.dosage,_that.scheduledAt,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String prescriptionItemId,  MedicationTimeOfDay timeOfDay,  String drugName,  String dosage,  DateTime scheduledAt,  MedicationDoseStatus status)?  $default,) {final _that = this;
switch (_that) {
case _MedicationScheduleEntry() when $default != null:
return $default(_that.id,_that.prescriptionItemId,_that.timeOfDay,_that.drugName,_that.dosage,_that.scheduledAt,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedicationScheduleEntry implements MedicationScheduleEntry {
  const _MedicationScheduleEntry({required this.id, required this.prescriptionItemId, required this.timeOfDay, required this.drugName, required this.dosage, required this.scheduledAt, required this.status});
  factory _MedicationScheduleEntry.fromJson(Map<String, dynamic> json) => _$MedicationScheduleEntryFromJson(json);

@override final  String id;
@override final  String prescriptionItemId;
@override final  MedicationTimeOfDay timeOfDay;
@override final  String drugName;
@override final  String dosage;
@override final  DateTime scheduledAt;
@override final  MedicationDoseStatus status;

/// Create a copy of MedicationScheduleEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedicationScheduleEntryCopyWith<_MedicationScheduleEntry> get copyWith => __$MedicationScheduleEntryCopyWithImpl<_MedicationScheduleEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedicationScheduleEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedicationScheduleEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.prescriptionItemId, prescriptionItemId) || other.prescriptionItemId == prescriptionItemId)&&(identical(other.timeOfDay, timeOfDay) || other.timeOfDay == timeOfDay)&&(identical(other.drugName, drugName) || other.drugName == drugName)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,prescriptionItemId,timeOfDay,drugName,dosage,scheduledAt,status);
}

@override
String toString() {
    return 'MedicationScheduleEntry(id: $id, prescriptionItemId: $prescriptionItemId, timeOfDay: $timeOfDay, drugName: $drugName, dosage: $dosage, scheduledAt: $scheduledAt, status: $status)';
}


}

/// @nodoc
abstract mixin class _$MedicationScheduleEntryCopyWith<$Res> implements $MedicationScheduleEntryCopyWith<$Res> {
  factory _$MedicationScheduleEntryCopyWith(_MedicationScheduleEntry value, $Res Function(_MedicationScheduleEntry) _then) = __$MedicationScheduleEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String prescriptionItemId, MedicationTimeOfDay timeOfDay, String drugName, String dosage, DateTime scheduledAt, MedicationDoseStatus status
});




}
/// @nodoc
class __$MedicationScheduleEntryCopyWithImpl<$Res>
    implements _$MedicationScheduleEntryCopyWith<$Res> {
  __$MedicationScheduleEntryCopyWithImpl(this._self, this._then);

  final _MedicationScheduleEntry _self;
  final $Res Function(_MedicationScheduleEntry) _then;

/// Create a copy of MedicationScheduleEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? prescriptionItemId = null,Object? timeOfDay = null,Object? drugName = null,Object? dosage = null,Object? scheduledAt = null,Object? status = null,}) {
  return _then(_MedicationScheduleEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,prescriptionItemId: null == prescriptionItemId ? _self.prescriptionItemId : prescriptionItemId // ignore: cast_nullable_to_non_nullable
as String,timeOfDay: null == timeOfDay ? _self.timeOfDay : timeOfDay // ignore: cast_nullable_to_non_nullable
as MedicationTimeOfDay,drugName: null == drugName ? _self.drugName : drugName // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,scheduledAt: null == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MedicationDoseStatus,
  ));
}


}


/// @nodoc
mixin _$ActivePrescriptionSummary {

 String get id; String get displayName; String get frequencyLabel; int get daysRemaining; int get refillsRemaining; double get supplyProgress; PrescriptionSupplyStatus get supplyStatus; DateTime? get scheduleStartAt; bool get needsScheduleStart; bool get scheduleConfirmed; DateTime? get endDate;
/// Create a copy of ActivePrescriptionSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivePrescriptionSummaryCopyWith<ActivePrescriptionSummary> get copyWith => _$ActivePrescriptionSummaryCopyWithImpl<ActivePrescriptionSummary>(this as ActivePrescriptionSummary, _$identity);

  /// Serializes this ActivePrescriptionSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ActivePrescriptionSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivePrescriptionSummary&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.displayName, _this.displayName) || other.displayName == _this.displayName)&&(identical(other.frequencyLabel, _this.frequencyLabel) || other.frequencyLabel == _this.frequencyLabel)&&(identical(other.daysRemaining, _this.daysRemaining) || other.daysRemaining == _this.daysRemaining)&&(identical(other.refillsRemaining, _this.refillsRemaining) || other.refillsRemaining == _this.refillsRemaining)&&(identical(other.supplyProgress, _this.supplyProgress) || other.supplyProgress == _this.supplyProgress)&&(identical(other.supplyStatus, _this.supplyStatus) || other.supplyStatus == _this.supplyStatus)&&(identical(other.scheduleStartAt, _this.scheduleStartAt) || other.scheduleStartAt == _this.scheduleStartAt)&&(identical(other.needsScheduleStart, _this.needsScheduleStart) || other.needsScheduleStart == _this.needsScheduleStart)&&(identical(other.scheduleConfirmed, _this.scheduleConfirmed) || other.scheduleConfirmed == _this.scheduleConfirmed)&&(identical(other.endDate, _this.endDate) || other.endDate == _this.endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ActivePrescriptionSummary;
  return Object.hash(runtimeType,_this.id,_this.displayName,_this.frequencyLabel,_this.daysRemaining,_this.refillsRemaining,_this.supplyProgress,_this.supplyStatus,_this.scheduleStartAt,_this.needsScheduleStart,_this.scheduleConfirmed,_this.endDate);
}

@override
String toString() {
  final _this = this as ActivePrescriptionSummary;
  return 'ActivePrescriptionSummary(id: ${_this.id}, displayName: ${_this.displayName}, frequencyLabel: ${_this.frequencyLabel}, daysRemaining: ${_this.daysRemaining}, refillsRemaining: ${_this.refillsRemaining}, supplyProgress: ${_this.supplyProgress}, supplyStatus: ${_this.supplyStatus}, scheduleStartAt: ${_this.scheduleStartAt}, needsScheduleStart: ${_this.needsScheduleStart}, scheduleConfirmed: ${_this.scheduleConfirmed}, endDate: ${_this.endDate})';
}


}

/// @nodoc
abstract mixin class $ActivePrescriptionSummaryCopyWith<$Res>  {
  factory $ActivePrescriptionSummaryCopyWith(ActivePrescriptionSummary value, $Res Function(ActivePrescriptionSummary) _then) = _$ActivePrescriptionSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String displayName, String frequencyLabel, int daysRemaining, int refillsRemaining, double supplyProgress, PrescriptionSupplyStatus supplyStatus, DateTime? scheduleStartAt, bool needsScheduleStart, bool scheduleConfirmed, DateTime? endDate
});




}
/// @nodoc
class _$ActivePrescriptionSummaryCopyWithImpl<$Res>
    implements $ActivePrescriptionSummaryCopyWith<$Res> {
  _$ActivePrescriptionSummaryCopyWithImpl(this._self, this._then);

  final ActivePrescriptionSummary _self;
  final $Res Function(ActivePrescriptionSummary) _then;

/// Create a copy of ActivePrescriptionSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? displayName = null,Object? frequencyLabel = null,Object? daysRemaining = null,Object? refillsRemaining = null,Object? supplyProgress = null,Object? supplyStatus = null,Object? scheduleStartAt = freezed,Object? needsScheduleStart = null,Object? scheduleConfirmed = null,Object? endDate = freezed,}) {
  return _then(ActivePrescriptionSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,frequencyLabel: null == frequencyLabel ? _self.frequencyLabel : frequencyLabel // ignore: cast_nullable_to_non_nullable
as String,daysRemaining: null == daysRemaining ? _self.daysRemaining : daysRemaining // ignore: cast_nullable_to_non_nullable
as int,refillsRemaining: null == refillsRemaining ? _self.refillsRemaining : refillsRemaining // ignore: cast_nullable_to_non_nullable
as int,supplyProgress: null == supplyProgress ? _self.supplyProgress : supplyProgress // ignore: cast_nullable_to_non_nullable
as double,supplyStatus: null == supplyStatus ? _self.supplyStatus : supplyStatus // ignore: cast_nullable_to_non_nullable
as PrescriptionSupplyStatus,scheduleStartAt: freezed == scheduleStartAt ? _self.scheduleStartAt : scheduleStartAt // ignore: cast_nullable_to_non_nullable
as DateTime?,needsScheduleStart: null == needsScheduleStart ? _self.needsScheduleStart : needsScheduleStart // ignore: cast_nullable_to_non_nullable
as bool,scheduleConfirmed: null == scheduleConfirmed ? _self.scheduleConfirmed : scheduleConfirmed // ignore: cast_nullable_to_non_nullable
as bool,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ActivePrescriptionSummary].
extension ActivePrescriptionSummaryPatterns on ActivePrescriptionSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivePrescriptionSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivePrescriptionSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivePrescriptionSummary value)  $default,){
final _that = this;
switch (_that) {
case _ActivePrescriptionSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivePrescriptionSummary value)?  $default,){
final _that = this;
switch (_that) {
case _ActivePrescriptionSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String displayName,  String frequencyLabel,  int daysRemaining,  int refillsRemaining,  double supplyProgress,  PrescriptionSupplyStatus supplyStatus,  DateTime? scheduleStartAt,  bool needsScheduleStart,  bool scheduleConfirmed,  DateTime? endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivePrescriptionSummary() when $default != null:
return $default(_that.id,_that.displayName,_that.frequencyLabel,_that.daysRemaining,_that.refillsRemaining,_that.supplyProgress,_that.supplyStatus,_that.scheduleStartAt,_that.needsScheduleStart,_that.scheduleConfirmed,_that.endDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String displayName,  String frequencyLabel,  int daysRemaining,  int refillsRemaining,  double supplyProgress,  PrescriptionSupplyStatus supplyStatus,  DateTime? scheduleStartAt,  bool needsScheduleStart,  bool scheduleConfirmed,  DateTime? endDate)  $default,) {final _that = this;
switch (_that) {
case _ActivePrescriptionSummary():
return $default(_that.id,_that.displayName,_that.frequencyLabel,_that.daysRemaining,_that.refillsRemaining,_that.supplyProgress,_that.supplyStatus,_that.scheduleStartAt,_that.needsScheduleStart,_that.scheduleConfirmed,_that.endDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String displayName,  String frequencyLabel,  int daysRemaining,  int refillsRemaining,  double supplyProgress,  PrescriptionSupplyStatus supplyStatus,  DateTime? scheduleStartAt,  bool needsScheduleStart,  bool scheduleConfirmed,  DateTime? endDate)?  $default,) {final _that = this;
switch (_that) {
case _ActivePrescriptionSummary() when $default != null:
return $default(_that.id,_that.displayName,_that.frequencyLabel,_that.daysRemaining,_that.refillsRemaining,_that.supplyProgress,_that.supplyStatus,_that.scheduleStartAt,_that.needsScheduleStart,_that.scheduleConfirmed,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActivePrescriptionSummary implements ActivePrescriptionSummary {
  const _ActivePrescriptionSummary({required this.id, required this.displayName, required this.frequencyLabel, required this.daysRemaining, required this.refillsRemaining, required this.supplyProgress, required this.supplyStatus, this.scheduleStartAt, this.needsScheduleStart = false, this.scheduleConfirmed = true, this.endDate});
  factory _ActivePrescriptionSummary.fromJson(Map<String, dynamic> json) => _$ActivePrescriptionSummaryFromJson(json);

@override final  String id;
@override final  String displayName;
@override final  String frequencyLabel;
@override final  int daysRemaining;
@override final  int refillsRemaining;
@override final  double supplyProgress;
@override final  PrescriptionSupplyStatus supplyStatus;
@override final  DateTime? scheduleStartAt;
@override@JsonKey() final  bool needsScheduleStart;
@override@JsonKey() final  bool scheduleConfirmed;
@override final  DateTime? endDate;

/// Create a copy of ActivePrescriptionSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivePrescriptionSummaryCopyWith<_ActivePrescriptionSummary> get copyWith => __$ActivePrescriptionSummaryCopyWithImpl<_ActivePrescriptionSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActivePrescriptionSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivePrescriptionSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.frequencyLabel, frequencyLabel) || other.frequencyLabel == frequencyLabel)&&(identical(other.daysRemaining, daysRemaining) || other.daysRemaining == daysRemaining)&&(identical(other.refillsRemaining, refillsRemaining) || other.refillsRemaining == refillsRemaining)&&(identical(other.supplyProgress, supplyProgress) || other.supplyProgress == supplyProgress)&&(identical(other.supplyStatus, supplyStatus) || other.supplyStatus == supplyStatus)&&(identical(other.scheduleStartAt, scheduleStartAt) || other.scheduleStartAt == scheduleStartAt)&&(identical(other.needsScheduleStart, needsScheduleStart) || other.needsScheduleStart == needsScheduleStart)&&(identical(other.scheduleConfirmed, scheduleConfirmed) || other.scheduleConfirmed == scheduleConfirmed)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,displayName,frequencyLabel,daysRemaining,refillsRemaining,supplyProgress,supplyStatus,scheduleStartAt,needsScheduleStart,scheduleConfirmed,endDate);
}

@override
String toString() {
    return 'ActivePrescriptionSummary(id: $id, displayName: $displayName, frequencyLabel: $frequencyLabel, daysRemaining: $daysRemaining, refillsRemaining: $refillsRemaining, supplyProgress: $supplyProgress, supplyStatus: $supplyStatus, scheduleStartAt: $scheduleStartAt, needsScheduleStart: $needsScheduleStart, scheduleConfirmed: $scheduleConfirmed, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$ActivePrescriptionSummaryCopyWith<$Res> implements $ActivePrescriptionSummaryCopyWith<$Res> {
  factory _$ActivePrescriptionSummaryCopyWith(_ActivePrescriptionSummary value, $Res Function(_ActivePrescriptionSummary) _then) = __$ActivePrescriptionSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String displayName, String frequencyLabel, int daysRemaining, int refillsRemaining, double supplyProgress, PrescriptionSupplyStatus supplyStatus, DateTime? scheduleStartAt, bool needsScheduleStart, bool scheduleConfirmed, DateTime? endDate
});




}
/// @nodoc
class __$ActivePrescriptionSummaryCopyWithImpl<$Res>
    implements _$ActivePrescriptionSummaryCopyWith<$Res> {
  __$ActivePrescriptionSummaryCopyWithImpl(this._self, this._then);

  final _ActivePrescriptionSummary _self;
  final $Res Function(_ActivePrescriptionSummary) _then;

/// Create a copy of ActivePrescriptionSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? displayName = null,Object? frequencyLabel = null,Object? daysRemaining = null,Object? refillsRemaining = null,Object? supplyProgress = null,Object? supplyStatus = null,Object? scheduleStartAt = freezed,Object? needsScheduleStart = null,Object? scheduleConfirmed = null,Object? endDate = freezed,}) {
  return _then(_ActivePrescriptionSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,frequencyLabel: null == frequencyLabel ? _self.frequencyLabel : frequencyLabel // ignore: cast_nullable_to_non_nullable
as String,daysRemaining: null == daysRemaining ? _self.daysRemaining : daysRemaining // ignore: cast_nullable_to_non_nullable
as int,refillsRemaining: null == refillsRemaining ? _self.refillsRemaining : refillsRemaining // ignore: cast_nullable_to_non_nullable
as int,supplyProgress: null == supplyProgress ? _self.supplyProgress : supplyProgress // ignore: cast_nullable_to_non_nullable
as double,supplyStatus: null == supplyStatus ? _self.supplyStatus : supplyStatus // ignore: cast_nullable_to_non_nullable
as PrescriptionSupplyStatus,scheduleStartAt: freezed == scheduleStartAt ? _self.scheduleStartAt : scheduleStartAt // ignore: cast_nullable_to_non_nullable
as DateTime?,needsScheduleStart: null == needsScheduleStart ? _self.needsScheduleStart : needsScheduleStart // ignore: cast_nullable_to_non_nullable
as bool,scheduleConfirmed: null == scheduleConfirmed ? _self.scheduleConfirmed : scheduleConfirmed // ignore: cast_nullable_to_non_nullable
as bool,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$MedicationStreak {

 int get currentStreak; int get longestStreak; String? get lastPerfectDate; int get shieldsRemaining; bool get todayCompleted;
/// Create a copy of MedicationStreak
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedicationStreakCopyWith<MedicationStreak> get copyWith => _$MedicationStreakCopyWithImpl<MedicationStreak>(this as MedicationStreak, _$identity);

  /// Serializes this MedicationStreak to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MedicationStreak;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedicationStreak&&(identical(other.currentStreak, _this.currentStreak) || other.currentStreak == _this.currentStreak)&&(identical(other.longestStreak, _this.longestStreak) || other.longestStreak == _this.longestStreak)&&(identical(other.lastPerfectDate, _this.lastPerfectDate) || other.lastPerfectDate == _this.lastPerfectDate)&&(identical(other.shieldsRemaining, _this.shieldsRemaining) || other.shieldsRemaining == _this.shieldsRemaining)&&(identical(other.todayCompleted, _this.todayCompleted) || other.todayCompleted == _this.todayCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MedicationStreak;
  return Object.hash(runtimeType,_this.currentStreak,_this.longestStreak,_this.lastPerfectDate,_this.shieldsRemaining,_this.todayCompleted);
}

@override
String toString() {
  final _this = this as MedicationStreak;
  return 'MedicationStreak(currentStreak: ${_this.currentStreak}, longestStreak: ${_this.longestStreak}, lastPerfectDate: ${_this.lastPerfectDate}, shieldsRemaining: ${_this.shieldsRemaining}, todayCompleted: ${_this.todayCompleted})';
}


}

/// @nodoc
abstract mixin class $MedicationStreakCopyWith<$Res>  {
  factory $MedicationStreakCopyWith(MedicationStreak value, $Res Function(MedicationStreak) _then) = _$MedicationStreakCopyWithImpl;
@useResult
$Res call({
 int currentStreak, int longestStreak, String? lastPerfectDate, int shieldsRemaining, bool todayCompleted
});




}
/// @nodoc
class _$MedicationStreakCopyWithImpl<$Res>
    implements $MedicationStreakCopyWith<$Res> {
  _$MedicationStreakCopyWithImpl(this._self, this._then);

  final MedicationStreak _self;
  final $Res Function(MedicationStreak) _then;

/// Create a copy of MedicationStreak
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStreak = null,Object? longestStreak = null,Object? lastPerfectDate = freezed,Object? shieldsRemaining = null,Object? todayCompleted = null,}) {
  return _then(MedicationStreak(
currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,longestStreak: null == longestStreak ? _self.longestStreak : longestStreak // ignore: cast_nullable_to_non_nullable
as int,lastPerfectDate: freezed == lastPerfectDate ? _self.lastPerfectDate : lastPerfectDate // ignore: cast_nullable_to_non_nullable
as String?,shieldsRemaining: null == shieldsRemaining ? _self.shieldsRemaining : shieldsRemaining // ignore: cast_nullable_to_non_nullable
as int,todayCompleted: null == todayCompleted ? _self.todayCompleted : todayCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MedicationStreak].
extension MedicationStreakPatterns on MedicationStreak {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedicationStreak value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedicationStreak() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedicationStreak value)  $default,){
final _that = this;
switch (_that) {
case _MedicationStreak():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedicationStreak value)?  $default,){
final _that = this;
switch (_that) {
case _MedicationStreak() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentStreak,  int longestStreak,  String? lastPerfectDate,  int shieldsRemaining,  bool todayCompleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedicationStreak() when $default != null:
return $default(_that.currentStreak,_that.longestStreak,_that.lastPerfectDate,_that.shieldsRemaining,_that.todayCompleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentStreak,  int longestStreak,  String? lastPerfectDate,  int shieldsRemaining,  bool todayCompleted)  $default,) {final _that = this;
switch (_that) {
case _MedicationStreak():
return $default(_that.currentStreak,_that.longestStreak,_that.lastPerfectDate,_that.shieldsRemaining,_that.todayCompleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentStreak,  int longestStreak,  String? lastPerfectDate,  int shieldsRemaining,  bool todayCompleted)?  $default,) {final _that = this;
switch (_that) {
case _MedicationStreak() when $default != null:
return $default(_that.currentStreak,_that.longestStreak,_that.lastPerfectDate,_that.shieldsRemaining,_that.todayCompleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedicationStreak implements MedicationStreak {
  const _MedicationStreak({this.currentStreak = 0, this.longestStreak = 0, this.lastPerfectDate, this.shieldsRemaining = 1, this.todayCompleted = false});
  factory _MedicationStreak.fromJson(Map<String, dynamic> json) => _$MedicationStreakFromJson(json);

@override@JsonKey() final  int currentStreak;
@override@JsonKey() final  int longestStreak;
@override final  String? lastPerfectDate;
@override@JsonKey() final  int shieldsRemaining;
@override@JsonKey() final  bool todayCompleted;

/// Create a copy of MedicationStreak
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedicationStreakCopyWith<_MedicationStreak> get copyWith => __$MedicationStreakCopyWithImpl<_MedicationStreak>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedicationStreakToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedicationStreak&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.longestStreak, longestStreak) || other.longestStreak == longestStreak)&&(identical(other.lastPerfectDate, lastPerfectDate) || other.lastPerfectDate == lastPerfectDate)&&(identical(other.shieldsRemaining, shieldsRemaining) || other.shieldsRemaining == shieldsRemaining)&&(identical(other.todayCompleted, todayCompleted) || other.todayCompleted == todayCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,currentStreak,longestStreak,lastPerfectDate,shieldsRemaining,todayCompleted);
}

@override
String toString() {
    return 'MedicationStreak(currentStreak: $currentStreak, longestStreak: $longestStreak, lastPerfectDate: $lastPerfectDate, shieldsRemaining: $shieldsRemaining, todayCompleted: $todayCompleted)';
}


}

/// @nodoc
abstract mixin class _$MedicationStreakCopyWith<$Res> implements $MedicationStreakCopyWith<$Res> {
  factory _$MedicationStreakCopyWith(_MedicationStreak value, $Res Function(_MedicationStreak) _then) = __$MedicationStreakCopyWithImpl;
@override @useResult
$Res call({
 int currentStreak, int longestStreak, String? lastPerfectDate, int shieldsRemaining, bool todayCompleted
});




}
/// @nodoc
class __$MedicationStreakCopyWithImpl<$Res>
    implements _$MedicationStreakCopyWith<$Res> {
  __$MedicationStreakCopyWithImpl(this._self, this._then);

  final _MedicationStreak _self;
  final $Res Function(_MedicationStreak) _then;

/// Create a copy of MedicationStreak
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStreak = null,Object? longestStreak = null,Object? lastPerfectDate = freezed,Object? shieldsRemaining = null,Object? todayCompleted = null,}) {
  return _then(_MedicationStreak(
currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,longestStreak: null == longestStreak ? _self.longestStreak : longestStreak // ignore: cast_nullable_to_non_nullable
as int,lastPerfectDate: freezed == lastPerfectDate ? _self.lastPerfectDate : lastPerfectDate // ignore: cast_nullable_to_non_nullable
as String?,shieldsRemaining: null == shieldsRemaining ? _self.shieldsRemaining : shieldsRemaining // ignore: cast_nullable_to_non_nullable
as int,todayCompleted: null == todayCompleted ? _self.todayCompleted : todayCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$MedicationDashboardResponse {

 List<MedicationDoseSummary> get nextDoses; List<MedicationScheduleEntry> get todaySchedule; List<ActivePrescriptionSummary> get activePrescriptions; MedicationStreak? get streak;
/// Create a copy of MedicationDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedicationDashboardResponseCopyWith<MedicationDashboardResponse> get copyWith => _$MedicationDashboardResponseCopyWithImpl<MedicationDashboardResponse>(this as MedicationDashboardResponse, _$identity);

  /// Serializes this MedicationDashboardResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MedicationDashboardResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedicationDashboardResponse&&const DeepCollectionEquality().equals(other.nextDoses, _this.nextDoses)&&const DeepCollectionEquality().equals(other.todaySchedule, _this.todaySchedule)&&const DeepCollectionEquality().equals(other.activePrescriptions, _this.activePrescriptions)&&(identical(other.streak, _this.streak) || other.streak == _this.streak));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MedicationDashboardResponse;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.nextDoses),const DeepCollectionEquality().hash(_this.todaySchedule),const DeepCollectionEquality().hash(_this.activePrescriptions),_this.streak);
}

@override
String toString() {
  final _this = this as MedicationDashboardResponse;
  return 'MedicationDashboardResponse(nextDoses: ${_this.nextDoses}, todaySchedule: ${_this.todaySchedule}, activePrescriptions: ${_this.activePrescriptions}, streak: ${_this.streak})';
}


}

/// @nodoc
abstract mixin class $MedicationDashboardResponseCopyWith<$Res>  {
  factory $MedicationDashboardResponseCopyWith(MedicationDashboardResponse value, $Res Function(MedicationDashboardResponse) _then) = _$MedicationDashboardResponseCopyWithImpl;
@useResult
$Res call({
 List<MedicationDoseSummary> nextDoses, List<MedicationScheduleEntry> todaySchedule, List<ActivePrescriptionSummary> activePrescriptions, MedicationStreak? streak
});


$MedicationStreakCopyWith<$Res>? get streak;

}
/// @nodoc
class _$MedicationDashboardResponseCopyWithImpl<$Res>
    implements $MedicationDashboardResponseCopyWith<$Res> {
  _$MedicationDashboardResponseCopyWithImpl(this._self, this._then);

  final MedicationDashboardResponse _self;
  final $Res Function(MedicationDashboardResponse) _then;

/// Create a copy of MedicationDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nextDoses = null,Object? todaySchedule = null,Object? activePrescriptions = null,Object? streak = freezed,}) {
  return _then(MedicationDashboardResponse(
nextDoses: null == nextDoses ? _self.nextDoses : nextDoses // ignore: cast_nullable_to_non_nullable
as List<MedicationDoseSummary>,todaySchedule: null == todaySchedule ? _self.todaySchedule : todaySchedule // ignore: cast_nullable_to_non_nullable
as List<MedicationScheduleEntry>,activePrescriptions: null == activePrescriptions ? _self.activePrescriptions : activePrescriptions // ignore: cast_nullable_to_non_nullable
as List<ActivePrescriptionSummary>,streak: freezed == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as MedicationStreak?,
  ));
}
/// Create a copy of MedicationDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MedicationStreakCopyWith<$Res>? get streak {
    if (_self.streak == null) {
    return null;
  }

  return $MedicationStreakCopyWith<$Res>(_self.streak!, (value) {
    return _then(_self.copyWith(streak: value));
  });
}
}


/// Adds pattern-matching-related methods to [MedicationDashboardResponse].
extension MedicationDashboardResponsePatterns on MedicationDashboardResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedicationDashboardResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedicationDashboardResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedicationDashboardResponse value)  $default,){
final _that = this;
switch (_that) {
case _MedicationDashboardResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedicationDashboardResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MedicationDashboardResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MedicationDoseSummary> nextDoses,  List<MedicationScheduleEntry> todaySchedule,  List<ActivePrescriptionSummary> activePrescriptions,  MedicationStreak? streak)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedicationDashboardResponse() when $default != null:
return $default(_that.nextDoses,_that.todaySchedule,_that.activePrescriptions,_that.streak);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MedicationDoseSummary> nextDoses,  List<MedicationScheduleEntry> todaySchedule,  List<ActivePrescriptionSummary> activePrescriptions,  MedicationStreak? streak)  $default,) {final _that = this;
switch (_that) {
case _MedicationDashboardResponse():
return $default(_that.nextDoses,_that.todaySchedule,_that.activePrescriptions,_that.streak);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MedicationDoseSummary> nextDoses,  List<MedicationScheduleEntry> todaySchedule,  List<ActivePrescriptionSummary> activePrescriptions,  MedicationStreak? streak)?  $default,) {final _that = this;
switch (_that) {
case _MedicationDashboardResponse() when $default != null:
return $default(_that.nextDoses,_that.todaySchedule,_that.activePrescriptions,_that.streak);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedicationDashboardResponse implements MedicationDashboardResponse {
  const _MedicationDashboardResponse({ List<MedicationDoseSummary> nextDoses = const [],  List<MedicationScheduleEntry> todaySchedule = const [],  List<ActivePrescriptionSummary> activePrescriptions = const [], this.streak}): _nextDoses = nextDoses,_todaySchedule = todaySchedule,_activePrescriptions = activePrescriptions;
  factory _MedicationDashboardResponse.fromJson(Map<String, dynamic> json) => _$MedicationDashboardResponseFromJson(json);

 final  List<MedicationDoseSummary> _nextDoses;
@override@JsonKey() List<MedicationDoseSummary> get nextDoses {
  if (_nextDoses is EqualUnmodifiableListView) return _nextDoses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nextDoses);
}

 final  List<MedicationScheduleEntry> _todaySchedule;
@override@JsonKey() List<MedicationScheduleEntry> get todaySchedule {
  if (_todaySchedule is EqualUnmodifiableListView) return _todaySchedule;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_todaySchedule);
}

 final  List<ActivePrescriptionSummary> _activePrescriptions;
@override@JsonKey() List<ActivePrescriptionSummary> get activePrescriptions {
  if (_activePrescriptions is EqualUnmodifiableListView) return _activePrescriptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activePrescriptions);
}

@override final  MedicationStreak? streak;

/// Create a copy of MedicationDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedicationDashboardResponseCopyWith<_MedicationDashboardResponse> get copyWith => __$MedicationDashboardResponseCopyWithImpl<_MedicationDashboardResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedicationDashboardResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedicationDashboardResponse&&const DeepCollectionEquality().equals(other.nextDoses, _nextDoses)&&const DeepCollectionEquality().equals(other.todaySchedule, _todaySchedule)&&const DeepCollectionEquality().equals(other.activePrescriptions, _activePrescriptions)&&(identical(other.streak, streak) || other.streak == streak));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_nextDoses),const DeepCollectionEquality().hash(_todaySchedule),const DeepCollectionEquality().hash(_activePrescriptions),streak);
}

@override
String toString() {
    return 'MedicationDashboardResponse(nextDoses: $nextDoses, todaySchedule: $todaySchedule, activePrescriptions: $activePrescriptions, streak: $streak)';
}


}

/// @nodoc
abstract mixin class _$MedicationDashboardResponseCopyWith<$Res> implements $MedicationDashboardResponseCopyWith<$Res> {
  factory _$MedicationDashboardResponseCopyWith(_MedicationDashboardResponse value, $Res Function(_MedicationDashboardResponse) _then) = __$MedicationDashboardResponseCopyWithImpl;
@override @useResult
$Res call({
 List<MedicationDoseSummary> nextDoses, List<MedicationScheduleEntry> todaySchedule, List<ActivePrescriptionSummary> activePrescriptions, MedicationStreak? streak
});


@override $MedicationStreakCopyWith<$Res>? get streak;

}
/// @nodoc
class __$MedicationDashboardResponseCopyWithImpl<$Res>
    implements _$MedicationDashboardResponseCopyWith<$Res> {
  __$MedicationDashboardResponseCopyWithImpl(this._self, this._then);

  final _MedicationDashboardResponse _self;
  final $Res Function(_MedicationDashboardResponse) _then;

/// Create a copy of MedicationDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nextDoses = null,Object? todaySchedule = null,Object? activePrescriptions = null,Object? streak = freezed,}) {
  return _then(_MedicationDashboardResponse(
nextDoses: null == nextDoses ? _self._nextDoses : nextDoses // ignore: cast_nullable_to_non_nullable
as List<MedicationDoseSummary>,todaySchedule: null == todaySchedule ? _self._todaySchedule : todaySchedule // ignore: cast_nullable_to_non_nullable
as List<MedicationScheduleEntry>,activePrescriptions: null == activePrescriptions ? _self._activePrescriptions : activePrescriptions // ignore: cast_nullable_to_non_nullable
as List<ActivePrescriptionSummary>,streak: freezed == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as MedicationStreak?,
  ));
}

/// Create a copy of MedicationDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MedicationStreakCopyWith<$Res>? get streak {
    if (_self.streak == null) {
    return null;
  }

  return $MedicationStreakCopyWith<$Res>(_self.streak!, (value) {
    return _then(_self.copyWith(streak: value));
  });
}
}


/// @nodoc
mixin _$MedicationCalendarResponse {

 List<MedicationScheduleEntry> get doses;
/// Create a copy of MedicationCalendarResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedicationCalendarResponseCopyWith<MedicationCalendarResponse> get copyWith => _$MedicationCalendarResponseCopyWithImpl<MedicationCalendarResponse>(this as MedicationCalendarResponse, _$identity);

  /// Serializes this MedicationCalendarResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MedicationCalendarResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedicationCalendarResponse&&const DeepCollectionEquality().equals(other.doses, _this.doses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MedicationCalendarResponse;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.doses));
}

@override
String toString() {
  final _this = this as MedicationCalendarResponse;
  return 'MedicationCalendarResponse(doses: ${_this.doses})';
}


}

/// @nodoc
abstract mixin class $MedicationCalendarResponseCopyWith<$Res>  {
  factory $MedicationCalendarResponseCopyWith(MedicationCalendarResponse value, $Res Function(MedicationCalendarResponse) _then) = _$MedicationCalendarResponseCopyWithImpl;
@useResult
$Res call({
 List<MedicationScheduleEntry> doses
});




}
/// @nodoc
class _$MedicationCalendarResponseCopyWithImpl<$Res>
    implements $MedicationCalendarResponseCopyWith<$Res> {
  _$MedicationCalendarResponseCopyWithImpl(this._self, this._then);

  final MedicationCalendarResponse _self;
  final $Res Function(MedicationCalendarResponse) _then;

/// Create a copy of MedicationCalendarResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? doses = null,}) {
  return _then(MedicationCalendarResponse(
doses: null == doses ? _self.doses : doses // ignore: cast_nullable_to_non_nullable
as List<MedicationScheduleEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [MedicationCalendarResponse].
extension MedicationCalendarResponsePatterns on MedicationCalendarResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedicationCalendarResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedicationCalendarResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedicationCalendarResponse value)  $default,){
final _that = this;
switch (_that) {
case _MedicationCalendarResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedicationCalendarResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MedicationCalendarResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MedicationScheduleEntry> doses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedicationCalendarResponse() when $default != null:
return $default(_that.doses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MedicationScheduleEntry> doses)  $default,) {final _that = this;
switch (_that) {
case _MedicationCalendarResponse():
return $default(_that.doses);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MedicationScheduleEntry> doses)?  $default,) {final _that = this;
switch (_that) {
case _MedicationCalendarResponse() when $default != null:
return $default(_that.doses);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedicationCalendarResponse implements MedicationCalendarResponse {
  const _MedicationCalendarResponse({ List<MedicationScheduleEntry> doses = const []}): _doses = doses;
  factory _MedicationCalendarResponse.fromJson(Map<String, dynamic> json) => _$MedicationCalendarResponseFromJson(json);

 final  List<MedicationScheduleEntry> _doses;
@override@JsonKey() List<MedicationScheduleEntry> get doses {
  if (_doses is EqualUnmodifiableListView) return _doses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_doses);
}


/// Create a copy of MedicationCalendarResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedicationCalendarResponseCopyWith<_MedicationCalendarResponse> get copyWith => __$MedicationCalendarResponseCopyWithImpl<_MedicationCalendarResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedicationCalendarResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedicationCalendarResponse&&const DeepCollectionEquality().equals(other.doses, _doses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_doses));
}

@override
String toString() {
    return 'MedicationCalendarResponse(doses: $doses)';
}


}

/// @nodoc
abstract mixin class _$MedicationCalendarResponseCopyWith<$Res> implements $MedicationCalendarResponseCopyWith<$Res> {
  factory _$MedicationCalendarResponseCopyWith(_MedicationCalendarResponse value, $Res Function(_MedicationCalendarResponse) _then) = __$MedicationCalendarResponseCopyWithImpl;
@override @useResult
$Res call({
 List<MedicationScheduleEntry> doses
});




}
/// @nodoc
class __$MedicationCalendarResponseCopyWithImpl<$Res>
    implements _$MedicationCalendarResponseCopyWith<$Res> {
  __$MedicationCalendarResponseCopyWithImpl(this._self, this._then);

  final _MedicationCalendarResponse _self;
  final $Res Function(_MedicationCalendarResponse) _then;

/// Create a copy of MedicationCalendarResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doses = null,}) {
  return _then(_MedicationCalendarResponse(
doses: null == doses ? _self._doses : doses // ignore: cast_nullable_to_non_nullable
as List<MedicationScheduleEntry>,
  ));
}


}


/// @nodoc
mixin _$PrescriptionDosesResponse {

 String get prescriptionId; String get displayName; List<MedicationScheduleEntry> get doses;
/// Create a copy of PrescriptionDosesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionDosesResponseCopyWith<PrescriptionDosesResponse> get copyWith => _$PrescriptionDosesResponseCopyWithImpl<PrescriptionDosesResponse>(this as PrescriptionDosesResponse, _$identity);

  /// Serializes this PrescriptionDosesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PrescriptionDosesResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionDosesResponse&&(identical(other.prescriptionId, _this.prescriptionId) || other.prescriptionId == _this.prescriptionId)&&(identical(other.displayName, _this.displayName) || other.displayName == _this.displayName)&&const DeepCollectionEquality().equals(other.doses, _this.doses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PrescriptionDosesResponse;
  return Object.hash(runtimeType,_this.prescriptionId,_this.displayName,const DeepCollectionEquality().hash(_this.doses));
}

@override
String toString() {
  final _this = this as PrescriptionDosesResponse;
  return 'PrescriptionDosesResponse(prescriptionId: ${_this.prescriptionId}, displayName: ${_this.displayName}, doses: ${_this.doses})';
}


}

/// @nodoc
abstract mixin class $PrescriptionDosesResponseCopyWith<$Res>  {
  factory $PrescriptionDosesResponseCopyWith(PrescriptionDosesResponse value, $Res Function(PrescriptionDosesResponse) _then) = _$PrescriptionDosesResponseCopyWithImpl;
@useResult
$Res call({
 String prescriptionId, String displayName, List<MedicationScheduleEntry> doses
});




}
/// @nodoc
class _$PrescriptionDosesResponseCopyWithImpl<$Res>
    implements $PrescriptionDosesResponseCopyWith<$Res> {
  _$PrescriptionDosesResponseCopyWithImpl(this._self, this._then);

  final PrescriptionDosesResponse _self;
  final $Res Function(PrescriptionDosesResponse) _then;

/// Create a copy of PrescriptionDosesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? prescriptionId = null,Object? displayName = null,Object? doses = null,}) {
  return _then(PrescriptionDosesResponse(
prescriptionId: null == prescriptionId ? _self.prescriptionId : prescriptionId // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,doses: null == doses ? _self.doses : doses // ignore: cast_nullable_to_non_nullable
as List<MedicationScheduleEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [PrescriptionDosesResponse].
extension PrescriptionDosesResponsePatterns on PrescriptionDosesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrescriptionDosesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrescriptionDosesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrescriptionDosesResponse value)  $default,){
final _that = this;
switch (_that) {
case _PrescriptionDosesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrescriptionDosesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PrescriptionDosesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String prescriptionId,  String displayName,  List<MedicationScheduleEntry> doses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrescriptionDosesResponse() when $default != null:
return $default(_that.prescriptionId,_that.displayName,_that.doses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String prescriptionId,  String displayName,  List<MedicationScheduleEntry> doses)  $default,) {final _that = this;
switch (_that) {
case _PrescriptionDosesResponse():
return $default(_that.prescriptionId,_that.displayName,_that.doses);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String prescriptionId,  String displayName,  List<MedicationScheduleEntry> doses)?  $default,) {final _that = this;
switch (_that) {
case _PrescriptionDosesResponse() when $default != null:
return $default(_that.prescriptionId,_that.displayName,_that.doses);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrescriptionDosesResponse implements PrescriptionDosesResponse {
  const _PrescriptionDosesResponse({required this.prescriptionId, required this.displayName,  List<MedicationScheduleEntry> doses = const []}): _doses = doses;
  factory _PrescriptionDosesResponse.fromJson(Map<String, dynamic> json) => _$PrescriptionDosesResponseFromJson(json);

@override final  String prescriptionId;
@override final  String displayName;
 final  List<MedicationScheduleEntry> _doses;
@override@JsonKey() List<MedicationScheduleEntry> get doses {
  if (_doses is EqualUnmodifiableListView) return _doses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_doses);
}


/// Create a copy of PrescriptionDosesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrescriptionDosesResponseCopyWith<_PrescriptionDosesResponse> get copyWith => __$PrescriptionDosesResponseCopyWithImpl<_PrescriptionDosesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrescriptionDosesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrescriptionDosesResponse&&(identical(other.prescriptionId, prescriptionId) || other.prescriptionId == prescriptionId)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&const DeepCollectionEquality().equals(other.doses, _doses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,prescriptionId,displayName,const DeepCollectionEquality().hash(_doses));
}

@override
String toString() {
    return 'PrescriptionDosesResponse(prescriptionId: $prescriptionId, displayName: $displayName, doses: $doses)';
}


}

/// @nodoc
abstract mixin class _$PrescriptionDosesResponseCopyWith<$Res> implements $PrescriptionDosesResponseCopyWith<$Res> {
  factory _$PrescriptionDosesResponseCopyWith(_PrescriptionDosesResponse value, $Res Function(_PrescriptionDosesResponse) _then) = __$PrescriptionDosesResponseCopyWithImpl;
@override @useResult
$Res call({
 String prescriptionId, String displayName, List<MedicationScheduleEntry> doses
});




}
/// @nodoc
class __$PrescriptionDosesResponseCopyWithImpl<$Res>
    implements _$PrescriptionDosesResponseCopyWith<$Res> {
  __$PrescriptionDosesResponseCopyWithImpl(this._self, this._then);

  final _PrescriptionDosesResponse _self;
  final $Res Function(_PrescriptionDosesResponse) _then;

/// Create a copy of PrescriptionDosesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? prescriptionId = null,Object? displayName = null,Object? doses = null,}) {
  return _then(_PrescriptionDosesResponse(
prescriptionId: null == prescriptionId ? _self.prescriptionId : prescriptionId // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,doses: null == doses ? _self._doses : doses // ignore: cast_nullable_to_non_nullable
as List<MedicationScheduleEntry>,
  ));
}


}


/// @nodoc
mixin _$ScheduleUpdateResponse {

 String get id; DateTime? get patientScheduleStartAt; DateTime? get scheduleConfirmedAt; int get dosesGenerated;
/// Create a copy of ScheduleUpdateResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleUpdateResponseCopyWith<ScheduleUpdateResponse> get copyWith => _$ScheduleUpdateResponseCopyWithImpl<ScheduleUpdateResponse>(this as ScheduleUpdateResponse, _$identity);

  /// Serializes this ScheduleUpdateResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ScheduleUpdateResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleUpdateResponse&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.patientScheduleStartAt, _this.patientScheduleStartAt) || other.patientScheduleStartAt == _this.patientScheduleStartAt)&&(identical(other.scheduleConfirmedAt, _this.scheduleConfirmedAt) || other.scheduleConfirmedAt == _this.scheduleConfirmedAt)&&(identical(other.dosesGenerated, _this.dosesGenerated) || other.dosesGenerated == _this.dosesGenerated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ScheduleUpdateResponse;
  return Object.hash(runtimeType,_this.id,_this.patientScheduleStartAt,_this.scheduleConfirmedAt,_this.dosesGenerated);
}

@override
String toString() {
  final _this = this as ScheduleUpdateResponse;
  return 'ScheduleUpdateResponse(id: ${_this.id}, patientScheduleStartAt: ${_this.patientScheduleStartAt}, scheduleConfirmedAt: ${_this.scheduleConfirmedAt}, dosesGenerated: ${_this.dosesGenerated})';
}


}

/// @nodoc
abstract mixin class $ScheduleUpdateResponseCopyWith<$Res>  {
  factory $ScheduleUpdateResponseCopyWith(ScheduleUpdateResponse value, $Res Function(ScheduleUpdateResponse) _then) = _$ScheduleUpdateResponseCopyWithImpl;
@useResult
$Res call({
 String id, DateTime? patientScheduleStartAt, DateTime? scheduleConfirmedAt, int dosesGenerated
});




}
/// @nodoc
class _$ScheduleUpdateResponseCopyWithImpl<$Res>
    implements $ScheduleUpdateResponseCopyWith<$Res> {
  _$ScheduleUpdateResponseCopyWithImpl(this._self, this._then);

  final ScheduleUpdateResponse _self;
  final $Res Function(ScheduleUpdateResponse) _then;

/// Create a copy of ScheduleUpdateResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? patientScheduleStartAt = freezed,Object? scheduleConfirmedAt = freezed,Object? dosesGenerated = null,}) {
  return _then(ScheduleUpdateResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patientScheduleStartAt: freezed == patientScheduleStartAt ? _self.patientScheduleStartAt : patientScheduleStartAt // ignore: cast_nullable_to_non_nullable
as DateTime?,scheduleConfirmedAt: freezed == scheduleConfirmedAt ? _self.scheduleConfirmedAt : scheduleConfirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dosesGenerated: null == dosesGenerated ? _self.dosesGenerated : dosesGenerated // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ScheduleUpdateResponse].
extension ScheduleUpdateResponsePatterns on ScheduleUpdateResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduleUpdateResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduleUpdateResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduleUpdateResponse value)  $default,){
final _that = this;
switch (_that) {
case _ScheduleUpdateResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduleUpdateResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduleUpdateResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime? patientScheduleStartAt,  DateTime? scheduleConfirmedAt,  int dosesGenerated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduleUpdateResponse() when $default != null:
return $default(_that.id,_that.patientScheduleStartAt,_that.scheduleConfirmedAt,_that.dosesGenerated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime? patientScheduleStartAt,  DateTime? scheduleConfirmedAt,  int dosesGenerated)  $default,) {final _that = this;
switch (_that) {
case _ScheduleUpdateResponse():
return $default(_that.id,_that.patientScheduleStartAt,_that.scheduleConfirmedAt,_that.dosesGenerated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime? patientScheduleStartAt,  DateTime? scheduleConfirmedAt,  int dosesGenerated)?  $default,) {final _that = this;
switch (_that) {
case _ScheduleUpdateResponse() when $default != null:
return $default(_that.id,_that.patientScheduleStartAt,_that.scheduleConfirmedAt,_that.dosesGenerated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScheduleUpdateResponse implements ScheduleUpdateResponse {
  const _ScheduleUpdateResponse({required this.id, this.patientScheduleStartAt, this.scheduleConfirmedAt, this.dosesGenerated = 0});
  factory _ScheduleUpdateResponse.fromJson(Map<String, dynamic> json) => _$ScheduleUpdateResponseFromJson(json);

@override final  String id;
@override final  DateTime? patientScheduleStartAt;
@override final  DateTime? scheduleConfirmedAt;
@override@JsonKey() final  int dosesGenerated;

/// Create a copy of ScheduleUpdateResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleUpdateResponseCopyWith<_ScheduleUpdateResponse> get copyWith => __$ScheduleUpdateResponseCopyWithImpl<_ScheduleUpdateResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScheduleUpdateResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleUpdateResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.patientScheduleStartAt, patientScheduleStartAt) || other.patientScheduleStartAt == patientScheduleStartAt)&&(identical(other.scheduleConfirmedAt, scheduleConfirmedAt) || other.scheduleConfirmedAt == scheduleConfirmedAt)&&(identical(other.dosesGenerated, dosesGenerated) || other.dosesGenerated == dosesGenerated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,patientScheduleStartAt,scheduleConfirmedAt,dosesGenerated);
}

@override
String toString() {
    return 'ScheduleUpdateResponse(id: $id, patientScheduleStartAt: $patientScheduleStartAt, scheduleConfirmedAt: $scheduleConfirmedAt, dosesGenerated: $dosesGenerated)';
}


}

/// @nodoc
abstract mixin class _$ScheduleUpdateResponseCopyWith<$Res> implements $ScheduleUpdateResponseCopyWith<$Res> {
  factory _$ScheduleUpdateResponseCopyWith(_ScheduleUpdateResponse value, $Res Function(_ScheduleUpdateResponse) _then) = __$ScheduleUpdateResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime? patientScheduleStartAt, DateTime? scheduleConfirmedAt, int dosesGenerated
});




}
/// @nodoc
class __$ScheduleUpdateResponseCopyWithImpl<$Res>
    implements _$ScheduleUpdateResponseCopyWith<$Res> {
  __$ScheduleUpdateResponseCopyWithImpl(this._self, this._then);

  final _ScheduleUpdateResponse _self;
  final $Res Function(_ScheduleUpdateResponse) _then;

/// Create a copy of ScheduleUpdateResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? patientScheduleStartAt = freezed,Object? scheduleConfirmedAt = freezed,Object? dosesGenerated = null,}) {
  return _then(_ScheduleUpdateResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patientScheduleStartAt: freezed == patientScheduleStartAt ? _self.patientScheduleStartAt : patientScheduleStartAt // ignore: cast_nullable_to_non_nullable
as DateTime?,scheduleConfirmedAt: freezed == scheduleConfirmedAt ? _self.scheduleConfirmedAt : scheduleConfirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dosesGenerated: null == dosesGenerated ? _self.dosesGenerated : dosesGenerated // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$MarkDoseTakenResponse {

 String get id; MedicationDoseStatus get status; DateTime get takenAt; MedicationStreak? get streak; bool get dayCompleted;
/// Create a copy of MarkDoseTakenResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarkDoseTakenResponseCopyWith<MarkDoseTakenResponse> get copyWith => _$MarkDoseTakenResponseCopyWithImpl<MarkDoseTakenResponse>(this as MarkDoseTakenResponse, _$identity);

  /// Serializes this MarkDoseTakenResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MarkDoseTakenResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarkDoseTakenResponse&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.takenAt, _this.takenAt) || other.takenAt == _this.takenAt)&&(identical(other.streak, _this.streak) || other.streak == _this.streak)&&(identical(other.dayCompleted, _this.dayCompleted) || other.dayCompleted == _this.dayCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MarkDoseTakenResponse;
  return Object.hash(runtimeType,_this.id,_this.status,_this.takenAt,_this.streak,_this.dayCompleted);
}

@override
String toString() {
  final _this = this as MarkDoseTakenResponse;
  return 'MarkDoseTakenResponse(id: ${_this.id}, status: ${_this.status}, takenAt: ${_this.takenAt}, streak: ${_this.streak}, dayCompleted: ${_this.dayCompleted})';
}


}

/// @nodoc
abstract mixin class $MarkDoseTakenResponseCopyWith<$Res>  {
  factory $MarkDoseTakenResponseCopyWith(MarkDoseTakenResponse value, $Res Function(MarkDoseTakenResponse) _then) = _$MarkDoseTakenResponseCopyWithImpl;
@useResult
$Res call({
 String id, MedicationDoseStatus status, DateTime takenAt, MedicationStreak? streak, bool dayCompleted
});


$MedicationStreakCopyWith<$Res>? get streak;

}
/// @nodoc
class _$MarkDoseTakenResponseCopyWithImpl<$Res>
    implements $MarkDoseTakenResponseCopyWith<$Res> {
  _$MarkDoseTakenResponseCopyWithImpl(this._self, this._then);

  final MarkDoseTakenResponse _self;
  final $Res Function(MarkDoseTakenResponse) _then;

/// Create a copy of MarkDoseTakenResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? takenAt = null,Object? streak = freezed,Object? dayCompleted = null,}) {
  return _then(MarkDoseTakenResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MedicationDoseStatus,takenAt: null == takenAt ? _self.takenAt : takenAt // ignore: cast_nullable_to_non_nullable
as DateTime,streak: freezed == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as MedicationStreak?,dayCompleted: null == dayCompleted ? _self.dayCompleted : dayCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MarkDoseTakenResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MedicationStreakCopyWith<$Res>? get streak {
    if (_self.streak == null) {
    return null;
  }

  return $MedicationStreakCopyWith<$Res>(_self.streak!, (value) {
    return _then(_self.copyWith(streak: value));
  });
}
}


/// Adds pattern-matching-related methods to [MarkDoseTakenResponse].
extension MarkDoseTakenResponsePatterns on MarkDoseTakenResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarkDoseTakenResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarkDoseTakenResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarkDoseTakenResponse value)  $default,){
final _that = this;
switch (_that) {
case _MarkDoseTakenResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarkDoseTakenResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MarkDoseTakenResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  MedicationDoseStatus status,  DateTime takenAt,  MedicationStreak? streak,  bool dayCompleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarkDoseTakenResponse() when $default != null:
return $default(_that.id,_that.status,_that.takenAt,_that.streak,_that.dayCompleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  MedicationDoseStatus status,  DateTime takenAt,  MedicationStreak? streak,  bool dayCompleted)  $default,) {final _that = this;
switch (_that) {
case _MarkDoseTakenResponse():
return $default(_that.id,_that.status,_that.takenAt,_that.streak,_that.dayCompleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  MedicationDoseStatus status,  DateTime takenAt,  MedicationStreak? streak,  bool dayCompleted)?  $default,) {final _that = this;
switch (_that) {
case _MarkDoseTakenResponse() when $default != null:
return $default(_that.id,_that.status,_that.takenAt,_that.streak,_that.dayCompleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarkDoseTakenResponse implements MarkDoseTakenResponse {
  const _MarkDoseTakenResponse({required this.id, required this.status, required this.takenAt, this.streak, this.dayCompleted = false});
  factory _MarkDoseTakenResponse.fromJson(Map<String, dynamic> json) => _$MarkDoseTakenResponseFromJson(json);

@override final  String id;
@override final  MedicationDoseStatus status;
@override final  DateTime takenAt;
@override final  MedicationStreak? streak;
@override@JsonKey() final  bool dayCompleted;

/// Create a copy of MarkDoseTakenResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkDoseTakenResponseCopyWith<_MarkDoseTakenResponse> get copyWith => __$MarkDoseTakenResponseCopyWithImpl<_MarkDoseTakenResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarkDoseTakenResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkDoseTakenResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.takenAt, takenAt) || other.takenAt == takenAt)&&(identical(other.streak, streak) || other.streak == streak)&&(identical(other.dayCompleted, dayCompleted) || other.dayCompleted == dayCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,status,takenAt,streak,dayCompleted);
}

@override
String toString() {
    return 'MarkDoseTakenResponse(id: $id, status: $status, takenAt: $takenAt, streak: $streak, dayCompleted: $dayCompleted)';
}


}

/// @nodoc
abstract mixin class _$MarkDoseTakenResponseCopyWith<$Res> implements $MarkDoseTakenResponseCopyWith<$Res> {
  factory _$MarkDoseTakenResponseCopyWith(_MarkDoseTakenResponse value, $Res Function(_MarkDoseTakenResponse) _then) = __$MarkDoseTakenResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, MedicationDoseStatus status, DateTime takenAt, MedicationStreak? streak, bool dayCompleted
});


@override $MedicationStreakCopyWith<$Res>? get streak;

}
/// @nodoc
class __$MarkDoseTakenResponseCopyWithImpl<$Res>
    implements _$MarkDoseTakenResponseCopyWith<$Res> {
  __$MarkDoseTakenResponseCopyWithImpl(this._self, this._then);

  final _MarkDoseTakenResponse _self;
  final $Res Function(_MarkDoseTakenResponse) _then;

/// Create a copy of MarkDoseTakenResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? takenAt = null,Object? streak = freezed,Object? dayCompleted = null,}) {
  return _then(_MarkDoseTakenResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MedicationDoseStatus,takenAt: null == takenAt ? _self.takenAt : takenAt // ignore: cast_nullable_to_non_nullable
as DateTime,streak: freezed == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as MedicationStreak?,dayCompleted: null == dayCompleted ? _self.dayCompleted : dayCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MarkDoseTakenResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MedicationStreakCopyWith<$Res>? get streak {
    if (_self.streak == null) {
    return null;
  }

  return $MedicationStreakCopyWith<$Res>(_self.streak!, (value) {
    return _then(_self.copyWith(streak: value));
  });
}
}


/// @nodoc
mixin _$UnmarkDoseTakenResponse {

 String get id; MedicationDoseStatus get status; MedicationStreak? get streak;
/// Create a copy of UnmarkDoseTakenResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnmarkDoseTakenResponseCopyWith<UnmarkDoseTakenResponse> get copyWith => _$UnmarkDoseTakenResponseCopyWithImpl<UnmarkDoseTakenResponse>(this as UnmarkDoseTakenResponse, _$identity);

  /// Serializes this UnmarkDoseTakenResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UnmarkDoseTakenResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnmarkDoseTakenResponse&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.streak, _this.streak) || other.streak == _this.streak));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UnmarkDoseTakenResponse;
  return Object.hash(runtimeType,_this.id,_this.status,_this.streak);
}

@override
String toString() {
  final _this = this as UnmarkDoseTakenResponse;
  return 'UnmarkDoseTakenResponse(id: ${_this.id}, status: ${_this.status}, streak: ${_this.streak})';
}


}

/// @nodoc
abstract mixin class $UnmarkDoseTakenResponseCopyWith<$Res>  {
  factory $UnmarkDoseTakenResponseCopyWith(UnmarkDoseTakenResponse value, $Res Function(UnmarkDoseTakenResponse) _then) = _$UnmarkDoseTakenResponseCopyWithImpl;
@useResult
$Res call({
 String id, MedicationDoseStatus status, MedicationStreak? streak
});


$MedicationStreakCopyWith<$Res>? get streak;

}
/// @nodoc
class _$UnmarkDoseTakenResponseCopyWithImpl<$Res>
    implements $UnmarkDoseTakenResponseCopyWith<$Res> {
  _$UnmarkDoseTakenResponseCopyWithImpl(this._self, this._then);

  final UnmarkDoseTakenResponse _self;
  final $Res Function(UnmarkDoseTakenResponse) _then;

/// Create a copy of UnmarkDoseTakenResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? streak = freezed,}) {
  return _then(UnmarkDoseTakenResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MedicationDoseStatus,streak: freezed == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as MedicationStreak?,
  ));
}
/// Create a copy of UnmarkDoseTakenResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MedicationStreakCopyWith<$Res>? get streak {
    if (_self.streak == null) {
    return null;
  }

  return $MedicationStreakCopyWith<$Res>(_self.streak!, (value) {
    return _then(_self.copyWith(streak: value));
  });
}
}


/// Adds pattern-matching-related methods to [UnmarkDoseTakenResponse].
extension UnmarkDoseTakenResponsePatterns on UnmarkDoseTakenResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnmarkDoseTakenResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnmarkDoseTakenResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnmarkDoseTakenResponse value)  $default,){
final _that = this;
switch (_that) {
case _UnmarkDoseTakenResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnmarkDoseTakenResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UnmarkDoseTakenResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  MedicationDoseStatus status,  MedicationStreak? streak)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnmarkDoseTakenResponse() when $default != null:
return $default(_that.id,_that.status,_that.streak);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  MedicationDoseStatus status,  MedicationStreak? streak)  $default,) {final _that = this;
switch (_that) {
case _UnmarkDoseTakenResponse():
return $default(_that.id,_that.status,_that.streak);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  MedicationDoseStatus status,  MedicationStreak? streak)?  $default,) {final _that = this;
switch (_that) {
case _UnmarkDoseTakenResponse() when $default != null:
return $default(_that.id,_that.status,_that.streak);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UnmarkDoseTakenResponse implements UnmarkDoseTakenResponse {
  const _UnmarkDoseTakenResponse({required this.id, required this.status, this.streak});
  factory _UnmarkDoseTakenResponse.fromJson(Map<String, dynamic> json) => _$UnmarkDoseTakenResponseFromJson(json);

@override final  String id;
@override final  MedicationDoseStatus status;
@override final  MedicationStreak? streak;

/// Create a copy of UnmarkDoseTakenResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnmarkDoseTakenResponseCopyWith<_UnmarkDoseTakenResponse> get copyWith => __$UnmarkDoseTakenResponseCopyWithImpl<_UnmarkDoseTakenResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UnmarkDoseTakenResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnmarkDoseTakenResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.streak, streak) || other.streak == streak));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,status,streak);
}

@override
String toString() {
    return 'UnmarkDoseTakenResponse(id: $id, status: $status, streak: $streak)';
}


}

/// @nodoc
abstract mixin class _$UnmarkDoseTakenResponseCopyWith<$Res> implements $UnmarkDoseTakenResponseCopyWith<$Res> {
  factory _$UnmarkDoseTakenResponseCopyWith(_UnmarkDoseTakenResponse value, $Res Function(_UnmarkDoseTakenResponse) _then) = __$UnmarkDoseTakenResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, MedicationDoseStatus status, MedicationStreak? streak
});


@override $MedicationStreakCopyWith<$Res>? get streak;

}
/// @nodoc
class __$UnmarkDoseTakenResponseCopyWithImpl<$Res>
    implements _$UnmarkDoseTakenResponseCopyWith<$Res> {
  __$UnmarkDoseTakenResponseCopyWithImpl(this._self, this._then);

  final _UnmarkDoseTakenResponse _self;
  final $Res Function(_UnmarkDoseTakenResponse) _then;

/// Create a copy of UnmarkDoseTakenResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? streak = freezed,}) {
  return _then(_UnmarkDoseTakenResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MedicationDoseStatus,streak: freezed == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as MedicationStreak?,
  ));
}

/// Create a copy of UnmarkDoseTakenResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MedicationStreakCopyWith<$Res>? get streak {
    if (_self.streak == null) {
    return null;
  }

  return $MedicationStreakCopyWith<$Res>(_self.streak!, (value) {
    return _then(_self.copyWith(streak: value));
  });
}
}


/// @nodoc
mixin _$PrescriptionHistorySummary {

 String get id; String get displayName; String get frequencyLabel; PrescriptionHistoryStatus get status; DateTime? get startDate; DateTime? get endDate; String get doctorName;
/// Create a copy of PrescriptionHistorySummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionHistorySummaryCopyWith<PrescriptionHistorySummary> get copyWith => _$PrescriptionHistorySummaryCopyWithImpl<PrescriptionHistorySummary>(this as PrescriptionHistorySummary, _$identity);

  /// Serializes this PrescriptionHistorySummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PrescriptionHistorySummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionHistorySummary&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.displayName, _this.displayName) || other.displayName == _this.displayName)&&(identical(other.frequencyLabel, _this.frequencyLabel) || other.frequencyLabel == _this.frequencyLabel)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&(identical(other.endDate, _this.endDate) || other.endDate == _this.endDate)&&(identical(other.doctorName, _this.doctorName) || other.doctorName == _this.doctorName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PrescriptionHistorySummary;
  return Object.hash(runtimeType,_this.id,_this.displayName,_this.frequencyLabel,_this.status,_this.startDate,_this.endDate,_this.doctorName);
}

@override
String toString() {
  final _this = this as PrescriptionHistorySummary;
  return 'PrescriptionHistorySummary(id: ${_this.id}, displayName: ${_this.displayName}, frequencyLabel: ${_this.frequencyLabel}, status: ${_this.status}, startDate: ${_this.startDate}, endDate: ${_this.endDate}, doctorName: ${_this.doctorName})';
}


}

/// @nodoc
abstract mixin class $PrescriptionHistorySummaryCopyWith<$Res>  {
  factory $PrescriptionHistorySummaryCopyWith(PrescriptionHistorySummary value, $Res Function(PrescriptionHistorySummary) _then) = _$PrescriptionHistorySummaryCopyWithImpl;
@useResult
$Res call({
 String id, String displayName, String frequencyLabel, PrescriptionHistoryStatus status, DateTime? startDate, DateTime? endDate, String doctorName
});




}
/// @nodoc
class _$PrescriptionHistorySummaryCopyWithImpl<$Res>
    implements $PrescriptionHistorySummaryCopyWith<$Res> {
  _$PrescriptionHistorySummaryCopyWithImpl(this._self, this._then);

  final PrescriptionHistorySummary _self;
  final $Res Function(PrescriptionHistorySummary) _then;

/// Create a copy of PrescriptionHistorySummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? displayName = null,Object? frequencyLabel = null,Object? status = null,Object? startDate = freezed,Object? endDate = freezed,Object? doctorName = null,}) {
  return _then(PrescriptionHistorySummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,frequencyLabel: null == frequencyLabel ? _self.frequencyLabel : frequencyLabel // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PrescriptionHistoryStatus,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PrescriptionHistorySummary].
extension PrescriptionHistorySummaryPatterns on PrescriptionHistorySummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrescriptionHistorySummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrescriptionHistorySummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrescriptionHistorySummary value)  $default,){
final _that = this;
switch (_that) {
case _PrescriptionHistorySummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrescriptionHistorySummary value)?  $default,){
final _that = this;
switch (_that) {
case _PrescriptionHistorySummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String displayName,  String frequencyLabel,  PrescriptionHistoryStatus status,  DateTime? startDate,  DateTime? endDate,  String doctorName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrescriptionHistorySummary() when $default != null:
return $default(_that.id,_that.displayName,_that.frequencyLabel,_that.status,_that.startDate,_that.endDate,_that.doctorName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String displayName,  String frequencyLabel,  PrescriptionHistoryStatus status,  DateTime? startDate,  DateTime? endDate,  String doctorName)  $default,) {final _that = this;
switch (_that) {
case _PrescriptionHistorySummary():
return $default(_that.id,_that.displayName,_that.frequencyLabel,_that.status,_that.startDate,_that.endDate,_that.doctorName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String displayName,  String frequencyLabel,  PrescriptionHistoryStatus status,  DateTime? startDate,  DateTime? endDate,  String doctorName)?  $default,) {final _that = this;
switch (_that) {
case _PrescriptionHistorySummary() when $default != null:
return $default(_that.id,_that.displayName,_that.frequencyLabel,_that.status,_that.startDate,_that.endDate,_that.doctorName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrescriptionHistorySummary implements PrescriptionHistorySummary {
  const _PrescriptionHistorySummary({required this.id, required this.displayName, required this.frequencyLabel, required this.status, this.startDate, this.endDate, required this.doctorName});
  factory _PrescriptionHistorySummary.fromJson(Map<String, dynamic> json) => _$PrescriptionHistorySummaryFromJson(json);

@override final  String id;
@override final  String displayName;
@override final  String frequencyLabel;
@override final  PrescriptionHistoryStatus status;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  String doctorName;

/// Create a copy of PrescriptionHistorySummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrescriptionHistorySummaryCopyWith<_PrescriptionHistorySummary> get copyWith => __$PrescriptionHistorySummaryCopyWithImpl<_PrescriptionHistorySummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrescriptionHistorySummaryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrescriptionHistorySummary&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.frequencyLabel, frequencyLabel) || other.frequencyLabel == frequencyLabel)&&(identical(other.status, status) || other.status == status)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,displayName,frequencyLabel,status,startDate,endDate,doctorName);
}

@override
String toString() {
    return 'PrescriptionHistorySummary(id: $id, displayName: $displayName, frequencyLabel: $frequencyLabel, status: $status, startDate: $startDate, endDate: $endDate, doctorName: $doctorName)';
}


}

/// @nodoc
abstract mixin class _$PrescriptionHistorySummaryCopyWith<$Res> implements $PrescriptionHistorySummaryCopyWith<$Res> {
  factory _$PrescriptionHistorySummaryCopyWith(_PrescriptionHistorySummary value, $Res Function(_PrescriptionHistorySummary) _then) = __$PrescriptionHistorySummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String displayName, String frequencyLabel, PrescriptionHistoryStatus status, DateTime? startDate, DateTime? endDate, String doctorName
});




}
/// @nodoc
class __$PrescriptionHistorySummaryCopyWithImpl<$Res>
    implements _$PrescriptionHistorySummaryCopyWith<$Res> {
  __$PrescriptionHistorySummaryCopyWithImpl(this._self, this._then);

  final _PrescriptionHistorySummary _self;
  final $Res Function(_PrescriptionHistorySummary) _then;

/// Create a copy of PrescriptionHistorySummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? displayName = null,Object? frequencyLabel = null,Object? status = null,Object? startDate = freezed,Object? endDate = freezed,Object? doctorName = null,}) {
  return _then(_PrescriptionHistorySummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,frequencyLabel: null == frequencyLabel ? _self.frequencyLabel : frequencyLabel // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PrescriptionHistoryStatus,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PrescriptionHistoryListResponse {

 List<PrescriptionHistorySummary> get data; int get total; int get page; int get limit;
/// Create a copy of PrescriptionHistoryListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionHistoryListResponseCopyWith<PrescriptionHistoryListResponse> get copyWith => _$PrescriptionHistoryListResponseCopyWithImpl<PrescriptionHistoryListResponse>(this as PrescriptionHistoryListResponse, _$identity);

  /// Serializes this PrescriptionHistoryListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PrescriptionHistoryListResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionHistoryListResponse&&const DeepCollectionEquality().equals(other.data, _this.data)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.page, _this.page) || other.page == _this.page)&&(identical(other.limit, _this.limit) || other.limit == _this.limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PrescriptionHistoryListResponse;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.data),_this.total,_this.page,_this.limit);
}

@override
String toString() {
  final _this = this as PrescriptionHistoryListResponse;
  return 'PrescriptionHistoryListResponse(data: ${_this.data}, total: ${_this.total}, page: ${_this.page}, limit: ${_this.limit})';
}


}

/// @nodoc
abstract mixin class $PrescriptionHistoryListResponseCopyWith<$Res>  {
  factory $PrescriptionHistoryListResponseCopyWith(PrescriptionHistoryListResponse value, $Res Function(PrescriptionHistoryListResponse) _then) = _$PrescriptionHistoryListResponseCopyWithImpl;
@useResult
$Res call({
 List<PrescriptionHistorySummary> data, int total, int page, int limit
});




}
/// @nodoc
class _$PrescriptionHistoryListResponseCopyWithImpl<$Res>
    implements $PrescriptionHistoryListResponseCopyWith<$Res> {
  _$PrescriptionHistoryListResponseCopyWithImpl(this._self, this._then);

  final PrescriptionHistoryListResponse _self;
  final $Res Function(PrescriptionHistoryListResponse) _then;

/// Create a copy of PrescriptionHistoryListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? total = null,Object? page = null,Object? limit = null,}) {
  return _then(PrescriptionHistoryListResponse(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<PrescriptionHistorySummary>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PrescriptionHistoryListResponse].
extension PrescriptionHistoryListResponsePatterns on PrescriptionHistoryListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrescriptionHistoryListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrescriptionHistoryListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrescriptionHistoryListResponse value)  $default,){
final _that = this;
switch (_that) {
case _PrescriptionHistoryListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrescriptionHistoryListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PrescriptionHistoryListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PrescriptionHistorySummary> data,  int total,  int page,  int limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrescriptionHistoryListResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PrescriptionHistorySummary> data,  int total,  int page,  int limit)  $default,) {final _that = this;
switch (_that) {
case _PrescriptionHistoryListResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PrescriptionHistorySummary> data,  int total,  int page,  int limit)?  $default,) {final _that = this;
switch (_that) {
case _PrescriptionHistoryListResponse() when $default != null:
return $default(_that.data,_that.total,_that.page,_that.limit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrescriptionHistoryListResponse implements PrescriptionHistoryListResponse {
  const _PrescriptionHistoryListResponse({ List<PrescriptionHistorySummary> data = const [], this.total = 0, this.page = 1, this.limit = 20}): _data = data;
  factory _PrescriptionHistoryListResponse.fromJson(Map<String, dynamic> json) => _$PrescriptionHistoryListResponseFromJson(json);

 final  List<PrescriptionHistorySummary> _data;
@override@JsonKey() List<PrescriptionHistorySummary> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey() final  int total;
@override@JsonKey() final  int page;
@override@JsonKey() final  int limit;

/// Create a copy of PrescriptionHistoryListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrescriptionHistoryListResponseCopyWith<_PrescriptionHistoryListResponse> get copyWith => __$PrescriptionHistoryListResponseCopyWithImpl<_PrescriptionHistoryListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrescriptionHistoryListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrescriptionHistoryListResponse&&const DeepCollectionEquality().equals(other.data, _data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),total,page,limit);
}

@override
String toString() {
    return 'PrescriptionHistoryListResponse(data: $data, total: $total, page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$PrescriptionHistoryListResponseCopyWith<$Res> implements $PrescriptionHistoryListResponseCopyWith<$Res> {
  factory _$PrescriptionHistoryListResponseCopyWith(_PrescriptionHistoryListResponse value, $Res Function(_PrescriptionHistoryListResponse) _then) = __$PrescriptionHistoryListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<PrescriptionHistorySummary> data, int total, int page, int limit
});




}
/// @nodoc
class __$PrescriptionHistoryListResponseCopyWithImpl<$Res>
    implements _$PrescriptionHistoryListResponseCopyWith<$Res> {
  __$PrescriptionHistoryListResponseCopyWithImpl(this._self, this._then);

  final _PrescriptionHistoryListResponse _self;
  final $Res Function(_PrescriptionHistoryListResponse) _then;

/// Create a copy of PrescriptionHistoryListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? total = null,Object? page = null,Object? limit = null,}) {
  return _then(_PrescriptionHistoryListResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<PrescriptionHistorySummary>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$RefillRequestResponse {

 String get id; String get prescriptionId; String get status; DateTime get createdAt;
/// Create a copy of RefillRequestResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefillRequestResponseCopyWith<RefillRequestResponse> get copyWith => _$RefillRequestResponseCopyWithImpl<RefillRequestResponse>(this as RefillRequestResponse, _$identity);

  /// Serializes this RefillRequestResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RefillRequestResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefillRequestResponse&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.prescriptionId, _this.prescriptionId) || other.prescriptionId == _this.prescriptionId)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RefillRequestResponse;
  return Object.hash(runtimeType,_this.id,_this.prescriptionId,_this.status,_this.createdAt);
}

@override
String toString() {
  final _this = this as RefillRequestResponse;
  return 'RefillRequestResponse(id: ${_this.id}, prescriptionId: ${_this.prescriptionId}, status: ${_this.status}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $RefillRequestResponseCopyWith<$Res>  {
  factory $RefillRequestResponseCopyWith(RefillRequestResponse value, $Res Function(RefillRequestResponse) _then) = _$RefillRequestResponseCopyWithImpl;
@useResult
$Res call({
 String id, String prescriptionId, String status, DateTime createdAt
});




}
/// @nodoc
class _$RefillRequestResponseCopyWithImpl<$Res>
    implements $RefillRequestResponseCopyWith<$Res> {
  _$RefillRequestResponseCopyWithImpl(this._self, this._then);

  final RefillRequestResponse _self;
  final $Res Function(RefillRequestResponse) _then;

/// Create a copy of RefillRequestResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? prescriptionId = null,Object? status = null,Object? createdAt = null,}) {
  return _then(RefillRequestResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,prescriptionId: null == prescriptionId ? _self.prescriptionId : prescriptionId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [RefillRequestResponse].
extension RefillRequestResponsePatterns on RefillRequestResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefillRequestResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefillRequestResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefillRequestResponse value)  $default,){
final _that = this;
switch (_that) {
case _RefillRequestResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefillRequestResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RefillRequestResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String prescriptionId,  String status,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefillRequestResponse() when $default != null:
return $default(_that.id,_that.prescriptionId,_that.status,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String prescriptionId,  String status,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _RefillRequestResponse():
return $default(_that.id,_that.prescriptionId,_that.status,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String prescriptionId,  String status,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _RefillRequestResponse() when $default != null:
return $default(_that.id,_that.prescriptionId,_that.status,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefillRequestResponse implements RefillRequestResponse {
  const _RefillRequestResponse({required this.id, required this.prescriptionId, required this.status, required this.createdAt});
  factory _RefillRequestResponse.fromJson(Map<String, dynamic> json) => _$RefillRequestResponseFromJson(json);

@override final  String id;
@override final  String prescriptionId;
@override final  String status;
@override final  DateTime createdAt;

/// Create a copy of RefillRequestResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefillRequestResponseCopyWith<_RefillRequestResponse> get copyWith => __$RefillRequestResponseCopyWithImpl<_RefillRequestResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefillRequestResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefillRequestResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.prescriptionId, prescriptionId) || other.prescriptionId == prescriptionId)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,prescriptionId,status,createdAt);
}

@override
String toString() {
    return 'RefillRequestResponse(id: $id, prescriptionId: $prescriptionId, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$RefillRequestResponseCopyWith<$Res> implements $RefillRequestResponseCopyWith<$Res> {
  factory _$RefillRequestResponseCopyWith(_RefillRequestResponse value, $Res Function(_RefillRequestResponse) _then) = __$RefillRequestResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String prescriptionId, String status, DateTime createdAt
});




}
/// @nodoc
class __$RefillRequestResponseCopyWithImpl<$Res>
    implements _$RefillRequestResponseCopyWith<$Res> {
  __$RefillRequestResponseCopyWithImpl(this._self, this._then);

  final _RefillRequestResponse _self;
  final $Res Function(_RefillRequestResponse) _then;

/// Create a copy of RefillRequestResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? prescriptionId = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_RefillRequestResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,prescriptionId: null == prescriptionId ? _self.prescriptionId : prescriptionId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
