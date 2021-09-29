import 'package:flutter/material.dart';
import 'package:jiit_shiksha/screen/Welcome.dart';
import 'package:jiit_shiksha/screen/home.dart';
import 'package:jiit_shiksha/utils/routes.dart';
import 'screen/signUp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: MyRoutes.welcomeRoute,
      routes: {
        MyRoutes.welcomeRoute: (context) => Welcome(),
        MyRoutes.signupRoute: (context) => SignUp(),
        MyRoutes.homeRoute: (context) => Home(),
      },
    );
  }
}
