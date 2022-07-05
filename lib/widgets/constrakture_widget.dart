// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';

// class CustomButton extends StatefulWidget {
//   final String title;
//   final IconData icon;
//   final VoidCallback onClick;
//   CustomButton(
//       {super.key,
//       required this.title,
//       required this.icon,
//       required this.onClick});

//   @override
//   State<CustomButton> createState() => _CustomButtonState();
// }

// class _CustomButtonState extends State<CustomButton> {
//   File? _image;

//   Future getImage() async {
//     final image = await ImagePicker().pickImage(source: ImageSource.camera);
//     if (image == null) return;

//     final imageTemporery = File(image.path);

//     setState(() {

//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 280,
//       child: ElevatedButton(
//           onPressed: widget.onClick,
//           child: Row(
//             children: [
//               Icon(widget.icon),
//               SizedBox(
//                 width: 20,
//               ),
//               Text(widget.title)
//             ],
//           )),
//     );
//   }
// }

// _image != null
//             ? Container(
//                 decoration: BoxDecoration(boxShadow: [
//                   BoxShadow(
//                     offset: Offset(0, 0),
//                     blurRadius: 5,
//                   )
//                 ]),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 200,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: InkWell(
//                       child: Image.file(
//                         File(_image!.path),
//                         width: MediaQuery.of(context).size.width,
//                         height: MediaQuery.of(context).size.height,
//                         fit: BoxFit.cover,
//                       ),
//                       onTap: () async {
//                         _image = await Bottom().getImage(source: ImageSource.gallery);
//                         setState(() {});
//                       },
//                     ),
//                   ),
//                 ),
//               )
// : InkWell(
//     onTap: () async {
//       _image = await Bottom().getImage(source: ImageSource.gallery);
//       setState(() {});
//     },
//     child: AddImageButton(
//       width: MediaQuery.of(context).size.width,
//       height: 200,

//       depth: 3,
//       size: 50,
//       onPressed: () async {
//         _image = await Bottom().getImage(source: ImageSource.gallery);
//         setState(() {});
//       },
//       borderRadius: BorderRadius.circular(20),

//       ),
// )]]

// :
// SizedBox(height: 40,),
// _image==null ? FileImage(File(_image!.path) : AssetImage('image/images4.jpeg')),
// _image != null
//     ? Image.file(
//         _image!,
//         width: 250,
//         height: 250,
//         fit: BoxFit.cover,
//       )
//     : Image.asset('image/images4.jpeg'),
// CustomButton(
//     title: 'Pilih dari Galery',
//     icon: Icons.image,
//     onClick: () async {
//       XFile? image =
//           await Bottom().getImage(source: ImageSource.gallery);
//     }),
// CustomButton(
//     title: 'Pilih dari Camera',
//     icon: Icons.camera,
//     onClick: () async {
//       XFile? image =
//           await Bottom().getImage(source: ImageSource.camera);
//     }),

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sweethome/widgets/constrakture_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sweethome/widgets/filebari.dart';

class CobaImagePicker extends StatefulWidget {
  const CobaImagePicker({super.key});

  @override
  State<CobaImagePicker> createState() => _CobaImagePickerState();
}

class _CobaImagePickerState extends State<CobaImagePicker> {
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
            image != null
                ? Container(
                    width: 200,
                    height: 200,
                    child: Image.file(
                      File(image!.path),
                      width: 200,
                      height: 200,
                    ))
                : Text("Tidak Ada Image"),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Choose Photo'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: [
                                InkWell(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.image,
                                        size: 40,
                                      ),
                                      Text('Galery')
                                    ],
                                  ),
                                  onTap: () async {
                                    image = await PickImage()
                                        .pickImage(source: ImageSource.gallery);
                                    setState(() {});
                                  },
                                ),
                                InkWell(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.camera,
                                        size: 40,
                                      ),
                                      Text('Camera')
                                    ],
                                  ),
                                  onTap: () async {
                                    image = await PickImage()
                                        .pickImage(source: ImageSource.gallery);
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container()),
            // ElevatedButton(
            //     onPressed: () async {
            //       image =
            //           await PickImage().pickImage(source: ImageSource.camera);
            //       setState(() {});
            //     },
            //     child: Container()),

            SizedBox(
              height: 200,
            ),

            // image != null ? Container(width: 200,height: 200, child: Image.file(File(image!.path),width: 200,height: 200,)): Text("Tidak Ada Image")
          ],
        )
            // ),
            // ),
            ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontSize: 14),
        ),
      );
}

class BottomSheet extends StatefulWidget {
  const BottomSheet({super.key});

  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text(
            'Pilih Foto',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Container(
                  child: Column(
                    children: [
                      Icon(
                        Icons.image,
                        size: 40,
                      ),
                      Text('Galery')
                    ],
                  ),
                ),
                onTap: () async {
                  image =
                      await PickImage().pickImage(source: ImageSource.gallery);
                  setState(() {});
                },
              ),
              //  ElevatedButton(onPressed: () async {
              //   image = await PickImage().pickImage(source: ImageSource.gallery);
              //   setState(() {

              //   });
              // }, child: Container()),
              SizedBox(
                width: 30,
              ),
              InkWell(
                child: Container(
                  child: Column(
                    children: [
                      Icon(
                        Icons.camera,
                        size: 40,
                      ),
                      Text('Camera')
                    ],
                  ),
                ),
                onTap: () async {
                  image =
                      await PickImage().pickImage(source: ImageSource.camera);
                  setState(() {});
                },
              ),
              //  image != null
              //     ? Container(
              //         width: 200,
              //         height: 200,
              //         child: Image.file(
              //           File(image!.path),
              //           width: 200,
              //           height: 200,
              //         ))
              //     : Text("Tidak Ada Image"),
            ],
          )
        ],
      ),
    );
  }
}
