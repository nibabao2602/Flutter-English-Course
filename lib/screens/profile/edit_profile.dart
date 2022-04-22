import 'dart:io';

import 'package:eduhub_mobile/constants/colors.dart';
import 'package:eduhub_mobile/icons/rounded_button.dart';
import 'package:eduhub_mobile/main.dart';
import 'package:eduhub_mobile/models/currentUserData.dart';
import 'package:eduhub_mobile/models/user.dart';
import 'package:eduhub_mobile/screens/profile/widget/avatar.dart';
import 'package:eduhub_mobile/screens/profile/widget/input.dart';
import 'package:eduhub_mobile/utils/backAppBar.dart';
import 'package:eduhub_mobile/utils/user_preference.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late CurrentUser user;

  @override
  void initState() {
    super.initState();
    User user = UserPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          AvatarWidget(
              imagePath: user.photoURL,
              onClick: () async {
                final image =
                    await ImagePicker().getImage(source: ImageSource.gallery);
                if (image == null) return;
                final directory = await getApplicationDocumentsDirectory();
                final name = basename(image.path);
                final imageFile = File('${directory.path}/$name');
                final newImage = await File(image.path).copy(imageFile.path);
                setState(() => user = user.copy(photoURL: newImage.path));
              },
              isEdit: true),
          SizedBox(
            height: 10,
          ),
          InputWidget(
              label: 'Email',
              text: user.email,
              isEnabled: false,
              onChanged: (email) => user = user.copy(email: email)),
          SizedBox(
            height: 10,
          ),
          InputWidget(
              label: 'Full Name',
              text: user.displayName,
              onChanged: (name) => user = user.copy(displayName: name)),
          SizedBox(
            height: 10,
          ),
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
    UserPreferences.setUser(user);
    navigatorKey.currentState!.pop();
  }
}
