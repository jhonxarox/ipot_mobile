import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/widgets/empty_state.dart';
import '../../order/presentation/submit_order.dart';
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

  Future<void> _placeOrder() async {
    try {
      final order = await submitCartOrder(ref);
      if (!mounted) return;
      context.go('/order/${order.id}');
    } catch (error) {
      if (!mounted) return;
      final message = switch (error) {
        StateError() => error.message,
        ApiException(:final message) => message,
        _ => 'Could not place order. Please try again.',
      };
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);
    final isSubmitting = ref.watch(orderSubmittingProvider);

    if (!_noteInitialized) {
      _noteController.text = cart.customerNote;
      _noteInitialized = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your cart'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: isSubmitting
              ? null
              : () {
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
          : Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(16),
                        children: [
                          for (final line in cart.lines)
                            CartLineTile(line: line),
                          const SizedBox(height: 8),
                          TextField(
                            controller: _noteController,
                            enabled: !isSubmitting,
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
                      actionLabel: isSubmitting ? 'Submitting…' : 'Place order',
                      enabled: !isSubmitting,
                      onAction: _placeOrder,
                    ),
                  ],
                ),
                if (isSubmitting)
                  const ColoredBox(
                    color: Color(0x33000000),
                    child: Center(child: CircularProgressIndicator()),
                  ),
              ],
            ),
    );
  }
}
