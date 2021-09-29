import 'package:flutter/material.dart';
import 'package:jiit_shiksha/utils/subjectTile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = "Karan";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi $name",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "What would you like to learn today",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Search Subjects",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.grey[600]!,
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.grey[600]!,
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SubjectTile(
                            subject: "Maths",
                          ),
                          SubjectTile(
                            subject: "DBMS",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SubjectTile(
                            subject: "Maths",
                          ),
                          SubjectTile(
                            subject: "DBMS",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SubjectTile(
                            subject: "Maths",
                          ),
                          SubjectTile(
                            subject: "DBMS",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SubjectTile(
                            subject: "Maths",
                          ),
                          SubjectTile(
                            subject: "DBMS",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SubjectTile(
                            subject: "Maths",
                          ),
                          SubjectTile(
                            subject: "DBMS",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SubjectTile(
                            subject: "Maths",
                          ),
                          SubjectTile(
                            subject: "DBMS",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xFFFAF1FF),
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
              icon: Icon(Icons.search),
              label: "Search",
            ),
          ],
        ),
      ),
    );
  }
}
