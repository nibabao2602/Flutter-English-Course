import 'package:eduhub_mobile/models/user.dart';
import 'package:flutter/material.dart';

class ProfileName extends StatelessWidget {
  final UserType user;
  const ProfileName({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          user.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          user.email,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
