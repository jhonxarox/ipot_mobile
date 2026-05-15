import 'package:freezed_annotation/freezed_annotation.dart';

import 'menu_category.dart';
import 'menu_item.dart';
import 'restaurant_info.dart';

part 'menu.freezed.dart';
part 'menu.g.dart';

@freezed
abstract class Menu with _$Menu {
  const factory Menu({
    required RestaurantInfo restaurant,
    required List<MenuCategory> categories,
    required List<MenuItem> items,
  }) = _Menu;

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
}

/// Client-side filtering for category tabs and search.
extension MenuFiltering on Menu {
  List<MenuCategory> get sortedCategories =>
      [...categories]..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

  List<MenuItem> itemsForCategory(int categoryId) =>
      items.where((item) => item.categoryId == categoryId).toList();

  List<MenuItem> filterItems({
    required String query,
    int? categoryId,
  }) {
    final normalized = query.trim().toLowerCase();
    Iterable<MenuItem> result = items;

    if (categoryId != null) {
      result = result.where((item) => item.categoryId == categoryId);
    }

    if (normalized.isNotEmpty) {
      result = result.where(
        (item) =>
            item.name.toLowerCase().contains(normalized) ||
            item.description.toLowerCase().contains(normalized),
      );
    }

    return result.toList();
  }
}
