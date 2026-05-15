// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Cart {

 List<CartLine> get lines; String get customerNote; String? get tableId;
/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartCopyWith<Cart> get copyWith => _$CartCopyWithImpl<Cart>(this as Cart, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cart&&const DeepCollectionEquality().equals(other.lines, lines)&&(identical(other.customerNote, customerNote) || other.customerNote == customerNote)&&(identical(other.tableId, tableId) || other.tableId == tableId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(lines),customerNote,tableId);

@override
String toString() {
  return 'Cart(lines: $lines, customerNote: $customerNote, tableId: $tableId)';
}


}

/// @nodoc
abstract mixin class $CartCopyWith<$Res>  {
  factory $CartCopyWith(Cart value, $Res Function(Cart) _then) = _$CartCopyWithImpl;
@useResult
$Res call({
 List<CartLine> lines, String customerNote, String? tableId
});




}
/// @nodoc
class _$CartCopyWithImpl<$Res>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._self, this._then);

  final Cart _self;
  final $Res Function(Cart) _then;

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lines = null,Object? customerNote = null,Object? tableId = freezed,}) {
  return _then(_self.copyWith(
lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<CartLine>,customerNote: null == customerNote ? _self.customerNote : customerNote // ignore: cast_nullable_to_non_nullable
as String,tableId: freezed == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Cart].
extension CartPatterns on Cart {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Cart value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Cart() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Cart value)  $default,){
final _that = this;
switch (_that) {
case _Cart():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Cart value)?  $default,){
final _that = this;
switch (_that) {
case _Cart() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CartLine> lines,  String customerNote,  String? tableId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Cart() when $default != null:
return $default(_that.lines,_that.customerNote,_that.tableId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CartLine> lines,  String customerNote,  String? tableId)  $default,) {final _that = this;
switch (_that) {
case _Cart():
return $default(_that.lines,_that.customerNote,_that.tableId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CartLine> lines,  String customerNote,  String? tableId)?  $default,) {final _that = this;
switch (_that) {
case _Cart() when $default != null:
return $default(_that.lines,_that.customerNote,_that.tableId);case _:
  return null;

}
}

}

/// @nodoc


class _Cart implements Cart {
  const _Cart({final  List<CartLine> lines = const [], this.customerNote = '', this.tableId}): _lines = lines;
  

 final  List<CartLine> _lines;
@override@JsonKey() List<CartLine> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

@override@JsonKey() final  String customerNote;
@override final  String? tableId;

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartCopyWith<_Cart> get copyWith => __$CartCopyWithImpl<_Cart>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cart&&const DeepCollectionEquality().equals(other._lines, _lines)&&(identical(other.customerNote, customerNote) || other.customerNote == customerNote)&&(identical(other.tableId, tableId) || other.tableId == tableId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_lines),customerNote,tableId);

@override
String toString() {
  return 'Cart(lines: $lines, customerNote: $customerNote, tableId: $tableId)';
}


}

/// @nodoc
abstract mixin class _$CartCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$CartCopyWith(_Cart value, $Res Function(_Cart) _then) = __$CartCopyWithImpl;
@override @useResult
$Res call({
 List<CartLine> lines, String customerNote, String? tableId
});




}
/// @nodoc
class __$CartCopyWithImpl<$Res>
    implements _$CartCopyWith<$Res> {
  __$CartCopyWithImpl(this._self, this._then);

  final _Cart _self;
  final $Res Function(_Cart) _then;

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lines = null,Object? customerNote = null,Object? tableId = freezed,}) {
  return _then(_Cart(
lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<CartLine>,customerNote: null == customerNote ? _self.customerNote : customerNote // ignore: cast_nullable_to_non_nullable
as String,tableId: freezed == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
