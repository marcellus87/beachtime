import 'package:flutter/material.dart';

class PlayerCard extends StatelessWidget {
  final Map<String, String> player;

  PlayerCard({required this.player});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/images/default_player.png'),
      ),
      title: Text(player['name'] ?? 'Unknown'),
      subtitle: Text(player['skillLevel'] ?? 'Skill Level'),
    );
  }
}