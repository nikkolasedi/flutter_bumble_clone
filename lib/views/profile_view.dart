import 'package:flutter/material.dart';
import 'package:flutter_bumble_clone/screens/settings_screen.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.settings),
          onPressed: () => _navigateToSettings(),
        ),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  _navigateToSettings() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SettingsScreen(),
        fullscreenDialog: true,
      ),
    );
  }
}

