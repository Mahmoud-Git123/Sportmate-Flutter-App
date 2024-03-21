// This is the main test file. It ensures that the app loads and that the first page displayed is the login page.
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:sportsmate_flutter/main.dart';
import 'package:sportsmate_flutter/pages/login/loginpage.dart';
import 'package:sportsmate_flutter/userName.dart';

void main() {
  testWidgets('App should run and show LoginPage', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => UsernameProvider(),
        child: const SportMate(),
      ),
    );

    // Verify that LoginPage is being shown.
    expect(find.byType(LoginPage), findsOneWidget);
  });
}