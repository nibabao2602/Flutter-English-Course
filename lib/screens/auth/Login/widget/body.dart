import 'dart:js';

import 'package:eduhub_mobile/constants/colors.dart';
import 'package:eduhub_mobile/screens/auth/ForgotPass/forgotPass.dart';
import 'package:eduhub_mobile/screens/auth/Login/widget/already_have_an_account_acheck.dart';
import 'package:eduhub_mobile/icons/rounded_button.dart';
import 'package:eduhub_mobile/icons/text_field_container.dart';
import 'package:eduhub_mobile/main.dart';
import 'package:eduhub_mobile/screens/auth/Login/widget/background.dart';
import 'package:eduhub_mobile/screens/auth/Signup/signup.dart';
import 'package:eduhub_mobile/utils/snackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'forgot_password_check.dart';

class BodyLogin extends StatefulWidget {
  const BodyLogin({Key? key}) : super(key: key);

  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            TextFieldContainer(
              child: TextField(
                controller: emailController,
                cursorColor: kPrimaryButton,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: kPrimaryButton,
                  ),
                  hintText: "Your Email",
                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
                child: TextField(
              controller: passwordController,
              obscureText: true,
              cursorColor: kPrimaryButton,
              decoration: InputDecoration(
                hintText: "Password",
                icon: Icon(
                  Icons.lock,
                  color: kPrimaryButton,
                ),
                suffixIcon: Icon(
                  Icons.visibility,
                  color: kPrimary,
                ),
                border: InputBorder.none,
              ),
            )),
            ForgotPasswordCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ForgotPassPage();
                    },
                  ),
                );
              },
            ),
            RoundedButton(text: "LOGIN", press: signIn),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(
        context: this.context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
  }
}
