import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ipot_mobile/features/scan/presentation/scan_screen.dart';

/// Top-level [GoRouter] configuration.
///
/// Routes are added as features land:
/// - `/scan`    — QR scanner (B1)
/// - `/menu/:tableId`  — menu browse (B2; placeholder until then)
/// - `/cart`    — cart review (B3)
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
        return _PlaceholderMenuScreen(tableId: tableId);
      },
    ),
  ],
);

/// Temporary menu landing until B2 ships the real [MenuScreen].
class _PlaceholderMenuScreen extends StatelessWidget {
  const _PlaceholderMenuScreen({required this.tableId});

  final String tableId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Table $tableId')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'Menu for table $tableId loads in B2.\n'
            'Scan flow is wired — you reached the right route.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
