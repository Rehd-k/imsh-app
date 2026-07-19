// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BillingSummaryResponse {

@ApiAmountConverter() String get totalOutstanding; int get unpaidInvoiceCount; DateTime? get nextDueDate; int get daysUntilDue; String get currency;
/// Create a copy of BillingSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillingSummaryResponseCopyWith<BillingSummaryResponse> get copyWith => _$BillingSummaryResponseCopyWithImpl<BillingSummaryResponse>(this as BillingSummaryResponse, _$identity);

  /// Serializes this BillingSummaryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillingSummaryResponse&&(identical(other.totalOutstanding, totalOutstanding) || other.totalOutstanding == totalOutstanding)&&(identical(other.unpaidInvoiceCount, unpaidInvoiceCount) || other.unpaidInvoiceCount == unpaidInvoiceCount)&&(identical(other.nextDueDate, nextDueDate) || other.nextDueDate == nextDueDate)&&(identical(other.daysUntilDue, daysUntilDue) || other.daysUntilDue == daysUntilDue)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalOutstanding,unpaidInvoiceCount,nextDueDate,daysUntilDue,currency);

@override
String toString() {
  return 'BillingSummaryResponse(totalOutstanding: $totalOutstanding, unpaidInvoiceCount: $unpaidInvoiceCount, nextDueDate: $nextDueDate, daysUntilDue: $daysUntilDue, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $BillingSummaryResponseCopyWith<$Res>  {
  factory $BillingSummaryResponseCopyWith(BillingSummaryResponse value, $Res Function(BillingSummaryResponse) _then) = _$BillingSummaryResponseCopyWithImpl;
@useResult
$Res call({
@ApiAmountConverter() String totalOutstanding, int unpaidInvoiceCount, DateTime? nextDueDate, int daysUntilDue, String currency
});




}
/// @nodoc
class _$BillingSummaryResponseCopyWithImpl<$Res>
    implements $BillingSummaryResponseCopyWith<$Res> {
  _$BillingSummaryResponseCopyWithImpl(this._self, this._then);

  final BillingSummaryResponse _self;
  final $Res Function(BillingSummaryResponse) _then;

/// Create a copy of BillingSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalOutstanding = null,Object? unpaidInvoiceCount = null,Object? nextDueDate = freezed,Object? daysUntilDue = null,Object? currency = null,}) {
  return _then(_self.copyWith(
totalOutstanding: null == totalOutstanding ? _self.totalOutstanding : totalOutstanding // ignore: cast_nullable_to_non_nullable
as String,unpaidInvoiceCount: null == unpaidInvoiceCount ? _self.unpaidInvoiceCount : unpaidInvoiceCount // ignore: cast_nullable_to_non_nullable
as int,nextDueDate: freezed == nextDueDate ? _self.nextDueDate : nextDueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,daysUntilDue: null == daysUntilDue ? _self.daysUntilDue : daysUntilDue // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BillingSummaryResponse].
extension BillingSummaryResponsePatterns on BillingSummaryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BillingSummaryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BillingSummaryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BillingSummaryResponse value)  $default,){
final _that = this;
switch (_that) {
case _BillingSummaryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BillingSummaryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BillingSummaryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@ApiAmountConverter()  String totalOutstanding,  int unpaidInvoiceCount,  DateTime? nextDueDate,  int daysUntilDue,  String currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BillingSummaryResponse() when $default != null:
return $default(_that.totalOutstanding,_that.unpaidInvoiceCount,_that.nextDueDate,_that.daysUntilDue,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@ApiAmountConverter()  String totalOutstanding,  int unpaidInvoiceCount,  DateTime? nextDueDate,  int daysUntilDue,  String currency)  $default,) {final _that = this;
switch (_that) {
case _BillingSummaryResponse():
return $default(_that.totalOutstanding,_that.unpaidInvoiceCount,_that.nextDueDate,_that.daysUntilDue,_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@ApiAmountConverter()  String totalOutstanding,  int unpaidInvoiceCount,  DateTime? nextDueDate,  int daysUntilDue,  String currency)?  $default,) {final _that = this;
switch (_that) {
case _BillingSummaryResponse() when $default != null:
return $default(_that.totalOutstanding,_that.unpaidInvoiceCount,_that.nextDueDate,_that.daysUntilDue,_that.currency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BillingSummaryResponse implements BillingSummaryResponse {
  const _BillingSummaryResponse({@ApiAmountConverter() this.totalOutstanding = '0', this.unpaidInvoiceCount = 0, this.nextDueDate, this.daysUntilDue = 0, this.currency = 'NGN'});
  factory _BillingSummaryResponse.fromJson(Map<String, dynamic> json) => _$BillingSummaryResponseFromJson(json);

@override@JsonKey()@ApiAmountConverter() final  String totalOutstanding;
@override@JsonKey() final  int unpaidInvoiceCount;
@override final  DateTime? nextDueDate;
@override@JsonKey() final  int daysUntilDue;
@override@JsonKey() final  String currency;

/// Create a copy of BillingSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BillingSummaryResponseCopyWith<_BillingSummaryResponse> get copyWith => __$BillingSummaryResponseCopyWithImpl<_BillingSummaryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BillingSummaryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BillingSummaryResponse&&(identical(other.totalOutstanding, totalOutstanding) || other.totalOutstanding == totalOutstanding)&&(identical(other.unpaidInvoiceCount, unpaidInvoiceCount) || other.unpaidInvoiceCount == unpaidInvoiceCount)&&(identical(other.nextDueDate, nextDueDate) || other.nextDueDate == nextDueDate)&&(identical(other.daysUntilDue, daysUntilDue) || other.daysUntilDue == daysUntilDue)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalOutstanding,unpaidInvoiceCount,nextDueDate,daysUntilDue,currency);

@override
String toString() {
  return 'BillingSummaryResponse(totalOutstanding: $totalOutstanding, unpaidInvoiceCount: $unpaidInvoiceCount, nextDueDate: $nextDueDate, daysUntilDue: $daysUntilDue, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$BillingSummaryResponseCopyWith<$Res> implements $BillingSummaryResponseCopyWith<$Res> {
  factory _$BillingSummaryResponseCopyWith(_BillingSummaryResponse value, $Res Function(_BillingSummaryResponse) _then) = __$BillingSummaryResponseCopyWithImpl;
@override @useResult
$Res call({
@ApiAmountConverter() String totalOutstanding, int unpaidInvoiceCount, DateTime? nextDueDate, int daysUntilDue, String currency
});




}
/// @nodoc
class __$BillingSummaryResponseCopyWithImpl<$Res>
    implements _$BillingSummaryResponseCopyWith<$Res> {
  __$BillingSummaryResponseCopyWithImpl(this._self, this._then);

  final _BillingSummaryResponse _self;
  final $Res Function(_BillingSummaryResponse) _then;

/// Create a copy of BillingSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalOutstanding = null,Object? unpaidInvoiceCount = null,Object? nextDueDate = freezed,Object? daysUntilDue = null,Object? currency = null,}) {
  return _then(_BillingSummaryResponse(
totalOutstanding: null == totalOutstanding ? _self.totalOutstanding : totalOutstanding // ignore: cast_nullable_to_non_nullable
as String,unpaidInvoiceCount: null == unpaidInvoiceCount ? _self.unpaidInvoiceCount : unpaidInvoiceCount // ignore: cast_nullable_to_non_nullable
as int,nextDueDate: freezed == nextDueDate ? _self.nextDueDate : nextDueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,daysUntilDue: null == daysUntilDue ? _self.daysUntilDue : daysUntilDue // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$InvoiceSummary {

 String get id; String get invoiceNumber; String get title; BillType get billType; InvoiceStatus get status; DateTime get issuedAt;@ApiAmountConverter() String get totalAmount;@ApiAmountConverter() String get amountPaid;@ApiAmountConverter() String get balance;
/// Create a copy of InvoiceSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceSummaryCopyWith<InvoiceSummary> get copyWith => _$InvoiceSummaryCopyWithImpl<InvoiceSummary>(this as InvoiceSummary, _$identity);

  /// Serializes this InvoiceSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.title, title) || other.title == title)&&(identical(other.billType, billType) || other.billType == billType)&&(identical(other.status, status) || other.status == status)&&(identical(other.issuedAt, issuedAt) || other.issuedAt == issuedAt)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.balance, balance) || other.balance == balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,invoiceNumber,title,billType,status,issuedAt,totalAmount,amountPaid,balance);

@override
String toString() {
  return 'InvoiceSummary(id: $id, invoiceNumber: $invoiceNumber, title: $title, billType: $billType, status: $status, issuedAt: $issuedAt, totalAmount: $totalAmount, amountPaid: $amountPaid, balance: $balance)';
}


}

/// @nodoc
abstract mixin class $InvoiceSummaryCopyWith<$Res>  {
  factory $InvoiceSummaryCopyWith(InvoiceSummary value, $Res Function(InvoiceSummary) _then) = _$InvoiceSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String invoiceNumber, String title, BillType billType, InvoiceStatus status, DateTime issuedAt,@ApiAmountConverter() String totalAmount,@ApiAmountConverter() String amountPaid,@ApiAmountConverter() String balance
});




}
/// @nodoc
class _$InvoiceSummaryCopyWithImpl<$Res>
    implements $InvoiceSummaryCopyWith<$Res> {
  _$InvoiceSummaryCopyWithImpl(this._self, this._then);

  final InvoiceSummary _self;
  final $Res Function(InvoiceSummary) _then;

/// Create a copy of InvoiceSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? invoiceNumber = null,Object? title = null,Object? billType = null,Object? status = null,Object? issuedAt = null,Object? totalAmount = null,Object? amountPaid = null,Object? balance = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,billType: null == billType ? _self.billType : billType // ignore: cast_nullable_to_non_nullable
as BillType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InvoiceStatus,issuedAt: null == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as DateTime,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as String,amountPaid: null == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceSummary].
extension InvoiceSummaryPatterns on InvoiceSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceSummary value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceSummary value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String invoiceNumber,  String title,  BillType billType,  InvoiceStatus status,  DateTime issuedAt, @ApiAmountConverter()  String totalAmount, @ApiAmountConverter()  String amountPaid, @ApiAmountConverter()  String balance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceSummary() when $default != null:
return $default(_that.id,_that.invoiceNumber,_that.title,_that.billType,_that.status,_that.issuedAt,_that.totalAmount,_that.amountPaid,_that.balance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String invoiceNumber,  String title,  BillType billType,  InvoiceStatus status,  DateTime issuedAt, @ApiAmountConverter()  String totalAmount, @ApiAmountConverter()  String amountPaid, @ApiAmountConverter()  String balance)  $default,) {final _that = this;
switch (_that) {
case _InvoiceSummary():
return $default(_that.id,_that.invoiceNumber,_that.title,_that.billType,_that.status,_that.issuedAt,_that.totalAmount,_that.amountPaid,_that.balance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String invoiceNumber,  String title,  BillType billType,  InvoiceStatus status,  DateTime issuedAt, @ApiAmountConverter()  String totalAmount, @ApiAmountConverter()  String amountPaid, @ApiAmountConverter()  String balance)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceSummary() when $default != null:
return $default(_that.id,_that.invoiceNumber,_that.title,_that.billType,_that.status,_that.issuedAt,_that.totalAmount,_that.amountPaid,_that.balance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoiceSummary implements InvoiceSummary {
  const _InvoiceSummary({required this.id, required this.invoiceNumber, required this.title, required this.billType, required this.status, required this.issuedAt, @ApiAmountConverter() required this.totalAmount, @ApiAmountConverter() required this.amountPaid, @ApiAmountConverter() required this.balance});
  factory _InvoiceSummary.fromJson(Map<String, dynamic> json) => _$InvoiceSummaryFromJson(json);

@override final  String id;
@override final  String invoiceNumber;
@override final  String title;
@override final  BillType billType;
@override final  InvoiceStatus status;
@override final  DateTime issuedAt;
@override@ApiAmountConverter() final  String totalAmount;
@override@ApiAmountConverter() final  String amountPaid;
@override@ApiAmountConverter() final  String balance;

/// Create a copy of InvoiceSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceSummaryCopyWith<_InvoiceSummary> get copyWith => __$InvoiceSummaryCopyWithImpl<_InvoiceSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.title, title) || other.title == title)&&(identical(other.billType, billType) || other.billType == billType)&&(identical(other.status, status) || other.status == status)&&(identical(other.issuedAt, issuedAt) || other.issuedAt == issuedAt)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.balance, balance) || other.balance == balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,invoiceNumber,title,billType,status,issuedAt,totalAmount,amountPaid,balance);

@override
String toString() {
  return 'InvoiceSummary(id: $id, invoiceNumber: $invoiceNumber, title: $title, billType: $billType, status: $status, issuedAt: $issuedAt, totalAmount: $totalAmount, amountPaid: $amountPaid, balance: $balance)';
}


}

/// @nodoc
abstract mixin class _$InvoiceSummaryCopyWith<$Res> implements $InvoiceSummaryCopyWith<$Res> {
  factory _$InvoiceSummaryCopyWith(_InvoiceSummary value, $Res Function(_InvoiceSummary) _then) = __$InvoiceSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String invoiceNumber, String title, BillType billType, InvoiceStatus status, DateTime issuedAt,@ApiAmountConverter() String totalAmount,@ApiAmountConverter() String amountPaid,@ApiAmountConverter() String balance
});




}
/// @nodoc
class __$InvoiceSummaryCopyWithImpl<$Res>
    implements _$InvoiceSummaryCopyWith<$Res> {
  __$InvoiceSummaryCopyWithImpl(this._self, this._then);

  final _InvoiceSummary _self;
  final $Res Function(_InvoiceSummary) _then;

/// Create a copy of InvoiceSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? invoiceNumber = null,Object? title = null,Object? billType = null,Object? status = null,Object? issuedAt = null,Object? totalAmount = null,Object? amountPaid = null,Object? balance = null,}) {
  return _then(_InvoiceSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,billType: null == billType ? _self.billType : billType // ignore: cast_nullable_to_non_nullable
as BillType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InvoiceStatus,issuedAt: null == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as DateTime,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as String,amountPaid: null == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$InvoiceListResponse {

 List<InvoiceSummary> get data; int get total; int get page; int get limit;
/// Create a copy of InvoiceListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceListResponseCopyWith<InvoiceListResponse> get copyWith => _$InvoiceListResponseCopyWithImpl<InvoiceListResponse>(this as InvoiceListResponse, _$identity);

  /// Serializes this InvoiceListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceListResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),total,page,limit);

@override
String toString() {
  return 'InvoiceListResponse(data: $data, total: $total, page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $InvoiceListResponseCopyWith<$Res>  {
  factory $InvoiceListResponseCopyWith(InvoiceListResponse value, $Res Function(InvoiceListResponse) _then) = _$InvoiceListResponseCopyWithImpl;
@useResult
$Res call({
 List<InvoiceSummary> data, int total, int page, int limit
});




}
/// @nodoc
class _$InvoiceListResponseCopyWithImpl<$Res>
    implements $InvoiceListResponseCopyWith<$Res> {
  _$InvoiceListResponseCopyWithImpl(this._self, this._then);

  final InvoiceListResponse _self;
  final $Res Function(InvoiceListResponse) _then;

/// Create a copy of InvoiceListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? total = null,Object? page = null,Object? limit = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<InvoiceSummary>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceListResponse].
extension InvoiceListResponsePatterns on InvoiceListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceListResponse value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<InvoiceSummary> data,  int total,  int page,  int limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceListResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<InvoiceSummary> data,  int total,  int page,  int limit)  $default,) {final _that = this;
switch (_that) {
case _InvoiceListResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<InvoiceSummary> data,  int total,  int page,  int limit)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceListResponse() when $default != null:
return $default(_that.data,_that.total,_that.page,_that.limit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoiceListResponse implements InvoiceListResponse {
  const _InvoiceListResponse({required final  List<InvoiceSummary> data, this.total = 0, this.page = 1, this.limit = 20}): _data = data;
  factory _InvoiceListResponse.fromJson(Map<String, dynamic> json) => _$InvoiceListResponseFromJson(json);

 final  List<InvoiceSummary> _data;
@override List<InvoiceSummary> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey() final  int total;
@override@JsonKey() final  int page;
@override@JsonKey() final  int limit;

/// Create a copy of InvoiceListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceListResponseCopyWith<_InvoiceListResponse> get copyWith => __$InvoiceListResponseCopyWithImpl<_InvoiceListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceListResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),total,page,limit);

@override
String toString() {
  return 'InvoiceListResponse(data: $data, total: $total, page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$InvoiceListResponseCopyWith<$Res> implements $InvoiceListResponseCopyWith<$Res> {
  factory _$InvoiceListResponseCopyWith(_InvoiceListResponse value, $Res Function(_InvoiceListResponse) _then) = __$InvoiceListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<InvoiceSummary> data, int total, int page, int limit
});




}
/// @nodoc
class __$InvoiceListResponseCopyWithImpl<$Res>
    implements _$InvoiceListResponseCopyWith<$Res> {
  __$InvoiceListResponseCopyWithImpl(this._self, this._then);

  final _InvoiceListResponse _self;
  final $Res Function(_InvoiceListResponse) _then;

/// Create a copy of InvoiceListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? total = null,Object? page = null,Object? limit = null,}) {
  return _then(_InvoiceListResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<InvoiceSummary>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PatientAdmissionSummary {

 String get id; String get wardName; DateTime get admittedAt; DateTime? get dischargedAt; String get status;
/// Create a copy of PatientAdmissionSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientAdmissionSummaryCopyWith<PatientAdmissionSummary> get copyWith => _$PatientAdmissionSummaryCopyWithImpl<PatientAdmissionSummary>(this as PatientAdmissionSummary, _$identity);

  /// Serializes this PatientAdmissionSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatientAdmissionSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.wardName, wardName) || other.wardName == wardName)&&(identical(other.admittedAt, admittedAt) || other.admittedAt == admittedAt)&&(identical(other.dischargedAt, dischargedAt) || other.dischargedAt == dischargedAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,wardName,admittedAt,dischargedAt,status);

@override
String toString() {
  return 'PatientAdmissionSummary(id: $id, wardName: $wardName, admittedAt: $admittedAt, dischargedAt: $dischargedAt, status: $status)';
}


}

/// @nodoc
abstract mixin class $PatientAdmissionSummaryCopyWith<$Res>  {
  factory $PatientAdmissionSummaryCopyWith(PatientAdmissionSummary value, $Res Function(PatientAdmissionSummary) _then) = _$PatientAdmissionSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String wardName, DateTime admittedAt, DateTime? dischargedAt, String status
});




}
/// @nodoc
class _$PatientAdmissionSummaryCopyWithImpl<$Res>
    implements $PatientAdmissionSummaryCopyWith<$Res> {
  _$PatientAdmissionSummaryCopyWithImpl(this._self, this._then);

  final PatientAdmissionSummary _self;
  final $Res Function(PatientAdmissionSummary) _then;

/// Create a copy of PatientAdmissionSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? wardName = null,Object? admittedAt = null,Object? dischargedAt = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,wardName: null == wardName ? _self.wardName : wardName // ignore: cast_nullable_to_non_nullable
as String,admittedAt: null == admittedAt ? _self.admittedAt : admittedAt // ignore: cast_nullable_to_non_nullable
as DateTime,dischargedAt: freezed == dischargedAt ? _self.dischargedAt : dischargedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PatientAdmissionSummary].
extension PatientAdmissionSummaryPatterns on PatientAdmissionSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatientAdmissionSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatientAdmissionSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatientAdmissionSummary value)  $default,){
final _that = this;
switch (_that) {
case _PatientAdmissionSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatientAdmissionSummary value)?  $default,){
final _that = this;
switch (_that) {
case _PatientAdmissionSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String wardName,  DateTime admittedAt,  DateTime? dischargedAt,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatientAdmissionSummary() when $default != null:
return $default(_that.id,_that.wardName,_that.admittedAt,_that.dischargedAt,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String wardName,  DateTime admittedAt,  DateTime? dischargedAt,  String status)  $default,) {final _that = this;
switch (_that) {
case _PatientAdmissionSummary():
return $default(_that.id,_that.wardName,_that.admittedAt,_that.dischargedAt,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String wardName,  DateTime admittedAt,  DateTime? dischargedAt,  String status)?  $default,) {final _that = this;
switch (_that) {
case _PatientAdmissionSummary() when $default != null:
return $default(_that.id,_that.wardName,_that.admittedAt,_that.dischargedAt,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatientAdmissionSummary implements PatientAdmissionSummary {
  const _PatientAdmissionSummary({required this.id, required this.wardName, required this.admittedAt, this.dischargedAt, required this.status});
  factory _PatientAdmissionSummary.fromJson(Map<String, dynamic> json) => _$PatientAdmissionSummaryFromJson(json);

@override final  String id;
@override final  String wardName;
@override final  DateTime admittedAt;
@override final  DateTime? dischargedAt;
@override final  String status;

/// Create a copy of PatientAdmissionSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientAdmissionSummaryCopyWith<_PatientAdmissionSummary> get copyWith => __$PatientAdmissionSummaryCopyWithImpl<_PatientAdmissionSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatientAdmissionSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatientAdmissionSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.wardName, wardName) || other.wardName == wardName)&&(identical(other.admittedAt, admittedAt) || other.admittedAt == admittedAt)&&(identical(other.dischargedAt, dischargedAt) || other.dischargedAt == dischargedAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,wardName,admittedAt,dischargedAt,status);

@override
String toString() {
  return 'PatientAdmissionSummary(id: $id, wardName: $wardName, admittedAt: $admittedAt, dischargedAt: $dischargedAt, status: $status)';
}


}

/// @nodoc
abstract mixin class _$PatientAdmissionSummaryCopyWith<$Res> implements $PatientAdmissionSummaryCopyWith<$Res> {
  factory _$PatientAdmissionSummaryCopyWith(_PatientAdmissionSummary value, $Res Function(_PatientAdmissionSummary) _then) = __$PatientAdmissionSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String wardName, DateTime admittedAt, DateTime? dischargedAt, String status
});




}
/// @nodoc
class __$PatientAdmissionSummaryCopyWithImpl<$Res>
    implements _$PatientAdmissionSummaryCopyWith<$Res> {
  __$PatientAdmissionSummaryCopyWithImpl(this._self, this._then);

  final _PatientAdmissionSummary _self;
  final $Res Function(_PatientAdmissionSummary) _then;

/// Create a copy of PatientAdmissionSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? wardName = null,Object? admittedAt = null,Object? dischargedAt = freezed,Object? status = null,}) {
  return _then(_PatientAdmissionSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,wardName: null == wardName ? _self.wardName : wardName // ignore: cast_nullable_to_non_nullable
as String,admittedAt: null == admittedAt ? _self.admittedAt : admittedAt // ignore: cast_nullable_to_non_nullable
as DateTime,dischargedAt: freezed == dischargedAt ? _self.dischargedAt : dischargedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$BreakdownLineItem {

 String get id; String get description;@ApiAmountConverter() String get unitPrice; int get quantity;@ApiAmountConverter() String get lineTotal;@ApiAmountConverter() String get amountPaid;@ApiAmountConverter() String get balance; bool get isRecurringDaily; int? get billableDays; String? get usageSummary;
/// Create a copy of BreakdownLineItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BreakdownLineItemCopyWith<BreakdownLineItem> get copyWith => _$BreakdownLineItemCopyWithImpl<BreakdownLineItem>(this as BreakdownLineItem, _$identity);

  /// Serializes this BreakdownLineItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BreakdownLineItem&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.lineTotal, lineTotal) || other.lineTotal == lineTotal)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.isRecurringDaily, isRecurringDaily) || other.isRecurringDaily == isRecurringDaily)&&(identical(other.billableDays, billableDays) || other.billableDays == billableDays)&&(identical(other.usageSummary, usageSummary) || other.usageSummary == usageSummary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,description,unitPrice,quantity,lineTotal,amountPaid,balance,isRecurringDaily,billableDays,usageSummary);

@override
String toString() {
  return 'BreakdownLineItem(id: $id, description: $description, unitPrice: $unitPrice, quantity: $quantity, lineTotal: $lineTotal, amountPaid: $amountPaid, balance: $balance, isRecurringDaily: $isRecurringDaily, billableDays: $billableDays, usageSummary: $usageSummary)';
}


}

/// @nodoc
abstract mixin class $BreakdownLineItemCopyWith<$Res>  {
  factory $BreakdownLineItemCopyWith(BreakdownLineItem value, $Res Function(BreakdownLineItem) _then) = _$BreakdownLineItemCopyWithImpl;
@useResult
$Res call({
 String id, String description,@ApiAmountConverter() String unitPrice, int quantity,@ApiAmountConverter() String lineTotal,@ApiAmountConverter() String amountPaid,@ApiAmountConverter() String balance, bool isRecurringDaily, int? billableDays, String? usageSummary
});




}
/// @nodoc
class _$BreakdownLineItemCopyWithImpl<$Res>
    implements $BreakdownLineItemCopyWith<$Res> {
  _$BreakdownLineItemCopyWithImpl(this._self, this._then);

  final BreakdownLineItem _self;
  final $Res Function(BreakdownLineItem) _then;

/// Create a copy of BreakdownLineItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? description = null,Object? unitPrice = null,Object? quantity = null,Object? lineTotal = null,Object? amountPaid = null,Object? balance = null,Object? isRecurringDaily = null,Object? billableDays = freezed,Object? usageSummary = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as String,amountPaid: null == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,isRecurringDaily: null == isRecurringDaily ? _self.isRecurringDaily : isRecurringDaily // ignore: cast_nullable_to_non_nullable
as bool,billableDays: freezed == billableDays ? _self.billableDays : billableDays // ignore: cast_nullable_to_non_nullable
as int?,usageSummary: freezed == usageSummary ? _self.usageSummary : usageSummary // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BreakdownLineItem].
extension BreakdownLineItemPatterns on BreakdownLineItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BreakdownLineItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BreakdownLineItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BreakdownLineItem value)  $default,){
final _that = this;
switch (_that) {
case _BreakdownLineItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BreakdownLineItem value)?  $default,){
final _that = this;
switch (_that) {
case _BreakdownLineItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String description, @ApiAmountConverter()  String unitPrice,  int quantity, @ApiAmountConverter()  String lineTotal, @ApiAmountConverter()  String amountPaid, @ApiAmountConverter()  String balance,  bool isRecurringDaily,  int? billableDays,  String? usageSummary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BreakdownLineItem() when $default != null:
return $default(_that.id,_that.description,_that.unitPrice,_that.quantity,_that.lineTotal,_that.amountPaid,_that.balance,_that.isRecurringDaily,_that.billableDays,_that.usageSummary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String description, @ApiAmountConverter()  String unitPrice,  int quantity, @ApiAmountConverter()  String lineTotal, @ApiAmountConverter()  String amountPaid, @ApiAmountConverter()  String balance,  bool isRecurringDaily,  int? billableDays,  String? usageSummary)  $default,) {final _that = this;
switch (_that) {
case _BreakdownLineItem():
return $default(_that.id,_that.description,_that.unitPrice,_that.quantity,_that.lineTotal,_that.amountPaid,_that.balance,_that.isRecurringDaily,_that.billableDays,_that.usageSummary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String description, @ApiAmountConverter()  String unitPrice,  int quantity, @ApiAmountConverter()  String lineTotal, @ApiAmountConverter()  String amountPaid, @ApiAmountConverter()  String balance,  bool isRecurringDaily,  int? billableDays,  String? usageSummary)?  $default,) {final _that = this;
switch (_that) {
case _BreakdownLineItem() when $default != null:
return $default(_that.id,_that.description,_that.unitPrice,_that.quantity,_that.lineTotal,_that.amountPaid,_that.balance,_that.isRecurringDaily,_that.billableDays,_that.usageSummary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BreakdownLineItem implements BreakdownLineItem {
  const _BreakdownLineItem({required this.id, required this.description, @ApiAmountConverter() required this.unitPrice, required this.quantity, @ApiAmountConverter() required this.lineTotal, @ApiAmountConverter() required this.amountPaid, @ApiAmountConverter() required this.balance, this.isRecurringDaily = false, this.billableDays, this.usageSummary});
  factory _BreakdownLineItem.fromJson(Map<String, dynamic> json) => _$BreakdownLineItemFromJson(json);

@override final  String id;
@override final  String description;
@override@ApiAmountConverter() final  String unitPrice;
@override final  int quantity;
@override@ApiAmountConverter() final  String lineTotal;
@override@ApiAmountConverter() final  String amountPaid;
@override@ApiAmountConverter() final  String balance;
@override@JsonKey() final  bool isRecurringDaily;
@override final  int? billableDays;
@override final  String? usageSummary;

/// Create a copy of BreakdownLineItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BreakdownLineItemCopyWith<_BreakdownLineItem> get copyWith => __$BreakdownLineItemCopyWithImpl<_BreakdownLineItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BreakdownLineItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BreakdownLineItem&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.lineTotal, lineTotal) || other.lineTotal == lineTotal)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.isRecurringDaily, isRecurringDaily) || other.isRecurringDaily == isRecurringDaily)&&(identical(other.billableDays, billableDays) || other.billableDays == billableDays)&&(identical(other.usageSummary, usageSummary) || other.usageSummary == usageSummary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,description,unitPrice,quantity,lineTotal,amountPaid,balance,isRecurringDaily,billableDays,usageSummary);

@override
String toString() {
  return 'BreakdownLineItem(id: $id, description: $description, unitPrice: $unitPrice, quantity: $quantity, lineTotal: $lineTotal, amountPaid: $amountPaid, balance: $balance, isRecurringDaily: $isRecurringDaily, billableDays: $billableDays, usageSummary: $usageSummary)';
}


}

/// @nodoc
abstract mixin class _$BreakdownLineItemCopyWith<$Res> implements $BreakdownLineItemCopyWith<$Res> {
  factory _$BreakdownLineItemCopyWith(_BreakdownLineItem value, $Res Function(_BreakdownLineItem) _then) = __$BreakdownLineItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String description,@ApiAmountConverter() String unitPrice, int quantity,@ApiAmountConverter() String lineTotal,@ApiAmountConverter() String amountPaid,@ApiAmountConverter() String balance, bool isRecurringDaily, int? billableDays, String? usageSummary
});




}
/// @nodoc
class __$BreakdownLineItemCopyWithImpl<$Res>
    implements _$BreakdownLineItemCopyWith<$Res> {
  __$BreakdownLineItemCopyWithImpl(this._self, this._then);

  final _BreakdownLineItem _self;
  final $Res Function(_BreakdownLineItem) _then;

/// Create a copy of BreakdownLineItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? description = null,Object? unitPrice = null,Object? quantity = null,Object? lineTotal = null,Object? amountPaid = null,Object? balance = null,Object? isRecurringDaily = null,Object? billableDays = freezed,Object? usageSummary = freezed,}) {
  return _then(_BreakdownLineItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as String,amountPaid: null == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,isRecurringDaily: null == isRecurringDaily ? _self.isRecurringDaily : isRecurringDaily // ignore: cast_nullable_to_non_nullable
as bool,billableDays: freezed == billableDays ? _self.billableDays : billableDays // ignore: cast_nullable_to_non_nullable
as int?,usageSummary: freezed == usageSummary ? _self.usageSummary : usageSummary // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$BreakdownCategory {

 ChargeCategory get category; String get label;@ApiAmountConverter() String get subtotal;@ApiAmountConverter() String get amountPaid;@ApiAmountConverter() String get balance; List<BreakdownLineItem> get items;
/// Create a copy of BreakdownCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BreakdownCategoryCopyWith<BreakdownCategory> get copyWith => _$BreakdownCategoryCopyWithImpl<BreakdownCategory>(this as BreakdownCategory, _$identity);

  /// Serializes this BreakdownCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BreakdownCategory&&(identical(other.category, category) || other.category == category)&&(identical(other.label, label) || other.label == label)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.balance, balance) || other.balance == balance)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,label,subtotal,amountPaid,balance,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'BreakdownCategory(category: $category, label: $label, subtotal: $subtotal, amountPaid: $amountPaid, balance: $balance, items: $items)';
}


}

/// @nodoc
abstract mixin class $BreakdownCategoryCopyWith<$Res>  {
  factory $BreakdownCategoryCopyWith(BreakdownCategory value, $Res Function(BreakdownCategory) _then) = _$BreakdownCategoryCopyWithImpl;
@useResult
$Res call({
 ChargeCategory category, String label,@ApiAmountConverter() String subtotal,@ApiAmountConverter() String amountPaid,@ApiAmountConverter() String balance, List<BreakdownLineItem> items
});




}
/// @nodoc
class _$BreakdownCategoryCopyWithImpl<$Res>
    implements $BreakdownCategoryCopyWith<$Res> {
  _$BreakdownCategoryCopyWithImpl(this._self, this._then);

  final BreakdownCategory _self;
  final $Res Function(BreakdownCategory) _then;

/// Create a copy of BreakdownCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? label = null,Object? subtotal = null,Object? amountPaid = null,Object? balance = null,Object? items = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ChargeCategory,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as String,amountPaid: null == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<BreakdownLineItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [BreakdownCategory].
extension BreakdownCategoryPatterns on BreakdownCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BreakdownCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BreakdownCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BreakdownCategory value)  $default,){
final _that = this;
switch (_that) {
case _BreakdownCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BreakdownCategory value)?  $default,){
final _that = this;
switch (_that) {
case _BreakdownCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChargeCategory category,  String label, @ApiAmountConverter()  String subtotal, @ApiAmountConverter()  String amountPaid, @ApiAmountConverter()  String balance,  List<BreakdownLineItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BreakdownCategory() when $default != null:
return $default(_that.category,_that.label,_that.subtotal,_that.amountPaid,_that.balance,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChargeCategory category,  String label, @ApiAmountConverter()  String subtotal, @ApiAmountConverter()  String amountPaid, @ApiAmountConverter()  String balance,  List<BreakdownLineItem> items)  $default,) {final _that = this;
switch (_that) {
case _BreakdownCategory():
return $default(_that.category,_that.label,_that.subtotal,_that.amountPaid,_that.balance,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChargeCategory category,  String label, @ApiAmountConverter()  String subtotal, @ApiAmountConverter()  String amountPaid, @ApiAmountConverter()  String balance,  List<BreakdownLineItem> items)?  $default,) {final _that = this;
switch (_that) {
case _BreakdownCategory() when $default != null:
return $default(_that.category,_that.label,_that.subtotal,_that.amountPaid,_that.balance,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BreakdownCategory implements BreakdownCategory {
  const _BreakdownCategory({required this.category, required this.label, @ApiAmountConverter() required this.subtotal, @ApiAmountConverter() required this.amountPaid, @ApiAmountConverter() required this.balance, final  List<BreakdownLineItem> items = const []}): _items = items;
  factory _BreakdownCategory.fromJson(Map<String, dynamic> json) => _$BreakdownCategoryFromJson(json);

@override final  ChargeCategory category;
@override final  String label;
@override@ApiAmountConverter() final  String subtotal;
@override@ApiAmountConverter() final  String amountPaid;
@override@ApiAmountConverter() final  String balance;
 final  List<BreakdownLineItem> _items;
@override@JsonKey() List<BreakdownLineItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of BreakdownCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BreakdownCategoryCopyWith<_BreakdownCategory> get copyWith => __$BreakdownCategoryCopyWithImpl<_BreakdownCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BreakdownCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BreakdownCategory&&(identical(other.category, category) || other.category == category)&&(identical(other.label, label) || other.label == label)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.balance, balance) || other.balance == balance)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,label,subtotal,amountPaid,balance,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'BreakdownCategory(category: $category, label: $label, subtotal: $subtotal, amountPaid: $amountPaid, balance: $balance, items: $items)';
}


}

/// @nodoc
abstract mixin class _$BreakdownCategoryCopyWith<$Res> implements $BreakdownCategoryCopyWith<$Res> {
  factory _$BreakdownCategoryCopyWith(_BreakdownCategory value, $Res Function(_BreakdownCategory) _then) = __$BreakdownCategoryCopyWithImpl;
@override @useResult
$Res call({
 ChargeCategory category, String label,@ApiAmountConverter() String subtotal,@ApiAmountConverter() String amountPaid,@ApiAmountConverter() String balance, List<BreakdownLineItem> items
});




}
/// @nodoc
class __$BreakdownCategoryCopyWithImpl<$Res>
    implements _$BreakdownCategoryCopyWith<$Res> {
  __$BreakdownCategoryCopyWithImpl(this._self, this._then);

  final _BreakdownCategory _self;
  final $Res Function(_BreakdownCategory) _then;

/// Create a copy of BreakdownCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? label = null,Object? subtotal = null,Object? amountPaid = null,Object? balance = null,Object? items = null,}) {
  return _then(_BreakdownCategory(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ChargeCategory,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as String,amountPaid: null == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<BreakdownLineItem>,
  ));
}


}


/// @nodoc
mixin _$InvoicePaymentSummary {

 String get id;@ApiAmountConverter() String get amount;@JsonKey(unknownEnumValue: PaymentMethod.cash) PaymentMethod? get method; String get methodLabel; DateTime get paidAt; String? get reference;
/// Create a copy of InvoicePaymentSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoicePaymentSummaryCopyWith<InvoicePaymentSummary> get copyWith => _$InvoicePaymentSummaryCopyWithImpl<InvoicePaymentSummary>(this as InvoicePaymentSummary, _$identity);

  /// Serializes this InvoicePaymentSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoicePaymentSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.method, method) || other.method == method)&&(identical(other.methodLabel, methodLabel) || other.methodLabel == methodLabel)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.reference, reference) || other.reference == reference));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,method,methodLabel,paidAt,reference);

@override
String toString() {
  return 'InvoicePaymentSummary(id: $id, amount: $amount, method: $method, methodLabel: $methodLabel, paidAt: $paidAt, reference: $reference)';
}


}

/// @nodoc
abstract mixin class $InvoicePaymentSummaryCopyWith<$Res>  {
  factory $InvoicePaymentSummaryCopyWith(InvoicePaymentSummary value, $Res Function(InvoicePaymentSummary) _then) = _$InvoicePaymentSummaryCopyWithImpl;
@useResult
$Res call({
 String id,@ApiAmountConverter() String amount,@JsonKey(unknownEnumValue: PaymentMethod.cash) PaymentMethod? method, String methodLabel, DateTime paidAt, String? reference
});




}
/// @nodoc
class _$InvoicePaymentSummaryCopyWithImpl<$Res>
    implements $InvoicePaymentSummaryCopyWith<$Res> {
  _$InvoicePaymentSummaryCopyWithImpl(this._self, this._then);

  final InvoicePaymentSummary _self;
  final $Res Function(InvoicePaymentSummary) _then;

/// Create a copy of InvoicePaymentSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? amount = null,Object? method = freezed,Object? methodLabel = null,Object? paidAt = null,Object? reference = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod?,methodLabel: null == methodLabel ? _self.methodLabel : methodLabel // ignore: cast_nullable_to_non_nullable
as String,paidAt: null == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime,reference: freezed == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoicePaymentSummary].
extension InvoicePaymentSummaryPatterns on InvoicePaymentSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoicePaymentSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoicePaymentSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoicePaymentSummary value)  $default,){
final _that = this;
switch (_that) {
case _InvoicePaymentSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoicePaymentSummary value)?  $default,){
final _that = this;
switch (_that) {
case _InvoicePaymentSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @ApiAmountConverter()  String amount, @JsonKey(unknownEnumValue: PaymentMethod.cash)  PaymentMethod? method,  String methodLabel,  DateTime paidAt,  String? reference)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoicePaymentSummary() when $default != null:
return $default(_that.id,_that.amount,_that.method,_that.methodLabel,_that.paidAt,_that.reference);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @ApiAmountConverter()  String amount, @JsonKey(unknownEnumValue: PaymentMethod.cash)  PaymentMethod? method,  String methodLabel,  DateTime paidAt,  String? reference)  $default,) {final _that = this;
switch (_that) {
case _InvoicePaymentSummary():
return $default(_that.id,_that.amount,_that.method,_that.methodLabel,_that.paidAt,_that.reference);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @ApiAmountConverter()  String amount, @JsonKey(unknownEnumValue: PaymentMethod.cash)  PaymentMethod? method,  String methodLabel,  DateTime paidAt,  String? reference)?  $default,) {final _that = this;
switch (_that) {
case _InvoicePaymentSummary() when $default != null:
return $default(_that.id,_that.amount,_that.method,_that.methodLabel,_that.paidAt,_that.reference);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoicePaymentSummary implements InvoicePaymentSummary {
  const _InvoicePaymentSummary({required this.id, @ApiAmountConverter() required this.amount, @JsonKey(unknownEnumValue: PaymentMethod.cash) this.method, this.methodLabel = '', required this.paidAt, this.reference});
  factory _InvoicePaymentSummary.fromJson(Map<String, dynamic> json) => _$InvoicePaymentSummaryFromJson(json);

@override final  String id;
@override@ApiAmountConverter() final  String amount;
@override@JsonKey(unknownEnumValue: PaymentMethod.cash) final  PaymentMethod? method;
@override@JsonKey() final  String methodLabel;
@override final  DateTime paidAt;
@override final  String? reference;

/// Create a copy of InvoicePaymentSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoicePaymentSummaryCopyWith<_InvoicePaymentSummary> get copyWith => __$InvoicePaymentSummaryCopyWithImpl<_InvoicePaymentSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoicePaymentSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoicePaymentSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.method, method) || other.method == method)&&(identical(other.methodLabel, methodLabel) || other.methodLabel == methodLabel)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.reference, reference) || other.reference == reference));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,method,methodLabel,paidAt,reference);

@override
String toString() {
  return 'InvoicePaymentSummary(id: $id, amount: $amount, method: $method, methodLabel: $methodLabel, paidAt: $paidAt, reference: $reference)';
}


}

/// @nodoc
abstract mixin class _$InvoicePaymentSummaryCopyWith<$Res> implements $InvoicePaymentSummaryCopyWith<$Res> {
  factory _$InvoicePaymentSummaryCopyWith(_InvoicePaymentSummary value, $Res Function(_InvoicePaymentSummary) _then) = __$InvoicePaymentSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id,@ApiAmountConverter() String amount,@JsonKey(unknownEnumValue: PaymentMethod.cash) PaymentMethod? method, String methodLabel, DateTime paidAt, String? reference
});




}
/// @nodoc
class __$InvoicePaymentSummaryCopyWithImpl<$Res>
    implements _$InvoicePaymentSummaryCopyWith<$Res> {
  __$InvoicePaymentSummaryCopyWithImpl(this._self, this._then);

  final _InvoicePaymentSummary _self;
  final $Res Function(_InvoicePaymentSummary) _then;

/// Create a copy of InvoicePaymentSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amount = null,Object? method = freezed,Object? methodLabel = null,Object? paidAt = null,Object? reference = freezed,}) {
  return _then(_InvoicePaymentSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod?,methodLabel: null == methodLabel ? _self.methodLabel : methodLabel // ignore: cast_nullable_to_non_nullable
as String,paidAt: null == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime,reference: freezed == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$InvoiceDetail {

 String get id; String get invoiceNumber; BillType get billType; InvoiceStatus get status; DateTime get issuedAt;@ApiAmountConverter() String get totalAmount;@ApiAmountConverter() String get amountPaid;@ApiAmountConverter() String get balance; PatientAdmissionSummary? get admission; List<BreakdownCategory> get breakdown; List<InvoicePaymentSummary> get payments;
/// Create a copy of InvoiceDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceDetailCopyWith<InvoiceDetail> get copyWith => _$InvoiceDetailCopyWithImpl<InvoiceDetail>(this as InvoiceDetail, _$identity);

  /// Serializes this InvoiceDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.billType, billType) || other.billType == billType)&&(identical(other.status, status) || other.status == status)&&(identical(other.issuedAt, issuedAt) || other.issuedAt == issuedAt)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.admission, admission) || other.admission == admission)&&const DeepCollectionEquality().equals(other.breakdown, breakdown)&&const DeepCollectionEquality().equals(other.payments, payments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,invoiceNumber,billType,status,issuedAt,totalAmount,amountPaid,balance,admission,const DeepCollectionEquality().hash(breakdown),const DeepCollectionEquality().hash(payments));

@override
String toString() {
  return 'InvoiceDetail(id: $id, invoiceNumber: $invoiceNumber, billType: $billType, status: $status, issuedAt: $issuedAt, totalAmount: $totalAmount, amountPaid: $amountPaid, balance: $balance, admission: $admission, breakdown: $breakdown, payments: $payments)';
}


}

/// @nodoc
abstract mixin class $InvoiceDetailCopyWith<$Res>  {
  factory $InvoiceDetailCopyWith(InvoiceDetail value, $Res Function(InvoiceDetail) _then) = _$InvoiceDetailCopyWithImpl;
@useResult
$Res call({
 String id, String invoiceNumber, BillType billType, InvoiceStatus status, DateTime issuedAt,@ApiAmountConverter() String totalAmount,@ApiAmountConverter() String amountPaid,@ApiAmountConverter() String balance, PatientAdmissionSummary? admission, List<BreakdownCategory> breakdown, List<InvoicePaymentSummary> payments
});


$PatientAdmissionSummaryCopyWith<$Res>? get admission;

}
/// @nodoc
class _$InvoiceDetailCopyWithImpl<$Res>
    implements $InvoiceDetailCopyWith<$Res> {
  _$InvoiceDetailCopyWithImpl(this._self, this._then);

  final InvoiceDetail _self;
  final $Res Function(InvoiceDetail) _then;

/// Create a copy of InvoiceDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? invoiceNumber = null,Object? billType = null,Object? status = null,Object? issuedAt = null,Object? totalAmount = null,Object? amountPaid = null,Object? balance = null,Object? admission = freezed,Object? breakdown = null,Object? payments = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String,billType: null == billType ? _self.billType : billType // ignore: cast_nullable_to_non_nullable
as BillType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InvoiceStatus,issuedAt: null == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as DateTime,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as String,amountPaid: null == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,admission: freezed == admission ? _self.admission : admission // ignore: cast_nullable_to_non_nullable
as PatientAdmissionSummary?,breakdown: null == breakdown ? _self.breakdown : breakdown // ignore: cast_nullable_to_non_nullable
as List<BreakdownCategory>,payments: null == payments ? _self.payments : payments // ignore: cast_nullable_to_non_nullable
as List<InvoicePaymentSummary>,
  ));
}
/// Create a copy of InvoiceDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatientAdmissionSummaryCopyWith<$Res>? get admission {
    if (_self.admission == null) {
    return null;
  }

  return $PatientAdmissionSummaryCopyWith<$Res>(_self.admission!, (value) {
    return _then(_self.copyWith(admission: value));
  });
}
}


/// Adds pattern-matching-related methods to [InvoiceDetail].
extension InvoiceDetailPatterns on InvoiceDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceDetail value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceDetail value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String invoiceNumber,  BillType billType,  InvoiceStatus status,  DateTime issuedAt, @ApiAmountConverter()  String totalAmount, @ApiAmountConverter()  String amountPaid, @ApiAmountConverter()  String balance,  PatientAdmissionSummary? admission,  List<BreakdownCategory> breakdown,  List<InvoicePaymentSummary> payments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceDetail() when $default != null:
return $default(_that.id,_that.invoiceNumber,_that.billType,_that.status,_that.issuedAt,_that.totalAmount,_that.amountPaid,_that.balance,_that.admission,_that.breakdown,_that.payments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String invoiceNumber,  BillType billType,  InvoiceStatus status,  DateTime issuedAt, @ApiAmountConverter()  String totalAmount, @ApiAmountConverter()  String amountPaid, @ApiAmountConverter()  String balance,  PatientAdmissionSummary? admission,  List<BreakdownCategory> breakdown,  List<InvoicePaymentSummary> payments)  $default,) {final _that = this;
switch (_that) {
case _InvoiceDetail():
return $default(_that.id,_that.invoiceNumber,_that.billType,_that.status,_that.issuedAt,_that.totalAmount,_that.amountPaid,_that.balance,_that.admission,_that.breakdown,_that.payments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String invoiceNumber,  BillType billType,  InvoiceStatus status,  DateTime issuedAt, @ApiAmountConverter()  String totalAmount, @ApiAmountConverter()  String amountPaid, @ApiAmountConverter()  String balance,  PatientAdmissionSummary? admission,  List<BreakdownCategory> breakdown,  List<InvoicePaymentSummary> payments)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceDetail() when $default != null:
return $default(_that.id,_that.invoiceNumber,_that.billType,_that.status,_that.issuedAt,_that.totalAmount,_that.amountPaid,_that.balance,_that.admission,_that.breakdown,_that.payments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoiceDetail implements InvoiceDetail {
  const _InvoiceDetail({required this.id, required this.invoiceNumber, required this.billType, required this.status, required this.issuedAt, @ApiAmountConverter() required this.totalAmount, @ApiAmountConverter() required this.amountPaid, @ApiAmountConverter() required this.balance, this.admission, final  List<BreakdownCategory> breakdown = const [], final  List<InvoicePaymentSummary> payments = const []}): _breakdown = breakdown,_payments = payments;
  factory _InvoiceDetail.fromJson(Map<String, dynamic> json) => _$InvoiceDetailFromJson(json);

@override final  String id;
@override final  String invoiceNumber;
@override final  BillType billType;
@override final  InvoiceStatus status;
@override final  DateTime issuedAt;
@override@ApiAmountConverter() final  String totalAmount;
@override@ApiAmountConverter() final  String amountPaid;
@override@ApiAmountConverter() final  String balance;
@override final  PatientAdmissionSummary? admission;
 final  List<BreakdownCategory> _breakdown;
@override@JsonKey() List<BreakdownCategory> get breakdown {
  if (_breakdown is EqualUnmodifiableListView) return _breakdown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_breakdown);
}

 final  List<InvoicePaymentSummary> _payments;
@override@JsonKey() List<InvoicePaymentSummary> get payments {
  if (_payments is EqualUnmodifiableListView) return _payments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_payments);
}


/// Create a copy of InvoiceDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceDetailCopyWith<_InvoiceDetail> get copyWith => __$InvoiceDetailCopyWithImpl<_InvoiceDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.billType, billType) || other.billType == billType)&&(identical(other.status, status) || other.status == status)&&(identical(other.issuedAt, issuedAt) || other.issuedAt == issuedAt)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.admission, admission) || other.admission == admission)&&const DeepCollectionEquality().equals(other._breakdown, _breakdown)&&const DeepCollectionEquality().equals(other._payments, _payments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,invoiceNumber,billType,status,issuedAt,totalAmount,amountPaid,balance,admission,const DeepCollectionEquality().hash(_breakdown),const DeepCollectionEquality().hash(_payments));

@override
String toString() {
  return 'InvoiceDetail(id: $id, invoiceNumber: $invoiceNumber, billType: $billType, status: $status, issuedAt: $issuedAt, totalAmount: $totalAmount, amountPaid: $amountPaid, balance: $balance, admission: $admission, breakdown: $breakdown, payments: $payments)';
}


}

/// @nodoc
abstract mixin class _$InvoiceDetailCopyWith<$Res> implements $InvoiceDetailCopyWith<$Res> {
  factory _$InvoiceDetailCopyWith(_InvoiceDetail value, $Res Function(_InvoiceDetail) _then) = __$InvoiceDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String invoiceNumber, BillType billType, InvoiceStatus status, DateTime issuedAt,@ApiAmountConverter() String totalAmount,@ApiAmountConverter() String amountPaid,@ApiAmountConverter() String balance, PatientAdmissionSummary? admission, List<BreakdownCategory> breakdown, List<InvoicePaymentSummary> payments
});


@override $PatientAdmissionSummaryCopyWith<$Res>? get admission;

}
/// @nodoc
class __$InvoiceDetailCopyWithImpl<$Res>
    implements _$InvoiceDetailCopyWith<$Res> {
  __$InvoiceDetailCopyWithImpl(this._self, this._then);

  final _InvoiceDetail _self;
  final $Res Function(_InvoiceDetail) _then;

/// Create a copy of InvoiceDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? invoiceNumber = null,Object? billType = null,Object? status = null,Object? issuedAt = null,Object? totalAmount = null,Object? amountPaid = null,Object? balance = null,Object? admission = freezed,Object? breakdown = null,Object? payments = null,}) {
  return _then(_InvoiceDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String,billType: null == billType ? _self.billType : billType // ignore: cast_nullable_to_non_nullable
as BillType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InvoiceStatus,issuedAt: null == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as DateTime,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as String,amountPaid: null == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,admission: freezed == admission ? _self.admission : admission // ignore: cast_nullable_to_non_nullable
as PatientAdmissionSummary?,breakdown: null == breakdown ? _self._breakdown : breakdown // ignore: cast_nullable_to_non_nullable
as List<BreakdownCategory>,payments: null == payments ? _self._payments : payments // ignore: cast_nullable_to_non_nullable
as List<InvoicePaymentSummary>,
  ));
}

/// Create a copy of InvoiceDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatientAdmissionSummaryCopyWith<$Res>? get admission {
    if (_self.admission == null) {
    return null;
  }

  return $PatientAdmissionSummaryCopyWith<$Res>(_self.admission!, (value) {
    return _then(_self.copyWith(admission: value));
  });
}
}


/// @nodoc
mixin _$PaymentHistoryItem {

 String get id; String get invoiceId; String get invoiceNumber; String get description;@ApiAmountConverter() String get amount;@JsonKey(unknownEnumValue: PaymentMethod.cash) PaymentMethod? get method; String get methodLabel; String get methodDetail; DateTime get paidAt; String get status;
/// Create a copy of PaymentHistoryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentHistoryItemCopyWith<PaymentHistoryItem> get copyWith => _$PaymentHistoryItemCopyWithImpl<PaymentHistoryItem>(this as PaymentHistoryItem, _$identity);

  /// Serializes this PaymentHistoryItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentHistoryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceId, invoiceId) || other.invoiceId == invoiceId)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.method, method) || other.method == method)&&(identical(other.methodLabel, methodLabel) || other.methodLabel == methodLabel)&&(identical(other.methodDetail, methodDetail) || other.methodDetail == methodDetail)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,invoiceId,invoiceNumber,description,amount,method,methodLabel,methodDetail,paidAt,status);

@override
String toString() {
  return 'PaymentHistoryItem(id: $id, invoiceId: $invoiceId, invoiceNumber: $invoiceNumber, description: $description, amount: $amount, method: $method, methodLabel: $methodLabel, methodDetail: $methodDetail, paidAt: $paidAt, status: $status)';
}


}

/// @nodoc
abstract mixin class $PaymentHistoryItemCopyWith<$Res>  {
  factory $PaymentHistoryItemCopyWith(PaymentHistoryItem value, $Res Function(PaymentHistoryItem) _then) = _$PaymentHistoryItemCopyWithImpl;
@useResult
$Res call({
 String id, String invoiceId, String invoiceNumber, String description,@ApiAmountConverter() String amount,@JsonKey(unknownEnumValue: PaymentMethod.cash) PaymentMethod? method, String methodLabel, String methodDetail, DateTime paidAt, String status
});




}
/// @nodoc
class _$PaymentHistoryItemCopyWithImpl<$Res>
    implements $PaymentHistoryItemCopyWith<$Res> {
  _$PaymentHistoryItemCopyWithImpl(this._self, this._then);

  final PaymentHistoryItem _self;
  final $Res Function(PaymentHistoryItem) _then;

/// Create a copy of PaymentHistoryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? invoiceId = null,Object? invoiceNumber = null,Object? description = null,Object? amount = null,Object? method = freezed,Object? methodLabel = null,Object? methodDetail = null,Object? paidAt = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,invoiceId: null == invoiceId ? _self.invoiceId : invoiceId // ignore: cast_nullable_to_non_nullable
as String,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod?,methodLabel: null == methodLabel ? _self.methodLabel : methodLabel // ignore: cast_nullable_to_non_nullable
as String,methodDetail: null == methodDetail ? _self.methodDetail : methodDetail // ignore: cast_nullable_to_non_nullable
as String,paidAt: null == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentHistoryItem].
extension PaymentHistoryItemPatterns on PaymentHistoryItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentHistoryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentHistoryItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentHistoryItem value)  $default,){
final _that = this;
switch (_that) {
case _PaymentHistoryItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentHistoryItem value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentHistoryItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String invoiceId,  String invoiceNumber,  String description, @ApiAmountConverter()  String amount, @JsonKey(unknownEnumValue: PaymentMethod.cash)  PaymentMethod? method,  String methodLabel,  String methodDetail,  DateTime paidAt,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentHistoryItem() when $default != null:
return $default(_that.id,_that.invoiceId,_that.invoiceNumber,_that.description,_that.amount,_that.method,_that.methodLabel,_that.methodDetail,_that.paidAt,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String invoiceId,  String invoiceNumber,  String description, @ApiAmountConverter()  String amount, @JsonKey(unknownEnumValue: PaymentMethod.cash)  PaymentMethod? method,  String methodLabel,  String methodDetail,  DateTime paidAt,  String status)  $default,) {final _that = this;
switch (_that) {
case _PaymentHistoryItem():
return $default(_that.id,_that.invoiceId,_that.invoiceNumber,_that.description,_that.amount,_that.method,_that.methodLabel,_that.methodDetail,_that.paidAt,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String invoiceId,  String invoiceNumber,  String description, @ApiAmountConverter()  String amount, @JsonKey(unknownEnumValue: PaymentMethod.cash)  PaymentMethod? method,  String methodLabel,  String methodDetail,  DateTime paidAt,  String status)?  $default,) {final _that = this;
switch (_that) {
case _PaymentHistoryItem() when $default != null:
return $default(_that.id,_that.invoiceId,_that.invoiceNumber,_that.description,_that.amount,_that.method,_that.methodLabel,_that.methodDetail,_that.paidAt,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentHistoryItem implements PaymentHistoryItem {
  const _PaymentHistoryItem({required this.id, this.invoiceId = '', this.invoiceNumber = '', this.description = '', @ApiAmountConverter() this.amount = '0', @JsonKey(unknownEnumValue: PaymentMethod.cash) this.method, this.methodLabel = '', this.methodDetail = '', required this.paidAt, this.status = 'SUCCESS'});
  factory _PaymentHistoryItem.fromJson(Map<String, dynamic> json) => _$PaymentHistoryItemFromJson(json);

@override final  String id;
@override@JsonKey() final  String invoiceId;
@override@JsonKey() final  String invoiceNumber;
@override@JsonKey() final  String description;
@override@JsonKey()@ApiAmountConverter() final  String amount;
@override@JsonKey(unknownEnumValue: PaymentMethod.cash) final  PaymentMethod? method;
@override@JsonKey() final  String methodLabel;
@override@JsonKey() final  String methodDetail;
@override final  DateTime paidAt;
@override@JsonKey() final  String status;

/// Create a copy of PaymentHistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentHistoryItemCopyWith<_PaymentHistoryItem> get copyWith => __$PaymentHistoryItemCopyWithImpl<_PaymentHistoryItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentHistoryItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentHistoryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceId, invoiceId) || other.invoiceId == invoiceId)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.method, method) || other.method == method)&&(identical(other.methodLabel, methodLabel) || other.methodLabel == methodLabel)&&(identical(other.methodDetail, methodDetail) || other.methodDetail == methodDetail)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,invoiceId,invoiceNumber,description,amount,method,methodLabel,methodDetail,paidAt,status);

@override
String toString() {
  return 'PaymentHistoryItem(id: $id, invoiceId: $invoiceId, invoiceNumber: $invoiceNumber, description: $description, amount: $amount, method: $method, methodLabel: $methodLabel, methodDetail: $methodDetail, paidAt: $paidAt, status: $status)';
}


}

/// @nodoc
abstract mixin class _$PaymentHistoryItemCopyWith<$Res> implements $PaymentHistoryItemCopyWith<$Res> {
  factory _$PaymentHistoryItemCopyWith(_PaymentHistoryItem value, $Res Function(_PaymentHistoryItem) _then) = __$PaymentHistoryItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String invoiceId, String invoiceNumber, String description,@ApiAmountConverter() String amount,@JsonKey(unknownEnumValue: PaymentMethod.cash) PaymentMethod? method, String methodLabel, String methodDetail, DateTime paidAt, String status
});




}
/// @nodoc
class __$PaymentHistoryItemCopyWithImpl<$Res>
    implements _$PaymentHistoryItemCopyWith<$Res> {
  __$PaymentHistoryItemCopyWithImpl(this._self, this._then);

  final _PaymentHistoryItem _self;
  final $Res Function(_PaymentHistoryItem) _then;

/// Create a copy of PaymentHistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? invoiceId = null,Object? invoiceNumber = null,Object? description = null,Object? amount = null,Object? method = freezed,Object? methodLabel = null,Object? methodDetail = null,Object? paidAt = null,Object? status = null,}) {
  return _then(_PaymentHistoryItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,invoiceId: null == invoiceId ? _self.invoiceId : invoiceId // ignore: cast_nullable_to_non_nullable
as String,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod?,methodLabel: null == methodLabel ? _self.methodLabel : methodLabel // ignore: cast_nullable_to_non_nullable
as String,methodDetail: null == methodDetail ? _self.methodDetail : methodDetail // ignore: cast_nullable_to_non_nullable
as String,paidAt: null == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PaymentListResponse {

 List<PaymentHistoryItem> get data; int get total; int get page; int get limit;
/// Create a copy of PaymentListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentListResponseCopyWith<PaymentListResponse> get copyWith => _$PaymentListResponseCopyWithImpl<PaymentListResponse>(this as PaymentListResponse, _$identity);

  /// Serializes this PaymentListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentListResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),total,page,limit);

@override
String toString() {
  return 'PaymentListResponse(data: $data, total: $total, page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $PaymentListResponseCopyWith<$Res>  {
  factory $PaymentListResponseCopyWith(PaymentListResponse value, $Res Function(PaymentListResponse) _then) = _$PaymentListResponseCopyWithImpl;
@useResult
$Res call({
 List<PaymentHistoryItem> data, int total, int page, int limit
});




}
/// @nodoc
class _$PaymentListResponseCopyWithImpl<$Res>
    implements $PaymentListResponseCopyWith<$Res> {
  _$PaymentListResponseCopyWithImpl(this._self, this._then);

  final PaymentListResponse _self;
  final $Res Function(PaymentListResponse) _then;

/// Create a copy of PaymentListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? total = null,Object? page = null,Object? limit = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<PaymentHistoryItem>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentListResponse].
extension PaymentListResponsePatterns on PaymentListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentListResponse value)  $default,){
final _that = this;
switch (_that) {
case _PaymentListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PaymentHistoryItem> data,  int total,  int page,  int limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentListResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PaymentHistoryItem> data,  int total,  int page,  int limit)  $default,) {final _that = this;
switch (_that) {
case _PaymentListResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PaymentHistoryItem> data,  int total,  int page,  int limit)?  $default,) {final _that = this;
switch (_that) {
case _PaymentListResponse() when $default != null:
return $default(_that.data,_that.total,_that.page,_that.limit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentListResponse implements PaymentListResponse {
  const _PaymentListResponse({required final  List<PaymentHistoryItem> data, this.total = 0, this.page = 1, this.limit = 20}): _data = data;
  factory _PaymentListResponse.fromJson(Map<String, dynamic> json) => _$PaymentListResponseFromJson(json);

 final  List<PaymentHistoryItem> _data;
@override List<PaymentHistoryItem> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey() final  int total;
@override@JsonKey() final  int page;
@override@JsonKey() final  int limit;

/// Create a copy of PaymentListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentListResponseCopyWith<_PaymentListResponse> get copyWith => __$PaymentListResponseCopyWithImpl<_PaymentListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentListResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),total,page,limit);

@override
String toString() {
  return 'PaymentListResponse(data: $data, total: $total, page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$PaymentListResponseCopyWith<$Res> implements $PaymentListResponseCopyWith<$Res> {
  factory _$PaymentListResponseCopyWith(_PaymentListResponse value, $Res Function(_PaymentListResponse) _then) = __$PaymentListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<PaymentHistoryItem> data, int total, int page, int limit
});




}
/// @nodoc
class __$PaymentListResponseCopyWithImpl<$Res>
    implements _$PaymentListResponseCopyWith<$Res> {
  __$PaymentListResponseCopyWithImpl(this._self, this._then);

  final _PaymentListResponse _self;
  final $Res Function(_PaymentListResponse) _then;

/// Create a copy of PaymentListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? total = null,Object? page = null,Object? limit = null,}) {
  return _then(_PaymentListResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<PaymentHistoryItem>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ReceiptResponse {

 String get id; String get invoiceNumber;@ApiAmountConverter() String get amount; DateTime get paidAt;@JsonKey(unknownEnumValue: PaymentMethod.cash) PaymentMethod? get method; String get methodLabel; String? get url;
/// Create a copy of ReceiptResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiptResponseCopyWith<ReceiptResponse> get copyWith => _$ReceiptResponseCopyWithImpl<ReceiptResponse>(this as ReceiptResponse, _$identity);

  /// Serializes this ReceiptResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiptResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.method, method) || other.method == method)&&(identical(other.methodLabel, methodLabel) || other.methodLabel == methodLabel)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,invoiceNumber,amount,paidAt,method,methodLabel,url);

@override
String toString() {
  return 'ReceiptResponse(id: $id, invoiceNumber: $invoiceNumber, amount: $amount, paidAt: $paidAt, method: $method, methodLabel: $methodLabel, url: $url)';
}


}

/// @nodoc
abstract mixin class $ReceiptResponseCopyWith<$Res>  {
  factory $ReceiptResponseCopyWith(ReceiptResponse value, $Res Function(ReceiptResponse) _then) = _$ReceiptResponseCopyWithImpl;
@useResult
$Res call({
 String id, String invoiceNumber,@ApiAmountConverter() String amount, DateTime paidAt,@JsonKey(unknownEnumValue: PaymentMethod.cash) PaymentMethod? method, String methodLabel, String? url
});




}
/// @nodoc
class _$ReceiptResponseCopyWithImpl<$Res>
    implements $ReceiptResponseCopyWith<$Res> {
  _$ReceiptResponseCopyWithImpl(this._self, this._then);

  final ReceiptResponse _self;
  final $Res Function(ReceiptResponse) _then;

/// Create a copy of ReceiptResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? invoiceNumber = null,Object? amount = null,Object? paidAt = null,Object? method = freezed,Object? methodLabel = null,Object? url = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,paidAt: null == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod?,methodLabel: null == methodLabel ? _self.methodLabel : methodLabel // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReceiptResponse].
extension ReceiptResponsePatterns on ReceiptResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReceiptResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReceiptResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReceiptResponse value)  $default,){
final _that = this;
switch (_that) {
case _ReceiptResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReceiptResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ReceiptResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String invoiceNumber, @ApiAmountConverter()  String amount,  DateTime paidAt, @JsonKey(unknownEnumValue: PaymentMethod.cash)  PaymentMethod? method,  String methodLabel,  String? url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReceiptResponse() when $default != null:
return $default(_that.id,_that.invoiceNumber,_that.amount,_that.paidAt,_that.method,_that.methodLabel,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String invoiceNumber, @ApiAmountConverter()  String amount,  DateTime paidAt, @JsonKey(unknownEnumValue: PaymentMethod.cash)  PaymentMethod? method,  String methodLabel,  String? url)  $default,) {final _that = this;
switch (_that) {
case _ReceiptResponse():
return $default(_that.id,_that.invoiceNumber,_that.amount,_that.paidAt,_that.method,_that.methodLabel,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String invoiceNumber, @ApiAmountConverter()  String amount,  DateTime paidAt, @JsonKey(unknownEnumValue: PaymentMethod.cash)  PaymentMethod? method,  String methodLabel,  String? url)?  $default,) {final _that = this;
switch (_that) {
case _ReceiptResponse() when $default != null:
return $default(_that.id,_that.invoiceNumber,_that.amount,_that.paidAt,_that.method,_that.methodLabel,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReceiptResponse implements ReceiptResponse {
  const _ReceiptResponse({required this.id, required this.invoiceNumber, @ApiAmountConverter() required this.amount, required this.paidAt, @JsonKey(unknownEnumValue: PaymentMethod.cash) this.method, this.methodLabel = '', this.url});
  factory _ReceiptResponse.fromJson(Map<String, dynamic> json) => _$ReceiptResponseFromJson(json);

@override final  String id;
@override final  String invoiceNumber;
@override@ApiAmountConverter() final  String amount;
@override final  DateTime paidAt;
@override@JsonKey(unknownEnumValue: PaymentMethod.cash) final  PaymentMethod? method;
@override@JsonKey() final  String methodLabel;
@override final  String? url;

/// Create a copy of ReceiptResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceiptResponseCopyWith<_ReceiptResponse> get copyWith => __$ReceiptResponseCopyWithImpl<_ReceiptResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReceiptResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReceiptResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.method, method) || other.method == method)&&(identical(other.methodLabel, methodLabel) || other.methodLabel == methodLabel)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,invoiceNumber,amount,paidAt,method,methodLabel,url);

@override
String toString() {
  return 'ReceiptResponse(id: $id, invoiceNumber: $invoiceNumber, amount: $amount, paidAt: $paidAt, method: $method, methodLabel: $methodLabel, url: $url)';
}


}

/// @nodoc
abstract mixin class _$ReceiptResponseCopyWith<$Res> implements $ReceiptResponseCopyWith<$Res> {
  factory _$ReceiptResponseCopyWith(_ReceiptResponse value, $Res Function(_ReceiptResponse) _then) = __$ReceiptResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String invoiceNumber,@ApiAmountConverter() String amount, DateTime paidAt,@JsonKey(unknownEnumValue: PaymentMethod.cash) PaymentMethod? method, String methodLabel, String? url
});




}
/// @nodoc
class __$ReceiptResponseCopyWithImpl<$Res>
    implements _$ReceiptResponseCopyWith<$Res> {
  __$ReceiptResponseCopyWithImpl(this._self, this._then);

  final _ReceiptResponse _self;
  final $Res Function(_ReceiptResponse) _then;

/// Create a copy of ReceiptResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? invoiceNumber = null,Object? amount = null,Object? paidAt = null,Object? method = freezed,Object? methodLabel = null,Object? url = freezed,}) {
  return _then(_ReceiptResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,paidAt: null == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod?,methodLabel: null == methodLabel ? _self.methodLabel : methodLabel // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$BillingDashboard {

 BillingSummaryResponse get summary; List<InvoiceSummary> get unpaidInvoices; int get unpaidTotal; List<PaymentHistoryItem> get recentPayments; int get paymentsTotal;
/// Create a copy of BillingDashboard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillingDashboardCopyWith<BillingDashboard> get copyWith => _$BillingDashboardCopyWithImpl<BillingDashboard>(this as BillingDashboard, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillingDashboard&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.unpaidInvoices, unpaidInvoices)&&(identical(other.unpaidTotal, unpaidTotal) || other.unpaidTotal == unpaidTotal)&&const DeepCollectionEquality().equals(other.recentPayments, recentPayments)&&(identical(other.paymentsTotal, paymentsTotal) || other.paymentsTotal == paymentsTotal));
}


@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(unpaidInvoices),unpaidTotal,const DeepCollectionEquality().hash(recentPayments),paymentsTotal);

@override
String toString() {
  return 'BillingDashboard(summary: $summary, unpaidInvoices: $unpaidInvoices, unpaidTotal: $unpaidTotal, recentPayments: $recentPayments, paymentsTotal: $paymentsTotal)';
}


}

/// @nodoc
abstract mixin class $BillingDashboardCopyWith<$Res>  {
  factory $BillingDashboardCopyWith(BillingDashboard value, $Res Function(BillingDashboard) _then) = _$BillingDashboardCopyWithImpl;
@useResult
$Res call({
 BillingSummaryResponse summary, List<InvoiceSummary> unpaidInvoices, int unpaidTotal, List<PaymentHistoryItem> recentPayments, int paymentsTotal
});


$BillingSummaryResponseCopyWith<$Res> get summary;

}
/// @nodoc
class _$BillingDashboardCopyWithImpl<$Res>
    implements $BillingDashboardCopyWith<$Res> {
  _$BillingDashboardCopyWithImpl(this._self, this._then);

  final BillingDashboard _self;
  final $Res Function(BillingDashboard) _then;

/// Create a copy of BillingDashboard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = null,Object? unpaidInvoices = null,Object? unpaidTotal = null,Object? recentPayments = null,Object? paymentsTotal = null,}) {
  return _then(_self.copyWith(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as BillingSummaryResponse,unpaidInvoices: null == unpaidInvoices ? _self.unpaidInvoices : unpaidInvoices // ignore: cast_nullable_to_non_nullable
as List<InvoiceSummary>,unpaidTotal: null == unpaidTotal ? _self.unpaidTotal : unpaidTotal // ignore: cast_nullable_to_non_nullable
as int,recentPayments: null == recentPayments ? _self.recentPayments : recentPayments // ignore: cast_nullable_to_non_nullable
as List<PaymentHistoryItem>,paymentsTotal: null == paymentsTotal ? _self.paymentsTotal : paymentsTotal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of BillingDashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BillingSummaryResponseCopyWith<$Res> get summary {
  
  return $BillingSummaryResponseCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [BillingDashboard].
extension BillingDashboardPatterns on BillingDashboard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BillingDashboard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BillingDashboard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BillingDashboard value)  $default,){
final _that = this;
switch (_that) {
case _BillingDashboard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BillingDashboard value)?  $default,){
final _that = this;
switch (_that) {
case _BillingDashboard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BillingSummaryResponse summary,  List<InvoiceSummary> unpaidInvoices,  int unpaidTotal,  List<PaymentHistoryItem> recentPayments,  int paymentsTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BillingDashboard() when $default != null:
return $default(_that.summary,_that.unpaidInvoices,_that.unpaidTotal,_that.recentPayments,_that.paymentsTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BillingSummaryResponse summary,  List<InvoiceSummary> unpaidInvoices,  int unpaidTotal,  List<PaymentHistoryItem> recentPayments,  int paymentsTotal)  $default,) {final _that = this;
switch (_that) {
case _BillingDashboard():
return $default(_that.summary,_that.unpaidInvoices,_that.unpaidTotal,_that.recentPayments,_that.paymentsTotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BillingSummaryResponse summary,  List<InvoiceSummary> unpaidInvoices,  int unpaidTotal,  List<PaymentHistoryItem> recentPayments,  int paymentsTotal)?  $default,) {final _that = this;
switch (_that) {
case _BillingDashboard() when $default != null:
return $default(_that.summary,_that.unpaidInvoices,_that.unpaidTotal,_that.recentPayments,_that.paymentsTotal);case _:
  return null;

}
}

}

/// @nodoc


class _BillingDashboard implements BillingDashboard {
  const _BillingDashboard({required this.summary, required final  List<InvoiceSummary> unpaidInvoices, required this.unpaidTotal, required final  List<PaymentHistoryItem> recentPayments, required this.paymentsTotal}): _unpaidInvoices = unpaidInvoices,_recentPayments = recentPayments;
  

@override final  BillingSummaryResponse summary;
 final  List<InvoiceSummary> _unpaidInvoices;
@override List<InvoiceSummary> get unpaidInvoices {
  if (_unpaidInvoices is EqualUnmodifiableListView) return _unpaidInvoices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_unpaidInvoices);
}

@override final  int unpaidTotal;
 final  List<PaymentHistoryItem> _recentPayments;
@override List<PaymentHistoryItem> get recentPayments {
  if (_recentPayments is EqualUnmodifiableListView) return _recentPayments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentPayments);
}

@override final  int paymentsTotal;

/// Create a copy of BillingDashboard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BillingDashboardCopyWith<_BillingDashboard> get copyWith => __$BillingDashboardCopyWithImpl<_BillingDashboard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BillingDashboard&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._unpaidInvoices, _unpaidInvoices)&&(identical(other.unpaidTotal, unpaidTotal) || other.unpaidTotal == unpaidTotal)&&const DeepCollectionEquality().equals(other._recentPayments, _recentPayments)&&(identical(other.paymentsTotal, paymentsTotal) || other.paymentsTotal == paymentsTotal));
}


@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(_unpaidInvoices),unpaidTotal,const DeepCollectionEquality().hash(_recentPayments),paymentsTotal);

@override
String toString() {
  return 'BillingDashboard(summary: $summary, unpaidInvoices: $unpaidInvoices, unpaidTotal: $unpaidTotal, recentPayments: $recentPayments, paymentsTotal: $paymentsTotal)';
}


}

/// @nodoc
abstract mixin class _$BillingDashboardCopyWith<$Res> implements $BillingDashboardCopyWith<$Res> {
  factory _$BillingDashboardCopyWith(_BillingDashboard value, $Res Function(_BillingDashboard) _then) = __$BillingDashboardCopyWithImpl;
@override @useResult
$Res call({
 BillingSummaryResponse summary, List<InvoiceSummary> unpaidInvoices, int unpaidTotal, List<PaymentHistoryItem> recentPayments, int paymentsTotal
});


@override $BillingSummaryResponseCopyWith<$Res> get summary;

}
/// @nodoc
class __$BillingDashboardCopyWithImpl<$Res>
    implements _$BillingDashboardCopyWith<$Res> {
  __$BillingDashboardCopyWithImpl(this._self, this._then);

  final _BillingDashboard _self;
  final $Res Function(_BillingDashboard) _then;

/// Create a copy of BillingDashboard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = null,Object? unpaidInvoices = null,Object? unpaidTotal = null,Object? recentPayments = null,Object? paymentsTotal = null,}) {
  return _then(_BillingDashboard(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as BillingSummaryResponse,unpaidInvoices: null == unpaidInvoices ? _self._unpaidInvoices : unpaidInvoices // ignore: cast_nullable_to_non_nullable
as List<InvoiceSummary>,unpaidTotal: null == unpaidTotal ? _self.unpaidTotal : unpaidTotal // ignore: cast_nullable_to_non_nullable
as int,recentPayments: null == recentPayments ? _self._recentPayments : recentPayments // ignore: cast_nullable_to_non_nullable
as List<PaymentHistoryItem>,paymentsTotal: null == paymentsTotal ? _self.paymentsTotal : paymentsTotal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of BillingDashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BillingSummaryResponseCopyWith<$Res> get summary {
  
  return $BillingSummaryResponseCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}

// dart format on
