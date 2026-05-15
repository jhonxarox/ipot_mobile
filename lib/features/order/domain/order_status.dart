/// Kitchen / service lifecycle for an order.
enum OrderStatus {
  pending,
  confirmed,
  preparing,
  ready,
  served;

  static OrderStatus fromJson(String value) => switch (value) {
        'pending' => OrderStatus.pending,
        'confirmed' => OrderStatus.confirmed,
        'preparing' => OrderStatus.preparing,
        'ready' => OrderStatus.ready,
        'served' => OrderStatus.served,
        _ => throw FormatException('Unknown order status: $value'),
      };

  String toJson() => name;
}

/// Display label for UI.
extension OrderStatusLabel on OrderStatus {
  String get label => switch (this) {
        OrderStatus.pending => 'Pending',
        OrderStatus.confirmed => 'Confirmed',
        OrderStatus.preparing => 'Preparing',
        OrderStatus.ready => 'Ready',
        OrderStatus.served => 'Served',
      };
}
