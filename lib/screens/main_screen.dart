import 'package:flutter/material.dart';
import 'package:flutter_bumble_clone/providers/main_screen_view_provider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MainScreenViewProvider>(context);

    return Scaffold(
      body: provider.body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            title: Text(''),
          ),
        ],
        onTap: (currentIndex) {
          provider.currentIndex = currentIndex;
        },
      ),
    );
  }
}
