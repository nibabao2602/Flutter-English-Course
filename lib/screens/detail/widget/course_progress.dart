import 'package:eduhub_mobile/constants/colors.dart';
import 'package:eduhub_mobile/models/course.dart';
import 'package:eduhub_mobile/models/module.dart';
import 'package:eduhub_mobile/screens/detail/widget/course_module.dart';
import 'package:flutter/material.dart';

class CourseProgress extends StatelessWidget {
  final moduleList = Module.generateModules();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'The Progress',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20, color: kFont),
              ),
              Row(
                children: [
                  Icon(
                    Icons.grid_4x4,
                    size: 25,
                  ),
                  SizedBox(width: 15),
                  Icon(
                    Icons.list,
                    size: 25,
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ...moduleList.map((e) => CourseModule(e)).toList()
        ],
      ),
    );
  }
}
