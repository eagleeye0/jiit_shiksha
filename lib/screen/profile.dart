import 'package:flutter/material.dart';
import 'package:jiit_shiksha/dataController/auth_base.dart';
import 'package:jiit_shiksha/utils/profileInfoTile.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  void signOut(BuildContext context) async {
    final Auth auth = Provider.of(context, listen: false);

    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Are you sure you want to Sign Out?"),
          actions: <Widget>[
            TextButton(
              child: const Text('cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () async {
                Navigator.of(context).pop();
                await auth.signOut();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Auth auth = Provider.of(context);
    final user = auth.currentUser();
    final name = user!.displayName;
    final email = user.email;
    final profileImage = user.photoURL;
    return SingleChildScrollView(
      child: Container(
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
              name!,
              style: TextStyle(fontSize: 36, color: Colors.white),
            ),
            SizedBox(height: 40),
            CircleAvatar(
              radius: 80,
              foregroundImage: NetworkImage(profileImage!),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
              child: Column(
                children: [
                  ProfileInfoTile(
                    tileIcon: Icons.person,
                    tileText: (name[0].toUpperCase() + name.substring(1)),
                  ),
                  SizedBox(height: 40),
                  // SizedBox(height: 40),
                  ProfileInfoTile(
                    tileIcon: Icons.mail,
                    tileText: email,
                  ),

                  SizedBox(height: 40),
                  TextButton(
                    onPressed: () {
                      signOut(context);
                    },
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
      ),
    );
  }
}
