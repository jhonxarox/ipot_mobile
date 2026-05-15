import 'dart:convert';

import 'package:flutter/services.dart';

import '../domain/menu.dart';
import '../domain/restaurant_info.dart';
import 'menu_repository.dart';

/// Loads the bundled spec mock payload with a short delay so loading UI is visible.
class MenuRepositoryMock implements MenuRepository {
  static const _assetPath = 'assets/mock/menu.json';
  static const _simulatedDelay = Duration(milliseconds: 300);

  @override
  Future<Menu> getMenu(String tableId) async {
    await Future<void>.delayed(_simulatedDelay);

    final jsonString = await rootBundle.loadString(_assetPath);
    final menu = Menu.fromJson(
      jsonDecode(jsonString) as Map<String, dynamic>,
    );

    // Keep restaurant metadata aligned with the scanned table.
    return menu.copyWith(
      restaurant: RestaurantInfo(
        id: menu.restaurant.id,
        name: menu.restaurant.name,
        tableId: tableId,
      ),
    );
  }
}
