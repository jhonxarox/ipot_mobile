import 'package:dio/dio.dart';

import 'api_exception.dart';

/// Unwraps a [DioException] into the typed [ApiException] from our interceptor.
ApiException mapDioException(DioException error) {
  final mapped = error.error;
  if (mapped is ApiException) return mapped;
  return ApiUnknownException(error.message ?? 'Unknown error');
}
