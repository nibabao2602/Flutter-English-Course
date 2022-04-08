import 'package:eduhub_mobile/screens/auth/Welcome/welcome.dart';
import 'package:eduhub_mobile/screens/dashboard/dashboard.dart';
import 'package:eduhub_mobile/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCeBPuDn6GHZE52SySykRJcCES0-Vdua38",
      appId: "1:612062462449:android:e635905278d7500cafc450",
      messagingSenderId: "612062462449",
      projectId: "eduhub-mobile",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
        scaffoldMessengerKey: Utils.messengerKey,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: "EduHub - Mobile version",
        home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(
            child: CircularProgressIndicator(),
          );
        else if (snapshot.hasError) {
          return Center(
            child: Text('Something went wrong! Please try again!!'),
          );
        } else if (snapshot.hasData) {
          return DashboardPage();
        } else
          return WelcomePage();
      },
    ));
  }
}

// logout
// FirebaseAuth.instance.signOut()
