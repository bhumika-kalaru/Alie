import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'GestureDetector.dart';
import 'foundPage.dart';
import 'lostPage.dart';
import 'GestureDetector.dart';

class LaddItems extends StatefulWidget {
  @override
  State<LaddItems> createState() => _LaddItemsState();
}

class _LaddItemsState extends State<LaddItems> {
  final descontroller = TextEditingController();
  final keycontroller = TextEditingController();
  final concontroller = TextEditingController();
  late var fcon = "";
  late var fk = "";
  late var fDes = "";
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 500,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: descontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Descrption of the item',
                  ),
                  onChanged: (des) {
                    fDes = descontroller.text;
                  },
                ),
              ),
            ),
            Text(
              'IMAGE',
              style: TextStyle(fontSize: 40),
            ),
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Color(0xCC777676))),
              height: 400,
              width: 376,
              child: GestureDetector(child: Center(child: Icon(Icons.add))),
            ),
            Container(
              height: 90,
              width: 500,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Center(
                  child: TextField(
                    controller: keycontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Key words',
                    ),
                    onChanged: (k) {
                      fk = keycontroller.text;
                    },
                  ),
                ),
              ),
            ),
            Container(
              height: 90,
              width: 500,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Center(
                  child: TextField(
                    controller: concontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Contact details',
                    ),
                    onChanged: (con) {
                      fcon = concontroller.text;
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 7, 11, 31),
        title: Text('Create an Alie'),
        actions: [
          GestureDetector(
            child: Icon(Icons.check),
            onTap: () {
              createUser(des: fDes, k: fk, con: fcon);
              Navigator.pop(context);
            },
          ),
        ],
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('Lost')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

  Future createUser(
      {required String des, required String k, required String con}) async {
    final docUser = FirebaseFirestore.instance.collection('Lost').doc();
    final user = User(
      id: docUser.id,
      d: des,
      c: con,
      k: fk,
    );
    final json = user.toJson();
    await docUser.set(json);
  }
}

class User {
  late String id;
  final String d, c, k;
  User({this.id = '', required this.d, required this.c, required this.k});

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': d,
        'key': k,
        'contactDetails': c,
      };
  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      d: json['description'],
      c: json['contactDetails'],
      k: json['key']);
}
