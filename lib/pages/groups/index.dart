import 'package:flutter/material.dart';
import 'package:sportsmate_flutter/pages/groups/group_feed.dart';

class Group {
  final String name;
  final String description;
  final DateTime lastUpdateTime;

  Group({
    required this.name,
    required this.description,
    required this.lastUpdateTime,
  });
}
class Groups extends StatelessWidget {
  final List<Group> managedGroups = [
    Group(
      name: 'Managed Group 1',
      description: 'Description 1',
      lastUpdateTime: DateTime.now(),
    ),
    Group(
      name: 'Managed Group 2',
      description: 'Description 2',
      lastUpdateTime: DateTime.now(),
    ),
  ];

  final List<Group> allGroups = [
    Group(
      name: 'LancsBallers',
      description: 'Casual Football Sessions',
      lastUpdateTime: DateTime.now(),
    ),
    Group(
      name: 'Tennis Group',
      description: 'Competitive Tennis Matchups (Singles & Doubles)',
      lastUpdateTime: DateTime.now(),
    ),
  ];

  Groups({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 230, 245, 253),
          foregroundColor: Color.fromARGB(255, 234, 234, 234),
          titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Color.fromARGB(255, 2, 38, 63),
            fontSize: 20,
          ),
        ),
        textTheme: const TextTheme(
          headline6: TextStyle(
            fontFamily: 'Poppins',
          ),
          bodyText2: TextStyle(
            fontFamily: 'Poppins',
          ),
          button: TextStyle(
            fontFamily: 'Poppins',
          ),
          subtitle1: TextStyle(
            fontFamily: 'Poppins',
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      home: Scaffold(
    appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(18.0),
          child: Text('Your Groups!'),
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
          children: [
            const ListTile(
              title: Text(
                "Groups you Manage",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ...managedGroups.map((group) {
              return InkWell(
                onTap: () {
                  // Navigate to the group feed page with the selected group information
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroupFeedPage(group: group),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(group.name),
                  subtitle: Text(group.description),
                ),
              );
            }),
            // Add the "Create New +" button
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 230, 245, 254),
              ),
              child: const Text(
                "Create New +",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            const ListTile(
              title: Text(
                "All Groups",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ...allGroups.map((group) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroupFeedPage(group: group),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(group.name),
                  subtitle: Text(group.description),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
