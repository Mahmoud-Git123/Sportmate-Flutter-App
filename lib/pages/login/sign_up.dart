import 'package:flutter/material.dart';
import 'package:sportsmate_flutter/SQLite/SQLite.dart';
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

  bool isVisible = true;

  final formKey = GlobalKey<FormState>();
  final db = DatabaseHelper();

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
          child: SingleChildScrollView(
            child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Form(
                key: formKey,
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

                  //username field
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      color: const Color.fromARGB(255, 183, 208, 246),
                    ),
                    child: TextFormField(
                      controller: nameController,
                      //validating empty fields
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter username";
                        }
                        return null;
                      },

                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text("Username"),
                      ),
                    ),
                  ),

                  //email field
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      color: const Color.fromARGB(255, 183, 208, 246),
                    ),
                    child: TextFormField(
                      controller: emailController,
                      //validating empty fields
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter your email";
                        }
                        return null;
                      },

                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text("Email"),
                      ),
                    ),
                  ),


                  //password field
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      color: const Color.fromARGB(255, 183, 208, 246),
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      //validating empty fields
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter a password";
                        }
                        return null;
                      },

                     obscureText: isVisible,
                        decoration: InputDecoration(
                            icon: const Icon(Icons.lock),
                            border: InputBorder.none,
                            label: const Text("Password"),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                icon: const Icon(Icons.visibility))),
                    ),
                  ),

                  //phone number field 
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      color: const Color.fromARGB(255, 183, 208, 246),
                    ),
                    child: TextFormField(
                      controller: phoneController,
                      //validating empty fields
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please confirm password";
                        }
                        return null;
                      },

                      obscureText: isVisible,
                        decoration: InputDecoration(
                            icon: const Icon(Icons.lock),
                            border: InputBorder.none,
                            label: const Text("Confirm password"),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                icon: const Icon(Icons.visibility))),
                    ),
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
              )
              
            ),
          ),
          )          
        ));
  }
}
