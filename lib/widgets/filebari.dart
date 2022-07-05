// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';

// class Bottom {
//    File? _image;

//   Future<XFile?> getImage({required ImageSource source}) async {
//     final image = await ImagePicker().pickImage(source: source);
//     if (image == null) return null;

//     final imageTemporery = File(image.path);

//     return image;

   
//   }
// }

// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';

// class PickImage {
//   final ImagePicker _picker = ImagePicker();
//   Future<XFile?> pickImage() async {
//     try {
//       final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//       if (image == null) return null;
//       final imageTemp = XFile(image.path);
//       return imageTemp;
//       // setState(() {
//       //   this.image = imageTemp;
//       // });
//     } on PlatformException catch (e) {
//       print("Failed to pick image $e");
//     }
//   }
// }

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class PickImage {
  final ImagePicker _picker = ImagePicker();
  Future<XFile?> pickImage({required ImageSource source}) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image == null) return null;
      final imageTemp = XFile(image.path);
      return imageTemp;
      // setState(() {
      //   this.image = imageTemp;
      // });
    } on PlatformException catch (e) {
      print("Failed to pick image $e");
    }
  }
  
  
}