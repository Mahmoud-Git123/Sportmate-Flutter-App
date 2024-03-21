import 'package:flutter_test/flutter_test.dart';
import 'package:sportsmate_flutter/matchmake.dart';

void main() {
  // Create an instance of the Matchmake class
  final matchmake = Matchmake();

  // Ensure getRank returns the correct rank for different Elo values
  test('getRank', () {
    expect(matchmake.getRank(200), "Bronze");
    expect(matchmake.getRank(400), "Silver");
    expect(matchmake.getRank(700), "Gold");
    expect(matchmake.getRank(1000), "Platinum");
    expect(matchmake.getRank(1300), "Pro");
  });

  // Ensure getMultipliers returns the correct multipliers for different inputs
  test('getMultipliers', () {
    expect(matchmake.getMultipliers(2, 0), [0.1, 0.0]);
    expect(matchmake.getMultipliers(0, 2), [0.0, 0.1]);
    expect(matchmake.getMultipliers(0, 3), [0.0, 0.2]);
    expect(matchmake.getMultipliers(0, 4), [0.0, 0.25]);
  });

  // Ensure expectedResultCalc returns a non-negative value
  test('expectedResultCalc', () {
    expect(matchmake.expectedResultCalc(1200, 1000), isNonNegative);
    expect(matchmake.expectedResultCalc(1000, 1200), isNonNegative);
  });

  // Ensure postGameEloCalc returns a non-negative value
  test('postGameEloCalc', () {
    expect(matchmake.postGameEloCalc(1200, 0.76, "win"), isNonNegative);
    expect(matchmake.postGameEloCalc(1200, 0.76, "draw"), isNonNegative);
    expect(matchmake.postGameEloCalc(1200, 0.76, "loss"), isNonNegative);
  });
}
