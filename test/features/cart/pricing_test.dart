import 'package:flutter_test/flutter_test.dart';
import 'package:ipot_mobile/features/cart/domain/cart.dart';
import 'package:ipot_mobile/features/cart/domain/cart_line.dart';
import 'package:ipot_mobile/features/cart/domain/pricing.dart';

import 'cart_test_helpers.dart';

void main() {
  test('line total for ramen with modifiers at quantity 2', () {
    final item = chickenRamenItem();
    final selections = chickenRamenFullModifiers();

    final line = CartLine(
      id: cartLineId(item.id, selections),
      item: item,
      selections: selections,
      quantity: 2,
    );

    const expectedUnit = 14.99 + 1.00 + 2.00 + 4.00;
    expect(lineUnitPrice(item, selections), expectedUnit);
    expect(lineTotal(line), expectedUnit * 2);
    expect(cartSubtotal(Cart(lines: [line])), expectedUnit * 2);
  });
}
