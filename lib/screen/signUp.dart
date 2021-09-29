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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA22FD3),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputField(
                    label: "Enter your name",
                    hint: "John Doe",
                  ),
                  InputField(
                    label: "Enter your age",
                    hint: "32",
                    isnumber: true,
                  ),
                  InputField(
                    label: "Enter your Weight in Kg",
                    hint: "75",
                    isnumber: true,
                  ),
                  InputField(
                    label: "Enter your Height in cm",
                    hint: "167",
                    isnumber: true,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      }
                    },
                    child: Text("Submit"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
