// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartLine {

 String get id; MenuItem get item; List<SelectedOption> get selections; int get quantity;
/// Create a copy of CartLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartLineCopyWith<CartLine> get copyWith => _$CartLineCopyWithImpl<CartLine>(this as CartLine, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartLine&&(identical(other.id, id) || other.id == id)&&(identical(other.item, item) || other.item == item)&&const DeepCollectionEquality().equals(other.selections, selections)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,id,item,const DeepCollectionEquality().hash(selections),quantity);

@override
String toString() {
  return 'CartLine(id: $id, item: $item, selections: $selections, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $CartLineCopyWith<$Res>  {
  factory $CartLineCopyWith(CartLine value, $Res Function(CartLine) _then) = _$CartLineCopyWithImpl;
@useResult
$Res call({
 String id, MenuItem item, List<SelectedOption> selections, int quantity
});


$MenuItemCopyWith<$Res> get item;

}
/// @nodoc
class _$CartLineCopyWithImpl<$Res>
    implements $CartLineCopyWith<$Res> {
  _$CartLineCopyWithImpl(this._self, this._then);

  final CartLine _self;
  final $Res Function(CartLine) _then;

/// Create a copy of CartLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? item = null,Object? selections = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as MenuItem,selections: null == selections ? _self.selections : selections // ignore: cast_nullable_to_non_nullable
as List<SelectedOption>,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of CartLine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuItemCopyWith<$Res> get item {
  
  return $MenuItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// Adds pattern-matching-related methods to [CartLine].
extension CartLinePatterns on CartLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartLine value)  $default,){
final _that = this;
switch (_that) {
case _CartLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartLine value)?  $default,){
final _that = this;
switch (_that) {
case _CartLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  MenuItem item,  List<SelectedOption> selections,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartLine() when $default != null:
return $default(_that.id,_that.item,_that.selections,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  MenuItem item,  List<SelectedOption> selections,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _CartLine():
return $default(_that.id,_that.item,_that.selections,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  MenuItem item,  List<SelectedOption> selections,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _CartLine() when $default != null:
return $default(_that.id,_that.item,_that.selections,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc


class _CartLine implements CartLine {
  const _CartLine({required this.id, required this.item, required final  List<SelectedOption> selections, required this.quantity}): _selections = selections;
  

@override final  String id;
@override final  MenuItem item;
 final  List<SelectedOption> _selections;
@override List<SelectedOption> get selections {
  if (_selections is EqualUnmodifiableListView) return _selections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selections);
}

@override final  int quantity;

/// Create a copy of CartLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartLineCopyWith<_CartLine> get copyWith => __$CartLineCopyWithImpl<_CartLine>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartLine&&(identical(other.id, id) || other.id == id)&&(identical(other.item, item) || other.item == item)&&const DeepCollectionEquality().equals(other._selections, _selections)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,id,item,const DeepCollectionEquality().hash(_selections),quantity);

@override
String toString() {
  return 'CartLine(id: $id, item: $item, selections: $selections, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$CartLineCopyWith<$Res> implements $CartLineCopyWith<$Res> {
  factory _$CartLineCopyWith(_CartLine value, $Res Function(_CartLine) _then) = __$CartLineCopyWithImpl;
@override @useResult
$Res call({
 String id, MenuItem item, List<SelectedOption> selections, int quantity
});


@override $MenuItemCopyWith<$Res> get item;

}
/// @nodoc
class __$CartLineCopyWithImpl<$Res>
    implements _$CartLineCopyWith<$Res> {
  __$CartLineCopyWithImpl(this._self, this._then);

  final _CartLine _self;
  final $Res Function(_CartLine) _then;

/// Create a copy of CartLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? item = null,Object? selections = null,Object? quantity = null,}) {
  return _then(_CartLine(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as MenuItem,selections: null == selections ? _self._selections : selections // ignore: cast_nullable_to_non_nullable
as List<SelectedOption>,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of CartLine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuItemCopyWith<$Res> get item {
  
  return $MenuItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

// dart format on
