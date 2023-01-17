// // import 'dart:html';
// import 'dart:io';

// import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';

// class Fimage extends StatefulWidget {
//   const Fimage({Key? key}) : super(key: key);

//   @override
//   State<Fimage> createState() => _FimageState();
// }

// class _FimageState extends State<Fimage> {
//   File? _image;

//   Future getImage() async {
//     final image = await ImagePicker().pickImage(source: ImageSource.camera);
//     if (image == null) {
//       return;
//     }
//     final imageTemporary = File(image.path);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.network(
//                   'https://media.istockphoto.com/photos/barbary-macaque-picture-id824860820?k=20&m=824860820&s=612x612&w=0&h=W8783ZGcqMfDMJoXvBAyDFcSjnOWdKqKhgLGvf-VIuU='),
//               customButton()
//             ],
//           ),
//         ),
//       ),
//     );
//     ;
//   }
// }

// Widget customButton() {
//   return Container(
//       width: 180,
//       child: ElevatedButton(
//         child: Row(
//           children: [Icon(Icons.image), Text('pick from')],
//         ),
//         onPressed: (() {}),
//       ));
// }
