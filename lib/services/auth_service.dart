class AuthService {
  // Mocked login for demonstration purposes
  final String _correctUsername = "Marcel";
  final String _correctPassword = "123";

  // Login function to verify user credentials
  bool login(String username, String password) {
    return username == _correctUsername && password == _correctPassword;
  }
}