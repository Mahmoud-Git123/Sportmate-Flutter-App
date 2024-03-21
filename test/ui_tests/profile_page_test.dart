import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:sportsmate_flutter/pages/profile/index.dart';
import 'package:sportsmate_flutter/pages/profile/my_profile.dart';
import 'package:sportsmate_flutter/userName.dart';

void main() {
  testWidgets('Profile widget should be created and rendered correctly',
      (WidgetTester tester) async {
    // Build SportMate app and trigger a frame
    await tester.pumpWidget(
      ChangeNotifierProvider<UsernameProvider>(
        create: (_) => UsernameProvider(),
        child: const Profile(),
      ),
    );

    // Ensure that the Profile page is rendered
    expect(find.byType(Profile), findsOneWidget);
    expect(find.byType(ProfileScreen), findsOneWidget);
    expect(find.byType(MaterialApp), findsOneWidget);
  });
} 
