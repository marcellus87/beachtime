import 'services/player_service.dart';

void main() {
  final playerService = PlayerService();

  print("Before:");
  final playersBefore = playerService.getPlayersLookingForGames();
    for (var player in playersBefore) {
    print('Name: ${player.name}, Skill Level: ${player.skillLevel}');
  }
  final firstPlayer = playerService.getPlayersLookingForGames()[0];
  playerService.updatePlayerSkillLevel(firstPlayer.id, "Z9");

  print("After:");
  final playersAfter = playerService.getPlayersLookingForGames();
    for (var player in playersAfter) {
    print('Name: ${player.name}, Skill Level: ${player.skillLevel}');
  }
}