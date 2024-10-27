import 'package:flutter/material.dart';
import '../services/court_service.dart';
import '../services/player_service.dart';
import '../widgets/weather_widget.dart';
import '../widgets/player_card.dart';
import '../widgets/court_card.dart';
import 'player_profile_screen.dart';
import 'menu_screen.dart';

class MainScreen extends StatelessWidget {
  final CourtService courtService = CourtService();
  final PlayerService playerService = PlayerService();

  @override
  Widget build(BuildContext context) {
    final availableCourts = courtService.getAvailableCourts();
    final playersLookingForGames = playerService.getPlayersLookingForGames();

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
            // Weather Widget
            Padding(
              padding: EdgeInsets.all(8.0),
              child: WeatherWidget(),
            ),
            Divider(),

            // Courts Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Available Courts',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: availableCourts.length,
                itemBuilder: (context, index) {
                  final court = availableCourts[index];
                  return CourtCard(court: court);
                },
              ),
            ),
            Divider(),

            // Players Looking For Games
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Players Looking for Games',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: playersLookingForGames.map((player) {
                return PlayerCard(player: player);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}