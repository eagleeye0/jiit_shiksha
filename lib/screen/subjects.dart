import 'package:flutter/material.dart';

class Subjects extends StatefulWidget {
  const Subjects({Key? key}) : super(key: key);

  @override
  _SubjectsState createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Subjects screen"),
    );
  }
}
