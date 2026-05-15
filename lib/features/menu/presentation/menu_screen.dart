import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/formatters.dart';
import '../../../core/widgets/app_error_view.dart';
import '../../../core/widgets/app_loader.dart';
import '../../cart/application/cart_controller.dart';
import '../../cart/presentation/totals_bar.dart';
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
    Future.microtask(() {
      ref.read(searchQueryProvider.notifier).clear();
      ref.read(cartProvider.notifier).setTableId(widget.tableId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final menuAsync = ref.watch(menuControllerProvider(widget.tableId));
    final searchQuery = ref.watch(searchQueryProvider);
    final cartCount = ref.watch(cartItemCountProvider);

    return Scaffold(
      appBar: AppBar(
        title: menuAsync.maybeWhen(
          data: (menu) => Text(menu.restaurant.name),
          orElse: () => Text('Table ${widget.tableId}'),
        ),
        actions: [
          _CartAppBarButton(
            count: cartCount,
            onPressed: cartCount == 0 ? null : () => context.push('/cart'),
          ),
        ],
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
              if (cartCount > 0)
                TotalsBar(
                  actionLabel: 'View cart',
                  onAction: () => context.push('/cart'),
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

/// Cart icon that scale-pulses when the cart count grows.
///
/// The pulse is the only add-to-cart animation in the happy path; keep it
/// short so it never blocks the user from tapping through to the cart.
class _CartAppBarButton extends StatefulWidget {
  const _CartAppBarButton({required this.count, this.onPressed});

  final int count;
  final VoidCallback? onPressed;

  @override
  State<_CartAppBarButton> createState() => _CartAppBarButtonState();
}

class _CartAppBarButtonState extends State<_CartAppBarButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );
    _scale = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.25), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 1.25, end: 1.0), weight: 1),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void didUpdateWidget(covariant _CartAppBarButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.count > oldWidget.count) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.onPressed,
      icon: ScaleTransition(
        scale: _scale,
        child: Badge(
          isLabelVisible: widget.count > 0,
          label: AnimatedSwitcher(
            duration: const Duration(milliseconds: 180),
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: child,
            ),
            child: Text(
              '${widget.count}',
              key: ValueKey<int>(widget.count),
            ),
          ),
          child: const Icon(Icons.shopping_cart_outlined),
        ),
      ),
    );
  }
}
