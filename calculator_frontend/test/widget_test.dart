import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_frontend/main.dart';

void main() {
  testWidgets('App builds without errors', (tester) async {
    await tester.pumpWidget(const CalculatorApp());
    expect(find.byType(CalculatorApp), findsOneWidget);
  });
}
