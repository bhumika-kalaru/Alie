import 'package:alie/pages/LaddItems.dart';
import 'package:alie/pages/loginpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'profilePage.dart';
import 'FaddItems.dart';
import 'GestureDetector.dart';

List<Widget> lostTiles = [];

class lostPage extends StatefulWidget {
  const lostPage({Key? key}) : super(key: key);

  @override
  State<lostPage> createState() => _lostPageState();
}

class _lostPageState extends State<lostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 7, 11, 31),
        title: Text('Lost Items'),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LaddItems()));
              });
            },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 15),
          // GestureDetector(
          //   onTap: () {
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (context) => profile()));
          //   },
          //   child: Icon(Icons.account_circle),
          // ),
          SizedBox(
            width: 5,
          )
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: StreamBuilder<List<User>>(
        stream: readUsers(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot.error}');
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            print('$users');

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
    );
  }

  Widget buildUser(User user) => GestureDetector(
        child: ListTile(
          title: Text(user.d),
          subtitle: Text('Key Details: ' +
              user.k +
              '\n' +
              'Contact Details: ' +
              user.c +
              '\n'),
        ),
        // onTap: Navigator.push(context, MaterialPageRoute(builder: (context)=>loginpage())),
      );
  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('Lost')
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
