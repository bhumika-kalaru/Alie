import 'package:flutter/animation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

final Color? card = Colors.lightGreen[50];
final Color? bar = Colors.lightGreen[400];
final Color? white = Colors.white;
final Color? red = Colors.red;
final Color? buttonColor = Colors.green[50];
final text = GoogleFonts.montserrat(
  textStyle:
      TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
);
final lightText = GoogleFonts.montserrat(
  textStyle:
      TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
);
final contText = GoogleFonts.montserrat(
  textStyle:
      TextStyle(color: Colors.black, fontSize: 6, fontWeight: FontWeight.w200),
);

List<BoxShadow> shadow = [
  BoxShadow(color: Colors.grey[300]!, blurRadius: 30, offset: Offset(0, 10))
];

List<BoxShadow> lightGreenShadow = [
  BoxShadow(
      color: Colors.lightGreen[50]!, blurRadius: 30, offset: Offset(0, 10))
];
List<BoxShadow> greenShadowButton = [
  BoxShadow(
      color: Colors.lightGreen[100]!, blurRadius: 30, offset: Offset(0, 10))
];

List<BoxShadow> greenShadow = [
  BoxShadow(
      color: Colors.lightGreen[100]!, blurRadius: 20, offset: Offset(0, 10))
];
