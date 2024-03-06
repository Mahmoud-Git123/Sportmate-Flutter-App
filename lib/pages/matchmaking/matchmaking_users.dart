import 'package:flutter/material.dart';
import 'package:sportsmate_flutter/DbHelper.dart';
import 'package:sportsmate_flutter/matchmake.dart';
import 'package:sportsmate_flutter/pages/matchmaking/matchmaking_confirmation.dart';

class MatchingUsers extends StatelessWidget {
  final DateTime? selectedDateTime;
  final String? location;
  final String? selectedSport;
  final List<Map<String, dynamic>> matchingPlayers;

  const MatchingUsers({
    Key? key,
    required this.selectedDateTime,
    required this.location,
    required this.selectedSport,
    required this.matchingPlayers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Matchmake m = Matchmake();

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(18.0),
          child: Text('Matching Players...'),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Transform.scale(
              scale: 2.5, // Adjust the scale factor as needed
              child: Image.asset('lib/images/sportmateLogo.png'), // Adjust the path as needed
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Players available at ${selectedDateTime!.toLocal()} in $location for $selectedSport:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: matchingPlayers.length,
                itemBuilder: (context, index) {
                  final player = matchingPlayers[index];
                  return ListTile(
                    title: Text('${player['userName']}',
                        style: Theme.of(context).textTheme.bodyMedium),
                    subtitle: Text('${m.getRank(player['elo'])}',
                        style: Theme.of(context).textTheme.titleMedium),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MatchmakingConfirmation(
                              playerName: player['userName'],
                              dateTime: selectedDateTime!, // Provide selectedDateTime here
                              sport: selectedSport!, // Provide selectedSport here
                              rank: m.getRank(player['elo']), // Provide player rank here
                              onMatchConfirmed: () {
                                // Handle match confirmation logic here
                                DbHelper dbHelper = DbHelper.instance;
                                Map<String, Object> newMatch = {
                                  'sport': '$selectedSport',
                                  'dateTime': '$selectedDateTime',
                                  'location': '$location',
                                  'homeName': 'Emily', // needs changing to user's name
                                  'awayName': '${player['userName']}', 
                                  'homeElo': 200, // needs changing to user's elo
                                  'homePredictedResult': m.expectedResultCalc(200, player['elo']),
                                  'awayElo': player['elo'],
                                  'awayPredictedResult': m.expectedResultCalc(player['elo'], 200),
                                  'gameResult': 'pending',
                                };
                                dbHelper.insertToTable('match', newMatch);
                              }
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 230, 245, 254),
                      ),
                      child: const Text('Select',
                          style: TextStyle(color: Color.fromARGB(255, 2, 38, 63))),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
