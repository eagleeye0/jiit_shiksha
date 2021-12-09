import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jiit_shiksha/utils/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:jiit_shiksha/dataController/auth_base.dart';


class Welcome extends StatefulWidget {
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool isLoading = false;
  void showPopup(BuildContext context, String message) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      setState(() {
        isLoading = true;
      });
      final auth = Provider.of<Auth>(context, listen: false);
      await auth.signInWithGoogle();
    } on PlatformException catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e.message);
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        showPopup(context, e.message!);
      }
    } catch (e) {
      print(e.toString());
    }
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
                onTap: () async {
                  await signInWithGoogle(context);
                },
                child: Container(
                  width: 150,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "Login with google",
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
