import '../models/player.dart';

class PlayerService {

  int _nextPlayerId = 1;

   List<Player> _players = [];
  PlayerService() { 
     _players = [
      Player(id: (_nextPlayerId++).toString(),
        name: "John Doe",
        skillLevel: "A1",
        imageUrl: "assets/images/player1.png",
      ),
      Player(id: (_nextPlayerId++).toString(),
        name: "Anna Smith",
        skillLevel: "B2",
        imageUrl: "assets/images/player2.png",
      ),
      Player(id: (_nextPlayerId++).toString(),
        name: "Mike Brown",
        skillLevel: "F3",
        imageUrl: "assets/images/player3.png",)];
        _players.add(
       Player(id: (_nextPlayerId++).toString(),
        name: "Laura White",
        skillLevel: "C1",
        imageUrl: "",
      ));
      _players.add(
       Player(id: (_nextPlayerId++).toString(),
        name: "Peter Green",
        skillLevel: "E2",
        imageUrl: "",
      ));
      _players.add(Player(id: (_nextPlayerId++).toString(),
        name: "Julia Red",
        skillLevel: "D3",
        imageUrl: "",));
  }
    List<Player> getPlayersLookingForGames() {
    return _players;
  }

  void createPlayer(String name, String skillLevel) {
    final newPlayer = Player(id: (_nextPlayerId++).toString(), name: name, skillLevel: skillLevel, imageUrl: "");
    _players.add(newPlayer);
  }


  // Mocked method to get player profile data
  Map<String, dynamic> getCurrentPlayerProfile() {
    return {
      "name": "Marcel",
      "skillLevel": "A2",
      "imagePath": null, // If there's no image, it'll use the default one
    };
  }

  // Mocked upcoming games
  List<Map<String, String>> getUpcomingGames() {
    return [
      {"courtName": "Beach Center Berlin", "time": "12:00 PM - 2:00 PM", "location": "Mitte, Berlin"},
    ];
  }

  // Mocked friends list
  List<Map<String, String>> getFriends() {
    return [
      {"name": "John Doe", "skillLevel": "A1"},
      {"name": "Anna Smith", "skillLevel": "F3"},
    ];
  }
   Player? getPlayerById(String playerId) {
    return _players.firstWhere(
            (player) => player.id == playerId,
            orElse: () => Player(id: '-1', name: 'Not found', skillLevel: '', imageUrl: ''));
  }
   void updatePlayerSkillLevel(String playerId, String newSkillLevel) {
    final playerIndex = _players.indexWhere((player) => player.id == playerId);
    if (playerIndex != -1) {
      _players[playerIndex] = Player(id: _players[playerIndex].id, name: _players[playerIndex].name, skillLevel: newSkillLevel, imageUrl: _players[playerIndex].imageUrl);
    }
  }
}