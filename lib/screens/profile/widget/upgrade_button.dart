import 'package:eduhub_mobile/constants/colors.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  final Icon icon;
  const ProfileButton(
      {Key? key, required this.text, required this.onClick, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onClick,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.all(20),
      ),
      icon: icon,
      label: Text(
        text,
        style: TextStyle(color: kAccent),
      ),
    );
  }
}
