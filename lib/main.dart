import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jiit_shiksha/dataController/auth_base.dart';
import 'package:jiit_shiksha/screen/landing_page.dart';
import 'package:jiit_shiksha/screen/login.dart';
import 'package:jiit_shiksha/screen/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jiit_shiksha/screen/video_info.dart';
import 'screen/welcome.dart';
import 'screen/mainScreen.dart';
import 'screen/signUp.dart';
import 'utils/routes.dart';
import 'screen/splash.dart';
import 'screen/video_info.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<Auth>(
      create: (context) => Auth(),
      child: GetMaterialApp(
        title: 'JIIT Shiksha',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        // initialRoute: MyRoutes.splashRoute,
        debugShowCheckedModeBanner: false,
        routes: {
          MyRoutes.splashRoute: (context) => Splash(),
          MyRoutes.welcomeRoute: (context) => Welcome(),
          MyRoutes.signupRoute: (context) => SignUp(),
          MyRoutes.homeRoute: (context) => MainScreen(),
          MyRoutes.loginRoute: (context) => LoginPage(),
          MyRoutes.landingRoute: (context) => LandingPage(),
          MyRoutes.videoRoute: (context) => VideoInfo(),
        },
        home: LandingPage(),
      ),
    );
  }
}
