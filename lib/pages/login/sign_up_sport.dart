import 'package:flutter/material.dart';
import 'package:sportsmate_flutter/pages/index.dart';


class SignUpSportPage extends StatelessWidget {
  SignUpSportPage({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final cityController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 250, 255),
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
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  //logo
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset('lib/images/sportmateLogo.png',
                        height: 248),
                  ),

                  //text: Welcome to SportMate
                  const Text(
                    "Welcome to SportMate!",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 0, 13, 70),
                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(height: 30),

                  DropdownButton(
                    value: 'Sports',
                    onChanged: (String? newValue) {
                      // Handle selection of a new option
                      print('Selected: $newValue');
                    },
                    items: <String>[
                      'Option 1',
                      'Option 2',
                      'Option 3',
                      'Option 4'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 20),

                  //continue button
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Navigation(),
                        )),
                    child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 2, 133, 217),
                                Color.fromARGB(255, 2, 38, 63),
                              ],
                              stops: [
                                0.0,
                                0.7
                              ],
                              //begin: Alignment.bottomLeft,
                              //end: Alignment.topRight,
                              transform: GradientRotation(0.5)),
                          borderRadius: BorderRadius.circular(205),
                        ),
                        padding: const EdgeInsets.all(15),
                        child: const Center(
                          child: Text(
                            "Continue",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 20),
                          ),
                        )),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ));
  }
}
