import '../domain/menu.dart';
import 'menu_api.dart';
import 'menu_repository.dart';

class MenuRepositoryLive implements MenuRepository {
  const MenuRepositoryLive(this._api);

  final MenuApi _api;

  @override
  Future<Menu> getMenu(String tableId) => _api.fetchMenu(tableId);
}
