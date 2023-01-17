import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'consts.dart';

class showItem extends StatelessWidget {
  showItem({required this.title, required this.keys, required this.contact});
  final String title, keys, contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
        backgroundColor: bar,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text('Description:' + title,
                    style: GoogleFonts.gabriela(fontSize: 30))),
            Center(
              child: Text('Key Details:' + keys,
                  style: GoogleFonts.gabriela(fontSize: 24)),
            ),
            Center(
                child: Text('Contact Details:' + contact,
                    style: GoogleFonts.dancingScript(fontSize: 16)))
          ],
        ),
      ),
    );
    ;
  }
}
