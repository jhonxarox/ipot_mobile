// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SelectedOption {

 int get groupId; CustomizationOption get option; int get quantity;
/// Create a copy of SelectedOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectedOptionCopyWith<SelectedOption> get copyWith => _$SelectedOptionCopyWithImpl<SelectedOption>(this as SelectedOption, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectedOption&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.option, option) || other.option == option)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,groupId,option,quantity);

@override
String toString() {
  return 'SelectedOption(groupId: $groupId, option: $option, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $SelectedOptionCopyWith<$Res>  {
  factory $SelectedOptionCopyWith(SelectedOption value, $Res Function(SelectedOption) _then) = _$SelectedOptionCopyWithImpl;
@useResult
$Res call({
 int groupId, CustomizationOption option, int quantity
});


$CustomizationOptionCopyWith<$Res> get option;

}
/// @nodoc
class _$SelectedOptionCopyWithImpl<$Res>
    implements $SelectedOptionCopyWith<$Res> {
  _$SelectedOptionCopyWithImpl(this._self, this._then);

  final SelectedOption _self;
  final $Res Function(SelectedOption) _then;

/// Create a copy of SelectedOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groupId = null,Object? option = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,option: null == option ? _self.option : option // ignore: cast_nullable_to_non_nullable
as CustomizationOption,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of SelectedOption
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomizationOptionCopyWith<$Res> get option {
  
  return $CustomizationOptionCopyWith<$Res>(_self.option, (value) {
    return _then(_self.copyWith(option: value));
  });
}
}


/// Adds pattern-matching-related methods to [SelectedOption].
extension SelectedOptionPatterns on SelectedOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SelectedOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectedOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SelectedOption value)  $default,){
final _that = this;
switch (_that) {
case _SelectedOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SelectedOption value)?  $default,){
final _that = this;
switch (_that) {
case _SelectedOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int groupId,  CustomizationOption option,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectedOption() when $default != null:
return $default(_that.groupId,_that.option,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int groupId,  CustomizationOption option,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _SelectedOption():
return $default(_that.groupId,_that.option,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int groupId,  CustomizationOption option,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _SelectedOption() when $default != null:
return $default(_that.groupId,_that.option,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc


class _SelectedOption implements SelectedOption {
  const _SelectedOption({required this.groupId, required this.option, required this.quantity});
  

@override final  int groupId;
@override final  CustomizationOption option;
@override final  int quantity;

/// Create a copy of SelectedOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectedOptionCopyWith<_SelectedOption> get copyWith => __$SelectedOptionCopyWithImpl<_SelectedOption>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectedOption&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.option, option) || other.option == option)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,groupId,option,quantity);

@override
String toString() {
  return 'SelectedOption(groupId: $groupId, option: $option, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$SelectedOptionCopyWith<$Res> implements $SelectedOptionCopyWith<$Res> {
  factory _$SelectedOptionCopyWith(_SelectedOption value, $Res Function(_SelectedOption) _then) = __$SelectedOptionCopyWithImpl;
@override @useResult
$Res call({
 int groupId, CustomizationOption option, int quantity
});


@override $CustomizationOptionCopyWith<$Res> get option;

}
/// @nodoc
class __$SelectedOptionCopyWithImpl<$Res>
    implements _$SelectedOptionCopyWith<$Res> {
  __$SelectedOptionCopyWithImpl(this._self, this._then);

  final _SelectedOption _self;
  final $Res Function(_SelectedOption) _then;

/// Create a copy of SelectedOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groupId = null,Object? option = null,Object? quantity = null,}) {
  return _then(_SelectedOption(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,option: null == option ? _self.option : option // ignore: cast_nullable_to_non_nullable
as CustomizationOption,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of SelectedOption
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomizationOptionCopyWith<$Res> get option {
  
  return $CustomizationOptionCopyWith<$Res>(_self.option, (value) {
    return _then(_self.copyWith(option: value));
  });
}
}

// dart format on
