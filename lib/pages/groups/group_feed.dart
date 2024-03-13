import 'package:flutter/material.dart';
import 'package:sportsmate_flutter/pages/groups/index.dart';

class GroupFeedPage extends StatefulWidget {
  final Group group;

  const GroupFeedPage({super.key, required this.group});

  @override
  State<GroupFeedPage> createState() => _GroupFeedPageState();
}

class _GroupFeedPageState extends State<GroupFeedPage> {
  final postTitleController = TextEditingController();
  final postContentController = TextEditingController();

  bool _isLiked = false;

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
      ),
      home: Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(18.0),
          child: Text("Group Feed"),
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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
            Color.fromARGB(255, 2, 135, 217),
            Color.fromARGB(255, 255, 255, 255),
          ],
              stops: [
            0.0,
            0.7
          ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              transform: GradientRotation(0.5))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                widget.group.name,
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
                    backgroundColor: const Color.fromARGB(255, 230, 245, 254),
                  ),
                  child: const Text(
                    "Joined",
                    style: TextStyle(
                      color: Color.fromARGB(255, 2, 48, 63)
                    )
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 230, 245, 254),
                  ),
                  child: const Text(
                    "Invite +",
                    style: TextStyle(
                      color: Color.fromARGB(255, 2, 48, 63)
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
                    backgroundColor: const Color.fromARGB(255, 230, 245, 254),
                  ),
                  child: const Text(
                    "Tagged",
                    style: TextStyle(
                      color: Color.fromARGB(255, 2, 48, 63)
                    )
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 230, 245, 254),
                  ),
                  child: const Text(
                    "Media(photos/videos)",
                    style: TextStyle(
                      color: Color.fromARGB(255, 2, 48, 63)
                    )
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 230, 245, 254),
                  ),
                  child: const Text(
                    "Events",
                    style: TextStyle(
                      color: Color.fromARGB(255, 2, 48, 63)
                    )
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                decoration: InputDecoration(
                  // controller: postTitleController,
                  hintText: "New Post...",
                  border: OutlineInputBorder(),
                ),
                maxLines: null,
              ),
            ),
            
          ],
        ),
      ),
      )
    );
  }

  Widget post(String postTitle, String postContent) {
    return ListTile(
      title: Text(postTitle),
      subtitle: Text(postContent),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              icon: _isLiked ? const Icon(Icons.thumb_up) : const Icon(Icons.thumb_up_outlined),
              onPressed: () {
                setState(() {
                  _isLiked = !_isLiked;
                });
              },
            ),
          IconButton(
            icon: const Icon(Icons.comment),
            onPressed: () {
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
            },
          ),
        ],
      ),
    );
  }



}
