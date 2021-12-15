import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiit_shiksha/dataController/auth_base.dart';
import 'package:jiit_shiksha/screen/home.dart';
import 'package:jiit_shiksha/screen/landing_page.dart';
import 'package:jiit_shiksha/screen/mainScreen.dart';
import 'package:jiit_shiksha/screen/profile.dart';
import 'package:jiit_shiksha/utils/routes.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Auth auth = Provider.of(context);
    final user = auth.currentUser();
    final name = user!.displayName;
    final email = user.email;
    final profileImage = user.photoURL;
    return Drawer(
      child: Container(
        // color: Color(0x8003ac13),
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color(0xFF03ac13)),
                margin: EdgeInsets.zero,
                accountName: Text(name!),
                accountEmail: Text(email!),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(profileImage!),
                ),
              ),
            ),
            ListTile(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainScreen(screen: 0)));
                },
                leading: Icon(
                  Icons.home,
                  size: 34,
                  color: Colors.green[700],
                ),
                title: Text(
                  "Home",
                  textScaleFactor: 1.3,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
            ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainScreen(screen: 1)));
                },
                leading: Icon(
                  Icons.person,
                  size: 34,
                  color: Colors.green[700],
                ),
                title: Text(
                  "Profile",
                  textScaleFactor: 1.3,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
