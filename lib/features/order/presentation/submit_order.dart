import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../cart/application/cart_controller.dart';
import '../../cart/domain/cart.dart';
import '../data/order_repository_provider.dart';
import '../domain/create_order_request.dart';
import '../domain/order.dart';

class OrderSubmittingNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void setSubmitting(bool value) => state = value;
}

/// Whether an order submission is in flight (disables Place order).
final orderSubmittingProvider =
    NotifierProvider<OrderSubmittingNotifier, bool>(
  OrderSubmittingNotifier.new,
);

/// Submits the current cart and clears it on success.
Future<Order> submitCartOrder(WidgetRef ref) async {
  final cart = ref.read(cartProvider);
  _validateCart(cart);

  ref.read(orderSubmittingProvider.notifier).setSubmitting(true);
  try {
    final request = CreateOrderRequest.fromCart(cart);
    final order = await ref.read(orderRepositoryProvider).createOrder(request);
    ref.read(cartProvider.notifier).clear();
    return order;
  } finally {
    ref.read(orderSubmittingProvider.notifier).setSubmitting(false);
  }
}

void _validateCart(Cart cart) {
  if (cart.lines.isEmpty) {
    throw StateError('Cart is empty');
  }
  if (cart.tableId == null || cart.tableId!.isEmpty) {
    throw StateError('Missing table ID — scan a table QR first');
  }
}
