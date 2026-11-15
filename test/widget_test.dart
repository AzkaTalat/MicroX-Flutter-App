
import 'package:flutter_test/flutter_test.dart';
import 'package:microx_app/main.dart';

void main() {
  testWidgets('MicroX Careers screen test', (WidgetTester tester) async {
    await tester.pumpWidget(const MicroxApp());

    expect(
      find.text('Your next chapter starts with curiosity.'),
      findsOneWidget,
    );

    expect(find.text('GROW WITH US'), findsOneWidget);

    expect(find.text('Team Portal'), findsOneWidget);
  });
}
