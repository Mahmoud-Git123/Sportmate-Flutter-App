import 'package:flutter/material.dart';
import 'package:sportsmate_flutter/pages/schedule/schedule_manager.dart';
import 'package:sportsmate_flutter/pages/schedule/schedule.dart';

class MatchmakingConfirmation extends StatelessWidget {
  final String playerName;
  final DateTime dateTime;
  final String sport;
  final String rank;
  final VoidCallback onMatchConfirmed;

  const MatchmakingConfirmation({
    Key? key,
    required this.playerName,
    required this.dateTime,
    required this.sport,
    required this.rank,
    required this.onMatchConfirmed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matchmaking Confirmation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Matchmaking with $playerName is confirmed!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ScheduleManager.addMatch(
                  playerName: playerName,
                  dateTime: dateTime,
                  sport: sport,
                  rank: rank,
                );
                onMatchConfirmed();
                Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SchedulePage(),
                      ),
                    );
                  },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 234, 234, 234),
              ),
              child: const Text(
                'Confirm and go to Schedule',
                style: TextStyle(color: Color.fromARGB(255, 2, 38, 63)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
