import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/empty_state.dart';
import '../application/cart_controller.dart';
import 'cart_line_tile.dart';
import 'totals_bar.dart';

/// Cart review: lines, quantity controls, customer note, and subtotal.
class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  late final TextEditingController _noteController;
  bool _noteInitialized = false;

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController();
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);

    if (!_noteInitialized) {
      _noteController.text = cart.customerNote;
      _noteInitialized = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your cart'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (cart.tableId != null) {
              context.go('/menu/${cart.tableId}');
            } else {
              context.pop();
            }
          },
        ),
      ),
      body: cart.lines.isEmpty
          ? EmptyState(
              message: 'Your cart is empty.\nBrowse the menu to add items.',
              icon: Icons.shopping_cart_outlined,
              action: FilledButton(
                onPressed: () {
                  if (cart.tableId != null) {
                    context.go('/menu/${cart.tableId}');
                  } else {
                    context.go('/scan');
                  }
                },
                child: const Text('Back to menu'),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      for (final line in cart.lines) CartLineTile(line: line),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _noteController,
                        decoration: const InputDecoration(
                          labelText: 'Note for kitchen',
                          hintText: 'No MSG please',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 2,
                        onChanged: ref
                            .read(cartProvider.notifier)
                            .setCustomerNote,
                      ),
                    ],
                  ),
                ),
                TotalsBar(
                  actionLabel: 'Place order',
                  onAction: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Order submission ships in B5'),
                      ),
                    );
                  },
                ),
              ],
            ),
    );
  }
}
