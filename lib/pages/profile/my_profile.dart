import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportsmate_flutter/DbHelper.dart';
import 'package:sportsmate_flutter/pages/login/loginpage.dart';
import 'package:sportsmate_flutter/pages/schedule/schedule.dart';
import 'package:sportsmate_flutter/userName.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final username = Provider.of<UsernameProvider>(context, listen: false).username;
    String email = Provider.of<UsernameProvider>(context).email;

    DbHelper dbHelper = DbHelper.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(18.0),
          child: Text('Your Profile'),
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // user information section
              SizedBox(
                width: 120,
                height: 120,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Color.fromARGB(255, 230, 245, 254),
                  child: Image.asset('lib/images/sportmateLogo.png'),
                ),
              ),
              const SizedBox(height: 10),
              Text(username),
              Text(email),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    // implement Edit profile logic here
                    // should open new page that allows user to edit account details
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfileScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 230, 245, 254),
                      side: BorderSide.none,
                      minimumSize: const Size(200, 50),
                      shape: const StadiumBorder()),
                  child: const Text('Edit Profile',
                      style: TextStyle(color: Colors.black)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
        
              // MENU
              Column(
                children: [
                  _buildMenuButton(
                      text: 'Your Schedule',
                      icon: Icons.timelapse,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SchedulePage(),
                          ),
                        );
                      }),
                  _buildMenuButton(
                    text: 'Sports Subscriptions',
                    icon: Icons.sports_soccer,
                    onPressed: () {},
                  ),
                  _buildMenuButton(
                      text: 'Settings', icon: Icons.settings, onPressed: () {}),
                  const Divider(),
                  _buildMenuButton(
                      text: 'Information',
                      icon: Icons.info,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Credits"),
                                content: const Text(
                                    "Joshua Rowley\nSye Phasuk\nRhys Woods\nKuwsh Okai\nJojo Andoh\nMahmoud Abdelfattah\nStanislaw Nowaczyk"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Close'),
                                  ),
                                ],
                              );
                            });
                      }),
                  _buildMenuButton(
                      text: 'Logout',
                      icon: Icons.logout,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Logout"),
                                content: const Text(
                                    "Are you sure you want to logout?"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // logic for logging out the user goes here
                                      Provider.of<UsernameProvider>(context, listen: false).reset();
                                      Navigator.of(context).pop(); // Close the dialog
                                                      Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => LoginPage(),
                                                        ),
                                                      );
                                    },
                                    child: const Text('Logout'),
                                  )
                                ],
                              );
                            });
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(
      {required String text,
      required IconData icon,
      required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 204, 221, 235),
          side: BorderSide.none,
          shape: const StadiumBorder(),
          minimumSize: const Size(200, 50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            text == 'Logout'
                ? Text(
                    text,
                    style: const TextStyle(
                        color: Colors.red), // Text color red for Logout button
                  )
                : Text(
                    text,
                    style: const TextStyle(
                        color:
                            Colors.black), // Text color black for other buttons
                  ),
            Icon(icon, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
