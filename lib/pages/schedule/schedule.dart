import 'package:flutter/material.dart';
import 'schedule_manager.dart';
import 'package:sportsmate_flutter/pages/matchmaking/matchmaking.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Your Schedule'),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Transform.scale(
              scale: 2.5,
              child: Image.asset('lib/images/sportmateLogo.png'),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Upcoming Matches',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: ScheduleManager.confirmedMatches.length,
              itemBuilder: (context, index) {
                final match = ScheduleManager.confirmedMatches[index];
                final DateTime matchDateTime = match['dateTime'];

                return Card(
                  color: const Color.fromARGB(255, 230, 245, 254),
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    title: Text(
                      _formatDate(matchDateTime),
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Player Name: ${match['playerName']}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'Sport: ${match['sport']}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'Rank: ${match['rank']}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor:
                                  const Color.fromARGB(255, 230, 245, 254),
                              title: const Text('Confirm Deletion'),
                              content: const Text(
                                  'Are you sure you want to delete this match? The match will be cancelled and will be removed from your schedule'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      ScheduleManager.deleteMatch(match);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Confirm Deletion',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MatchmakingPage()),
              );
            },
            label: const Text(
              'Find A New Match!',
              style: TextStyle(color: Color.fromARGB(255, 2, 38, 63)),
            ),
            icon: const Icon(Icons.add),
            backgroundColor: const Color.fromARGB(255, 230, 245, 254),
            tooltip: 'Add Availability',
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
}
