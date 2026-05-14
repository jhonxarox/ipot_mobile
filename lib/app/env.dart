import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Build-time environment configuration sourced from `--dart-define` values.
///
/// Override per build with:
/// ```
/// flutter run \
///   --dart-define=API_BASE_URL=https://api.example.com \
///   --dart-define=USE_MOCK=false
/// ```
///
/// Defaults are tuned for offline development: [useMock] is `true` so a fresh
/// `flutter run` with no flags renders the bundled mock menu. This keeps the
/// app reviewable without needing a real backend on hand.
class Env {
  const Env({
    required this.apiBaseUrl,
    required this.useMock,
  });

  /// Singleton derived from compile-time `--dart-define` values.
  static const Env current = Env(
    apiBaseUrl: String.fromEnvironment(
      'API_BASE_URL',
      defaultValue: 'https://api.example.com',
    ),
    useMock: bool.fromEnvironment(
      'USE_MOCK',
      defaultValue: true,
    ),
  );

  final String apiBaseUrl;
  final bool useMock;
}

/// Provider for the active [Env].
///
/// Production reads [Env.current] (compile-time consts). Tests override this
/// provider via `ProviderContainer(overrides: [envProvider.overrideWithValue(...)])`
/// to exercise different API URLs or toggle the mock repository without a
/// rebuild.
final envProvider = Provider<Env>((_) => Env.current);
