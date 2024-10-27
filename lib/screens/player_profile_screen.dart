import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/skill_dropdown.dart';
import '../services/player_service.dart';
import 'dart:io' show File;
import 'package:flutter/foundation.dart' show kIsWeb;
import '../utils/constants.dart';

class PlayerProfileScreen extends StatefulWidget {
  @override
  _PlayerProfileScreenState createState() => _PlayerProfileScreenState();
}

class _PlayerProfileScreenState extends State<PlayerProfileScreen> {
  final playerService = PlayerService();
  String selectedSkillLevel = 'A1';
  XFile? _profileImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker(); // Ensure you use the ImagePicker instance correctly
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = pickedFile;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No image selected. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: _profileImage != null
                    ? (kIsWeb
                        ? NetworkImage(_profileImage!.path)
                        : FileImage(File(_profileImage!.path)) as ImageProvider)
                    : AssetImage('assets/default_player.png'),
                child: _profileImage == null ? Icon(Icons.camera_alt, size: 40, color: Colors.grey) : null,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SkillDropdown(
              selectedSkill: selectedSkillLevel,
              onSkillChange: (value) {
                setState(() {
                  selectedSkillLevel = value;
                });
              },
            ),
            TextButton(
              onPressed: () {
                _showSkillExplanation();
              },
              child: Text('What are the skill levels?'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Birthdate'),
              onTap: () {
                // Implement date picker
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showSkillExplanation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Skill Level Explanation"),
        content: Text(skillLevels.toString()),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Close"),
          ),
        ],
      ),
    );
  }
}