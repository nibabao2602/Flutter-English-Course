import 'package:eduhub_mobile/constants/colors.dart';
import 'package:eduhub_mobile/main.dart';
import 'package:eduhub_mobile/screens/profile/edit_profile.dart';
import 'package:eduhub_mobile/screens/profile/widget/avatar.dart';
import 'package:eduhub_mobile/screens/profile/widget/number.dart';
import 'package:eduhub_mobile/screens/profile/widget/profile_name.dart';
import 'package:eduhub_mobile/screens/profile/widget/upgrade_button.dart';
import 'package:eduhub_mobile/utils/backAppBar.dart';
import 'package:eduhub_mobile/utils/snackBar.dart';
import 'package:eduhub_mobile/utils/user_preference.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:eduhub_mobile/models/user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final UserType user = UserPreferences.myUser;
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          AvatarWidget(
            imagePath: user.imagePath,
            onClick: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditProfilePage()));
            },
            isEdit: false,
          ),
          SizedBox(
            height: 24,
          ),
          ProfileName(user: user),
          SizedBox(
            height: 10,
          ),
          NumberWidget(),
          SizedBox(
            height: 10,
          ),
          ProfileButton(
              text: "Đổi mật khẩu",
              icon: Icon(
                Icons.edit,
                size: 18,
                color: kAccent,
              ),
              onClick: () {}),
          ProfileButton(
              text: "Đăng xuất",
              icon: Icon(
                Icons.logout,
                size: 18,
                color: kAccent,
              ),
              onClick: logOut),
        ],
      ),
    );
  }

  Future logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
      Utils.showSnackBar('Logout successfully!');
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
  }
}
