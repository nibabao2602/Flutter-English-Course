import 'package:eduhub_mobile/main.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    leading: BackButton(
      color: Colors.black,
      onPressed: () {
        navigatorKey.currentState!.pop();
      },
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
