class PlayerService {
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

  // New Method: Mocked players looking for games
  List<Map<String, String>> getPlayersLookingForGames() {
    return [
      {"name": "Chris Weber", "skillLevel": "A3"},
      {"name": "Sarah Mills", "skillLevel": "F1"},
      {"name": "James Turner", "skillLevel": "T2"},
    ];
  }
}