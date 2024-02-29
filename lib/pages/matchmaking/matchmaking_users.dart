import 'package:flutter/material.dart';
import 'package:sportsmate_flutter/pages/matchmaking/matchmaking_confirmation';

class MatchingUsers extends StatelessWidget {
  final DateTime? selectedDateTime;
  final String? location;
  final String? selectedSport;

  const MatchingUsers({super.key, 
    required this.selectedDateTime,
    required this.location,
    required this.selectedSport,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> matchingPlayers = [
      {'name': 'Player 1', 'rank': 'Diamond 3'},
      {'name': 'Player 2', 'rank': 'Diamond 1'},
      {'name': 'Player 3', 'rank': 'Diamond 2'},
    ];

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
                    title: Text('${player['name']}',
                        style: Theme.of(context).textTheme.bodyMedium),
                    subtitle: Text('${player['rank']}',
                        style: Theme.of(context).textTheme.titleMedium),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MatchmakingConfirmation(
                              playerName: player['name'],
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
