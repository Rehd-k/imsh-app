// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medication_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedicationDoseSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.prescriptionItemId, prescriptionItemId) || other.prescriptionItemId == prescriptionItemId)&&(identical(other.drugName, drugName) || other.drugName == drugName)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,prescriptionItemId,drugName,dosage,instructions,scheduledAt,status);

@override
String toString() {
  return 'MedicationDoseSummary(id: $id, prescriptionItemId: $prescriptionItemId, drugName: $drugName, dosage: $dosage, instructions: $instructions, scheduledAt: $scheduledAt, status: $status)';
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
  return _then(_self.copyWith(
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
int get hashCode => Object.hash(runtimeType,id,prescriptionItemId,drugName,dosage,instructions,scheduledAt,status);

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedicationScheduleEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.prescriptionItemId, prescriptionItemId) || other.prescriptionItemId == prescriptionItemId)&&(identical(other.timeOfDay, timeOfDay) || other.timeOfDay == timeOfDay)&&(identical(other.drugName, drugName) || other.drugName == drugName)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,prescriptionItemId,timeOfDay,drugName,dosage,scheduledAt,status);

@override
String toString() {
  return 'MedicationScheduleEntry(id: $id, prescriptionItemId: $prescriptionItemId, timeOfDay: $timeOfDay, drugName: $drugName, dosage: $dosage, scheduledAt: $scheduledAt, status: $status)';
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
  return _then(_self.copyWith(
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
int get hashCode => Object.hash(runtimeType,id,prescriptionItemId,timeOfDay,drugName,dosage,scheduledAt,status);

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

 String get id; String get displayName; String get frequencyLabel; int get daysRemaining; int get refillsRemaining; double get supplyProgress; PrescriptionSupplyStatus get supplyStatus;
/// Create a copy of ActivePrescriptionSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivePrescriptionSummaryCopyWith<ActivePrescriptionSummary> get copyWith => _$ActivePrescriptionSummaryCopyWithImpl<ActivePrescriptionSummary>(this as ActivePrescriptionSummary, _$identity);

  /// Serializes this ActivePrescriptionSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivePrescriptionSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.frequencyLabel, frequencyLabel) || other.frequencyLabel == frequencyLabel)&&(identical(other.daysRemaining, daysRemaining) || other.daysRemaining == daysRemaining)&&(identical(other.refillsRemaining, refillsRemaining) || other.refillsRemaining == refillsRemaining)&&(identical(other.supplyProgress, supplyProgress) || other.supplyProgress == supplyProgress)&&(identical(other.supplyStatus, supplyStatus) || other.supplyStatus == supplyStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,frequencyLabel,daysRemaining,refillsRemaining,supplyProgress,supplyStatus);

@override
String toString() {
  return 'ActivePrescriptionSummary(id: $id, displayName: $displayName, frequencyLabel: $frequencyLabel, daysRemaining: $daysRemaining, refillsRemaining: $refillsRemaining, supplyProgress: $supplyProgress, supplyStatus: $supplyStatus)';
}


}

/// @nodoc
abstract mixin class $ActivePrescriptionSummaryCopyWith<$Res>  {
  factory $ActivePrescriptionSummaryCopyWith(ActivePrescriptionSummary value, $Res Function(ActivePrescriptionSummary) _then) = _$ActivePrescriptionSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String displayName, String frequencyLabel, int daysRemaining, int refillsRemaining, double supplyProgress, PrescriptionSupplyStatus supplyStatus
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? displayName = null,Object? frequencyLabel = null,Object? daysRemaining = null,Object? refillsRemaining = null,Object? supplyProgress = null,Object? supplyStatus = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,frequencyLabel: null == frequencyLabel ? _self.frequencyLabel : frequencyLabel // ignore: cast_nullable_to_non_nullable
as String,daysRemaining: null == daysRemaining ? _self.daysRemaining : daysRemaining // ignore: cast_nullable_to_non_nullable
as int,refillsRemaining: null == refillsRemaining ? _self.refillsRemaining : refillsRemaining // ignore: cast_nullable_to_non_nullable
as int,supplyProgress: null == supplyProgress ? _self.supplyProgress : supplyProgress // ignore: cast_nullable_to_non_nullable
as double,supplyStatus: null == supplyStatus ? _self.supplyStatus : supplyStatus // ignore: cast_nullable_to_non_nullable
as PrescriptionSupplyStatus,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String displayName,  String frequencyLabel,  int daysRemaining,  int refillsRemaining,  double supplyProgress,  PrescriptionSupplyStatus supplyStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivePrescriptionSummary() when $default != null:
return $default(_that.id,_that.displayName,_that.frequencyLabel,_that.daysRemaining,_that.refillsRemaining,_that.supplyProgress,_that.supplyStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String displayName,  String frequencyLabel,  int daysRemaining,  int refillsRemaining,  double supplyProgress,  PrescriptionSupplyStatus supplyStatus)  $default,) {final _that = this;
switch (_that) {
case _ActivePrescriptionSummary():
return $default(_that.id,_that.displayName,_that.frequencyLabel,_that.daysRemaining,_that.refillsRemaining,_that.supplyProgress,_that.supplyStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String displayName,  String frequencyLabel,  int daysRemaining,  int refillsRemaining,  double supplyProgress,  PrescriptionSupplyStatus supplyStatus)?  $default,) {final _that = this;
switch (_that) {
case _ActivePrescriptionSummary() when $default != null:
return $default(_that.id,_that.displayName,_that.frequencyLabel,_that.daysRemaining,_that.refillsRemaining,_that.supplyProgress,_that.supplyStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActivePrescriptionSummary implements ActivePrescriptionSummary {
  const _ActivePrescriptionSummary({required this.id, required this.displayName, required this.frequencyLabel, required this.daysRemaining, required this.refillsRemaining, required this.supplyProgress, required this.supplyStatus});
  factory _ActivePrescriptionSummary.fromJson(Map<String, dynamic> json) => _$ActivePrescriptionSummaryFromJson(json);

@override final  String id;
@override final  String displayName;
@override final  String frequencyLabel;
@override final  int daysRemaining;
@override final  int refillsRemaining;
@override final  double supplyProgress;
@override final  PrescriptionSupplyStatus supplyStatus;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivePrescriptionSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.frequencyLabel, frequencyLabel) || other.frequencyLabel == frequencyLabel)&&(identical(other.daysRemaining, daysRemaining) || other.daysRemaining == daysRemaining)&&(identical(other.refillsRemaining, refillsRemaining) || other.refillsRemaining == refillsRemaining)&&(identical(other.supplyProgress, supplyProgress) || other.supplyProgress == supplyProgress)&&(identical(other.supplyStatus, supplyStatus) || other.supplyStatus == supplyStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,frequencyLabel,daysRemaining,refillsRemaining,supplyProgress,supplyStatus);

@override
String toString() {
  return 'ActivePrescriptionSummary(id: $id, displayName: $displayName, frequencyLabel: $frequencyLabel, daysRemaining: $daysRemaining, refillsRemaining: $refillsRemaining, supplyProgress: $supplyProgress, supplyStatus: $supplyStatus)';
}


}

/// @nodoc
abstract mixin class _$ActivePrescriptionSummaryCopyWith<$Res> implements $ActivePrescriptionSummaryCopyWith<$Res> {
  factory _$ActivePrescriptionSummaryCopyWith(_ActivePrescriptionSummary value, $Res Function(_ActivePrescriptionSummary) _then) = __$ActivePrescriptionSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String displayName, String frequencyLabel, int daysRemaining, int refillsRemaining, double supplyProgress, PrescriptionSupplyStatus supplyStatus
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? displayName = null,Object? frequencyLabel = null,Object? daysRemaining = null,Object? refillsRemaining = null,Object? supplyProgress = null,Object? supplyStatus = null,}) {
  return _then(_ActivePrescriptionSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,frequencyLabel: null == frequencyLabel ? _self.frequencyLabel : frequencyLabel // ignore: cast_nullable_to_non_nullable
as String,daysRemaining: null == daysRemaining ? _self.daysRemaining : daysRemaining // ignore: cast_nullable_to_non_nullable
as int,refillsRemaining: null == refillsRemaining ? _self.refillsRemaining : refillsRemaining // ignore: cast_nullable_to_non_nullable
as int,supplyProgress: null == supplyProgress ? _self.supplyProgress : supplyProgress // ignore: cast_nullable_to_non_nullable
as double,supplyStatus: null == supplyStatus ? _self.supplyStatus : supplyStatus // ignore: cast_nullable_to_non_nullable
as PrescriptionSupplyStatus,
  ));
}


}


/// @nodoc
mixin _$MedicationDashboardResponse {

 List<MedicationDoseSummary> get nextDoses; List<MedicationScheduleEntry> get todaySchedule; List<ActivePrescriptionSummary> get activePrescriptions;
/// Create a copy of MedicationDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedicationDashboardResponseCopyWith<MedicationDashboardResponse> get copyWith => _$MedicationDashboardResponseCopyWithImpl<MedicationDashboardResponse>(this as MedicationDashboardResponse, _$identity);

  /// Serializes this MedicationDashboardResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedicationDashboardResponse&&const DeepCollectionEquality().equals(other.nextDoses, nextDoses)&&const DeepCollectionEquality().equals(other.todaySchedule, todaySchedule)&&const DeepCollectionEquality().equals(other.activePrescriptions, activePrescriptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(nextDoses),const DeepCollectionEquality().hash(todaySchedule),const DeepCollectionEquality().hash(activePrescriptions));

@override
String toString() {
  return 'MedicationDashboardResponse(nextDoses: $nextDoses, todaySchedule: $todaySchedule, activePrescriptions: $activePrescriptions)';
}


}

/// @nodoc
abstract mixin class $MedicationDashboardResponseCopyWith<$Res>  {
  factory $MedicationDashboardResponseCopyWith(MedicationDashboardResponse value, $Res Function(MedicationDashboardResponse) _then) = _$MedicationDashboardResponseCopyWithImpl;
@useResult
$Res call({
 List<MedicationDoseSummary> nextDoses, List<MedicationScheduleEntry> todaySchedule, List<ActivePrescriptionSummary> activePrescriptions
});




}
/// @nodoc
class _$MedicationDashboardResponseCopyWithImpl<$Res>
    implements $MedicationDashboardResponseCopyWith<$Res> {
  _$MedicationDashboardResponseCopyWithImpl(this._self, this._then);

  final MedicationDashboardResponse _self;
  final $Res Function(MedicationDashboardResponse) _then;

/// Create a copy of MedicationDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nextDoses = null,Object? todaySchedule = null,Object? activePrescriptions = null,}) {
  return _then(_self.copyWith(
nextDoses: null == nextDoses ? _self.nextDoses : nextDoses // ignore: cast_nullable_to_non_nullable
as List<MedicationDoseSummary>,todaySchedule: null == todaySchedule ? _self.todaySchedule : todaySchedule // ignore: cast_nullable_to_non_nullable
as List<MedicationScheduleEntry>,activePrescriptions: null == activePrescriptions ? _self.activePrescriptions : activePrescriptions // ignore: cast_nullable_to_non_nullable
as List<ActivePrescriptionSummary>,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MedicationDoseSummary> nextDoses,  List<MedicationScheduleEntry> todaySchedule,  List<ActivePrescriptionSummary> activePrescriptions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedicationDashboardResponse() when $default != null:
return $default(_that.nextDoses,_that.todaySchedule,_that.activePrescriptions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MedicationDoseSummary> nextDoses,  List<MedicationScheduleEntry> todaySchedule,  List<ActivePrescriptionSummary> activePrescriptions)  $default,) {final _that = this;
switch (_that) {
case _MedicationDashboardResponse():
return $default(_that.nextDoses,_that.todaySchedule,_that.activePrescriptions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MedicationDoseSummary> nextDoses,  List<MedicationScheduleEntry> todaySchedule,  List<ActivePrescriptionSummary> activePrescriptions)?  $default,) {final _that = this;
switch (_that) {
case _MedicationDashboardResponse() when $default != null:
return $default(_that.nextDoses,_that.todaySchedule,_that.activePrescriptions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedicationDashboardResponse implements MedicationDashboardResponse {
  const _MedicationDashboardResponse({final  List<MedicationDoseSummary> nextDoses = const [], final  List<MedicationScheduleEntry> todaySchedule = const [], final  List<ActivePrescriptionSummary> activePrescriptions = const []}): _nextDoses = nextDoses,_todaySchedule = todaySchedule,_activePrescriptions = activePrescriptions;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedicationDashboardResponse&&const DeepCollectionEquality().equals(other._nextDoses, _nextDoses)&&const DeepCollectionEquality().equals(other._todaySchedule, _todaySchedule)&&const DeepCollectionEquality().equals(other._activePrescriptions, _activePrescriptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_nextDoses),const DeepCollectionEquality().hash(_todaySchedule),const DeepCollectionEquality().hash(_activePrescriptions));

@override
String toString() {
  return 'MedicationDashboardResponse(nextDoses: $nextDoses, todaySchedule: $todaySchedule, activePrescriptions: $activePrescriptions)';
}


}

/// @nodoc
abstract mixin class _$MedicationDashboardResponseCopyWith<$Res> implements $MedicationDashboardResponseCopyWith<$Res> {
  factory _$MedicationDashboardResponseCopyWith(_MedicationDashboardResponse value, $Res Function(_MedicationDashboardResponse) _then) = __$MedicationDashboardResponseCopyWithImpl;
@override @useResult
$Res call({
 List<MedicationDoseSummary> nextDoses, List<MedicationScheduleEntry> todaySchedule, List<ActivePrescriptionSummary> activePrescriptions
});




}
/// @nodoc
class __$MedicationDashboardResponseCopyWithImpl<$Res>
    implements _$MedicationDashboardResponseCopyWith<$Res> {
  __$MedicationDashboardResponseCopyWithImpl(this._self, this._then);

  final _MedicationDashboardResponse _self;
  final $Res Function(_MedicationDashboardResponse) _then;

/// Create a copy of MedicationDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nextDoses = null,Object? todaySchedule = null,Object? activePrescriptions = null,}) {
  return _then(_MedicationDashboardResponse(
nextDoses: null == nextDoses ? _self._nextDoses : nextDoses // ignore: cast_nullable_to_non_nullable
as List<MedicationDoseSummary>,todaySchedule: null == todaySchedule ? _self._todaySchedule : todaySchedule // ignore: cast_nullable_to_non_nullable
as List<MedicationScheduleEntry>,activePrescriptions: null == activePrescriptions ? _self._activePrescriptions : activePrescriptions // ignore: cast_nullable_to_non_nullable
as List<ActivePrescriptionSummary>,
  ));
}


}


/// @nodoc
mixin _$MarkDoseTakenResponse {

 String get id; MedicationDoseStatus get status; DateTime get takenAt;
/// Create a copy of MarkDoseTakenResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarkDoseTakenResponseCopyWith<MarkDoseTakenResponse> get copyWith => _$MarkDoseTakenResponseCopyWithImpl<MarkDoseTakenResponse>(this as MarkDoseTakenResponse, _$identity);

  /// Serializes this MarkDoseTakenResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarkDoseTakenResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.takenAt, takenAt) || other.takenAt == takenAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,takenAt);

@override
String toString() {
  return 'MarkDoseTakenResponse(id: $id, status: $status, takenAt: $takenAt)';
}


}

/// @nodoc
abstract mixin class $MarkDoseTakenResponseCopyWith<$Res>  {
  factory $MarkDoseTakenResponseCopyWith(MarkDoseTakenResponse value, $Res Function(MarkDoseTakenResponse) _then) = _$MarkDoseTakenResponseCopyWithImpl;
@useResult
$Res call({
 String id, MedicationDoseStatus status, DateTime takenAt
});




}
/// @nodoc
class _$MarkDoseTakenResponseCopyWithImpl<$Res>
    implements $MarkDoseTakenResponseCopyWith<$Res> {
  _$MarkDoseTakenResponseCopyWithImpl(this._self, this._then);

  final MarkDoseTakenResponse _self;
  final $Res Function(MarkDoseTakenResponse) _then;

/// Create a copy of MarkDoseTakenResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? takenAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MedicationDoseStatus,takenAt: null == takenAt ? _self.takenAt : takenAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  MedicationDoseStatus status,  DateTime takenAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarkDoseTakenResponse() when $default != null:
return $default(_that.id,_that.status,_that.takenAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  MedicationDoseStatus status,  DateTime takenAt)  $default,) {final _that = this;
switch (_that) {
case _MarkDoseTakenResponse():
return $default(_that.id,_that.status,_that.takenAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  MedicationDoseStatus status,  DateTime takenAt)?  $default,) {final _that = this;
switch (_that) {
case _MarkDoseTakenResponse() when $default != null:
return $default(_that.id,_that.status,_that.takenAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarkDoseTakenResponse implements MarkDoseTakenResponse {
  const _MarkDoseTakenResponse({required this.id, required this.status, required this.takenAt});
  factory _MarkDoseTakenResponse.fromJson(Map<String, dynamic> json) => _$MarkDoseTakenResponseFromJson(json);

@override final  String id;
@override final  MedicationDoseStatus status;
@override final  DateTime takenAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkDoseTakenResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.takenAt, takenAt) || other.takenAt == takenAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,takenAt);

@override
String toString() {
  return 'MarkDoseTakenResponse(id: $id, status: $status, takenAt: $takenAt)';
}


}

/// @nodoc
abstract mixin class _$MarkDoseTakenResponseCopyWith<$Res> implements $MarkDoseTakenResponseCopyWith<$Res> {
  factory _$MarkDoseTakenResponseCopyWith(_MarkDoseTakenResponse value, $Res Function(_MarkDoseTakenResponse) _then) = __$MarkDoseTakenResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, MedicationDoseStatus status, DateTime takenAt
});




}
/// @nodoc
class __$MarkDoseTakenResponseCopyWithImpl<$Res>
    implements _$MarkDoseTakenResponseCopyWith<$Res> {
  __$MarkDoseTakenResponseCopyWithImpl(this._self, this._then);

  final _MarkDoseTakenResponse _self;
  final $Res Function(_MarkDoseTakenResponse) _then;

/// Create a copy of MarkDoseTakenResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? takenAt = null,}) {
  return _then(_MarkDoseTakenResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MedicationDoseStatus,takenAt: null == takenAt ? _self.takenAt : takenAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionHistorySummary&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.frequencyLabel, frequencyLabel) || other.frequencyLabel == frequencyLabel)&&(identical(other.status, status) || other.status == status)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,frequencyLabel,status,startDate,endDate,doctorName);

@override
String toString() {
  return 'PrescriptionHistorySummary(id: $id, displayName: $displayName, frequencyLabel: $frequencyLabel, status: $status, startDate: $startDate, endDate: $endDate, doctorName: $doctorName)';
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
  return _then(_self.copyWith(
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
int get hashCode => Object.hash(runtimeType,id,displayName,frequencyLabel,status,startDate,endDate,doctorName);

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionHistoryListResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),total,page,limit);

@override
String toString() {
  return 'PrescriptionHistoryListResponse(data: $data, total: $total, page: $page, limit: $limit)';
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
  return _then(_self.copyWith(
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
  const _PrescriptionHistoryListResponse({final  List<PrescriptionHistorySummary> data = const [], this.total = 0, this.page = 1, this.limit = 20}): _data = data;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrescriptionHistoryListResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),total,page,limit);

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefillRequestResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.prescriptionId, prescriptionId) || other.prescriptionId == prescriptionId)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,prescriptionId,status,createdAt);

@override
String toString() {
  return 'RefillRequestResponse(id: $id, prescriptionId: $prescriptionId, status: $status, createdAt: $createdAt)';
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
  return _then(_self.copyWith(
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
int get hashCode => Object.hash(runtimeType,id,prescriptionId,status,createdAt);

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
