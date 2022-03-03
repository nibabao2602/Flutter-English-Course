import 'package:eduhub_mobile/models/course.dart';
import 'package:eduhub_mobile/screens/home/widget/category_title.dart';
import 'package:eduhub_mobile/screens/home/widget/course_item.dart';
import 'package:flutter/material.dart';

class FeatureCourse extends StatelessWidget {
  final courseList = Course.generateCourses();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CategoryTitle('Nhi', 'View All'),
          Container(
            height: 300,
            child: ListView.separated(
              padding: EdgeInsets.all(25),
              scrollDirection: Axis.horizontal,
              itemCount: courseList.length,
              itemBuilder: (context, index) => CourseItem(courseList[index]),
              separatorBuilder: (context, index) => SizedBox(width: 15),
            ),
          )
        ],
      ),
    );
  }
}
