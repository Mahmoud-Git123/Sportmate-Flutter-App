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
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Your Groups"),
          backgroundColor: Colors.blue, // Set the app bar color
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
                backgroundColor: Colors.blue, // Set button color
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
