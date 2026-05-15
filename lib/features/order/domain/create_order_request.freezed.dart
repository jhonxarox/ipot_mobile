// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateOrderRequest {

@JsonKey(name: 'table_id') String get tableId; List<CreateOrderItemRequest> get items;@JsonKey(name: 'customer_note') String? get customerNote;
/// Create a copy of CreateOrderRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateOrderRequestCopyWith<CreateOrderRequest> get copyWith => _$CreateOrderRequestCopyWithImpl<CreateOrderRequest>(this as CreateOrderRequest, _$identity);

  /// Serializes this CreateOrderRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOrderRequest&&(identical(other.tableId, tableId) || other.tableId == tableId)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.customerNote, customerNote) || other.customerNote == customerNote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tableId,const DeepCollectionEquality().hash(items),customerNote);

@override
String toString() {
  return 'CreateOrderRequest(tableId: $tableId, items: $items, customerNote: $customerNote)';
}


}

/// @nodoc
abstract mixin class $CreateOrderRequestCopyWith<$Res>  {
  factory $CreateOrderRequestCopyWith(CreateOrderRequest value, $Res Function(CreateOrderRequest) _then) = _$CreateOrderRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'table_id') String tableId, List<CreateOrderItemRequest> items,@JsonKey(name: 'customer_note') String? customerNote
});




}
/// @nodoc
class _$CreateOrderRequestCopyWithImpl<$Res>
    implements $CreateOrderRequestCopyWith<$Res> {
  _$CreateOrderRequestCopyWithImpl(this._self, this._then);

  final CreateOrderRequest _self;
  final $Res Function(CreateOrderRequest) _then;

/// Create a copy of CreateOrderRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tableId = null,Object? items = null,Object? customerNote = freezed,}) {
  return _then(_self.copyWith(
tableId: null == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CreateOrderItemRequest>,customerNote: freezed == customerNote ? _self.customerNote : customerNote // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateOrderRequest].
extension CreateOrderRequestPatterns on CreateOrderRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateOrderRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateOrderRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateOrderRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateOrderRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateOrderRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateOrderRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'table_id')  String tableId,  List<CreateOrderItemRequest> items, @JsonKey(name: 'customer_note')  String? customerNote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateOrderRequest() when $default != null:
return $default(_that.tableId,_that.items,_that.customerNote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'table_id')  String tableId,  List<CreateOrderItemRequest> items, @JsonKey(name: 'customer_note')  String? customerNote)  $default,) {final _that = this;
switch (_that) {
case _CreateOrderRequest():
return $default(_that.tableId,_that.items,_that.customerNote);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'table_id')  String tableId,  List<CreateOrderItemRequest> items, @JsonKey(name: 'customer_note')  String? customerNote)?  $default,) {final _that = this;
switch (_that) {
case _CreateOrderRequest() when $default != null:
return $default(_that.tableId,_that.items,_that.customerNote);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateOrderRequest implements CreateOrderRequest {
  const _CreateOrderRequest({@JsonKey(name: 'table_id') required this.tableId, required final  List<CreateOrderItemRequest> items, @JsonKey(name: 'customer_note') this.customerNote}): _items = items;
  factory _CreateOrderRequest.fromJson(Map<String, dynamic> json) => _$CreateOrderRequestFromJson(json);

@override@JsonKey(name: 'table_id') final  String tableId;
 final  List<CreateOrderItemRequest> _items;
@override List<CreateOrderItemRequest> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey(name: 'customer_note') final  String? customerNote;

/// Create a copy of CreateOrderRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateOrderRequestCopyWith<_CreateOrderRequest> get copyWith => __$CreateOrderRequestCopyWithImpl<_CreateOrderRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateOrderRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateOrderRequest&&(identical(other.tableId, tableId) || other.tableId == tableId)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.customerNote, customerNote) || other.customerNote == customerNote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tableId,const DeepCollectionEquality().hash(_items),customerNote);

@override
String toString() {
  return 'CreateOrderRequest(tableId: $tableId, items: $items, customerNote: $customerNote)';
}


}

/// @nodoc
abstract mixin class _$CreateOrderRequestCopyWith<$Res> implements $CreateOrderRequestCopyWith<$Res> {
  factory _$CreateOrderRequestCopyWith(_CreateOrderRequest value, $Res Function(_CreateOrderRequest) _then) = __$CreateOrderRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'table_id') String tableId, List<CreateOrderItemRequest> items,@JsonKey(name: 'customer_note') String? customerNote
});




}
/// @nodoc
class __$CreateOrderRequestCopyWithImpl<$Res>
    implements _$CreateOrderRequestCopyWith<$Res> {
  __$CreateOrderRequestCopyWithImpl(this._self, this._then);

  final _CreateOrderRequest _self;
  final $Res Function(_CreateOrderRequest) _then;

/// Create a copy of CreateOrderRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tableId = null,Object? items = null,Object? customerNote = freezed,}) {
  return _then(_CreateOrderRequest(
tableId: null == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CreateOrderItemRequest>,customerNote: freezed == customerNote ? _self.customerNote : customerNote // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CreateOrderItemRequest {

@JsonKey(name: 'menu_item_id') int get menuItemId; int get quantity; List<CreateOrderCustomizationRequest> get customizations;
/// Create a copy of CreateOrderItemRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateOrderItemRequestCopyWith<CreateOrderItemRequest> get copyWith => _$CreateOrderItemRequestCopyWithImpl<CreateOrderItemRequest>(this as CreateOrderItemRequest, _$identity);

  /// Serializes this CreateOrderItemRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOrderItemRequest&&(identical(other.menuItemId, menuItemId) || other.menuItemId == menuItemId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other.customizations, customizations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menuItemId,quantity,const DeepCollectionEquality().hash(customizations));

@override
String toString() {
  return 'CreateOrderItemRequest(menuItemId: $menuItemId, quantity: $quantity, customizations: $customizations)';
}


}

/// @nodoc
abstract mixin class $CreateOrderItemRequestCopyWith<$Res>  {
  factory $CreateOrderItemRequestCopyWith(CreateOrderItemRequest value, $Res Function(CreateOrderItemRequest) _then) = _$CreateOrderItemRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'menu_item_id') int menuItemId, int quantity, List<CreateOrderCustomizationRequest> customizations
});




}
/// @nodoc
class _$CreateOrderItemRequestCopyWithImpl<$Res>
    implements $CreateOrderItemRequestCopyWith<$Res> {
  _$CreateOrderItemRequestCopyWithImpl(this._self, this._then);

  final CreateOrderItemRequest _self;
  final $Res Function(CreateOrderItemRequest) _then;

/// Create a copy of CreateOrderItemRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? menuItemId = null,Object? quantity = null,Object? customizations = null,}) {
  return _then(_self.copyWith(
menuItemId: null == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,customizations: null == customizations ? _self.customizations : customizations // ignore: cast_nullable_to_non_nullable
as List<CreateOrderCustomizationRequest>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateOrderItemRequest].
extension CreateOrderItemRequestPatterns on CreateOrderItemRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateOrderItemRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateOrderItemRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateOrderItemRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateOrderItemRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateOrderItemRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateOrderItemRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'menu_item_id')  int menuItemId,  int quantity,  List<CreateOrderCustomizationRequest> customizations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateOrderItemRequest() when $default != null:
return $default(_that.menuItemId,_that.quantity,_that.customizations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'menu_item_id')  int menuItemId,  int quantity,  List<CreateOrderCustomizationRequest> customizations)  $default,) {final _that = this;
switch (_that) {
case _CreateOrderItemRequest():
return $default(_that.menuItemId,_that.quantity,_that.customizations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'menu_item_id')  int menuItemId,  int quantity,  List<CreateOrderCustomizationRequest> customizations)?  $default,) {final _that = this;
switch (_that) {
case _CreateOrderItemRequest() when $default != null:
return $default(_that.menuItemId,_that.quantity,_that.customizations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateOrderItemRequest implements CreateOrderItemRequest {
  const _CreateOrderItemRequest({@JsonKey(name: 'menu_item_id') required this.menuItemId, required this.quantity, final  List<CreateOrderCustomizationRequest> customizations = const []}): _customizations = customizations;
  factory _CreateOrderItemRequest.fromJson(Map<String, dynamic> json) => _$CreateOrderItemRequestFromJson(json);

@override@JsonKey(name: 'menu_item_id') final  int menuItemId;
@override final  int quantity;
 final  List<CreateOrderCustomizationRequest> _customizations;
@override@JsonKey() List<CreateOrderCustomizationRequest> get customizations {
  if (_customizations is EqualUnmodifiableListView) return _customizations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_customizations);
}


/// Create a copy of CreateOrderItemRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateOrderItemRequestCopyWith<_CreateOrderItemRequest> get copyWith => __$CreateOrderItemRequestCopyWithImpl<_CreateOrderItemRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateOrderItemRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateOrderItemRequest&&(identical(other.menuItemId, menuItemId) || other.menuItemId == menuItemId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other._customizations, _customizations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menuItemId,quantity,const DeepCollectionEquality().hash(_customizations));

@override
String toString() {
  return 'CreateOrderItemRequest(menuItemId: $menuItemId, quantity: $quantity, customizations: $customizations)';
}


}

/// @nodoc
abstract mixin class _$CreateOrderItemRequestCopyWith<$Res> implements $CreateOrderItemRequestCopyWith<$Res> {
  factory _$CreateOrderItemRequestCopyWith(_CreateOrderItemRequest value, $Res Function(_CreateOrderItemRequest) _then) = __$CreateOrderItemRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'menu_item_id') int menuItemId, int quantity, List<CreateOrderCustomizationRequest> customizations
});




}
/// @nodoc
class __$CreateOrderItemRequestCopyWithImpl<$Res>
    implements _$CreateOrderItemRequestCopyWith<$Res> {
  __$CreateOrderItemRequestCopyWithImpl(this._self, this._then);

  final _CreateOrderItemRequest _self;
  final $Res Function(_CreateOrderItemRequest) _then;

/// Create a copy of CreateOrderItemRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? menuItemId = null,Object? quantity = null,Object? customizations = null,}) {
  return _then(_CreateOrderItemRequest(
menuItemId: null == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,customizations: null == customizations ? _self._customizations : customizations // ignore: cast_nullable_to_non_nullable
as List<CreateOrderCustomizationRequest>,
  ));
}


}


