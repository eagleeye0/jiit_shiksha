import 'package:flutter/material.dart';
import 'package:jiit_shiksha/utils/routes.dart';
// import 'package:lottie/lottie.dart';

class Welcome extends StatefulWidget {
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool unchanged = false;
  nextScreen(BuildContext context, String route) async {
    setState(() {
      unchanged = true;
    });
    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context, route);
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
            "assets/images/study.gif",
          ),
          // Center(
          //     child: Image.network(
          //   'https://flutter-examples.com/wp-content/uploads/2021/01/happy_mothers_Day.gif',
          //   height: 300,
          // )),
          // Image.network(
          //   'https://i.pinimg.com/originals/ab/c1/38/abc1384a20170a315274db9d19a5fe7f.gif',
          //   height: 200,
          //   width: 200,
          // ),
          // Image.asset('assets/images/studying.png'),
          // Lottie.network(
          //   'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
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
                onTap: () => {nextScreen(context, MyRoutes.loginRoute)},
                child: Container(
                  width: 150,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Dont have an account?",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              TextButton(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                onPressed: () => {nextScreen(context, MyRoutes.signupRoute)},
              ),
            ],
          )
        ]),
      ),
    );
  }
}
