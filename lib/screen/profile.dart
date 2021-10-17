import 'package:flutter/material.dart';
import 'package:jiit_shiksha/utils/profileInfoTile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [Color(0xff03c04a), Colors.white],
          center: Alignment(0, -1.95),
          stops: [1, 1],
          radius: 1.4,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 40),
          Text(
            "Karan Malhotra",
            style: TextStyle(fontSize: 36, color: Colors.white),
          ),
          SizedBox(height: 40),
          CircleAvatar(
            radius: 80,
            foregroundImage: AssetImage("assets/images/karanprofile.png"),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
            child: Column(
              children: [
                ProfileInfoTile(
                  tileIcon: Icons.mail,
                  tileText: "karan@gmail.com",
                ),
                SizedBox(height: 40),
                ProfileInfoTile(
                  tileIcon: Icons.phone,
                  tileText: "+91 9876543210",
                ),
                SizedBox(height: 40),
                ProfileInfoTile(
                  tileIcon: Icons.mail,
                  tileText: "karan@gmail.com",
                ),
                SizedBox(height: 40),
                ProfileInfoTile(
                  tileIcon: Icons.mail,
                  tileText: "karan@gmail.com",
                ),
                SizedBox(height: 40),
                TextButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(60, 8, 60, 8),
                    child: Text(
                      "Logout",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
