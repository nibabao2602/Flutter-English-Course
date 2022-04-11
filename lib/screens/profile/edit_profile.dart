import 'package:eduhub_mobile/constants/colors.dart';
import 'package:eduhub_mobile/icons/rounded_button.dart';
import 'package:eduhub_mobile/main.dart';
import 'package:eduhub_mobile/models/user.dart';
import 'package:eduhub_mobile/screens/profile/widget/avatar.dart';
import 'package:eduhub_mobile/screens/profile/widget/input.dart';
import 'package:eduhub_mobile/utils/backAppBar.dart';
import 'package:eduhub_mobile/utils/user_preference.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  UserType user = UserPreferences.myUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          AvatarWidget(imagePath: user.imagePath, onClick: () {}, isEdit: true),
          SizedBox(
            height: 10,
          ),
          InputWidget(
              label: 'Full Name', text: user.name, onChanged: (name) {}),
          SizedBox(
            height: 10,
          ),
          InputWidget(label: 'Adress', text: user.name, onChanged: (name) {}),
          SizedBox(
            height: 10,
          ),
          InputWidget(
              label: 'Description', text: user.name, onChanged: (name) {}),
          SizedBox(
            height: 10,
          ),
          RoundedButton(
            text: 'Save',
            press: updateProfile,
            color: kAccent,
          )
        ],
      ),
    );
  }

  void updateProfile() {
    navigatorKey.currentState!.pop();
  }
}
