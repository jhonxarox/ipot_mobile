/// Sealed hierarchy for network-layer errors.
///
/// The error-mapping interceptor in `dio_client.dart` converts raw
/// [DioException]s into one of the subclasses below. Repositories unwrap the
/// `DioException.error` field to access the typed [ApiException], and UI code
/// pattern-matches on it via `switch`. We never let a raw `DioException`
/// escape the data layer.
sealed class ApiException implements Exception {
  const ApiException(this.message);

  final String message;

  @override
  String toString() => '$runtimeType: $message';
}

/// Device could not reach the server (no internet, DNS failure, connection
/// refused, TLS handshake failure).
final class ApiNetworkException extends ApiException {
  const ApiNetworkException(super.message);
}

/// Request exceeded the configured connect, send, or receive timeout.
final class ApiTimeoutException extends ApiException {
  const ApiTimeoutException(super.message);
}

/// Server responded with a 4xx or 5xx status code.
///
/// [serverMessage] holds the human-readable error string surfaced by the
/// backend (e.g. `{"error": "Invalid table"}` → `'Invalid table'`) when one
/// is present in a recognised shape; otherwise `null`.
final class ApiHttpException extends ApiException {
  const ApiHttpException({
    required this.statusCode,
    required String message,
    this.serverMessage,
  }) : super(message);

  final int statusCode;
  final String? serverMessage;
}

/// Response body could not be deserialised into the expected shape.
final class ApiParseException extends ApiException {
  const ApiParseException(super.message);
}

/// Request was cancelled by the caller (e.g. polling provider torn down
/// mid-flight). Surfaced so call sites can suppress UI errors for cancels.
final class ApiCancelException extends ApiException {
  const ApiCancelException(super.message);
}

/// Anything dio could not classify. Surfaced explicitly so failures are
/// never silently swallowed.
final class ApiUnknownException extends ApiException {
  const ApiUnknownException(super.message);
}
