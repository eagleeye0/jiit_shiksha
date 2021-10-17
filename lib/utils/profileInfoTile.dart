import 'dart:ffi';

import 'package:flutter/material.dart';

class ProfileInfoTile extends StatelessWidget {
  final IconData? tileIcon;
  final String? tileText;
  const ProfileInfoTile(
      {Key? key, @required this.tileIcon, @required this.tileText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // SizedBox(width: ),
            Icon(
              tileIcon,
              color: Color(0xff03c04a),
              size: 34,
            ),
            SizedBox(width: 30),
            Text(
              tileText!,
              style: TextStyle(fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}
