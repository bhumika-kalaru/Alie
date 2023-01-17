import 'package:alie/pages/foundPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../googlesignin.dart';
import 'lostPage.dart';
import 'myProfile.dart';
import 'package:alie/main.dart';
import 'consts.dart';
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
        backgroundColor: buttonColor,
        child: ListView(
          children: [
            ListTile(
              tileColor: bar,
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
              tileColor: bar,
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
        backgroundColor: bar,
        title: Text('Welcome to Alie'),
        centerTitle: true,
        actions: [
          GestureDetector(
            child: Icon(
              Icons.logout,
              color: red,
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
      body: Stack(children: [
        Container(
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => lostPage()));
                  },
                  child: Container(
                    width: 250,
                    decoration: BoxDecoration(
                        boxShadow: greenShadow,
                        color: white,
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Text('Lost',
                          style: GoogleFonts.dancingScript(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 100,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  )),
              SizedBox(
                height: 200,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => foundPage()));
                },
                child: Center(
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                        boxShadow: greenShadow,
                        color: white,
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                        child: Text('Found',
                            style: GoogleFonts.dancingScript(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 100,
                                  fontWeight: FontWeight.bold),
                            ))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
