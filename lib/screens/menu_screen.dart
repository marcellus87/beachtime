import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Beachtime Menu'),
            decoration: BoxDecoration(color: Colors.deepOrangeAccent),
          ),
          ListTile(
            title: Text('Courts'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ExpansionTile(
            title: Text('Courts'),
            children: [
              ListTile(title: Text('BeachMitte')),
              ListTile(title: Text('Beach61')),
              ListTile(title: Text('Füchse Berlin')),
            ],
          ),
          ListTile(
            title: Text('Trainer Sessions'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Open Plays (All You Can Beach)'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Beach Camps Germany'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Vacation Camps Abroad'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}