import 'package:flutter/material.dart';

import 'screen/Welcome.dart';
import 'screen/home.dart';
import 'screen/signUp.dart';
import 'utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      home: Home(),
    );
  }
}
