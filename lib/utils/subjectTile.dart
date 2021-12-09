import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiit_shiksha/screen/video_info.dart';

class SubjectTile extends StatelessWidget {
  final QueryDocumentSnapshot? subjectDocument;
  const SubjectTile({
    Key? key,
    @required this.subjectDocument,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String subjectName = subjectDocument!['name'].toString();

    return TextButton(
      onPressed: () => {Get.to(() => VideoInfo(subject: subjectDocument,))},
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
                  image: Image.asset("assets/images/maths.jpg").image,
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
                subjectName,
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
