import 'package:freezed_annotation/freezed_annotation.dart';

import '../../cart/domain/cart.dart';
import '../../cart/domain/cart_line.dart';

part 'create_order_request.freezed.dart';
part 'create_order_request.g.dart';

@freezed
abstract class CreateOrderRequest with _$CreateOrderRequest {
  const factory CreateOrderRequest({
    @JsonKey(name: 'table_id') required String tableId,
    required List<CreateOrderItemRequest> items,
    @JsonKey(name: 'customer_note') String? customerNote,
  }) = _CreateOrderRequest;

  factory CreateOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderRequestFromJson(json);

  factory CreateOrderRequest.fromCart(Cart cart) {
    if (cart.tableId == null) {
      throw StateError('Cart is missing table_id');
    }
    if (cart.lines.isEmpty) {
      throw StateError('Cart has no items');
    }

    return CreateOrderRequest(
      tableId: cart.tableId!,
      customerNote: cart.customerNote.isEmpty ? null : cart.customerNote,
      items: cart.lines.map(CreateOrderItemRequest.fromCartLine).toList(),
    );
  }
}

@freezed
abstract class CreateOrderItemRequest with _$CreateOrderItemRequest {
  const factory CreateOrderItemRequest({
    @JsonKey(name: 'menu_item_id') required int menuItemId,
    required int quantity,
    @Default([]) List<CreateOrderCustomizationRequest> customizations,
  }) = _CreateOrderItemRequest;

  factory CreateOrderItemRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderItemRequestFromJson(json);

  factory CreateOrderItemRequest.fromCartLine(CartLine line) {
    return CreateOrderItemRequest(
      menuItemId: line.item.id,
      quantity: line.quantity,
      customizations: line.selections
          .map(
            (selection) => CreateOrderCustomizationRequest(
              optionId: selection.option.id,
              quantity: selection.quantity,
            ),
          )
          .toList(),
    );
  }
}

@freezed
abstract class CreateOrderCustomizationRequest
    with _$CreateOrderCustomizationRequest {
  const factory CreateOrderCustomizationRequest({
    @JsonKey(name: 'option_id') required int optionId,
    required int quantity,
  }) = _CreateOrderCustomizationRequest;

  factory CreateOrderCustomizationRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderCustomizationRequestFromJson(json);
}
