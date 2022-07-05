// // import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:sweethome/screen/halamanuser/halaman_postingan.dart';
// import 'package:sweethome/screen/halamanuser/tokomu.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:sweethome/widgets/bottom_sheet_widget.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:sweethome/widgets/filebari.dart';

// class CobaTanah extends StatefulWidget {
//   const CobaTanah({super.key});

//   @override
//   State<CobaTanah> createState() => _CobaTanahState();
// }

// class _CobaTanahState extends State<CobaTanah> {
//   final controllerJudul = TextEditingController();
//   final controllerLuasTanah = TextEditingController();
//   final controllerAlamatLokasi = TextEditingController();
//   final controllerHarga = TextEditingController();
//   final controllerSertifikat = TextEditingController();
//   final controllerDeskripsi = TextEditingController();

//   final items = ['SHM', 'AJB'];

//   String? value;
//   XFile? image;

//   @override
//   Widget build(BuildContext context) {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     CollectionReference users = firestore.collection('tanah');
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
//                     SizedBox(
//                       height: 10,
//                     ),
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
//                         Container(
//                           width: 100,
//                           height: 100,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               width: 1,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 5,
//                         ),
//                         IconButton(
//                             onPressed: () {
//                               showModalBottomSheet(
//                                   context: context,
//                                   builder: ((builder) => bottomSheet(context)));
//                             },
//                             icon: Icon(
//                               Icons.add,
//                               size: 40,
//                             ))
//                       ],
//                     ),
//                     SizedBox(
//                       height: 60,
//                     ),
//                     Center(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           users.add({
//                             'judul': controllerJudul.text,
//                             'harga': int.parse(controllerHarga.text),
//                             'luasTanah': int.parse(controllerLuasTanah.text),
//                             'alamatLokasi': controllerAlamatLokasi.text,
//                             'sertifikat': controllerSertifikat.text,
//                             'deskripsi': controllerDeskripsi.text,
//                             'sertifikat': value,
//                           });

//                           controllerJudul.text = '';
//                           controllerLuasTanah.text = '';
//                           controllerAlamatLokasi.text = '';
//                           controllerHarga.text = '';
//                           controllerDeskripsi.text = '';
//                           controllerSertifikat.text = '';
//                           value = '';
//                           // final user = User(
//                           //   judul: controllerJudul.text,
//                           //   luasTanah: int.parse(controllerLuasTanah.text),
//                           //   alamatLokasi: controllerAlamatLokasi.text,
//                           //   harga: int.parse(controllerHarga.text),
//                           //   sertifikat: controllerSertifikat.text,
//                           //   deskripsi: controllerDeskripsi.text

//                           // );
//                           // Navigator.pop(context);
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => (HalamanPostingan())));
//                         },
//                         child: const Text('Lanjut'),
//                         style: ElevatedButton.styleFrom(
//                             primary: Color(0xff141228),
//                             fixedSize: const Size(240, 44),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(50))),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ));
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

// Widget bottomSheet(BuildContext context) {
//   return Container(
//     height: 100,
//     width: MediaQuery.of(context).size.width,
//     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//     child: Column(
//       children: [
//         Text('Pilih Foto', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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
              
//             ),
//             SizedBox(width: 30,),
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
