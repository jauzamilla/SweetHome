
import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
// import '../../development/flutter/packages/flutter/lib/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerApp extends StatefulWidget {
  const ImagePickerApp({super.key});

  @override
  State<ImagePickerApp> createState() => _ImagePickerAppState();
}

class _ImagePickerAppState extends State<ImagePickerApp> {
  late PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          SizedBox(
            height: 80,
          ),
          // _imageFile==null ? AssetImage('image/images4.jpeg'): FileImage(File(_imageFile.path)),
          SizedBox(
            height: 30,
          ),
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              width: 90,
              height: 40,
              child: Center(child: Text('Pilih Foto')),
            ),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet(context)));
            },
          )
          // CustomButton()
        ]),
      ),
    );
  }
  Widget bottomSheet(BuildContext context) {
  return Container(
    height: 100,
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Column(
      children: <Widget>[
        Text(
          'Choose Profile photo',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              child: Icon(Icons.camera, size: 40,),
              onTap: (){
                // takePhoto(ImageSource.camera);
              },
            ),
            SizedBox(width: 5,),
            Text('Camera'),
            SizedBox(
              width: 40,
            ),
            InkWell(
              child: Icon(Icons.image, size: 40,),
              onTap: (){
                // takePhoto(ImageSource.gallery); 
              },
            ),
            Text('Galery')
          ],
        )
      ],
    ),
  );
}

void takePhoto(ImageSource source) async{
  var _picker;
  final PickedFile = await _picker.getImage(source: source);
  setState(() {
    _imageFile = PickedFile;
  } );
}

}