/// @nodoc
mixin _$CreateOrderCustomizationRequest {

@JsonKey(name: 'option_id') int get optionId; int get quantity;
/// Create a copy of CreateOrderCustomizationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateOrderCustomizationRequestCopyWith<CreateOrderCustomizationRequest> get copyWith => _$CreateOrderCustomizationRequestCopyWithImpl<CreateOrderCustomizationRequest>(this as CreateOrderCustomizationRequest, _$identity);

  /// Serializes this CreateOrderCustomizationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOrderCustomizationRequest&&(identical(other.optionId, optionId) || other.optionId == optionId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,optionId,quantity);

@override
String toString() {
  return 'CreateOrderCustomizationRequest(optionId: $optionId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $CreateOrderCustomizationRequestCopyWith<$Res>  {
  factory $CreateOrderCustomizationRequestCopyWith(CreateOrderCustomizationRequest value, $Res Function(CreateOrderCustomizationRequest) _then) = _$CreateOrderCustomizationRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'option_id') int optionId, int quantity
});




}
/// @nodoc
class _$CreateOrderCustomizationRequestCopyWithImpl<$Res>
    implements $CreateOrderCustomizationRequestCopyWith<$Res> {
  _$CreateOrderCustomizationRequestCopyWithImpl(this._self, this._then);

  final CreateOrderCustomizationRequest _self;
  final $Res Function(CreateOrderCustomizationRequest) _then;

/// Create a copy of CreateOrderCustomizationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? optionId = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
optionId: null == optionId ? _self.optionId : optionId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateOrderCustomizationRequest].
extension CreateOrderCustomizationRequestPatterns on CreateOrderCustomizationRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateOrderCustomizationRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateOrderCustomizationRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateOrderCustomizationRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateOrderCustomizationRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateOrderCustomizationRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateOrderCustomizationRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'option_id')  int optionId,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateOrderCustomizationRequest() when $default != null:
return $default(_that.optionId,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'option_id')  int optionId,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _CreateOrderCustomizationRequest():
return $default(_that.optionId,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'option_id')  int optionId,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _CreateOrderCustomizationRequest() when $default != null:
return $default(_that.optionId,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateOrderCustomizationRequest implements CreateOrderCustomizationRequest {
  const _CreateOrderCustomizationRequest({@JsonKey(name: 'option_id') required this.optionId, required this.quantity});
  factory _CreateOrderCustomizationRequest.fromJson(Map<String, dynamic> json) => _$CreateOrderCustomizationRequestFromJson(json);

@override@JsonKey(name: 'option_id') final  int optionId;
@override final  int quantity;

/// Create a copy of CreateOrderCustomizationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateOrderCustomizationRequestCopyWith<_CreateOrderCustomizationRequest> get copyWith => __$CreateOrderCustomizationRequestCopyWithImpl<_CreateOrderCustomizationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateOrderCustomizationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateOrderCustomizationRequest&&(identical(other.optionId, optionId) || other.optionId == optionId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,optionId,quantity);

@override
String toString() {
  return 'CreateOrderCustomizationRequest(optionId: $optionId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$CreateOrderCustomizationRequestCopyWith<$Res> implements $CreateOrderCustomizationRequestCopyWith<$Res> {
  factory _$CreateOrderCustomizationRequestCopyWith(_CreateOrderCustomizationRequest value, $Res Function(_CreateOrderCustomizationRequest) _then) = __$CreateOrderCustomizationRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'option_id') int optionId, int quantity
});




}
/// @nodoc
class __$CreateOrderCustomizationRequestCopyWithImpl<$Res>
    implements _$CreateOrderCustomizationRequestCopyWith<$Res> {
  __$CreateOrderCustomizationRequestCopyWithImpl(this._self, this._then);

  final _CreateOrderCustomizationRequest _self;
  final $Res Function(_CreateOrderCustomizationRequest) _then;

/// Create a copy of CreateOrderCustomizationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? optionId = null,Object? quantity = null,}) {
  return _then(_CreateOrderCustomizationRequest(
optionId: null == optionId ? _self.optionId : optionId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
