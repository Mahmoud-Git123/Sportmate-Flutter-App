import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportsmate_flutter/pages/index.dart';
import 'package:sportsmate_flutter/pages/login/sign_up.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final userNameController = TextEditingController();
  final passWordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

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
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      //logo
                      Padding(
                        padding: const EdgeInsets.all(10.0),
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

                      const SizedBox(height: 80),

                      TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "username is required";
                            }
                            return null;
                          },
                          decoration:
                              const InputDecoration(hintText: "Username")),
                      const SizedBox(height: 25),
                      TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "password is required";
                            }
                            return null;
                          },
                          decoration:
                              const InputDecoration(hintText: "Password")),

                      const SizedBox(height: 40),

                      //login button
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Navigation(),
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
                            padding: const EdgeInsets.all(25),
                            child: const Center(
                              child: Text(
                                "Log in",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 20),
                              ),
                            )),
                      ),

                      const SizedBox(height: 20),

                      //text: Don't have an account
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 13, 70),
                          fontSize: 13,
                        ),
                      ),

                      //sign up button
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            )),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 6, 41, 69),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ));
  }
}
