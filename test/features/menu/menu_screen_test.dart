import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipot_mobile/features/menu/data/menu_repository.dart';
import 'package:ipot_mobile/features/menu/data/menu_repository_provider.dart';
import 'package:ipot_mobile/features/menu/domain/customization_group.dart';
import 'package:ipot_mobile/features/menu/domain/customization_option.dart';
import 'package:ipot_mobile/features/menu/domain/menu.dart';
import 'package:ipot_mobile/features/menu/domain/menu_category.dart';
import 'package:ipot_mobile/features/menu/domain/menu_item.dart';
import 'package:ipot_mobile/features/menu/domain/restaurant_info.dart';
import 'package:ipot_mobile/features/menu/presentation/menu_screen.dart';
class _FakeMenuRepository implements MenuRepository {
  _FakeMenuRepository(this.menu);

  final Menu menu;

  @override
  Future<Menu> getMenu(String tableId) async => menu;
}

void main() {
  final testMenu = Menu(
    restaurant: const RestaurantInfo(
      id: 'R001',
      name: 'Sushi Zen',
      tableId: 'T001',
    ),
    categories: const [
      MenuCategory(id: 1, name: 'Appetizers', sortOrder: 1),
      MenuCategory(id: 2, name: 'Main Course', sortOrder: 2),
    ],
    items: [
      const MenuItem(
        id: 1,
        name: 'Edamame',
        description: 'Steamed soybeans',
        price: 5.99,
        categoryId: 1,
      ),
      const MenuItem(
        id: 2,
        name: 'Chicken Ramen',
        description: 'Rich chicken broth',
        price: 14.99,
        categoryId: 2,
        customizationGroups: [
          CustomizationGroup(
            id: 1,
            name: 'Spice Level',
            required: true,
            maxSelections: 1,
            options: [
              CustomizationOption(id: 1, name: 'Mild', priceModifier: 0),
            ],
          ),
        ],
      ),
    ],
  );

  Widget buildTestApp() {
    return ProviderScope(
      overrides: [
        menuRepositoryProvider.overrideWithValue(
          _FakeMenuRepository(testMenu),
        ),
      ],
      child: const MaterialApp(
        home: MenuScreen(tableId: 'T001'),
      ),
    );
  }

  testWidgets('renders categories and items from repository', (tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('Sushi Zen'), findsOneWidget);
    expect(find.text('Appetizers'), findsOneWidget);
    expect(find.text('Main Course'), findsOneWidget);
    expect(find.text('Edamame'), findsOneWidget);
    expect(find.text('Chicken Ramen'), findsNothing);
  });

  testWidgets('filters items when search query is set', (tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    await tester.enterText(find.byType(TextField), 'ramen');
    await tester.pump();

    expect(find.text('Chicken Ramen'), findsOneWidget);
    expect(find.text('Edamame'), findsNothing);
    expect(find.text('Searching all categories'), findsOneWidget);
  });

  tearDown(() {
    // Reset search provider between tests when using shared container patterns.
    // Each test builds a fresh ProviderScope, so no action needed.
  });
}
