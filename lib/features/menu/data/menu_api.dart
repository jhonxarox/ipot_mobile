import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/dio_error_mapper.dart';
import '../domain/menu.dart';

/// HTTP client for menu endpoints.
class MenuApi {
  const MenuApi(this._dio);

  final Dio _dio;

  Future<Menu> fetchMenu(String tableId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/menu',
        queryParameters: {'table_id': tableId},
      );
      final data = response.data;
      if (data == null) {
        throw const ApiParseException('Menu response was empty');
      }
      return Menu.fromJson(data);
    } on DioException catch (error) {
      throw mapDioException(error);
    } on ApiException {
      rethrow;
    } catch (error) {
      throw ApiParseException('Failed to parse menu: $error');
    }
  }
}

final menuApiProvider = Provider<MenuApi>((ref) {
  return MenuApi(ref.watch(dioProvider));
});
