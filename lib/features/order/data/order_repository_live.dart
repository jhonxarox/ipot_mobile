import '../domain/create_order_request.dart';
import '../domain/order.dart';
import 'order_api.dart';
import 'order_repository.dart';

class OrderRepositoryLive implements OrderRepository {
  const OrderRepositoryLive(this._api);

  final OrderApi _api;

  @override
  Future<Order> createOrder(CreateOrderRequest request) =>
      _api.createOrder(request);

  @override
  Future<Order> getOrder(String orderId) => _api.fetchOrder(orderId);
}
