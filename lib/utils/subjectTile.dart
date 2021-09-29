import 'package:flutter/material.dart';

class SubjectTile extends StatelessWidget {
  final String subject;
  const SubjectTile({
    Key? key,
    this.subject = "Maths",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xFFB352DD),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            subject,
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
