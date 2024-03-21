import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sportsmate_flutter/pages/matchmaking/index.dart';
import 'package:sportsmate_flutter/pages/matchmaking/matchmaking.dart';

void main() {
  testWidgets('MatchMaking widget should be rendered',
      (WidgetTester tester) async {
    // Build SporMate app and trigger a frame
    await tester.pumpWidget(const MaterialApp(home: MatchMaking()));

    // Ensure that MatchmakingPage widget is being displayed
    expect(find.byType(MatchmakingPage), findsOneWidget);

    // Ensure that MatchMaking widget is being displayed
    expect(find.byType(MatchMaking), findsOneWidget);

    // Ensure app bar is being displayed
    expect(find.byType(AppBar), findsOneWidget);
  });
}
