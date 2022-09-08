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
        child: GestureDetector(
          child: Tooltip(
            message: 'copied to clipboard',
            // triggerMode: TooltipTriggerMode.tap,
            child: ListTile(
                onTap: () {
                  Clipboard.setData(
                      ClipboardData(text: 'bhumikakalru@gmail.com'));
                },
                title: Text('                   bhumikakalaru@gmail.com')),
          ),
        ),
      ),
    );
  }
}
