import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:leaderboardapp/controller/api_integrat.dart';
import 'package:leaderboardapp/model/storehive/storedata.dart';
import 'package:leaderboardapp/view/core.dart';
import 'package:leaderboardapp/view/bottomnavbar/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(GetModelshiveAdapter());
  Hive.registerAdapter(LeaderAdapter());
  hivedata = await Hive.openBox<GetModelshive>("hive_box");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ApiControler(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Provider.of<ApiControler>(context, listen: false).fetchResource();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavBar(),
    );
  }
}
