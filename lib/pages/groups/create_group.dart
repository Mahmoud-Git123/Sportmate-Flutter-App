import 'package:flutter/material.dart';
import 'package:sportsmate_flutter/pages/groups/default_group.dart';

class CreateGroupPage extends StatelessWidget {
  const CreateGroupPage({super.key});

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
            child: Text("Your Groups")
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Group Details",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Group Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  maxLines: null,
                  decoration: const InputDecoration(
                    labelText: "Group Description",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DefaultGroupPage(),
                      )
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 230, 245, 253),
                  ),
                  child: const Text(
                    "Create Group +",
                    style: TextStyle(
                      color: Color.fromARGB(255, 2, 47, 63),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
