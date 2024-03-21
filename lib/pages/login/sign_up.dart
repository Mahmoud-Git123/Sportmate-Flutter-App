import 'package:flutter/material.dart';
import 'package:sportsmate_flutter/DbHelper.dart';
import 'package:sportsmate_flutter/pages/login/loginpage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}



class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassword = TextEditingController();

  DbHelper dbHelper = DbHelper.instance;

  bool isVisible = true;

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

                  // confirm password field 
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      color: const Color.fromARGB(255, 183, 208, 246),
                    ),
                    child: TextFormField(
                      controller: confirmPassword,
                      //validating empty fields and whether password and confirm password match 
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password is required";
                        } else if (passwordController.text != confirmPassword.text) {
                          return "passwords don't match";
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

                  const SizedBox(height: 10),

                  //sign up button
                  Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * .9,
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
                          borderRadius: BorderRadius.circular(200)),
                      child: TextButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            //checks if the username already exists
                            bool usernameExist = await dbHelper.doesUsernameExist('user', nameController.text);
                            bool emailExist = await dbHelper.isEmailInUse('user', emailController.text);
                            //checks if username is taken and if email is in use
                            if(usernameExist == false && emailExist == false) {
                              bool isEmailValid = isValidEmail(emailController.text);
                              //checks if email is valid
                              if(isEmailValid == true) {
                                //if the username is not taken and email is not in use, insert users sign up information into database 
                                Map<String, Object> signUpUser = {
                                  'userName': nameController.text,
                                  'email': emailController.text,
                                  'password': confirmPassword.text,
                                  'elo': 100,
                                };
                                await dbHelper.insertToTable('user', signUpUser);
                                //then goes to login page
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const LoginPage()),
                                  );
                                } else {
                                  showErrorMessage(context, "Please enter valid email");
                                }                                                        
                            } else {
                              //show error message if username does exist
                              showErrorMessage(context, "Username or email is already in use");
                            }                     
                          }
                        },
                        child: const Text(
                          "SIGN UP",
                          style: TextStyle(
                              color: Color.fromARGB(235, 254, 254, 254)),
                        ),
                      ),
                    ),

                  const SizedBox(height: 50),
                ],
              ),
              )
            ),
          ),
          )          
        ));
  }
  
  //method for error message
  void showErrorMessage(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          errorMessage,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  //checks whether email it valid
  bool isValidEmail(String email) {
    // This regex allows for most common email formats but may not cover all edge cases
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    return emailRegex.hasMatch(email);
  }

}