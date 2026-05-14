import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipot_mobile/app/app.dart';

void main() {
  testWidgets('app renders placeholder home screen on launch',
      (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: IpotMobileApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('IPOT Mobile'), findsOneWidget);
    expect(find.textContaining('QR ordering'), findsOneWidget);
  });
}
