import 'package:flutter/material.dart';

void main() {
  runApp(const GroupApp());
}

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

class HoverContainer extends StatefulWidget {
  final Widget child;
  final Color hoverColour;

  const HoverContainer({
    Key? key,
    required this.child,
    required this.hoverColour,
  }) : super(key: key);

  @override
  _HoverContainerState createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _mouseEnter(true),
      onExit: (_) => _mouseEnter(false),
      child: Container(
        color: _isHovered ? widget.hoverColour : Colors.transparent,
        child: widget.child,
      ),
    );
  }

  void _mouseEnter(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}

class GroupsPage extends StatelessWidget {
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

  GroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
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

class GroupFeedPage extends StatelessWidget {
  final Group group;

  const GroupFeedPage({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${group.name} Feed"),
        backgroundColor: Colors.blue, // Set the app bar color
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              group.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Set button color
                ),
                child: const Text(
                  "Joined",
                  style: TextStyle(
                    color: Colors.black
                  )
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Set button color
                ),
                child: const Text(
                  "Invite +",
                  style: TextStyle(
                    color: Colors.black
                  )
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Set button color
                ),
                child: const Text(
                  "Tagged",
                  style: TextStyle(
                    color: Colors.black
                  )
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Set button color
                ),
                child: const Text(
                  "Media(photos/videos)",
                  style: TextStyle(
                    color: Colors.black
                  )
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Set button color
                ),
                child: const Text(
                  "Events",
                  style: TextStyle(
                    color: Colors.black
                  )
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                hintText: "New Post...",
                border: OutlineInputBorder(),
              ),
              maxLines: null,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Post $index"),
                  subtitle: const Text("Post content... lorem ipsum dolor sit amet"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.thumb_up),
                        onPressed: () {
                          // Handle button press
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.comment),
                        onPressed: () {
                          // Handle button press
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.share),
                        onPressed: () {
                          // Handle button press
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class GroupApp extends StatelessWidget {
  const GroupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Groups',
      theme: ThemeData(
        primaryColor: Colors.blue, // Set the primary color
        hintColor: Colors.white, // Set the accent color
      ),
      home: GroupsPage(),
    );
  }
}