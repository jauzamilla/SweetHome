import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweethome/percobaan/coba_edit_postingan.dart';
import 'package:sweethome/percobaan/coba_menampilkakn_postingan.dart';
import 'package:sweethome/percobaan/halaman_lanjutan.dart';
import 'package:sweethome/screen/halamanuser/halaman_postingan.dart';
import 'package:sweethome/screen/halamanuser/tokomu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sweethome/widgets/bottom_sheet_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sweethome/widgets/filebari.dart';

class CobaTambahIklanTanah extends StatefulWidget {
  DocumentSnapshot docid;
  CobaTambahIklanTanah({required this.docid});

  @override
  State<CobaTambahIklanTanah> createState() => _CobaTambahIklanTanahState();
}

class _CobaTambahIklanTanahState extends State<CobaTambahIklanTanah> {
  final controllerJudul = TextEditingController();
  final controllerLuasTanah = TextEditingController();
  final controllerAlamatLokasi = TextEditingController();
  final controllerHarga = TextEditingController();
  final controllerSertifikat = TextEditingController();
  final controllerDeskripsi = TextEditingController();

  final items = ['SHM', 'AJB'];

  String? value;
  XFile? image;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('new');
    return Scaffold(
        appBar: AppBar(
          title: Text('Iklan Tanah'),
          backgroundColor: Color(0xff141228),
        ),
        body: Center(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      inputFormatters: [UpperCaseTextFormatter()],
                      controller: controllerJudul,
                      decoration: InputDecoration(
                        hintText: 'Judul',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.subtitles,
                          color: Color(0xff5A5A5A),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: controllerLuasTanah,
                      decoration: InputDecoration(
                        hintText: 'Luas Tanah',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.straighten,
                          color: Color(0xff5A5A5A),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: controllerAlamatLokasi,
                      decoration: InputDecoration(
                        hintText: 'Alamat Lokasi',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.place,
                          color: Color(0xff5A5A5A),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: controllerHarga,
                      decoration: InputDecoration(
                        hintText: 'Harga',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.attach_money,
                          color: Color(0xff5A5A5A),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.straighten,
                            color: Color(0xff5A5A5A),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Sertifikat',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey)),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                          DropdownButton<String>(
                              value: value,
                              items: items.map(buildMenuItem).toList(),
                              onChanged: (value) =>
                                  setState(() => this.value = value)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: controllerDeskripsi,
                      decoration: InputDecoration(
                        hintText: 'Deskripsi',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.description,
                          color: Color(0xff5A5A5A),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        image != null
                            ? Container(
                                width: 120,
                                height: 120,
                                child: Image.file(
                                  File(image!.path),
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ))
                            : Text("Tidak Ada Image"),
                        SizedBox(
                          width: 5,
                        ),
                        IconButton(
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
                                                    .pickImage(
                                                        source: ImageSource
                                                            .gallery);
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
                                                    .pickImage(
                                                        source:
                                                            ImageSource.camera);
                                                setState(() {});
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            icon: Icon(
                              Icons.add,
                              size: 40,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          FirebaseStorage.instance
                              .ref("${controllerJudul.text}.png")
                              .putFile(File(image!.path))
                              .then((image) async {
                            String imageUrl = await image.ref.getDownloadURL();
                            users.add({
                              'tanah': {
                                'title': controllerJudul.text,
                                'price': int.parse(controllerHarga.text),
                                'luasTanah':
                                    int.parse(controllerLuasTanah.text),
                                'alamatLokasi': controllerAlamatLokasi.text,
                                'sertifikat': value,
                                'deskripsi': controllerDeskripsi.text,
                                'fieldGambar': imageUrl,
                              },
                            }).then((value) {
                              Navigator.of(context)
                                ..pop()
                                ..pop();
                              //
                            });

                            controllerJudul.text = '';
                            controllerLuasTanah.text = '';
                            controllerAlamatLokasi.text = '';
                            controllerHarga.text = '';
                            controllerDeskripsi.text = '';
                            value = '';
                          });
                        },
                        child: const Text('Lanjut'),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff141228),
                            fixedSize: const Size(240, 44),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                      ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     FirebaseStorage.instance.ref("${controllerJudul.text}.png").putFile(File(image!.path)).then((image) async{
                      //             String imageUrl = await image.ref.getDownloadURL();
                      //     users.add({
                      //       'title': controllerJudul.text,
                      //       'price': int.parse(controllerHarga.text),
                      //       // 'price': price.text,
                      //       'alamatLokasi': controllerAlamatLokasi.text,
                      //       'sertifikat': value,
                      //       'fieldGambar': imageUrl,
                      //     }).whenComplete(() {
                      //       Navigator.pushReplacement(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (_) => Menampilkan()));
                      //     });
                      //   });

                      // child: const Text('Lanjut'),
                      // style: ElevatedButton.styleFrom(
                      //     primary: Color(0xff141228),
                      //     fixedSize: const Size(240, 44),
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(50))),
                      // }),
                    ),
                  ],
                ),
              )
            ],
          ),
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

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  // XFile? image;
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
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
              )
            ],
          )
        ],
      ),
    );
  }
}

