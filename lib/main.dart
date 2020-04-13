import 'package:flutter/material.dart';
import 'package:flutter_bumble_clone/screens/landing_screen.dart';
import 'package:flutter_bumble_clone/screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
