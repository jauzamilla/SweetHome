import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sweethome/widgets/constrakture_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sweethome/widgets/filebari.dart';

class ImagePicker extends StatefulWidget {
  const ImagePicker({super.key});

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: Center(
        child: Column(
          children: [
            image != null ? Container(width: 200,height: 200, child: Image.file(File(image!.path),width: 200,height: 200,)): Text("Tidak Ada Image"),
         ElevatedButton(onPressed: () async {
              image = await PickImage().pickImage(source: ImageSource.gallery);
              setState(() {
                
              });
            }, child: Container()),
            ElevatedButton(onPressed: ()async {
              image = await PickImage().pickImage(source: ImageSource.camera);
              setState(() {
                
              });
            }, child: Container()),


            SizedBox(height: 200,),

            // image != null ? Container(width: 200,height: 200, child: Image.file(File(image!.path),width: 200,height: 200,)): Text("Tidak Ada Image")
      ],)
        // ),
      // ),
    ));
  }
}
