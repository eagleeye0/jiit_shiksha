import 'package:flutter/material.dart';
import 'package:jiit_shiksha/screen/login.dart';
import 'package:jiit_shiksha/screen/splash.dart';

import 'screen/welcome.dart';
import 'screen/mainScreen.dart';
import 'screen/signUp.dart';
import 'utils/routes.dart';
import 'screen/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: MyRoutes.splashRoute,
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.splashRoute: (context) => Splash(),
        MyRoutes.welcomeRoute: (context) => Welcome(),
        MyRoutes.signupRoute: (context) => SignUp(),
        MyRoutes.homeRoute: (context) => MainScreen(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
      home: MainScreen(),
    );
  }
}
