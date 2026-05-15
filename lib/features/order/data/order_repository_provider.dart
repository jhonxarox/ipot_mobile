import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/env.dart';
import 'order_api.dart';
import 'order_repository.dart';
import 'order_repository_live.dart';
import 'order_repository_mock.dart';

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  final env = ref.watch(envProvider);
  if (env.useMock) {
    return OrderRepositoryMock();
  }
  return OrderRepositoryLive(ref.watch(orderApiProvider));
});
