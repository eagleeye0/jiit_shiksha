import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiit_shiksha/dataController/auth_base.dart';
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
                  backgroundImage: AssetImage("assets/images/karanprofile.png"),
                ),
              ),
            ),
            ListTile(
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
            ListTile(
                leading: Icon(
                  Icons.book,
                  size: 34,
                  color: Colors.green[700],
                ),
                title: Text(
                  "Subjects",
                  textScaleFactor: 1.3,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}