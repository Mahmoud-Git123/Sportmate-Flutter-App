import 'package:flutter/material.dart';
import 'package:sportsmate_flutter/pages/matchmaking/matchmaking_users.dart';

class MatchmakingPage extends StatefulWidget {
  const MatchmakingPage({super.key});

  @override
  _MatchmakingPageState createState() => _MatchmakingPageState();
}

class _MatchmakingPageState extends State<MatchmakingPage> {
  DateTime? selectedDateTime;
  String? location;
  String? selectedSport;

  final List<String> sports = [  //This should be the sports that the user has chosen to add to their profile
    'Football',
    'Basketball',
    'Tennis',
    'Running',
    'Badminton',
    'Cricket',
  ];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(18.0),
          child: Text('Find a match!'),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Choose Date and Time:'),
              const SizedBox(height: 8),
ElevatedButton(
  onPressed: () async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light().copyWith(
              primary: Colors.blue,  
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      final TimeOfDay? timePicked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (timePicked != null) {
        setState(() {
          selectedDateTime = DateTime(
            picked.year,
            picked.month,
            picked.day,
            timePicked.hour,
            timePicked.minute,
          );
        });
      }
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 230, 245, 253),
  ),
  child: Text(selectedDateTime == null
      ? 'Choose Date and Time'
      : '${selectedDateTime!.toLocal()}',
      style: const TextStyle(color: Color.fromARGB(255, 2, 38, 63))
                ),
              ),
              if (selectedDateTime == null)
                const Text(
                  'Please choose date and time',
                  style: TextStyle(
                      color: Color.fromARGB(255, 228, 193, 190),
                      fontFamily: 'Poppins'),
                ),
              const SizedBox(height: 16),
              TextFormField(
                onChanged: (value) {
                  location = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter location';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Enter Location',
                  border: OutlineInputBorder(),
                ),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedSport,
                hint: const Text('Choose Sport'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please choose sport';
                  }
                  return null;
                },
                onChanged: (newValue) {
                  setState(() {
                    selectedSport = newValue;
                  });
                },
                items: sports.map((sport) {
                  return DropdownMenuItem(
                    value: sport,
                    child: Text(sport,
                        style: Theme.of(context).textTheme.bodyMedium),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      selectedDateTime != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MatchingUsers(
                          selectedDateTime: selectedDateTime,
                          location: location,
                          selectedSport: selectedSport,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please fill out all required fields')));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 230, 245, 254),
                ),
                child: const Text(
                  'Add Availability',
                  style: TextStyle(color: Color.fromARGB(255, 2, 38, 63)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
