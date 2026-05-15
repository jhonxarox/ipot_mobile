import '../../../core/network/api_exception.dart';
import '../domain/create_order_request.dart';
import '../domain/order.dart';
import '../domain/order_status.dart';
import 'order_repository.dart';

class _MockOrderState {
  _MockOrderState({required this.status});

  OrderStatus status;
  static const estimatedPreparationMinutes = 12;
}

/// Simulates create + status progression for offline demos.
class OrderRepositoryMock implements OrderRepository {
  static final _orders = <String, _MockOrderState>{};
  static var _counter = 1000;

  static const _progression = [
    OrderStatus.pending,
    OrderStatus.confirmed,
    OrderStatus.preparing,
    OrderStatus.ready,
    OrderStatus.served,
  ];

  @override
  Future<Order> createOrder(CreateOrderRequest request) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));

    final id = 'MOCK-${++_counter}';
    _orders[id] = _MockOrderState(status: OrderStatus.pending);

    return Order(
      id: id,
      status: OrderStatus.pending,
      estimatedPreparationMinutes: 12,
    );
  }

  @override
  Future<Order> getOrder(String orderId) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));

    final state = _orders[orderId];
    if (state == null) {
      throw const ApiHttpException(
        statusCode: 404,
        message: 'Order not found',
      );
    }

    final currentIndex = _progression.indexOf(state.status);
    if (currentIndex < _progression.length - 1) {
      state.status = _progression[currentIndex + 1];
    }

    return Order(
      id: orderId,
      status: state.status,
      estimatedPreparationMinutes: _MockOrderState.estimatedPreparationMinutes,
    );
  }
}
