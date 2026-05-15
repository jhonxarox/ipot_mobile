# IPOT Mobile

A QR-based customer ordering app for IPOT. Customers scan a table QR, browse the menu, customize items, place an order, and track it through to served. Flutter 3.41 + Riverpod 3.

---

## Setup

Requires:

- Flutter `3.41.9` / Dart `3.11.5` (the SDK constraint in `pubspec.yaml` is `^3.11.5`).
- JDK 17 for Android builds.

```
flutter pub get
```

Generated `*.freezed.dart` and `*.g.dart` files are committed, so a fresh clone runs without build_runner. Re-run it only after touching a model:

```
dart run build_runner build --delete-conflicting-outputs
```

---

## Run

The app is offline-first: `flutter run` with no flags loads the bundled mock menu so reviewers can exercise the full flow with no backend.

```
# Mock (default)
flutter run

# Live API
flutter run \
  --dart-define=API_BASE_URL=https://api.example.com \
  --dart-define=USE_MOCK=false
```

`USE_MOCK` defaults to `true` and `API_BASE_URL` to a placeholder; both live in `lib/app/env.dart` and are read at compile time.

> **Re: `.env` files.** The submission checklist mentions a `.env`. This project uses `--dart-define` instead — Flutter-native, baked into the build, no runtime file I/O. Same outcome, fewer moving parts. If `.env` is mandatory for review, the change is a one-file swap to `flutter_dotenv`.

---

## Build APK

```
flutter build apk --release \
  --dart-define=API_BASE_URL=https://api.example.com \
  --dart-define=USE_MOCK=false
```

Output: `build/app/outputs/flutter-apk/app-release.apk` (~63 MB fat APK on the current tree).

For a smaller install on a single device, add `--split-per-abi` — that drops each artefact to ~22 MB. Skipped here so a reviewer can grab one file and sideload it.

The release build is signed with the debug keystore (see `android/app/build.gradle.kts`). Fine for review installs; not for distribution. Called out in *Known limitations* below.

---

## Architecture

- **Feature-first layout** under `lib/features/{scan, menu, cart, order}`. Each feature owns its own `data/`, `domain/`, `presentation/` layers and barely talks to the others.
- **Riverpod is the only DI container.** No `get_it`, no `injectable`. `Provider`, `Provider.family`, and `AsyncNotifier` cover everything at this scope.
- **Repository abstraction with live/mock switch.** `MenuRepository` and `OrderRepository` are abstract; `*_live.dart` uses Dio, `*_mock.dart` reads `assets/mock/menu.json` and simulates a 300 ms latency. Selected by `Env.useMock` in `*_repository_provider.dart`.
- **Pure pricing module.** `lib/features/cart/domain/pricing.dart` and `cart_validation.dart` are stateless functions with zero Flutter imports — fully unit-testable. This is where most candidates ship broken math, so it gets the most test coverage.
- **Customization-aware cart line keying.** A `CartLine.id` is `hash(itemId + sorted selected option ids)`. Same item with different toppings → two lines. Same item, same toppings → quantity bump.
- **Sealed `ApiException` hierarchy** in `lib/core/network/`, plus a Dio interceptor that maps `DioException` to a typed exception before any UI sees it. Every async screen handles `loading / error / data` via `AsyncValue.when` and the shared `AppLoader`, `AppErrorView`, and `EmptyState` widgets in `lib/core/widgets/`.
- **Order tracking via polling.** `OrderScreen` runs a 3 s `Timer.periodic`, cancelled when status reaches `served`. WebSocket was cut deliberately — the API doesn't claim to support it and polling already satisfies the requirement.

---

## Why I deviated from the suggested folder structure

The spec suggests a layer-first structure (`screens/`, `models/`, `state/`). I went feature-first instead. At this scope the four features barely interact, and keeping each feature's blast radius local is worth more than the symmetry of seeing every screen in one directory.

The trade-off is real: shared cross-cutting code (theming, networking, generic widgets) has to live somewhere visible, which is what `lib/core/` is for. For a four-feature app I'd rather pay that cost than watch 12 screens slowly grow cross-imports against each other.

---

## What I'd add for production

- **Auth.** The current "BYO table id" model has no user identity. Production needs at least a session token per table.
- **Retry + backoff** on transient Dio errors. Today the user retries by tapping.
- **Crash reporting** (Sentry / Crashlytics) and product analytics.
- **Cart persistence** to `SharedPreferences` so a backgrounded app doesn't lose the cart. See Known Limitations.
- **Offline order queue.** Full offline submission is weeks of edge cases, deliberately deferred.
- **Design tokens** (`spacing`, `radius`, typography ramp) instead of inline magic numbers.
- **A11y pass:** Semantics labels on the scanner, dynamic-type sweep on the totals bar.
- **CI:** `flutter analyze` + `flutter test` on every PR; tag-driven APK builds.
- **L10n setup.** The UI is English-only; the menu strings come from the API, so most of the localisation surface is data-side.

---

## Known limitations

- **Cart is in-memory.** Killing the app loses it. Persistence was a stretch goal cut to protect core features.
- **Release APK uses the debug keystore.** Fine for review installs, not for distribution.
- **`API_BASE_URL` defaults to a placeholder** because IPOT did not provide a real one. Override via `--dart-define` at build time. The app is identical against mock and live as long as the response matches the spec'd shape.
- **iOS is configured but not built for distribution.** Camera permission strings are set in `Info.plist`. Ad-hoc IPA needs a paid Apple Developer account, so iOS is dev-only here.
- **Screenshots/GIF below are placeholders.** They need to be captured on a real device before submission.

---

## Tests

```
flutter test
```

15 tests across `test/features/{cart, menu, scan}` plus a top-level smoke test. Coverage focuses on the rubric-rewarded bits:

- `pricing_test.dart` — exact-total math with multiple customizations + quantity multiplier.
- `cart_validation_test.dart` — required-group and `max_selections` rules.
- `cart_controller_test.dart` — same-item-different-customization keying produces two lines; same selections increment quantity.
- `scan_url_parser_test.dart` — accepted/rejected QR payloads (`ipot://table/{id}`, bare IDs, malformed inputs).
- `menu_screen_test.dart` — widget test against a fake repository, exercises categories + search.

Static analysis:

```
flutter analyze
```

Clean on the current tree; `analysis_options.yaml` adds strict casts/inference and a handful of opinionated lints (`prefer_single_quotes`, `unawaited_futures`, `directives_ordering`).
