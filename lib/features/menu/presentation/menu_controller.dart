import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/menu_repository_provider.dart';
import '../domain/menu.dart';

/// Loads the menu for a given [tableId] via [menuRepositoryProvider].
final menuControllerProvider = FutureProvider.autoDispose.family<Menu, String>(
  (ref, tableId) async {
    final repository = ref.watch(menuRepositoryProvider);
    return repository.getMenu(tableId);
  },
);
