import 'package:flutter/material.dart';
import 'package:jiit_shiksha/screen/home.dart';
import 'package:jiit_shiksha/screen/profile.dart';
import 'package:jiit_shiksha/screen/subjects.dart';
import 'package:jiit_shiksha/widgets/drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [Home(), Subjects(), Profile()];
  Widget currentScreen = Home();
  itemTapped(int index) {
    setState(() {
      currentScreen = screens[index];
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("JIIT Shiksha"),
          backgroundColor: Color(0xff03c04a),
          shadowColor: Color(0x00000000),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: MyDrawer(),
        body: currentScreen,
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: "Subjects",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
          currentIndex: selectedIndex,
          onTap: itemTapped,
        ),
      ),
    );
  }
}
