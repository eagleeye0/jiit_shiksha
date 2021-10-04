import 'package:flutter/material.dart';

class SubjectTile extends StatelessWidget {
  final String subject;
  const SubjectTile({
    Key? key,
    this.subject = "Maths",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => {print(subject)},
      child: Container(
        height: 100,
        width: double.infinity,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://media.istockphoto.com/photos/math-physics-formulas-picture-id838557436?k=20&m=838557436&s=612x612&w=0&h=JwBOzmA4foWuABaO4Z2Rl8JcYGp7mP6vekfT5ax8x3A=",
                  ),
                ),
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(1, 0.0),
                  colors: [
                    Color(0xFF0D1015),
                    Color(0xff0D1015).withOpacity(0.0),
                  ],
                  stops: [0.4, 1.0],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                subject,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
