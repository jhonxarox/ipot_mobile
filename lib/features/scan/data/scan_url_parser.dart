/// Extracts a table ID from a scanned QR payload or manual entry.
///
/// Accepted formats:
/// - Deep link: `ipot://table/{tableId}` (e.g. `ipot://table/T001`)
/// - Bare ID for manual entry: `T001`
String? parseTableId(String raw) {
  final trimmed = raw.trim();
  if (trimmed.isEmpty) return null;

  final uri = Uri.tryParse(trimmed);
  if (uri != null && uri.hasScheme) {
    if (uri.scheme != 'ipot' || uri.host != 'table') return null;

    final segments =
        uri.pathSegments.where((segment) => segment.isNotEmpty).toList();
    if (segments.length != 1) return null;

    return _isValidTableId(segments.single) ? segments.single : null;
  }

  // Manual entry: reject strings that look like other URL shapes.
  if (trimmed.contains('://') || trimmed.contains('/')) return null;

  return _isValidTableId(trimmed) ? trimmed : null;
}

bool _isValidTableId(String id) {
  if (id.isEmpty) return false;
  return RegExp(r'^[A-Za-z0-9_-]+$').hasMatch(id);
}
