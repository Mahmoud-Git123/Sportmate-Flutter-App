// Import the necessary packages
import 'package:flutter_test/flutter_test.dart';
import 'package:sportsmate_flutter/pages/schedule/index.dart';

void main() {
  testWidgets('Schedule widget should be created and rendered correctly',
      (WidgetTester tester) async {
    // Build SporMate app and trigger a frame
    await tester.pumpWidget(const Schedule());

    // Ensure that the Schedule page is rendered
    expect(find.byType(Schedule), findsOneWidget);
  });
}
