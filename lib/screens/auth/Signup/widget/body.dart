import 'package:eduhub_mobile/constants/colors.dart';
import 'package:eduhub_mobile/screens/auth/Login/widget/already_have_an_account_acheck.dart';
import 'package:eduhub_mobile/icons/rounded_button.dart';
import 'package:eduhub_mobile/icons/text_field_container.dart';
import 'package:eduhub_mobile/main.dart';
import 'package:eduhub_mobile/screens/auth/Signup/widget/background.dart';
import 'package:eduhub_mobile/screens/auth/Signup/widget/or_divider.dart';
import 'package:eduhub_mobile/screens/auth/Signup/widget/social_icon.dart';
import 'package:eduhub_mobile/utils/snackBar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../Login/login.dart';

class BodySignUp extends StatefulWidget {
  const BodySignUp({Key? key}) : super(key: key);

  @override
  State<BodySignUp> createState() => _BodySignUpState();
}

class _BodySignUpState extends State<BodySignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final displayNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "SIGNUP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/signup.svg",
                height: size.height * 0.35,
              ),
              TextFieldContainer(
                child: TextFormField(
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? "Enter a valid email"
                          : null,
                ),
              ),
              TextFieldContainer(
                  child: TextFormField(
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (pass) => pass != null && pass.length < 6
                    ? "Enter min 6 characters"
                    : null,
              )),
              TextFieldContainer(
                  child: TextFormField(
                controller: displayNameController,
                cursorColor: kPrimaryButton,
                decoration: InputDecoration(
                  hintText: "Display Name",
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
              RoundedButton(
                text: "SIGNUP",
                press: signUp,
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginPage();
                      },
                    ),
                  );
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: this.context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      final user = FirebaseAuth.instance.currentUser!;
      final displayName = "123";

      if (FirebaseAuth.instance.currentUser! != null) {
        user.updateDisplayName(displayName);
      }
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
