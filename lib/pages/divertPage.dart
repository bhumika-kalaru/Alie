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
              tileColor: Colors.blueAccent,
              title: Center(child: Text('Account')),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => profile()));
              },
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              tileColor: Colors.blueGrey,
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
        title: Text('           Welcome to Alie'),
        actions: [
          GestureDetector(
            child: Icon(
              Icons.logout,
              color: Colors.red,
            ),
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
          SizedBox(
            height: 150,
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => lostPage()));
            },
            style: OutlinedButton.styleFrom(
              shape: StadiumBorder(),
              side: BorderSide(width: 5.0, color: Colors.blue),
            ),
            child: Center(
                child: Text(
              'Lost',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 100,
                  fontWeight: FontWeight.bold),
            )),
          ),
          SizedBox(
            height: 200,
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => foundPage()));
            },
            style: OutlinedButton.styleFrom(
              shape: StadiumBorder(),
              side: BorderSide(width: 5.0, color: Colors.blue),
            ),
            child: Center(
                child: Text(
              'Found',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 100,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
    );
  }
}
