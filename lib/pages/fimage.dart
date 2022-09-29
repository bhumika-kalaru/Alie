// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class Fimage extends StatefulWidget {
//   late File imagefile;
//   @override
//   State<Fimage> createState() => _FimageState();
// }

// class _FimageState extends State<Fimage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                   onPressed: () {
//                     _getFromGallery();
//                   },
//                   child: Text("pick from gallery")),
//               ElevatedButton(
//                   onPressed: () {
//                     _getFromCamera();
//                   },
//                   child: Text("pick from camera"))
//             ],
//           ),
//         ),
//       ),
//     );
//     ;
//   }
// }

// _getFromGallery() async {
//   PickedFile? pickedFile = await ImagePicker().getImage(
//     source: ImageSource.gallery,
//     maxWidth: 1800,
//     maxHeight: 1800,
//   );
//   if (pickedFile != null) {
//     File imageFile = File(pickedFile.path);
//   }
// }

// _getFromCamera() async {
//   PickedFile? pickedFile = await ImagePicker().getImage(
//     source: ImageSource.camera,
//     maxWidth: 1800,
//     maxHeight: 1800,
//   );
//   if (pickedFile != null) {
//     File imageFile = File(pickedFile.path);
//   }
// }
