class ScheduleManager {
  static List<Map<String, dynamic>> confirmedMatches = [];

  static void addMatch({
    required String playerName,
    required DateTime dateTime,
    required String sport,
    required String rank,
  }) {
    confirmedMatches.add({
      'playerName': playerName,
      'dateTime': dateTime,
      'sport': sport,
      'rank': rank,
    });
  }

  static void deleteMatch(Map<String, dynamic> match) {
    confirmedMatches.remove(match);
  }
}
