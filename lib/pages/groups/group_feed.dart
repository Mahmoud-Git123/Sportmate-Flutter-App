import 'package:flutter/material.dart';
import 'package:sportsmate_flutter/pages/groups/index.dart';

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
