import 'package:flutter/material.dart';
import '../models/auth_mode.dart';
import '../models/player_model.dart';
import '../widgets/auth_input_field.dart';
import '../services/auth_service.dart';
import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  AuthMode _authMode = AuthMode.login;

  @override
  Widget build(BuildContext context) {
    final message = _authMode == AuthMode.register ? 'Login mode' : 'Register mode';
    final buttonText = _authMode == AuthMode.register ? 'Login' : 'Register';
        return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"), // Ensure this image exists
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Login Form Centered
          Center(
            child: Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8), // Semi-transparent background
                borderRadius: BorderRadius.circular(12),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [                    
                    AuthInputField(
                      controller: emailController,
                      label: 'Email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        }
                        final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      ),
                     SizedBox(height: 10),                  
                    AuthInputField(
                      controller: passwordController,
                      label: _authMode == AuthMode.login ? 'Password' : 'Confirm Password',
                      obscureText: true,
                      validator: (value) => _validatePassword(value),
                    ),
                    if (_authMode == AuthMode.register) SizedBox(height: 10),
                    if (_authMode == AuthMode.register) AuthInputField(
                      controller: confirmPasswordController,
                      label: 'Confirm Password',
                      obscureText: true,
                      validator: (value) => _validateConfirmPassword(value),
                      ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  ElevatedButton(                    
                    onPressed: () {
                      String email = emailController.text;
                      String password = passwordController.text;

                      if (_authMode == AuthMode.login) {                                                
                        if (authService.login(email, password)) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainScreen()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Invalid email or password'),
                              ));
                        }
                      } else {
                        if (_formKey.currentState!.validate())
                        {
                          Player player = Player(id: '', name: usernameController.text, email: emailController.text, photoUrl: '', skillLevel: '');
                          authService.register(player, password);
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Register')));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainScreen()),
                          );
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error in registration')));
                        }
                      }

                    },
                    style: ElevatedButton
                        .styleFrom(
                      backgroundColor: Colors.deepOrangeAccent,
                      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
                    ),
                    child: Text('Login', style: TextStyle(fontSize: 16)),
                  ),),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  TextButton(
                      onPressed: () {
                      
                    setState(() {
                      _authMode = _authMode == AuthMode.login ? AuthMode.register : AuthMode.login;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(message)),
                    );
                  },
                    child: Text(
                        buttonText,
                        style: TextStyle(fontSize: 16, color: Colors.blue)),

                  ),
                  ),
                ],
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm the password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }
}