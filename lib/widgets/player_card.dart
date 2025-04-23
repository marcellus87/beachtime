import 'package:flutter/material.dart';
import '../models/player.dart';

class PlayerCard extends StatelessWidget {
  final Player player;

  PlayerCard({required this.player});

  @override
  Widget build(BuildContext context) {
    return ListTile(
       leading: CircleAvatar(
        backgroundImage: player.imageUrl != null
            ? AssetImage(player.imageUrl!)
            : AssetImage('assets/images/default_player.png'),
      ),
      title: Text(player.name),
      subtitle: Text(player.skillLevel),
    );
  }
}