import 'services/player_service.dart';

void main() {
  final playerService = PlayerService();

  print("Players Looking for Games:");
  final players = playerService.getPlayersLookingForGames();
  for (var player in players) {
    print('Player Name: ${player.name}, Skill Level: ${player.skillLevel}');
  }
}