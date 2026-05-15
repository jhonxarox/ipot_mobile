import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/formatters.dart';
import '../../../core/widgets/app_error_view.dart';
import '../../../core/widgets/app_loader.dart';
import '../domain/menu.dart';
import '../domain/menu_item.dart';
import 'category_tabs.dart';
import 'item_detail_sheet.dart';
import 'menu_controller.dart';
import 'search_field.dart';
import 'search_query_provider.dart';

/// Menu browser for a scanned table.
class MenuScreen extends ConsumerStatefulWidget {
  const MenuScreen({super.key, required this.tableId});

  final String tableId;

  @override
  ConsumerState<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends ConsumerState<MenuScreen> {
  int? _selectedCategoryId;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(searchQueryProvider.notifier).clear(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final menuAsync = ref.watch(menuControllerProvider(widget.tableId));
    final searchQuery = ref.watch(searchQueryProvider);

    return Scaffold(
      appBar: AppBar(
        title: menuAsync.maybeWhen(
          data: (menu) => Text(menu.restaurant.name),
          orElse: () => Text('Table ${widget.tableId}'),
        ),
      ),
      body: menuAsync.when(
        loading: () => const AppLoader(message: 'Loading menu…'),
        error: (error, _) => AppErrorView(
          error: error,
          onRetry: () =>
              ref.invalidate(menuControllerProvider(widget.tableId)),
        ),
        data: (menu) {
          final categories = menu.sortedCategories;
          final selectedCategoryId = _selectedCategoryId ?? categories.first.id;
          final visibleItems = menu.filterItems(
            query: searchQuery,
            categoryId: searchQuery.isEmpty ? selectedCategoryId : null,
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const MenuSearchField(),
              if (searchQuery.isEmpty)
                CategoryTabs(
                  categories: categories,
                  selectedCategoryId: selectedCategoryId,
                  onCategorySelected: (id) {
                    setState(() => _selectedCategoryId = id);
                  },
                )
              else
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: Text(
                    'Searching all categories',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              Expanded(
                child: visibleItems.isEmpty
                    ? const Center(child: Text('No items match your search'))
                    : ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: visibleItems.length,
                        separatorBuilder: (context, index) =>
                            const Divider(height: 1),
                        itemBuilder: (context, index) => _MenuItemTile(
                          item: visibleItems[index],
                          onTap: () => showItemDetailSheet(
                            context,
                            visibleItems[index],
                          ),
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _MenuItemTile extends StatelessWidget {
  const _MenuItemTile({required this.item, required this.onTap});

  final MenuItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(item.name),
      subtitle: Text(
        item.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        formatCurrency(item.price),
        style: Theme.of(context).textTheme.titleSmall,
      ),
      onTap: onTap,
    );
  }
}
