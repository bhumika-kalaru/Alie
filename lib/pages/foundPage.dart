import 'package:alie/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'showItem.dart';
import 'FaddItems.dart';
import 'package:google_fonts/google_fonts.dart';
import 'consts.dart';

class foundPage extends StatefulWidget {
  const foundPage({Key? key}) : super(key: key);

  @override
  State<foundPage> createState() => _foundPageState();
}

class _foundPageState extends State<foundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bar,
        title: Text('Found Items'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FaddItems()));
              });
            },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 15),
          SizedBox(
            width: 5,
          )
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: StreamBuilder<List<User>>(
              stream: readUsers(),
              builder: ((context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong! ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final users = snapshot.data!;
                  return ListView(
                    children: users.map(buildUser).toList(),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUser(User user) => GestureDetector(
        child: Container(
          height: 100,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: white,
              boxShadow: greenShadow,
              borderRadius: BorderRadius.circular(30)),
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                user.d,
                style: text,
              ),
              Text(
                'Key Details: ' + user.k,
                style: lightText,
              ),
              Text(
                'Contact Details: ' + user.c,
                style: contText,
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      showItem(title: user.d, keys: user.k, contact: user.c)));
        },
      );
  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('Found')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
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
