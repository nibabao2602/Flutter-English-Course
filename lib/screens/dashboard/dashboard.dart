import 'package:eduhub_mobile/constants/colors.dart';
import 'package:eduhub_mobile/models/course.dart';
import 'package:eduhub_mobile/screens/Login/login.dart';
import 'package:eduhub_mobile/screens/Signup/signup.dart';
import 'package:eduhub_mobile/screens/Welcome/welcome.dart';
import 'package:eduhub_mobile/screens/home/home.dart';
import 'package:eduhub_mobile/screens/home/widget/active_course.dart';
import 'package:eduhub_mobile/screens/home/widget/bottom_navigation_bar.dart';
import 'package:eduhub_mobile/screens/home/widget/course_item.dart';
import 'package:eduhub_mobile/screens/home/widget/emoji_text.dart';
import 'package:eduhub_mobile/screens/home/widget/feature_course.dart';
import 'package:eduhub_mobile/screens/home/widget/search_input.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  final screens = [
    HomePage(),
    WelcomePage(),
    LoginPage(),
    SignUpPage(),
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
          ]),
    );
  }
}
