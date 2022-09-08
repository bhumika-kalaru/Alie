import 'package:flutter/material.dart';

class GestureDetectorMaker extends StatelessWidget {
  GestureDetectorMaker({required this.tit});
  final String tit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: null,
          child: Container(
            height: 80,
            width: 600,
            color: Color(0xFF1A1E31),
            child: Center(child: Text(tit)),
          ),
        ),
        SizedBox(
          height: 1,
        ),
      ],
    );
  }
}
