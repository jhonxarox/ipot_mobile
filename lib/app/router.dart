import 'package:go_router/go_router.dart';

import '../features/cart/presentation/cart_screen.dart';
import '../features/menu/presentation/menu_screen.dart';
import '../features/scan/presentation/scan_screen.dart';

/// Top-level [GoRouter] configuration.
///
/// Routes:
/// - `/scan`    — QR scanner (B1)
/// - `/menu/:tableId`  — menu browse (B2)
/// - `/cart`    — cart review (B4)
/// - `/order/:orderId` — confirmation + tracking (B5)
final appRouter = GoRouter(
  initialLocation: '/scan',
  routes: [
    GoRoute(path: '/', redirect: (context, state) => '/scan'),
    GoRoute(path: '/scan', builder: (context, state) => const ScanScreen()),
    GoRoute(
      path: '/menu/:tableId',
      builder: (context, state) {
        final tableId = state.pathParameters['tableId']!;
        return MenuScreen(tableId: tableId);
      },
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartScreen(),
    ),
  ],
);
