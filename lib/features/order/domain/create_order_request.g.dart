// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateOrderRequest _$CreateOrderRequestFromJson(Map<String, dynamic> json) =>
    _CreateOrderRequest(
      tableId: json['table_id'] as String,
      items: (json['items'] as List<dynamic>)
          .map(
            (e) => CreateOrderItemRequest.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      customerNote: json['customer_note'] as String?,
    );

Map<String, dynamic> _$CreateOrderRequestToJson(_CreateOrderRequest instance) =>
    <String, dynamic>{
      'table_id': instance.tableId,
      'items': instance.items,
      'customer_note': instance.customerNote,
    };

_CreateOrderItemRequest _$CreateOrderItemRequestFromJson(
  Map<String, dynamic> json,
) => _CreateOrderItemRequest(
  menuItemId: (json['menu_item_id'] as num).toInt(),
  quantity: (json['quantity'] as num).toInt(),
  customizations:
      (json['customizations'] as List<dynamic>?)
          ?.map(
            (e) => CreateOrderCustomizationRequest.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$CreateOrderItemRequestToJson(
  _CreateOrderItemRequest instance,
) => <String, dynamic>{
  'menu_item_id': instance.menuItemId,
  'quantity': instance.quantity,
  'customizations': instance.customizations,
};

_CreateOrderCustomizationRequest _$CreateOrderCustomizationRequestFromJson(
  Map<String, dynamic> json,
) => _CreateOrderCustomizationRequest(
  optionId: (json['option_id'] as num).toInt(),
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$CreateOrderCustomizationRequestToJson(
  _CreateOrderCustomizationRequest instance,
) => <String, dynamic>{
  'option_id': instance.optionId,
  'quantity': instance.quantity,
};
