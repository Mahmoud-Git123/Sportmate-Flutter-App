import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sportsmate_flutter/pages/groups/index.dart';

void main() {
  testWidgets('Groups widget should be rendered', (WidgetTester tester) async {

    // Build SporMate app and trigger a frame
    await tester.pumpWidget(MaterialApp(home: Groups()));

    // Ensure that Groups widget is being displayed
    expect(find.byType(Groups), findsOneWidget);

    // Ensure that the "All Groups" and "Groups you Manage" titles are displayed
    expect(find.text('All Groups'), findsOneWidget);
    expect(find.text('Groups you Manage'), findsOneWidget);

    // Ensure that the "Create New +" button is being displayed
    expect(find.text('Create New +'), findsOneWidget);

    // Ensure that AppBar widget is being displayed
    expect(find.byType(AppBar), findsOneWidget);
  });
}