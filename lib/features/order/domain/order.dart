import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_status.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
abstract class Order with _$Order {
  const factory Order({
    required String id,
    @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
    required OrderStatus status,
    @JsonKey(name: 'estimated_preparation_minutes')
    int? estimatedPreparationMinutes,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

OrderStatus _statusFromJson(Object? value) {
  if (value is String) return OrderStatus.fromJson(value);
  throw FormatException('Expected status string, got $value');
}

String _statusToJson(OrderStatus status) => status.toJson();
