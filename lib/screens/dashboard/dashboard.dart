import 'package:eduhub_mobile/screens/home/home.dart';
import 'package:eduhub_mobile/screens/profile/edit_profile.dart';
import 'package:eduhub_mobile/screens/profile/profile.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../auth/Login/login.dart';
import '../auth/Signup/signup.dart';
import '../auth/Welcome/welcome.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  final screens = [
    HomePage(),
    EditProfilePage(),
    LoginPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => setState(() => _selectedIndex = index),
          backgroundColor: kBackground,
          showUnselectedLabels: false,
          selectedItemColor: kAccent,
          iconSize: 60,
          items: [
            BottomNavigationBarItem(
                label: 'Home', icon: Icon(Icons.home, size: 20)),
            BottomNavigationBarItem(
              label: 'History',
              icon: Icon(Icons.chrome_reader_mode_rounded, size: 20),
            ),
            BottomNavigationBarItem(
              label: 'Favorite',
              icon: Icon(Icons.favorite, size: 20),
            ),
            BottomNavigationBarItem(
              label: 'User',
              icon: Icon(Icons.person, size: 20),
            ),
          ]),
    );
  }
}
