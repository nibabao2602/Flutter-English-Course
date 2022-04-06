import 'package:eduhub_mobile/constants/colors.dart';
import 'package:eduhub_mobile/screens/home/home.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _selectedIndex = index),
        backgroundColor: kBackground,
        showUnselectedLabels: false,
        selectedItemColor: kAccent,
        iconSize: 60,
        items: [
          BottomNavigationBarItem(
              label: 'home', icon: Icon(Icons.home, size: 20)),
          BottomNavigationBarItem(
            label: 'calendar',
            icon: Icon(Icons.calendar_month, size: 20),
          ),
          BottomNavigationBarItem(
            label: 'bookmark',
            icon: Icon(Icons.bookmark, size: 20),
          ),
          BottomNavigationBarItem(
            label: 'user',
            icon: Icon(Icons.account_circle_outlined, size: 20),
          ),
        ]);
  }
}
