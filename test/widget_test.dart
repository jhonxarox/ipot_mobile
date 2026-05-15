import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipot_mobile/app/app.dart';
import 'package:ipot_mobile/features/scan/presentation/scan_controller.dart';

/// Fixed permission state so widget tests avoid real camera / platform channels.
class _TestScanController extends ScanController {
  @override
  ScanState build() =>
      const ScanState(permission: ScanPermissionStatus.denied);
}

void main() {
  testWidgets('app opens on scan screen', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          scanControllerProvider.overrideWith(_TestScanController.new),
        ],
        child: const IpotMobileApp(),
      ),
    );
    await tester.pump();

    expect(find.text('Scan table QR'), findsOneWidget);
    expect(find.text('Allow camera'), findsOneWidget);
    expect(find.text('Enter table ID manually'), findsOneWidget);
  });
}
