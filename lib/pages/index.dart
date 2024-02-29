import 'package:flutter/material.dart';
import 'package:sportsmate_flutter/pages/groups/index.dart';
import 'package:sportsmate_flutter/pages/matchmaking/index.dart';
import 'package:sportsmate_flutter/pages/profile/index.dart';
import 'package:sportsmate_flutter/pages/schedule/index.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    Groups(),
    const MatchMaking(),
    const Schedule(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Bottom Navigation Demo'),
      // ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.blue,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.groups),
              label: 'Groups',
              backgroundColor: Color.fromARGB(255, 17, 160, 216)),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_tennis),
              label: 'MatchMaking',
              backgroundColor: Color.fromARGB(255, 17, 140, 216)),
          BottomNavigationBarItem(
              icon: Icon(Icons.schedule),
              label: 'Schedule',
              backgroundColor: Color.fromARGB(255, 17, 120, 216)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Color.fromARGB(255, 17, 100, 216)),
        ],
      ),
    );
  }
}
