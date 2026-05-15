import 'package:ipot_mobile/features/cart/domain/selected_option.dart';
import 'package:ipot_mobile/features/menu/domain/customization_group.dart';
import 'package:ipot_mobile/features/menu/domain/customization_option.dart';
import 'package:ipot_mobile/features/menu/domain/menu_item.dart';

/// Chicken Ramen from the spec mock payload (item id 4).
MenuItem chickenRamenItem() {
  return const MenuItem(
    id: 4,
    name: 'Chicken Ramen',
    description: 'Rich chicken broth with chashu, egg, and noodles',
    price: 14.99,
    categoryId: 2,
    customizationGroups: [
      CustomizationGroup(
        id: 3,
        name: 'Spice Level',
        required: true,
        maxSelections: 1,
        options: [
          CustomizationOption(id: 6, name: 'Mild', priceModifier: 0),
          CustomizationOption(id: 7, name: 'Medium', priceModifier: 0),
          CustomizationOption(id: 8, name: 'Spicy', priceModifier: 0),
          CustomizationOption(id: 9, name: 'Extra Spicy', priceModifier: 1),
        ],
      ),
      CustomizationGroup(
        id: 4,
        name: 'Add-ons',
        required: false,
        maxSelections: 3,
        options: [
          CustomizationOption(id: 10, name: 'Extra Egg', priceModifier: 2),
          CustomizationOption(id: 11, name: 'Extra Chashu', priceModifier: 4),
          CustomizationOption(id: 12, name: 'Corn', priceModifier: 1),
        ],
      ),
    ],
  );
}

List<SelectedOption> chickenRamenFullModifiers() {
  final item = chickenRamenItem();
  final spice = item.customizationGroups[0];
  final addOns = item.customizationGroups[1];

  return [
    SelectedOption(
      groupId: spice.id,
      option: spice.options[3],
      quantity: 1,
    ),
    SelectedOption(
      groupId: addOns.id,
      option: addOns.options[0],
      quantity: 1,
    ),
    SelectedOption(
      groupId: addOns.id,
      option: addOns.options[1],
      quantity: 1,
    ),
  ];
}
