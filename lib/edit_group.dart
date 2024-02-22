import 'package:flutter/material.dart';

class EditGroupPage extends StatefulWidget {
  const EditGroupPage({super.key, required this.title});

  final String title;

  @override
  State<EditGroupPage> createState() => _EditGroup();
}

class _EditGroup extends State<EditGroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
