import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../models/player_model.dart';

class User {
  final String username;
  final String hashedPassword;

  User({required this.username, required this.hashedPassword});
}

class AuthService {
  // Map to store registered users
  final Map<String, User> _registeredUsers = {};

  // Login function to verify user credentials
  bool login(String email, String password) {
    // Check if the user exists
    if (_registeredUsers.containsKey(email)) {
      final user = _registeredUsers[email]!;
      // Hash the entered password
      final enteredPasswordHash = sha256.convert(utf8.encode(password)).toString();

      // Compare the hashed passwords
      return enteredPasswordHash == user.hashedPassword;
    } else {
      return false;
    }
  }

  // Register function to add new users
  void register(Player player, String password) {
    // Hash the password
    final hashedPassword = sha256.convert(utf8.encode(password)).toString();
    final user = User(username: player.name, hashedPassword: hashedPassword);
    // Store the user in the map using the email as the key
    _registeredUsers[player.email] = user;

    // Print a message indicating the registration
    print(
        "Registering: Player: ${player.name} Email: ${player.email} Password: $password hashed: $hashedPassword");
  }
}