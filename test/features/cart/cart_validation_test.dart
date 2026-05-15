import 'package:flutter_test/flutter_test.dart';
import 'package:ipot_mobile/features/cart/domain/cart_validation.dart';
import 'package:ipot_mobile/features/cart/domain/selected_option.dart';
import 'package:ipot_mobile/features/menu/domain/customization_group.dart';
import 'package:ipot_mobile/features/menu/domain/customization_option.dart';
import 'package:ipot_mobile/features/menu/domain/menu_item.dart';

import 'cart_test_helpers.dart';

void main() {
  test('required group missing returns RequiredGroupMissing', () {
    final item = chickenRamenItem();

    final errors = validateSelections(item, const []);

    expect(errors, hasLength(1));
    expect(errors.single, isA<RequiredGroupMissing>());
    expect((errors.single as RequiredGroupMissing).group.id, 3);
  });

  test('max_selections exceeded returns MaxSelectionsExceeded', () {
    final item = chickenRamenItem();
    final spice = item.customizationGroups[0];
    final addOns = item.customizationGroups[1];

    final errors = validateSelections(item, [
      SelectedOption(
        groupId: spice.id,
        option: spice.options[0],
        quantity: 1,
      ),
      SelectedOption(
        groupId: addOns.id,
        option: addOns.options[0],
        quantity: 2,
      ),
      SelectedOption(
        groupId: addOns.id,
        option: addOns.options[1],
        quantity: 1,
      ),
      SelectedOption(
        groupId: addOns.id,
        option: addOns.options[2],
        quantity: 1,
      ),
    ]);

    expect(errors, isNotEmpty);
    expect(
      errors.whereType<MaxSelectionsExceeded>().single.selectedCount,
      greaterThan(addOns.maxSelections),
    );
  });

  test('unknown option id returns UnknownOption', () {
    const item = MenuItem(
      id: 99,
      name: 'Test',
      description: 'Test',
      price: 1,
      categoryId: 1,
      customizationGroups: [
        CustomizationGroup(
          id: 1,
          name: 'Size',
          required: false,
          maxSelections: 1,
          options: [
            CustomizationOption(id: 1, name: 'Small', priceModifier: 0),
          ],
        ),
      ],
    );

    final errors = validateSelections(
      item,
      const [
        SelectedOption(
          groupId: 1,
          option: CustomizationOption(id: 999, name: 'Ghost', priceModifier: 0),
          quantity: 1,
        ),
      ],
    );

    expect(errors.single, isA<UnknownOption>());
    expect((errors.single as UnknownOption).optionId, 999);
  });
}
