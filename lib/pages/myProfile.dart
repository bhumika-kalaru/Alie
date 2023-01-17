import 'package:flutter/material.dart';
import 'consts.dart';
import 'package:flutter/services.dart';

class myProfile extends StatelessWidget {
  const myProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Developer Contacts'),
          centerTitle: true,
          backgroundColor: bar,
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () => Navigator.pop(context),
          )),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 300,
            ),
            Container(child: Text('Tap to copy')),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Tooltip(
                message: 'Single tap to copy',
                // triggerMode: TooltipTriggerMode.tap,
                child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        boxShadow: greenShadow,
                        color: white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      ' bhumikakalaru@gmail.com',
                      style: text,
                    ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
