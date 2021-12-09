import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jiit_shiksha/dataController/auth_base.dart';
import 'package:provider/provider.dart';
import 'package:jiit_shiksha/screen/mainScreen.dart';
import 'package:jiit_shiksha/screen/Welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LandingPage extends StatelessWidget {
  static const String route = "landing_page";
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return StreamBuilder<User?>(
      stream: auth.onAuthChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          print('stream changed');
          if (snapshot.data == null) {
            return Welcome();
          }
          return MainScreen();
        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
