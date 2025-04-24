import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/player_profile_screen.dart';
import 'screens/main_screen.dart';
import 'screens/calendar_view_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beachtime Berlin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(), // Starts with the Main Screen
      routes: {
        '/profile': (context) => PlayerProfileScreen(), // Player Profile route
        '/main': (context) => MainScreen(),             // Main Screen route
        '/calendar': (context) => CalendarViewScreen(), // Calendar View route
      },
    );
  }
}