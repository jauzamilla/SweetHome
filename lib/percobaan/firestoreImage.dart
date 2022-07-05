// import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:sweethome/screen/halamanuser/halaman_postingan.dart';
// import 'package:sweethome/screen/halamanuser/tokomu.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:sweethome/services/firestore_service.dart';
// import 'package:sweethome/widgets/bottom_sheet_widget.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:sweethome/widgets/filebari.dart';

// class TambahIklanTanah1 extends StatefulWidget {
//   // User user;
//   // TambahIklanTanah1(this.user);

//   @override
//   State<TambahIklanTanah1> createState() => _TambahIklanTanah1State();
// }

// class _TambahIklanTanah1State extends State<TambahIklanTanah1> {
//   final controllerJudul = TextEditingController();
//   final controllerLuasTanah = TextEditingController();
//   final controllerAlamatLokasi = TextEditingController();
//   final controllerHarga = TextEditingController();
//   final controllerSertifikat = TextEditingController();
//   final controllerDeskripsi = TextEditingController();
//   final ImagePicker _picker = ImagePicker();

//   final items = ['SHM', 'AJB'];

//   String? value;
//   XFile? image;

//   bool loading = false;
//   List<XFile>? _imageFileList;

//   void _setImageFileListFromFile(XFile? value) {
//     _imageFileList = value == null ? null : <XFile>[value];
//   }

//   dynamic _pickImageError;

//   String? _retrieveDataError;

//   Widget _previewImages() {
//     final Text? retrieveError = _getRetrieveErrorWidget();
//     if (retrieveError != null) {
//       return retrieveError;
//     }
//     if (_imageFileList != null) {
//       return Semantics(
//         label: 'image_picker_example_picked_images',
//         child: ListView.builder(
//           key: UniqueKey(),
//           itemBuilder: (BuildContext context, int index) {
//             // Why network for web?
//             // See https://pub.dev/packages/image_picker#getting-ready-for-the-web-platform

//             File file = File(_imageFileList![index].path);

//             FirebaseStorage.instance
//                 .ref(_imageFileList![index].name)
//                 .putFile(file)
//                 .then((imageResult) {
//               imageResult.ref.getDownloadURL().then((value) {
//                 FirebaseFirestore.instance
//                     .collection("test")
//                     .add({"image": value});
//               });
//             });

//             return Semantics(
//               label: 'image_picker_example_picked_image',
//               child: kIsWeb
//                   ? Image.network(_imageFileList![index].path)
//                   : Image.file(File(_imageFileList![index].path)),
//             );
//           },
//           itemCount: _imageFileList!.length,
//         ),
//       );
//     } else if (_pickImageError != null) {
//       return Text(
//         'Pick image error: $_pickImageError',
//         textAlign: TextAlign.center,
//       );
//     } else {
//       return const Text(
//         'Masukan Photo.',
//         textAlign: TextAlign.center,
//       );
//     }
//   }

//   Widget _handlePreview() {
//     {
//       return _previewImages();
//     }
//   }

