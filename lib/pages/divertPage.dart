import 'package:alie/pages/foundPage.dart';
import 'package:alie/pages/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import '../googlesignin.dart';
import 'lostPage.dart';
import 'myProfile.dart';
import 'profilePage.dart';

class DivertPage extends StatefulWidget {
  @override
  _DivertPageState createState() => _DivertPageState();
}

class _DivertPageState extends State<DivertPage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 7, 11, 31),
        child: ListView(
          children: [
            ListTile(
              title: Center(child: Text('Account')),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => profile()));
              },
            ),
            ListTile(
              title: Center(child: Text('Developer Contacts')),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => myProfile()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 7, 11, 31),
        title: Text('Welcome to ALie'),
        actions: [
          GestureDetector(
            child: Icon(Icons.logout),
            onTap: () {
              setState(() {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              });
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => lostPage()));
              },
              child: Center(
                  child: Text(
                'Lost',
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 100,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => foundPage()));
              },
              child: Center(
                  child: Text(
                'Found',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 100,
                    fontWeight: FontWeight.bold),
              )),
            ),
          )
        ],
      ),
    );
  }
}
