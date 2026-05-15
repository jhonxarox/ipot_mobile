import 'package:freezed_annotation/freezed_annotation.dart';

import '../../menu/domain/menu_item.dart';
import 'selected_option.dart';

part 'cart_line.freezed.dart';

@freezed
abstract class CartLine with _$CartLine {
  const factory CartLine({
    required String id,
    required MenuItem item,
    required List<SelectedOption> selections,
    required int quantity,
  }) = _CartLine;
}

/// Stable line key: menu item id + sorted option ids and quantities.
String cartLineId(int menuItemId, List<SelectedOption> selections) {
  final sorted = List<SelectedOption>.from(selections)
    ..sort((a, b) {
      final byGroup = a.groupId.compareTo(b.groupId);
      if (byGroup != 0) return byGroup;
      return a.option.id.compareTo(b.option.id);
    });

  final optionKey = sorted
      .map((selection) => '${selection.option.id}:${selection.quantity}')
      .join(',');

  return '$menuItemId|$optionKey';
}