// Widget bottomSheet(BuildContext context) {
//   return Container(
//     height: 100,
//     width: MediaQuery.of(context).size.width,
//     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//     child: Column(
//       children: [
//         Text(
//           'Pilih Foto',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             InkWell(
//               child: Container(
//                 child: Column(
//                   children: [
//                     Icon(
//                       Icons.image,
//                       size: 40,
//                     ),
//                     Text('Galery')
//                   ],
//                 ),
//               ),
//               onTap: () {},
//             ),
//             SizedBox(
//               width: 30,
//             ),
//             InkWell(
//               child: Container(
//                 child: Column(
//                   children: [
//                     Icon(
//                       Icons.camera,
//                       size: 40,
//                     ),
//                     Text('Camera')
//                   ],
//                 ),
//               ),
//             )
//           ],
//         )
//       ],
//     ),
//   );
// }

// class ImagePicker extends StatefulWidget {
//   const ImagePicker({super.key});

//   @override
//   State<ImagePicker> createState() => _ImagePickerState();
// }

// class _ImagePickerState extends State<ImagePicker> {
//   XFile? image;
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: Container(
//           color: Colors.teal,
//       height: 100,
//       width: MediaQuery.of(context).size.width,
//       margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//       child: Column(
//         children: [
//           Text(
//             'Pilih Foto',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               InkWell(
//                 child: Container(
//                   child: Column(
//                     children: [
//                       Icon(
//                         Icons.image,
//                         size: 40,
//                       ),
//                       Text('Galery')
//                     ],
//                   ),
//                 ),
//   onTap: () async {
//     image =
//         await PickImage().pickImage(source: ImageSource.gallery);
//     setState(() {});
//   },
// ),
//               SizedBox(
//                 width: 30,
//               ),
//               InkWell(
//                 child: Container(
//                   color: Colors.indigo,
//                   child: Column(
//                     children: [
//                       Icon(
//                         Icons.camera,
//                         size: 40,
//                       ),
//                       Text('Camera')
//                     ],
//                   ),
//                 ),
//                 onTap: () async {
//                   image =
//                       await PickImage().pickImage(source: ImageSource.camera);
//                   setState(() {});
//                 },
//               )
//             ],
//           ),
// ElevatedButton(
//     onPressed: () async {
//       image = await PickImage()
//           .pickImage(source: ImageSource.gallery);
//       setState(() {});
//     },
//     child: Container()),
// ElevatedButton(
//     onPressed: () async {
//       image =
//           await PickImage().pickImage(source: ImageSource.camera);
//       setState(() {});
//     },
//     child: Container()),
// SizedBox(
//   height: 200,
// ),
// image != null
//     ? Container(
//         width: 200,
//         height: 200,
//         child: Image.file(
//           File(image!.path),
//           width: 200,
//           height: 200,
//         ))
//     : Text("Tidak Ada Image")
//     ],
//   ),
// )
// ),
// ),
//         );
//   }
// }