//   Future<void> retrieveLostData() async {
//     final LostDataResponse response = await _picker.retrieveLostData();
//     if (response.isEmpty) {
//       return;
//     }
//     if (response.file != null) {
//       {
//         // isVideo = false;
//         setState(() {
//           if (response.files == null) {
//             _setImageFileListFromFile(response.file);
//           } else {
//             _imageFileList = response.files;
//           }
//         });
//       }
//     } else {
//       _retrieveDataError = response.exception!.code;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     CollectionReference users = firestore.collection('categories');
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Iklan Tanah'),
//           backgroundColor: Color(0xff141228),
//         ),
//         body: Center(
//           child: ListView(
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(24.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     TextField(
//                       inputFormatters: [UpperCaseTextFormatter()],
//                       maxLength: 50,
//                       controller: controllerJudul,
//                       decoration: InputDecoration(
//                         hintText: 'Judul',
//                         hintStyle: TextStyle(color: Colors.grey),
//                         prefixIcon: Icon(
//                           Icons.subtitles,
//                           color: Color(0xff5A5A5A),
//                         ),
//                       ),
//                     ),
//                     // SizedBox(
//                     //   height: 10,
//                     // ),
//                     TextField(
//                       controller: controllerLuasTanah,
//                       decoration: InputDecoration(
//                         hintText: 'Luas Tanah',
//                         hintStyle: TextStyle(color: Colors.grey),
//                         prefixIcon: Icon(
//                           Icons.straighten,
//                           color: Color(0xff5A5A5A),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     TextField(
//                       controller: controllerAlamatLokasi,
//                       decoration: InputDecoration(
//                         hintText: 'Alamat Lokasi',
//                         hintStyle: TextStyle(color: Colors.grey),
//                         prefixIcon: Icon(
//                           Icons.place,
//                           color: Color(0xff5A5A5A),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     TextField(
//                       controller: controllerHarga,
//                       decoration: InputDecoration(
//                         hintText: 'Harga',
//                         hintStyle: TextStyle(color: Colors.grey),
//                         prefixIcon: Icon(
//                           Icons.attach_money,
//                           color: Color(0xff5A5A5A),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       child: Row(
//                         children: [
//                           SizedBox(
//                             width: 15,
//                           ),
//                           Icon(
//                             Icons.straighten,
//                             color: Color(0xff5A5A5A),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Text('Sertifikat',
//                               style:
//                                   TextStyle(fontSize: 16, color: Colors.grey)),
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width * 0.4,
//                           ),
//                           DropdownButton<String>(
//                               value: value,
//                               items: items.map(buildMenuItem).toList(),
//                               onChanged: (value) =>
//                                   setState(() => this.value = value)),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     TextField(
//                       controller: controllerDeskripsi,
//                       decoration: InputDecoration(
//                         hintText: 'Deskripsi',
//                         hintStyle: TextStyle(color: Colors.grey),
//                         prefixIcon: Icon(
//                           Icons.description,
//                           color: Color(0xff5A5A5A),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       children: [
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Center(
//                           child: !kIsWeb &&
//                                   defaultTargetPlatform ==
//                                       TargetPlatform.android
//                               ? FutureBuilder<void>(
//                                   future: retrieveLostData(),
//                                   builder: (BuildContext context,
//                                       AsyncSnapshot<void> snapshot) {
//                                     switch (snapshot.connectionState) {
//                                       case ConnectionState.none:
//                                       case ConnectionState.waiting:
//                                         return Container(
//                                           height: 500,
//                                           width: 500,
//                                           child: const Text(
//                                             'You have not yet picked an image.',
//                                             textAlign: TextAlign.center,
//                                           ),
//                                         );
//                                       case ConnectionState.done:
//                                         return _handlePreview();
//                                       default:
//                                         if (snapshot.hasError) {
//                                           return Text(
//                                             'Pick image/video error: ${snapshot.error}}',
//                                             textAlign: TextAlign.center,
//                                           );
//                                         } else {
//                                           return const Text(
//                                             'Masukan Photo.',
//                                             textAlign: TextAlign.center,
//                                           );
//                                         }
//                                     }
//                                   },
//                                 )
//                               : _handlePreview(),
//                         ),
//                         SizedBox(
//                           width: 5,
//                         ),
//                         IconButton(
//                             onPressed: () {
//                               showDialog(
//                                   context: context,
//                                   builder: (BuildContext context) {
//                                     return AlertDialog(
//                                       title: Text('Choose Photo'),
//                                       content: SingleChildScrollView(
//                                         child: ListBody(
//                                           children: [
//                                             InkWell(
//                                               child: Row(
//                                                 children: [
//                                                   Icon(
//                                                     Icons.image,
//                                                     size: 40,
//                                                   ),
//                                                   Text('Galery')
//                                                 ],
//                                               ),
//                                               onTap: () async {
//                                                 image = await PickImage()
//                                                     .pickImage(
//                                                         source: ImageSource
//                                                             .gallery);
//                                                 setState(() {});
//                                               },
//                                             ),
//                                             InkWell(
//                                               child: Row(
//                                                 children: [
//                                                   Icon(
//                                                     Icons.camera,
//                                                     size: 40,
//                                                   ),
//                                                   Text('Camera')
//                                                 ],
//                                               ),
//                                               onTap: () async {
//                                                 image = await PickImage()
//                                                     .pickImage(
//                                                         source:
//                                                             ImageSource.camera);
//                                                 setState(() {});
//                                               },
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     );
                                    
//                                   });
//                             },
//                             icon: Icon(
//                               Icons.add,
//                               size: 40,
//                             ))
//                       ],
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     loading
//                         ? Center(
//                             child: CircularProgressIndicator(),
//                           )
//                         : Center(
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 users.add({
//                                   'tanah': {
//                                     'title': controllerJudul.text,
//                                     'price': int.parse(controllerHarga.text),
//                                     'luasTanah':
//                                         int.parse(controllerLuasTanah.text),
//                                     'alamatLokasi': controllerAlamatLokasi.text,
//                                     // 'sertifikat': controllerSertifikat.text,
//                                     'deskripsi': controllerDeskripsi.text,
//                                     'sertifikat': value,
//                                   },
//                                 });

//                                 controllerJudul.text = '';
//                                 controllerLuasTanah.text = '';
//                                 controllerAlamatLokasi.text = '';
//                                 controllerHarga.text = '';
//                                 controllerDeskripsi.text = '';
//                                 value = '';

//                                 // Navigator.pop(context);
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             (HalamanPostingan())));
//                               },
//                               child: const Text('Lanjut'),
//                               style: ElevatedButton.styleFrom(
//                                   primary: Color(0xff141228),
//                                   fixedSize: const Size(240, 44),
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(50))),
//                             ),
//                           ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ));
//   }

//   Text? _getRetrieveErrorWidget() {
//     if (_retrieveDataError != null) {
//       final Text result = Text(_retrieveDataError!);
//       _retrieveDataError = null;
//       return result;
//     }
//     return null;
//   }

//   DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
//         value: item,
//         child: Text(
//           item,
//           style: TextStyle(fontSize: 14),
//         ),
//       );
// }

// class UpperCaseTextFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     return TextEditingValue(
//       text: newValue.text.toUpperCase(),
//       selection: newValue.selection,
//     );
//   }
// }
