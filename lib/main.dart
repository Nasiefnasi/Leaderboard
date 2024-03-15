import 'package:flutter/material.dart';
import 'package:leaderboardapp/view/leadership/bottom_nav_bar.dart';
import 'package:leaderboardapp/view/leadership/leader_ship.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: BottomNavBar(),
    );
  }
}
