import 'package:flutter/material.dart';

class CalendarViewScreen extends StatefulWidget {
  @override
  _CalendarViewScreenState createState() => _CalendarViewScreenState();
}

class _CalendarViewScreenState extends State<CalendarViewScreen> {
  List<Map<String, String>> mockCourts = [
    {"court": "BeachMitte", "time": "12:00 - 13:00", "slots": "1/4"},
    {"court": "Sunset Beach", "time": "14:00 - 15:00", "slots": "2/4"},
    {"court": "Sandy Shore", "time": "16:00 - 17:00", "slots": "3/4"},
  ];

  void _signUpForCourt(String courtName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Signed up for $courtName')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Open Courts - Calendar View'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView.builder(
        itemCount: mockCourts.length,
        itemBuilder: (context, index) {
          final court = mockCourts[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(court["court"]!),
              subtitle: Text("${court["time"]} - Slots: ${court["slots"]}"),
              trailing: IconButton(
                icon: Icon(Icons.add, color: Colors.green),
                onPressed: () {
                  _signUpForCourt(court["court"]!);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}