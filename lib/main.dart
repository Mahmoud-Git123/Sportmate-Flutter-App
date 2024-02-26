import 'package:flutter/material.dart';
import 'package:sportmate_flutter_application/databaseUI.dart';
void main() {

  runApp(SportMate());
}

class SportMate extends StatelessWidget {
  const SportMate({Key? key}) : super(key: key);
  
  @override
  
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DatabaseUI(),
    );
  }
}