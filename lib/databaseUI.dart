import 'package:flutter/material.dart';
import 'package:sportmate_flutter_application/initialiseDatabase.dart';

class DatabaseUI extends StatefulWidget {
  const DatabaseUI({Key? key}) : super(key: key);



  @override
  State<DatabaseUI> createState() => _DatabaseUIState();
}

class _DatabaseUIState extends State<DatabaseUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SportMate'),
      ),
      body: const Center(
        child: Text('Welcome to SportMate'),
      ),
    );
  }
}