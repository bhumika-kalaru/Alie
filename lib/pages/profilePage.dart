import 'package:alie/pages/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'consts.dart';

class profile extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: bar,
          title: Text('                   Profile'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          )),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Profile',
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 30,
              ),
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
              SizedBox(
                height: 20,
              ),
              Text(user.displayName!),
              SizedBox(
                height: 20,
              ),
              Text(user.email!),
            ],
          ),
        ),
      ),
    );
  }
}
