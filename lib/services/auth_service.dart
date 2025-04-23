import '../models/player_model.dart';

class AuthService {


  //Map to store registered users
  final Map<String, Player> _registeredUsers = {};

  // Login function to verify user credentials
  bool login(String email, String password) {
    // Check if the user exists and the password matches
    if (_registeredUsers.containsKey(email)) {     
      //password validation is mocked.
      //In a real app we should use a encrypted method.
      return true; 
    } else {
        return false;
    }
  }

   // Register function to add new users
  void register(Player player, String password) {
    // Store the user in the map using the email as the key
    _registeredUsers[player.email] = player;

    // Print a message indicating the registration
    print("Registering: Player: ${player.name} Email: ${player.email} Password: $password");
  }
}