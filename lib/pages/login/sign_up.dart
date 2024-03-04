import 'package:flutter/material.dart';
import 'package:sportsmate_flutter/components/text_field.dart';
import 'package:sportsmate_flutter/pages/login/sign_up_sport.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

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
                    "Create your account",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 0, 13, 70),
                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(height: 30),

                  textField(
                    controller: nameController,
                    hintText: 'Username',
                  ),
                  const SizedBox(height: 20),
                  textField(
                    controller: emailController,
                    hintText: 'Email',
                  ),
                  const SizedBox(height: 20),
                  textField(
                    controller: passwordController,
                    hintText: 'Password',
                  ),
                  const SizedBox(height: 20),
                  textField(
                    controller: phoneController,
                    hintText: 'Phone Number',
                  ),

                  const SizedBox(height: 30),

                  //continue button
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpSportPage(),
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
