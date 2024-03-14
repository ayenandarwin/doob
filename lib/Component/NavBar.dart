import 'package:doob/Pages/Explore.dart';
import 'package:doob/Pages/Home.dart';
import 'package:doob/Pages/Library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBAr extends StatefulWidget {
  const NavBAr({super.key});

  @override
  State<NavBAr> createState() => _NavBArState();
}

class _NavBArState extends State<NavBAr> {
  int _currentindex = 0;
  Color iconColor = Colors.white;

  final List<Widget> _screens = [
    Home(),
    Explore(),
    Library(),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black.withOpacity(0.3),
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.white,
      selectedItemColor: Color(0xffff9800),
      iconSize: 24,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.folder_outlined,
          ),
          label: 'Library',
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentindex = index;
        });
      },
    );
  }
}
