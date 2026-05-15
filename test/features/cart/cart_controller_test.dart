import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipot_mobile/features/cart/application/cart_controller.dart';
import 'package:ipot_mobile/features/cart/domain/selected_option.dart';

import 'cart_test_helpers.dart';

void main() {
  test('different selections create separate lines', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final controller = container.read(cartProvider.notifier);
    final item = chickenRamenItem();
    final spice = item.customizationGroups[0];

    controller.addItem(
      item,
      [
        SelectedOption(
          groupId: spice.id,
          option: spice.options[0],
          quantity: 1,
        ),
      ],
    );
    controller.addItem(
      item,
      [
        SelectedOption(
          groupId: spice.id,
          option: spice.options[1],
          quantity: 1,
        ),
      ],
    );

    final cart = container.read(cartProvider);
    expect(cart.lines, hasLength(2));
    expect(cart.lines[0].quantity, 1);
    expect(cart.lines[1].quantity, 1);
  });

  test('same selections merge quantity on repeat add', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final controller = container.read(cartProvider.notifier);
    final item = chickenRamenItem();
    final spice = item.customizationGroups[0];
    final selections = [
      SelectedOption(
        groupId: spice.id,
        option: spice.options[0],
        quantity: 1,
      ),
    ];

    controller.addItem(item, selections);
    controller.addItem(item, selections, quantity: 2);

    final cart = container.read(cartProvider);
    expect(cart.lines, hasLength(1));
    expect(cart.lines.single.quantity, 3);
  });

  test('invalid selections return errors and do not mutate cart', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final controller = container.read(cartProvider.notifier);
    final item = chickenRamenItem();

    final errors = controller.addItem(item, const []);

    expect(errors, isNotEmpty);
    expect(container.read(cartProvider).lines, isEmpty);
  });
}
