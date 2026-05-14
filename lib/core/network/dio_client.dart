import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/env.dart';
import 'api_exception.dart';

/// Builds the singleton [Dio] instance: sensible JSON defaults, 10s timeouts,
/// and the error-mapping interceptor that turns raw [DioException]s into our
/// typed [ApiException] hierarchy.
Dio _buildDio(Env env) {
  final dio = Dio(
    BaseOptions(
      baseUrl: env.apiBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: const {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );
  dio.interceptors.add(_ErrorMappingInterceptor());
  return dio;
}

/// Intercepts [DioException] on the error pipeline and rejects with a new
/// [DioException] whose `error` field carries a typed [ApiException].
///
/// Dio's API requires the rejected value to be a [DioException], so we wrap
/// rather than throwing [ApiException] directly. Call sites unwrap via
/// `e.error as ApiException`.
class _ErrorMappingInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final mapped = _mapDioError(err);
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        type: err.type,
        response: err.response,
        error: mapped,
        message: mapped.message,
      ),
    );
  }
}

ApiException _mapDioError(DioException err) => switch (err.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout =>
        const ApiTimeoutException('Request timed out'),
      DioExceptionType.cancel =>
        const ApiCancelException('Request was cancelled'),
      DioExceptionType.connectionError =>
        const ApiNetworkException('Cannot reach the server'),
      DioExceptionType.badCertificate => ApiNetworkException(
          'TLS handshake failed: ${err.message ?? 'bad certificate'}',
        ),
      DioExceptionType.badResponse => _mapBadResponse(err),
      DioExceptionType.unknown =>
        ApiUnknownException(err.message ?? 'Unknown error'),
    };

ApiHttpException _mapBadResponse(DioException err) {
  final res = err.response;
  final code = res?.statusCode ?? 0;
  return ApiHttpException(
    statusCode: code,
    message: 'Request failed with status $code',
    serverMessage: _extractServerMessage(res?.data),
  );
}

/// Pulls a human-readable message from common backend error shapes:
/// `{"error": "..."}`, `{"message": "..."}`, `{"detail": "..."}`.
///
/// Returns `null` for shapes we don't recognise — callers fall back to
/// the generic `'Request failed with status N'` message in that case.
String? _extractServerMessage(Object? data) {
  if (data is Map<String, dynamic>) {
    final candidate = data['error'] ?? data['message'] ?? data['detail'];
    if (candidate is String) return candidate;
  }
  return null;
}

/// Riverpod-provided singleton [Dio]. The instance rebuilds when [envProvider]
/// changes (e.g. tests overriding the base URL) and the prior instance is
/// closed via [ref.onDispose] to free its connection pool.
final dioProvider = Provider<Dio>((ref) {
  final env = ref.watch(envProvider);
  final dio = _buildDio(env);
  ref.onDispose(dio.close);
  return dio;
});
