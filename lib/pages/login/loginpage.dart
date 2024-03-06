import 'package:flutter/material.dart';
import 'package:sportsmate_flutter/JSON%20models/user_model.dart';
import 'package:sportsmate_flutter/pages/index.dart';
import 'package:sportsmate_flutter/pages/login/sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passWordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isVisible = true;
  bool isLoginTrue = false;

  // login() async {
  //   var response = await db
  //     .login(UserModel(userName: usernameController.text, userPassword: passWordController.text));
  //   if (response == true) {
  //     if(!mounted) return;
  //       Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => const Navigation())
  //       );
  //   } else {
  //     setState(() {
  //       isLoginTrue = true;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 99, 171, 209),
      body: Center(
        child: Container(
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
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    //logo
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset('lib/images/sportmateLogo.png',
                          height: 248),
                    ),

                    //welcome text
                    const Text(
                      "Welcome to SportMate!",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 0, 13, 70),
                        fontSize: 23,
                      ),
                    ),

                    const SizedBox(height: 30),

                    //username
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150),
                        color: const Color.fromARGB(255, 183, 208, 246),
                      ),
                      child: TextFormField(
                        controller: usernameController,
                        //validating empty fields
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "username is required";
                          }
                          return null;
                        },

                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          border: InputBorder.none,
                          label: Text("Username"),
                        ),
                      ),
                    ),

                    //password
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150),
                        color: const Color.fromARGB(255, 183, 208, 246),
                      ),
                      child: TextFormField(
                        controller: passWordController,
                        //validating empty fields
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "username is required";
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

                    const SizedBox(height: 20),

                    //login button
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 22, 18, 154),
                          borderRadius: BorderRadius.circular(200)),
                      child: TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(
                              color: Color.fromARGB(235, 254, 254, 254)),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

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
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()),
                          );
                        },
                        child: const Text(
                          "SIGN UP",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 12.0,
                            color: Color.fromARGB(255, 6, 41, 69),
                          ),
                        )),

                    const SizedBox(height: 100)
                  ],
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
