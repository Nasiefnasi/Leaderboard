import 'package:flutter/material.dart';
import 'package:leaderboardapp/controller/api_integrat.dart';
import 'package:leaderboardapp/view/leadership/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ApiControler(),
        ),
      ],child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavBar(),
    );
  }
}
