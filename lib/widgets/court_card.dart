import 'package:flutter/material.dart';

class CourtCard extends StatelessWidget {
  final Map<String, String> court;

  CourtCard({required this.court});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Container(
        width: 150,
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(court['courtName'] ?? 'Unknown Court', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(court['time'] ?? 'Unknown Time'),
            Text(court['location'] ?? 'Unknown Location', style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}