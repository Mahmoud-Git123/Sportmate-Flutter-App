import 'package:flutter/material.dart';
import 'package:sportsmate_flutter/pages/login/loginpage.dart';
import 'package:sportsmate_flutter/userName.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets(
      'LoginPage should have username and password fields and a login button',
      (WidgetTester tester) async {
    // Build SporMate app and trigger a frame
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => UsernameProvider(),
        child: const MaterialApp(home: LoginPage()),
      ),
    );

    // Ensure that the login button is displayed
    expect(find.text('LOGIN'), findsOneWidget);

    // Ensure that username and password fields are displayed
    expect(find.byIcon(Icons.person), findsOneWidget);
    expect(find.byIcon(Icons.lock), findsOneWidget);
  });
}
