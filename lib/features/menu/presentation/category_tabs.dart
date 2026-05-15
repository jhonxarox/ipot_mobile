import 'package:flutter/material.dart';

import '../domain/menu_category.dart';

/// Horizontal category chips for filtering the menu list.
class CategoryTabs extends StatelessWidget {
  const CategoryTabs({
    super.key,
    required this.categories,
    required this.selectedCategoryId,
    required this.onCategorySelected,
  });

  final List<MenuCategory> categories;
  final int selectedCategoryId;
  final ValueChanged<int> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];
          final selected = category.id == selectedCategoryId;

          return ChoiceChip(
            label: Text(category.name),
            selected: selected,
            onSelected: (_) => onCategorySelected(category.id),
          );
        },
      ),
    );
  }
}
