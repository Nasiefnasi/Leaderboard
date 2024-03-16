// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, deprecated_member_use

import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:leaderboardapp/view/leadership/leader_ship.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List<Widget> _pages = [
    const LeaderBoard(),
    const LeaderBoard(),
    const LeaderBoard(),
    const LeaderBoard(),
    const LeaderBoard()
  ];
  List<int> arry = [1, 45, 6, 86, 78, 0, 2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          items: const [
            CurvedNavigationBarItem(
              child: Icon(Icons.home_filled),
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.casino_outlined),
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.sync_alt_rounded),
            ),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.red,
          backgroundColor: Colors.grey.shade200,
          animationCurve: Curves.easeInOut,
          // height: 50,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: _pages[_page]);
  }
}
