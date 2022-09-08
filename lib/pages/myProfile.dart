import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class myProfile extends StatelessWidget {
  const myProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 7, 11, 31),
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
            Center(child: Text('Tap to copy')),
            SizedBox(
              height: 50,
            ),
            Center(
              child: OutlinedButton(
                child: Tooltip(
                  message: 'SIngle tap to copy',
                  // triggerMode: TooltipTriggerMode.tap,
                  child: ListTile(
                      title:
                          Text('                   bhumikakalaru@gmail.com')),
                ),
                onPressed: () {
                  Clipboard.setData(
                      ClipboardData(text: 'bhumikakalru@gmail.com'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
