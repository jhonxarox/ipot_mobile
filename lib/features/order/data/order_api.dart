import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/dio_error_mapper.dart';
import '../domain/create_order_request.dart';
import '../domain/order.dart';

class OrderApi {
  const OrderApi(this._dio);

  final Dio _dio;

  Future<Order> createOrder(CreateOrderRequest request) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/orders',
        data: request.toJson(),
      );
      return _parseOrderResponse(response.data);
    } on DioException catch (error) {
      throw mapDioException(error);
    } on ApiException {
      rethrow;
    } catch (error) {
      throw ApiParseException('Failed to parse create order response: $error');
    }
  }

  Future<Order> fetchOrder(String orderId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/orders/$orderId',
      );
      return _parseOrderResponse(response.data, fallbackId: orderId);
    } on DioException catch (error) {
      throw mapDioException(error);
    } on ApiException {
      rethrow;
    } catch (error) {
      throw ApiParseException('Failed to parse order response: $error');
    }
  }

  Order _parseOrderResponse(Map<String, dynamic>? data, {String? fallbackId}) {
    if (data == null) {
      throw const ApiParseException('Order response was empty');
    }

    // Accept either a wrapped `order` object or a flat payload.
    final payload = data['order'] is Map<String, dynamic>
        ? data['order'] as Map<String, dynamic>
        : data;

    final id = payload['id'] ?? payload['order_id'] ?? fallbackId;
    if (id == null) {
      throw const ApiParseException('Order response missing id');
    }

    return Order.fromJson({
      ...payload,
      'id': id.toString(),
    });
  }
}

final orderApiProvider = Provider<OrderApi>((ref) {
  return OrderApi(ref.watch(dioProvider));
});
