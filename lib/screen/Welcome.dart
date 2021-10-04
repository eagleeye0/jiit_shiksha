import 'package:flutter/material.dart';
import 'package:jiit_shiksha/utils/routes.dart';
// import 'package:lottie/lottie.dart';

class Welcome extends StatefulWidget {
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool unchanged = false;
  Next_Tap_Func(BuildContext context) async {
    setState(() {
      unchanged = true;
    });
    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoutes.signupRoute);
    setState(() {
      unchanged = false;
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            "assets/Images/logo.png",
            // fit: BoxFit.cover,
            height: 150,
            width: 200,
          ),
          // Lottie.asset(
          //   'assets/Lottie/Studying.json',
          // ),
          Container(
            height: 20.0,
          ),
          Container(
            child: Material(
              color: Colors.green,
              borderRadius: BorderRadius.circular(100),
              child: InkWell(
                splashColor: Colors.green,
                onTap: () => {Next_Tap_Func(context)},
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: 150,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
