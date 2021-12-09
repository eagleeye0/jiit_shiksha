import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/rendering.dart';
import 'package:jiit_shiksha/screen/Welcome.dart';
import 'package:jiit_shiksha/screen/home.dart';
import 'package:jiit_shiksha/screen/mainScreen.dart';
import 'package:jiit_shiksha/screen/profile.dart';
import 'package:jiit_shiksha/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool unchanged = false;
  String xyz = "";
  final _formKey = GlobalKey<FormState>();

  Next_Tap_Func(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        unchanged = true;
      });
      await Future.delayed(Duration(seconds: 1));
      Navigator.pop(context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainScreen()));
      Navigator.pop(context);
      setState(() {
        unchanged = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              Text("Welcome",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter name of the User",
                          label: Text("UserName")),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username is not entered";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter password", label: Text("Password")),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is not entered";
                        } else if (value != null && value.length < 6) {
                          return "Enter a strong password length more than 6";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Material(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(100),
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () => {Next_Tap_Func(context)},
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: (unchanged) ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: unchanged
                              ? Icon(Icons.done, color: Colors.white)
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                        ),
                      ),
                    )
                    // ElevatedButton(
                    //   onPressed: () => {
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute),
                    //   },
                    //   child: Text("Login"),
                    //   style: TextButton.styleFrom(
                    //     minimumSize: Size(150, 40),
                    //   ),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
