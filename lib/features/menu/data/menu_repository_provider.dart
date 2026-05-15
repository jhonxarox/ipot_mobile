import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/env.dart';
import 'menu_api.dart';
import 'menu_repository.dart';
import 'menu_repository_live.dart';
import 'menu_repository_mock.dart';

final menuRepositoryProvider = Provider<MenuRepository>((ref) {
  final env = ref.watch(envProvider);
  if (env.useMock) {
    return MenuRepositoryMock();
  }
  return MenuRepositoryLive(ref.watch(menuApiProvider));
});
