import 'package:flutter/material.dart';

/// App-wide Material 3 theming.
///
/// We derive both light and dark schemes from a single seed colour via
/// [ColorScheme.fromSeed]. The seed is a stock Material palette rather than a
/// guessed brand hex — easy to swap to IPOT's actual primary once known.
class AppTheme {
  AppTheme._();

  /// Seed colour for the generated [ColorScheme]. Replace with IPOT's
  /// official primary when a brand spec is provided.
  static const Color _seed = Colors.deepOrange;

  static ThemeData get light => _build(Brightness.light);

  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final scheme = ColorScheme.fromSeed(
      seedColor: _seed,
      brightness: brightness,
    );
    return ThemeData(
      colorScheme: scheme,
    );
  }
}
