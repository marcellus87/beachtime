import 'package:flutter/material.dart';
import '../utils/constants.dart';

class SkillDropdown extends StatelessWidget {
  final String selectedSkill;
  final Function(String) onSkillChange;

  SkillDropdown({required this.selectedSkill, required this.onSkillChange});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedSkill,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepOrangeAccent),
      underline: Container(
        height: 2,
        color: Colors.deepOrangeAccent,
      ),
      onChanged: (String? newValue) {
        onSkillChange(newValue!);
      },
      items: skillLevels.keys.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(skillLevels[value]!, style: TextStyle(fontSize: 12)),
            ],
          ),
        );
      }).toList(),
    );
  }
}