import 'package:freezed_annotation/freezed_annotation.dart';

import 'cart_line.dart';

part 'cart.freezed.dart';

@freezed
abstract class Cart with _$Cart {
  const factory Cart({
    @Default([]) List<CartLine> lines,
    @Default('') String customerNote,
    String? tableId,
  }) = _Cart;
}
