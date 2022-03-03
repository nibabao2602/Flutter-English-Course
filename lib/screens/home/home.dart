import 'package:eduhub_mobile/constants/colors.dart';
import 'package:eduhub_mobile/models/course.dart';
import 'package:eduhub_mobile/screens/home/widget/active_course.dart';
import 'package:eduhub_mobile/screens/home/widget/course_item.dart';
import 'package:eduhub_mobile/screens/home/widget/emoji_text.dart';
import 'package:eduhub_mobile/screens/home/widget/feature_course.dart';
import 'package:eduhub_mobile/screens/home/widget/search_input.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            EmojiText(),
            SearchInput(),
            FeatureCourse(),
            ActiveCourse()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: kBackground,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                label: 'home',
                icon: Container(
                  padding: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: kAccent, width: 2))),
                  child: Text(
                    'home',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )),
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

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: kBackground,
      elevation: 0,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          'Hello Ruize!',
          style: TextStyle(color: kFontLight, fontSize: 16),
        ),
      ),
      actions: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, right: 20),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border:
                      Border.all(color: kFontLight.withOpacity(0.3), width: 2),
                  borderRadius: BorderRadius.circular(15)),
              child: Icon(
                Icons.notifications_outlined,
                color: kFontLight,
                size: 30.0,
              ),
            ),
            Positioned(
                top: 15,
                right: 30,
                child: Container(
                  height: 8,
                  width: 8,
                  decoration:
                      BoxDecoration(color: kAccent, shape: BoxShape.circle),
                ))
          ],
        )
      ],
    );
  }
}
