import 'package:flutter/material.dart';
import '../services/court_service.dart';
import '../services/auth_service.dart';
import '../services/player_service.dart';
import '../widgets/weather_widget.dart';
import '../widgets/player_card.dart';
import '../widgets/court_card.dart';
import 'player_profile_screen.dart';
import 'menu_screen.dart';
import 'login_screen.dart';
import '../models/court.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final CourtService courtService = CourtService();
  final PlayerService playerService = PlayerService();
  final AuthService authService = AuthService();

  String? selectedLocation;
  List<Map<String, String>> filteredCourts = [];

  

  @override
  Widget build(BuildContext context) {
    final availableCourts = courtService.getAvailableCourts();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuScreen()),
            );
          },
        ),
        title: Text('Beachtime Berlin'),
        backgroundColor: Colors.deepOrangeAccent,
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/images/default_player.png'),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlayerProfileScreen()),
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [            
            //Welcome message
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Welcome to Beachtime Berlin!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
                  ),
                  child: Text('Logout', style: TextStyle(fontSize: 16)),
                )
              ),
            ),
            SizedBox(height: 20),
            // Weather Widget
            Padding(              
              padding: EdgeInsets.all(8.0),
              child: WeatherWidget(),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 20),
            
          
            // Courts Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Available Courts',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  DropdownButton<String>(
                    value: selectedLocation,
                    hint: Text("Select Location"),
                    items: courtService.getLocations().map((String location) {
                      return DropdownMenuItem<String>(
                        value: location,
                        child: Text(location),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLocation = newValue;
                        filteredCourts = courtService.getCourtsByLocation(selectedLocation!);
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: selectedLocation == null
                    ? availableCourts.length
                    : filteredCourts.length,
                itemBuilder: (context, index) {
                  final court = selectedLocation == null
                      ? availableCourts[index]
                      : filteredCourts[index];
                  return CourtCard(court: court);
                },
                ),
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
          
              // Players Looking For Games
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Players Looking for Games', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
                 child: FutureBuilder(
                    future: Future.value(playerService.getPlayersLookingForGames()),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(children: snapshot.data!.map((player) => PlayerCard(player: player)).toList(),);
                      }
                      return CircularProgressIndicator();
                    }),
               ),
           ],
        ),

      ),
    );
    }
  }

