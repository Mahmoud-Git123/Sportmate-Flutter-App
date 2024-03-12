import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportsmate_flutter/DbHelper.dart';
import 'package:sportsmate_flutter/userName.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  void showSuccessMessage(BuildContext context, String changed) {
  final snackBar = SnackBar(
    content: Text('$changed Successfully Changed'),
    duration: Duration(seconds: 5),
    backgroundColor: Colors.green,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showExistsMessage(BuildContext context, String changed) {
  final snackBar = SnackBar(
    content: Text('$changed Already Exists'),
    duration: Duration(seconds: 5),
    backgroundColor: Colors.red,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

  void showPasswordErrorMessage(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Passwords Do Not Match'),
      duration: Duration(seconds: 5),
      backgroundColor: Colors.red,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

  @override
  Widget build(BuildContext context) {
    
    final currentUsername = Provider.of<UsernameProvider>(context, listen: false).username;
    final currentEmail = Provider.of<UsernameProvider>(context, listen: false).email;

    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
        
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(18.0),
          child: Text('Edit Profile'),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              width: 120,
              height: 120,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Color.fromARGB(255, 230, 245, 254),
                child: Icon(Icons.person,
                    size: 60, color: Color.fromARGB(255, 143, 72, 72)),
              ),
            ),

            SizedBox(height: 30),
            Divider(),
            SizedBox(height: 10),
            _buildFormField(Icons.person, "Username", controller: usernameController),
            SizedBox(height: 10),
            _buildFormField(Icons.email, "Email", controller: emailController),
            SizedBox(height: 10),
            _buildFormField(Icons.lock, "Password", obscureText: true, controller: passwordController),
            SizedBox(height: 10),
            _buildFormField(Icons.lock, "Confirm Password", obscureText: true, controller: confirmPasswordController),
            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () async {
                
                // saves edit changes to the database

                DbHelper dbHelper = DbHelper.instance;

                bool usernameExist = await dbHelper.doesUsernameExist('user', usernameController.text);
                bool emailExist = await dbHelper.isEmailInUse('user', emailController.text);

                List<String> newPassword = [
                  passwordController.text,
                  confirmPasswordController.text
                ];

                // changes username
                if (usernameController.text != "") {
                  if (usernameExist){
                    showExistsMessage(context, 'Username');
                  }
                  else{
                  dbHelper.updateProfile('user', 'userName', usernameController.text, '$currentUsername');
                  Provider.of<UsernameProvider>(context, listen: false).reset();
                  Provider.of<UsernameProvider>(context, listen: false).username = usernameController.text;        
                  showSuccessMessage(context, 'Username');
                  }
                }
                

                // changes email
                if (emailController.text != ""){
                  if (emailExist){
                    showExistsMessage(context, 'Email');
                  }
                  else{
                  dbHelper.updateProfile('user', 'email', emailController.text, '$currentEmail');
                  Provider.of<UsernameProvider>(context, listen: false).reset();
                  Provider.of<UsernameProvider>(context, listen: false).username = usernameController.text;
                  showSuccessMessage(context, 'Email');
                  }
                }

                //changes password
                if (passwordController.text != "") {
                  if (newPassword[0] == newPassword[1]) {
                    dbHelper.updateProfile('user', 'password', newPassword[0], '$currentUsername');
                    showSuccessMessage(context, 'Password');
                  }
                  else if (newPassword[0] != newPassword[1]){
                    showPasswordErrorMessage(context);
                  }
                }

              },
              
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue, // background color
                  side: BorderSide.none,
                  minimumSize: const Size(200, 50),
                  shape: const StadiumBorder()),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField(IconData icon, String hintText,
      {bool obscureText = false, required TextEditingController controller}) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: hintText,
            suffixIcon: obscureText && icon == Icons.lock
                ? IconButton(
                    onPressed: () {
                      // Toggles the password visibility
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
                  )
                : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
          ),
        );
      }
    );
  }

}