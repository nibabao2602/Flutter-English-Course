import 'package:eduhub_mobile/models/currentUserData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileName extends StatelessWidget {
  final User user;
  const ProfileName({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          user.displayName.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          user.email.toString(),
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
