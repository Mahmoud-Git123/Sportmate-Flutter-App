import 'package:flutter/material.dart';
import 'package:sportsmate_flutter/DbHelper.dart';
import 'schedule_manager.dart';
import 'package:sportsmate_flutter/pages/matchmaking/matchmaking.dart';
import 'package:sportsmate_flutter/matchmake.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {

  DbHelper dbHelper = DbHelper.instance;
  Matchmake matchmake = Matchmake();
  List<Map<String, dynamic>> previousMatches = [];
  
  @override
  void initState() {
    super.initState();
    getPreviousMatches();
  }

  

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
            padding: const EdgeInsets.all(8.0),
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
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), 
                  ),
                  child: ListTile(
                    title: Text(
                      '${_formatDate(matchDateTime)}',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Player Name: ${match['playerName']}',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'Sport: ${match['sport']}',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'Rank: ${match['rank']}',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: const Color.fromARGB(255, 230, 245, 254),
                              title: const Text('Confirm Deletion'),
                              content: const Text('Are you sure you want to delete this match? The match will be cancelled and will be removed from your schedule'),
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
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Previous Matches',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
        itemCount: previousMatches.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> match = previousMatches[index];
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
            ),
            child: ListTile(
              title: Text('${match['sport']} match against ${match['awayName']}'),
              subtitle: Text('Date: ${match['dateTime']} result: ${match['gameResult']}'),
              
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      updateMatchResult(index, 'win');
                      double newHomeElo = matchmake.postGameEloCalc(match['homeElo'], match['homePredictedResult'], 'win');
                      double newAwayElo = matchmake.postGameEloCalc(match['awayElo'], match['awayPredictedResult'], 'lose');
                      dbHelper.updateMatchElo(match['id'], newHomeElo, newAwayElo);
                      dbHelper.printUpdatedMatch(match['id']);
                      getPreviousMatches();
                      setState(() {});
                    },
                    child: Text('Win'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      updateMatchResult(index, 'lose');
                      getPreviousMatches();
                      setState(() {});
                    },
                    child: Text('Lose'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      updateMatchResult(index, 'draw');
                      double newHomeElo = matchmake.postGameEloCalc(match['homeElo'], match['homePredictedResult'], 'draw');
                      double newAwayElo = matchmake.postGameEloCalc(match['awayElo'], match['awayPredictedResult'], 'lose');
                      dbHelper.updateMatchElo(match['id'], newHomeElo, newAwayElo);
                      dbHelper.printUpdatedMatch(match['id']);
                      getPreviousMatches();
                      setState(() {});
                    },
                    child: Text('Draw'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MatchmakingPage()),
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

  Future<void> getPreviousMatches() async {
    try {
      List<Map<String, dynamic>> matches = await dbHelper.getPastMatches();
      setState(() {
        previousMatches = matches;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateMatchResult(int index, String result) async {
  try {
    Map<String, dynamic> match = Map<String, dynamic>.from(previousMatches[index]);
    match['gameResult'] = result;
    await dbHelper.updateGameResult('match', match['id'], result);
  } catch (e) {
    print(e.toString());
  }
}

}