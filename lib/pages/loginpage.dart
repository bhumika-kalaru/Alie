import 'package:alie/pages/divertPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import '../googlesignin.dart';
import 'package:alie/pages/loginpage.dart';

class loginpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Login")),
        ),
        body: SafeArea(
            child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 390,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SignInButton(
                    Buttons.GoogleDark,
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.googleLogin();
                      print(signi);
                      print('log');
                      if (check() == 2) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DivertPage()));
                      }
                      // String
                    },
                    mini: false,
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
