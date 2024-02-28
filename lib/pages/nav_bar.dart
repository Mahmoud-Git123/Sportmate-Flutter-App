import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class navBar extends StatelessWidget {
  const navBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Color.fromARGB(255 , 230, 245, 253),
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Color.fromARGB(255, 2, 135, 217),
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Color.fromARGB(255 , 230, 245, 253),
              color: Color.fromARGB(255, 6, 24, 106),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                  onPressed: (){
                    Navigator.pushNamed(context, '/home');
                  },
                ),
                GButton(
                  icon: Icons.timer,
                  text: 'Scheduele',
                ),
                GButton(
                  icon: Icons.add,
                  text: 'Availability',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),

              ],
          ),
        ),
        ),
      ),
      );
  }
}