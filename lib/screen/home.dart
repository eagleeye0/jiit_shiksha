import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiit_shiksha/utils/subjectTile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jiit_shiksha/dataController/auth_base.dart';
import 'package:jiit_shiksha/utils/profileInfoTile.dart';
import 'package:provider/provider.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final subjectDocument = _firestore.collection('subjects').get();

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Future<List<QueryDocumentSnapshot>> getSubjects() async {
  // final subjectDocument = await subjectCollection.get();
  // final List<QueryDocumentSnapshot> documents = subjectDocument;
  // print(documents.first.toString());
  // List<String> subjects =
  //     documents.map((snapshot) => snapshot['name'].toString()).toList();
  // print(subjects);
  // return documents;
  // }

  @override
  Widget build(BuildContext context) {
    // final name = user!.displayName;
    final Auth auth = Provider.of(context);
    final user = auth.currentUser();
    var name = user!.displayName;
    name = name!.split(' ').first;
    
    return Padding(
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
              child: FutureBuilder(
                future: subjectDocument,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  // return Column(children: snapshot.docs,);
                  if (snapshot.hasData) {
                    // var a = snapshot.data!.docs;
                    // print(]);
                    return Column(
                        children: snapshot.data!.docs
                            .map((e) => SubjectTile(subjectDocument: e))
                            .toList());
                  }
                  return CircularProgressIndicator();
                  // return SubjectTile(subjectDocument: snapshot,);

                  // return Text("hello");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
