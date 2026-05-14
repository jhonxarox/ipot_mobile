import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Top-level [GoRouter] configuration.
///
/// Routes are added as features land:
/// - `/`        — placeholder home (replaced by `/scan` in B1)
/// - `/scan`    — QR scanner (B1)
/// - `/menu/:tableId`  — menu browse (B2)
/// - `/cart`    — cart review (B3)
/// - `/order/:orderId` — confirmation + tracking (B5)
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const _PlaceholderHomeScreen(),
    ),
  ],
);

/// Temporary landing screen until the QR scanner ships in B1.
///
/// Kept private and colocated with the router so it can be deleted in a
/// single edit without leaking into the `features/` tree.
class _PlaceholderHomeScreen extends StatelessWidget {
  const _PlaceholderHomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('IPOT Mobile')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'QR ordering coming soon.\nScan a table QR to start.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
