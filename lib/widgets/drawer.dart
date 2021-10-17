import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0x8003ac13),
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color(0xFF03ac13)),
                margin: EdgeInsets.zero,
                accountName: Text("Karan Malhotra"),
                accountEmail: Text("17102121@mail.jiit.ac.in"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/karanprofile.png"),
                ),
              ),
            ),
            ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.black,
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
                  CupertinoIcons.profile_circled,
                  color: Colors.black,
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
                  CupertinoIcons.search_circle,
                  color: Colors.black,
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
