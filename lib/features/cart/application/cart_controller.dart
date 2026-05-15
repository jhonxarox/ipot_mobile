import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../menu/domain/menu_item.dart';
import '../domain/cart.dart';
import '../domain/cart_line.dart';
import '../domain/cart_validation.dart';
import '../domain/pricing.dart';
import '../domain/selected_option.dart';

/// In-memory cart state. Survives navigation via [ref.keepAlive]; persistence
/// is deferred (shared_preferences was cut from B0 scope).
class CartController extends Notifier<Cart> {
  @override
  Cart build() {
    ref.keepAlive();
    return const Cart();
  }

  void setTableId(String tableId) {
    state = state.copyWith(tableId: tableId);
  }

  void setCustomerNote(String note) {
    state = state.copyWith(customerNote: note);
  }

  void clear() {
    state = Cart(tableId: state.tableId);
  }

  /// Adds [item] with [selections], or increments quantity when the line key
  /// already exists. Returns validation errors without mutating the cart.
  List<CustomizationError> addItem(
    MenuItem item,
    List<SelectedOption> selections, {
    int quantity = 1,
  }) {
    if (quantity < 1) return const [];

    final errors = validateSelections(item, selections);
    if (errors.isNotEmpty) return errors;

    final lineId = cartLineId(item.id, selections);
    final existingIndex = state.lines.indexWhere((line) => line.id == lineId);

    if (existingIndex >= 0) {
      final existing = state.lines[existingIndex];
      final updated = existing.copyWith(quantity: existing.quantity + quantity);
      final lines = [...state.lines]..[existingIndex] = updated;
      state = state.copyWith(lines: lines);
    } else {
      final line = CartLine(
        id: lineId,
        item: item,
        selections: selections,
        quantity: quantity,
      );
      state = state.copyWith(lines: [...state.lines, line]);
    }

    return const [];
  }

  void updateLineQuantity(String lineId, int quantity) {
    if (quantity <= 0) {
      removeLine(lineId);
      return;
    }

    final index = state.lines.indexWhere((line) => line.id == lineId);
    if (index < 0) return;

    final lines = [...state.lines];
    lines[index] = lines[index].copyWith(quantity: quantity);
    state = state.copyWith(lines: lines);
  }

  void removeLine(String lineId) {
    state = state.copyWith(
      lines: state.lines.where((line) => line.id != lineId).toList(),
    );
  }

  int get itemCount => state.lines.fold<int>(0, (sum, line) => sum + line.quantity);
}

final cartProvider = NotifierProvider<CartController, Cart>(
  CartController.new,
);

final cartSubtotalProvider = Provider<double>((ref) {
  return cartSubtotal(ref.watch(cartProvider));
});

final cartItemCountProvider = Provider<int>((ref) {
  final cart = ref.watch(cartProvider);
  return cart.lines.fold<int>(0, (sum, line) => sum + line.quantity);
});
