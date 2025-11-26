import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_frontend/main.dart';

void main() {
  // Keep CI-fast smoke test with short timeout to avoid hangs.
  testWidgets(
    'App builds without errors (smoke)',
    (tester) async {
      await tester.pumpWidget(const CalculatorApp());
      await tester.pump(const Duration(milliseconds: 50));
      expect(find.byType(CalculatorApp), findsOneWidget);
    },
    timeout: const Timeout(Duration(seconds: 10)),
  );
}
