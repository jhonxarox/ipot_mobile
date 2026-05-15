import '../domain/create_order_request.dart';
import '../domain/order.dart';

abstract class OrderRepository {
  Future<Order> createOrder(CreateOrderRequest request);

  Future<Order> getOrder(String orderId);
}
