import 'dart:math' as math;
import 'package:sportsmate_flutter/DbHelper.dart';

class Matchmake {
  DbHelper dbHelper = DbHelper.instance;

  List getMultipliers(int lossStreak, int winStreak) {
    double lossStreakMultil = 0;
    double winStreakMulti = 0;

    if (lossStreak > 1) {
      lossStreakMultil = 0.1;
    } else if (winStreak > 1) {
      winStreakMulti = winStreak == 2
          ? 0.1
          : winStreak == 3
              ? 0.2
              : 0.25;
    }

    return [lossStreakMultil, winStreakMulti];
  }

  double expectedResultCalc(double elo, double opponentElo) {
    double eloDifference = elo - opponentElo;
    double expectedResult = 1 / (math.pow(10, eloDifference / 400) + 1);

    return expectedResult;
  }

  double postGameEloCalc(double elo, expectedResult, String gameResult) {
    double resultValue = gameResult == "win"
        ? 1
        : gameResult == "draw"
            ? 0.5
            : 0;

    double eloCalc = elo * (resultValue - expectedResult);

    double newElo = elo + eloCalc;

    return newElo;
  }

  String getRank(double newElo) {
    String newRank = newElo < 300
        ? "Bronze"
        : newElo < 600
            ? "Silver"
            : newElo < 900
                ? "Gold"
                : newElo < 1200
                    ? "Platinum"
                    : "Pro";
    return newRank;
  }

  List findOpponents() {
    //finds and sets opponent

    //gets users from database that match
    List<double> opponents = [];

    return opponents;
  }
}
