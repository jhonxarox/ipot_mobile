import '../domain/menu.dart';

/// Data access contract for loading a table's menu.
abstract class MenuRepository {
  Future<Menu> getMenu(String tableId);
}
