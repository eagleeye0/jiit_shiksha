import 'package:flutter/material.dart';
import 'package:jiit_shiksha/utils/inputField.dart';
import 'package:jiit_shiksha/utils/routes.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    Key? key,
  }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool unchanged = false;
  Next_Tap_Func(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        unchanged = true;
      });
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        unchanged = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: false,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Image.asset(
                "assets/images/signup.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              Text("Tell us about you",
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username is not entered";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "1810XXXX",
                          label: Text("Enrollment number")),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enrollment is not entered";
                        } else if (int.tryParse(value) == null) {
                          return "Please Enter a number";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(hintText: "B3", label: Text("Batch")),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Batch is not entered";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "CSE", label: Text("Branch")),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Branch is not entered";
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
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
              )
            ],
          ),
        ),
      ),
    );
  }
}
