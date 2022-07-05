// // // import 'package:flutter/material.dart';
// // // import 'package:flutter/src/widgets/framework.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';

// // // class CobaEditPostingan extends StatefulWidget {
// // //   // static const DecorationImage
// // //   const CobaEditPostingan({super.key});

// // //   @override
// // //   State<CobaEditPostingan> createState() => _CobaEditPostinganState();
// // // }

// // // class _CobaEditPostinganState extends State<CobaEditPostingan> {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final CollectionReference _tanah =
// // //         FirebaseFirestore.instance.collection('categories');
// // //     return StreamBuilder(
// // //         stream: _tanah.snapshots(),
// // //         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
// // //           if (snapshot.hasError) {
// // //             return Text('Something is error');
// // //           }
// // //           if (snapshot.connectionState == ConnectionState.waiting) {
// // //             return Center(
// // //               child: CircularProgressIndicator(color: Colors.amberAccent),
// // //             );
// // //           }
// // //           return ListView.builder(
// // //               itemCount: snapshot.data!.docs.length,
// // //               itemBuilder: (context, index) {
// // //                 final DocumentSnapshot documentSnapshot =
// // //                     snapshot.data!.docs[index];
// // //                 return InkWell(
// // //                   child: Container(
// // //                     width: MediaQuery.of(context).size.width,
// // //                     height: 119,
// // //                     decoration: BoxDecoration(
// // //                         color: Colors.white,
// // //                         borderRadius: BorderRadius.circular(20),
// // //                         boxShadow: [
// // //                           BoxShadow(
// // //                             color: Colors.grey.withOpacity(0.5),
// // //                             spreadRadius: 1,
// // //                             blurRadius: 7,
// // //                             offset: Offset(0, 3),
// // //                           )
// // //                         ]),
// // //                     child: Row(
// // //                       mainAxisAlignment: MainAxisAlignment.start,
// // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // //                       children: [
// // //                         Center(
// // //                           child: Padding(
// // //                             padding: const EdgeInsets.all(16.0),
// // //                             child: Container(
// // //                               width: 102,
// // //                               height: 85,
// // //                               decoration: BoxDecoration(
// // //                                 borderRadius: BorderRadius.circular(20),
// // //                                 color: Colors.grey,
// // //                               ),
// // //                               child: Container(
// // //                                 child: ClipRRect(
// // //                                   borderRadius: BorderRadius.circular(20),
// // //                                   child: Container(),
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                           ),
// // //                         ),
// // //                         Container(
// // //                           width: MediaQuery.of(context).size.width * 0.43,
// // //                           child: Column(
// // //                             crossAxisAlignment: CrossAxisAlignment.start,
// // //                             mainAxisAlignment: MainAxisAlignment.center,
// // //                             children: [
// // //                               // SizedBox(
// // //                               //   height: 19,
// // //                               // ),
// // //                               Text(
// // //                                 snapshot.data!.docs[index]
// // //                                         .get('tanah')['title'],
// // //                                 style: TextStyle(
// // //                                     fontSize: 16, fontWeight: FontWeight.bold),
// // //                               ),
// // //                               SizedBox(
// // //                                 height: 2,
// // //                               ),
// // //                               Text(
// // //                                 snapshot.data!.docs[index]
// // //                                         .get('tanah')['price'].toString(),
// // //                                 style: TextStyle(
// // //                                     fontSize: 18, fontWeight: FontWeight.bold),
// // //                               ),
// // //                               SizedBox(
// // //                                 height: 2,
// // //                               ),
// // //                               Text(
// // //                                 snapshot.data!.docs[index]
// // //                                         .get('tanah')['typeProperty'],
// // //                                 style:
// // //                                     TextStyle(fontSize: 14, color: Colors.grey),
// // //                               ),
// // //                               SizedBox(
// // //                                 height: 2,
// // //                               ),
// // //                               Row(
// // //                                 children: [
// // //                                   Icon(
// // //                                     Icons.place,
// // //                                     size: 14,
// // //                                     color: Color.fromARGB(255, 86, 111, 159),
// // //                                   ),
// // //                                   Text(
// // //                                     snapshot.data!.docs[index]
// // //                                         .get('tanah')['city'],
// // //                                     style: TextStyle(
// // //                                         color:
// // //                                             Color.fromARGB(255, 86, 111, 159),
// // //                                         fontSize: 16),
// // //                                   ),
// // //                                 ],
// // //                               )
// // //                             ],
// // //                           ),
// // //                         ),
// // //                         Padding(
// // //                           padding: const EdgeInsets.only(left: 0),
// // //                           child: Column(
// // //                               mainAxisAlignment: MainAxisAlignment.center,
// // //                               children: [
// // //                                 InkWell(
// // //                                   child: Icon(
// // //                                     Icons.delete_outline,
// // //                                     color: Color(0xff566F9F),
// // //                                   ),
// // //                                 ),
// // //                                 SizedBox(
// // //                                   height: 10,
// // //                                 ),
// // //                                 InkWell(
// // //                                   child: Icon(
// // //                                     Icons.mode_edit_outline,
// // //                                     color: Color(0xff566F9F),
// // //                                   ),
// // //                                 ),
// // //                               ]),
// // //                         )
// // //                       ],
// // //                     ),
// // //                     // ),
// // //                   ),
// // //                 );
// // //               });
// // //         });
// // //   }
// // // }

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/src/widgets/framework.dart';
// // import 'package:sweethome/percobaan/coba_Halaman_edit.dart';
// // import 'package:sweethome/percobaan/coba_iklan_tanah.dart';
// // import 'package:sweethome/screen/halamanuser/iklan-tanah.dart';

// // class Edit extends StatefulWidget {
// //   const Edit({super.key});

// //   @override
// //   State<Edit> createState() => _EditState();
// // }

// // class _EditState extends State<Edit> {
// //   final controllerJudul = TextEditingController();
// //   final controllerLuasTanah = TextEditingController();
// //   final controllerAlamatLokasi = TextEditingController();
// //   final controllerHarga = TextEditingController();
// //   final controllerSertifikat = TextEditingController();
// //   final controllerDeskripsi = TextEditingController();

// //   Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
// //     if (documentSnapshot != null) {
// //       controllerJudul.text = documentSnapshot['title'];
// //       controllerHarga.text = documentSnapshot['price'].toString();
// //       controllerLuasTanah.text = documentSnapshot['luasTanah'].toString();
// //       controllerAlamatLokasi.text = documentSnapshot['alamatLokasi'];
// //       controllerSertifikat.text = documentSnapshot['sertifikat'];
// //       controllerDeskripsi.text = documentSnapshot['deskripsi'];
// //     }

// //     await showBottomSheet(
// //         context: context,
// //         builder: (BuildContext context) {
// //           return Padding(
// //             padding: EdgeInsets.only(
// //                 top: 20,
// //                 left: 20,
// //                 right: 20,
// //                 bottom: MediaQuery.of(context).viewInsets.bottom + 20),
// //             child: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 TextField(
// //                   controller: controllerJudul,
// //                   decoration: InputDecoration(labelText: 'Judul'),
// //                 ),
// //                 TextField(
// //                   controller: controllerHarga,
// //                   decoration: InputDecoration(labelText: 'Harga'),
// //                 ),
// //                 TextField(
// //                   controller: controllerLuasTanah,
// //                   decoration: InputDecoration(labelText: 'Luas Tanah'),
// //                 ),
// //                 TextField(
// //                   controller: controllerAlamatLokasi,
// //                   decoration: InputDecoration(labelText: 'Alamat Lokasi'),
// //                 ),
// //                 TextField(
// //                   controller: controllerSertifikat,
// //                   decoration: InputDecoration(labelText: 'Sertifikat'),
// //                 ),
// //                 TextField(
// //                   controller: controllerDeskripsi,
// //                   decoration: InputDecoration(labelText: 'Deskripsi'),
// //                 ),
// //                 SizedBox(
// //                   height: 20,
// //                 ),
// //                 ElevatedButton(
// //                     onPressed: () async {
// //                       final String title = controllerJudul.text;
// //                       final double? price =
// //                           double.tryParse(controllerHarga.text);
// //                       final double? luasTanah =
// //                           double.tryParse(controllerLuasTanah.text);
// //                       final String sertifikat = controllerSertifikat.text;
// //                       final String alamatLokasi = controllerAlamatLokasi.text;
// //                       final String deskripsi = controllerDeskripsi.text;

// //                       if (price != null) {
// //                         await _categories.doc(documentSnapshot!.id).update({
// //                           "title": title,
// //                           "price": price,
// //                           "luasTanah": luasTanah,
// //                           "sertifikat": sertifikat,
// //                           "alamatLokasi": alamatLokasi,
// //                           "deskripsi": deskripsi
// //                         });

// //                         controllerJudul.text = '';
// //                         controllerLuasTanah.text = '';
// //                         controllerAlamatLokasi.text = '';
// //                         controllerHarga.text = '';
// //                         controllerSertifikat.text = '';
// //                         controllerDeskripsi.text = '';
// //                       }
// //                     },
// //                     child: Text('Update'))
// //               ],
// //             ),
// //           );
// //         });
// //   }

// //   Future<void> showAja([DocumentSnapshot? documentSnapshot]) async {
// //     if (documentSnapshot != null) {
// //        controllerJudul.text = documentSnapshot['title'];
// //        controllerLuasTanah.text = documentSnapshot['luasTanah'].toString();
// //        controllerAlamatLokasi.text = documentSnapshot['alamatLokasi'];
// //        controllerHarga.text = documentSnapshot['price'].toString();
// //        controllerSertifikat.text = documentSnapshot['sertifikat'];
// //        controllerDeskripsi.text = documentSnapshot['deskripsi'];
// //     }
// //   }

// //   Future<void> delete(String docid) async {
// //     await _categories.doc(docid).delete();

// //     ScaffoldMessenger.of(context)
// //         .showSnackBar(SnackBar(content: Text('Postingan telah dihapus...')));
// //   }

// //   final CollectionReference _categories =
// //       FirebaseFirestore.instance.collection('categories');
// //   @override
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Edit data'),
// //         actions: [
// //           IconButton(
// //               onPressed: () => {
// //                     Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                             builder: (context) => (CobaTambahIklanTanah())))
// //                   },
// //               icon: Icon(Icons.add))
// //         ],
// //       ),
// //       body: StreamBuilder(
// //           stream: _categories.snapshots(),
// //           builder:
// //               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
// //             if (snapshot.hasError) {
// //               return Text('Something is error');
// //             }
// //             if (snapshot.connectionState == ConnectionState.waiting) {
// //               return Center(
// //                 child: CircularProgressIndicator(color: Colors.amberAccent),
// //               );
// //             }
// //             return ListView.builder(
// //                 itemCount: snapshot.data!.docs.length,
// //                 itemBuilder: (context, index) {
// //                   final DocumentSnapshot documentSnapshot =
// //                       snapshot.data!.docs[index];
// //                   return InkWell(
// //                     child: Container(
// //                       margin: EdgeInsets.only(left: 20, right: 20, top: 20),
// //                       width: MediaQuery.of(context).size.width,
// //                       height: 119,
// //                       decoration: BoxDecoration(
// //                           color: Colors.white,
// //                           borderRadius: BorderRadius.circular(20),
// //                           boxShadow: [
// //                             BoxShadow(
// //                               color: Colors.grey.withOpacity(0.5),
// //                               spreadRadius: 1,
// //                               blurRadius: 7,
// //                               offset: Offset(0, 3),
// //                             )
// //                           ]),
// //                       child: Row(
// //                         mainAxisAlignment: MainAxisAlignment.start,
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Center(
// //                             child: Padding(
// //                               padding: const EdgeInsets.all(16.0),
// //                               child: Container(
// //                                 width: 102,
// //                                 height: 85,
// //                                 decoration: BoxDecoration(
// //                                   borderRadius: BorderRadius.circular(20),
// //                                   color: Colors.grey,
// //                                 ),
// //                                 child: Container(
// //                                   child: ClipRRect(
// //                                     borderRadius: BorderRadius.circular(20),
// //                                     child: Container(),
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                           Container(
// //                             width: MediaQuery.of(context).size.width * 0.43,
// //                             child: Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               mainAxisAlignment: MainAxisAlignment.center,
// //                               children: [
// //                                 // SizedBox(
// //                                 //   height: 19,
// //                                 // ),
// //                                 Text(
// //                                   snapshot.data!.docs[index]
// //                                       .get('tanah')['title'],
// //                                   style: TextStyle(
// //                                       fontSize: 14,
// //                                       fontWeight: FontWeight.bold),
// //                                 ),
// //                                 SizedBox(
// //                                   height: 2,
// //                                 ),
// //                                 Text(
// //                                   'Rp. ' +
// //                                       snapshot.data!.docs[index]
// //                                           .get('tanah')['price']
// //                                           .toString(),
// //                                   style: TextStyle(
// //                                       fontSize: 16,
// //                                       fontWeight: FontWeight.bold),
// //                                 ),
// //                                 SizedBox(
// //                                   height: 2,
// //                                 ),
// //                                 Text(
// //                                   'Tipe Properti : Tanah',
// //                                   // +
// //                                   //     snapshot.data!.docs[index]
// //                                   //         .get('perumahan')['typeProperty'],
// //                                   style: TextStyle(
// //                                       fontSize: 14, color: Colors.grey),
// //                                 ),
// //                                 SizedBox(
// //                                   height: 2,
// //                                 ),
// //                                 Row(
// //                                   children: [
// //                                     Icon(
// //                                       Icons.place,
// //                                       size: 14,
// //                                       color: Color.fromARGB(255, 86, 111, 159),
// //                                     ),
// //                                     Container(
// //                                       width: 140,
// //                                       child: Text(
// //                                         snapshot.data!.docs[index]
// //                                             .get('tanah')['alamatLokasi'],
// //                                         overflow: TextOverflow.ellipsis,
// //                                         style: TextStyle(
// //                                             color: Color.fromARGB(
// //                                                 255, 86, 111, 159),
// //                                             fontSize: 16),
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 )
// //                               ],
// //                             ),
// //                           ),
// //                           Padding(
// //                             padding: const EdgeInsets.only(left: 0),
// //                             child: Column(
// //                                 mainAxisAlignment: MainAxisAlignment.center,
// //                                 children: [
// //                                   InkWell(
// //                                     child: Container(
// //                                       child: Icon(
// //                                         Icons.delete_outline,
// //                                         color: Color(0xff566F9F),
// //                                       ),
// //                                     ),
// //                                     onTap: () => delete(documentSnapshot.id),
// //                                   ),
// //                                   SizedBox(
// //                                     height: 10,
// //                                   ),
// //                                   InkWell(
// //                                       child: Container(
// //                                         child: Icon(
// //                                           Icons.adb,
// //                                           color: Color(0xff566F9F),
// //                                         ),
// //                                       ),
// //                                       onTap: ()  
// //                                       // => showAja(documentSnapshot)
// //                                       // async {
// //                                       //   final docUser = FirebaseFirestore
// //                                       //       .instance
// //                                       //       .collection('categories')
// //                                       //       .doc();

// //                                       //   Map<String, dynamic> data =
// //                                       //       <String, dynamic>{
// //                                       //     "title": controllerJudul,
// //                                       //     "description": controllerDeskripsi,

// //                                           // final docUser = FirebaseFirestore.instance.collection('categories').doc();

// //                                           // docUser.update({
// //                                           //   'title': 'TANAH DAERAH BOJONGSOANG'
// //                                           // });
                                  
// //                                       //   await docUser
// //                                       //       .update(data)
// //                                       //       .whenComplete(() => print(
// //                                       //           "Note item updated in the database"))
// //                                       //       .catchError((e) => print(e));
                                       
// //                                         // {
// //                                         //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => (CobaEditHalaman(docid: snapshot.data!.docs[index]))));
// //                                         // },
// //                                          {
// //                                           Navigator.of(context).push(MaterialPageRoute(builder: (context) => (CobaEditHalaman(docid: snapshot.data!.docs[index]))));
// //                                         },
// //                                       //  };
// //                                         ),
// //                                 ]),
// //                           )
// //                         ],
// //                       ),
// //                       // ),
// //                     ),
// //                   );
// //                 });
// //           }),
// //     );
// //   }
// // }


// // // import 'package:flutter/material.dart';
// // // import 'package:flutter/src/widgets/framework.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';

// // // class CobaEditPostingan extends StatefulWidget {
// // //   const CobaEditPostingan({super.key});

// // //   @override
// // //   State<CobaEditPostingan> createState() => _CobaEditPostinganState();
// // // }

// // // class _CobaEditPostinganState extends State<CobaEditPostingan> {
// // //   final CollectionReference _tanah =
// // //       FirebaseFirestore.instance.collection('categories');
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Menampilkan data'),
// // //       ),
// // //       body: StreamBuilder(
// // //           stream: _tanah.snapshots(),
// // //           builder:
// // //               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
// // //             if (snapshot.hasError) {
// // //               return Text('Something is error');
// // //             }
// // //             if (snapshot.connectionState == ConnectionState.waiting) {
// // //               return Center(
// // //                 child: CircularProgressIndicator(color: Colors.amberAccent),
// // //               );
// // //             }
// // //             return ListView.builder(
// // //                 itemCount: snapshot.data!.docs.length,
// // //                 itemBuilder: (context, index) {
// // //                   final DocumentSnapshot documentSnapshot =
// // //                       snapshot.data!.docs[index];
// // //                   // return Container(
// // //                   //               child: Text(
// // //                   //                 snapshot.data!.docs[index]
// // //                   //                     .get('tanah')['title'],
// // //                   //                 style: const TextStyle(
// // //                   //                   fontSize: 17,
// // //                   //                   fontWeight: FontWeight.bold,
// // //                   //                 ),
// // //                   //               ),
// // //                   //             );
// // //                   return Center(
// // //                     child: InkWell(
// // //                         child: Padding(
// // //                       padding: const EdgeInsets.all(10.0),
// // //                       child: Container(
// // //                           width: 309,
// // //                           height: 198,
// // //                           decoration: BoxDecoration(
// // //                               color: Colors.white,
// // //                               borderRadius: BorderRadius.circular(20),
// // //                               boxShadow: [
// // //                                 BoxShadow(
// // //                                   color: Colors.grey.withOpacity(0.5),
// // //                                   spreadRadius: 1,
// // //                                   blurRadius: 7,
// // //                                   offset: Offset(0, 3),
// // //                                 )
// // //                               ]),
// // //                           child: Column(
// // //                             mainAxisAlignment: MainAxisAlignment.start,
// // //                             crossAxisAlignment: CrossAxisAlignment.start,
// // //                             children: [
// // //                               Container(
// // //                                 width: 309,
// // //                                 height: 102,
// // //                                 decoration: BoxDecoration(
// // //                                   borderRadius: BorderRadius.circular(20),
// // //                                   color: Colors.grey,
// // //                                 ),
// // //                                 child: Container(
// // //                                   color: Colors.amber,
// // //                                   child: ClipRRect(
// // //                                     borderRadius: BorderRadius.circular(20),
// // //                                     child: Container(),
// // //                                   ),
// // //                                 ),
// // //                               ),
// // //                               Container(
// // //                                 child: Padding(
// // //                                   padding: const EdgeInsets.only(left: 19),
// // //                                   child: Column(
// // //                                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                                     children: [
// // //                                       SizedBox(
// // //                                         height: 12,
// // //                                       ),
// // //                                       Text(
// // //                                         snapshot.data!.docs[index]
// // //                                         .get('tanah')['title'],
// // //                                         style: TextStyle(
// // //                                             fontSize: 16,
// // //                                             fontWeight: FontWeight.bold),
// // //                                       ),
// // //                                       SizedBox(
// // //                                         height: 1.6,
// // //                                       ),
// // //                                       Text(
// // //                                         snapshot.data!.docs[index]
// // //                                         .get('tanah')['price'].toString(),
// // //                                         style: TextStyle(
// // //                                             fontSize: 18,
// // //                                             fontWeight: FontWeight.bold),
// // //                                       ),
// // //                                       SizedBox(
// // //                                         height: 1.6,
// // //                                       ),
// // //                                       Text(
// // //                                         snapshot.data!.docs[index]
// // //                                         .get('tanah')['typeProperty'],
// // //                                         style: TextStyle(
// // //                                             fontSize: 15, color: Colors.grey),
// // //                                       ),
// // //                                       SizedBox(
// // //                                         height: 1.6,
// // //                                       ),
// // //                                       Row(
// // //                                         children: [
// // //                                           Icon(
// // //                                             Icons.place,
// // //                                             size: 14,
// // //                                             color:
// // //                                                 Color.fromARGB(255, 86, 111, 159),
// // //                                           ),
// // //                                           Text(
// // //                                             snapshot.data!.docs[index]
// // //                                         .get('tanah')['city'],
// // //                                             style: TextStyle(
// // //                                                 color: Color.fromARGB(
// // //                                                     255, 86, 111, 159),
// // //                                                 fontSize: 16),
// // //                                           ),
// // //                                         ],
// // //                                       )
// // //                                     ],
// // //                                   ),
// // //                                 ),
// // //                               )
// // //                             ],
// // //                           )),
// // //                     )),
// // //                   );
// // //                 });
// // //           }),
// // //     );
// // //   }
// // // }


// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:sweethome/models/note.dart';
// import 'package:sweethome/percobaan/coba_edit_postingan.dart';
// import 'package:sweethome/percobaan/coba_menampilkakn_postingan.dart';
// import 'package:sweethome/percobaan/halaman_lanjutan.dart';
// import 'package:sweethome/screen/halamanuser/halaman_postingan.dart';
// import 'package:sweethome/screen/halamanuser/tokomu.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:sweethome/widgets/bottom_sheet_widget.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:sweethome/widgets/filebari.dart';

// class EditDulu extends StatefulWidget {
//   NoteModel noteModel;
//   EditDulu({required this.noteModel});

//   @override
//   State<EditDulu> createState() => _EditDuluState();
// }

// class _EditDuluState extends State<EditDulu> {
//     TextEditingController controllerJudul = TextEditingController();
//     TextEditingController controllerLuasTanah = TextEditingController();
//     TextEditingController controllerAlamatLokasi = TextEditingController();
//     TextEditingController controllerHarga = TextEditingController();
//     TextEditingController controllerSertifikat = TextEditingController();
//     TextEditingController controllerDeskripsi = TextEditingController();

//   final items = ['SHM', 'AJB'];

//   String? value;
//   XFile? image;

//     @override
//   // void initState() {
//   //    controllerJudul.text = widget.noteModel.title;
//   //    controllerHarga.text = widget.noteModel.harga;
//   //    controllerLuasTanah.text = widget.noteModel.tipeProperti;
//   //    controllerAlamatLokasi.text = widget.noteModel.kota;
//   //    controllerDeskripsi.text = widget.noteModel.;
//   //    controllerSertifikat.text = ;
//   //   super.initState();
//   // }

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
//                         image != null
//                             ? Container(
//                                 width: 120,
//                                 height: 120,
//                                 child: Image.file(
//                                   File(image!.path),
//                                   width: 120,
//                                   height: 120,
//                                   fit: BoxFit.cover,
//                                 ))
//                             : Text("Tidak Ada Image"),
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
//                       height: 60,
//                     ),
//                     Center(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           users.add({
//                             'tanah': {
//                               'title': controllerJudul.text,
//                               'price': int.parse(controllerHarga.text),
//                               'luasTanah': int.parse(controllerLuasTanah.text),
//                               'alamatLokasi': controllerAlamatLokasi.text,
//                               'sertifikat': controllerSertifikat.text,
//                               'deskripsi': controllerDeskripsi.text,
//                               // 'sertifikat': value,
//                             },
//                             // 'harga': int.parse(controllerHarga.text),
//                             // 'luasTanah': int.parse(controllerLuasTanah.text),
//                             // 'alamatLokasi': controllerAlamatLokasi.text,
//                             // 'sertifikat': controllerSertifikat.text,
//                             // 'deskripsi': controllerDeskripsi.text,
//                             // 'sertifikat': value,
//                           });
//                           // var tanah = {
//                           //   users.add({
//                           //     'judul': controllerJudul.text,
//                           //     'harga': int.parse(controllerHarga.text),
//                           //     'luasTanah': int.parse(controllerLuasTanah.text),
//                           //     'alamatLokasi': controllerAlamatLokasi.text,
//                           //     'sertifikat': controllerSertifikat.text,
//                           //     'deskripsi': controllerDeskripsi.text,
//                           //     'sertifikat': value,
//                           //   })
//                           // };

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
//                                   builder: (context) => (CobaEditPostingan())));
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
//   // XFile? image;
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     return TextEditingValue(
//       text: newValue.text.toUpperCase(),
//       selection: newValue.selection,
//     );
//   }
// }

// class BottomSheet extends StatefulWidget {
//   const BottomSheet({super.key});

//   @override
//   State<BottomSheet> createState() => _BottomSheetState();
// }

// class _BottomSheetState extends State<BottomSheet> {
//   XFile? image;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
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
//                 onTap: () async {
//                   image =
//                       await PickImage().pickImage(source: ImageSource.gallery);
//                   setState(() {});
//                 },
//               ),
//               SizedBox(
//                 width: 30,
//               ),
//               InkWell(
//                 child: Container(
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
//           )
//         ],
//       ),
//     );
//   }
// }

// // Widget bottomSheet(BuildContext context) {
// //   return Container(
// //     height: 100,
// //     width: MediaQuery.of(context).size.width,
// //     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
// //     child: Column(
// //       children: [
// //         Text(
// //           'Pilih Foto',
// //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //         ),
// //         SizedBox(
// //           height: 20,
// //         ),
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             InkWell(
// //               child: Container(
// //                 child: Column(
// //                   children: [
// //                     Icon(
// //                       Icons.image,
// //                       size: 40,
// //                     ),
// //                     Text('Galery')
// //                   ],
// //                 ),
// //               ),
// //               onTap: () {},
// //             ),
// //             SizedBox(
// //               width: 30,
// //             ),
// //             InkWell(
// //               child: Container(
// //                 child: Column(
// //                   children: [
// //                     Icon(
// //                       Icons.camera,
// //                       size: 40,
// //                     ),
// //                     Text('Camera')
// //                   ],
// //                 ),
// //               ),
// //             )
// //           ],
// //         )
// //       ],
// //     ),
// //   );
// // }

// // class ImagePicker extends StatefulWidget {
// //   const ImagePicker({super.key});

// //   @override
// //   State<ImagePicker> createState() => _ImagePickerState();
// // }

// // class _ImagePickerState extends State<ImagePicker> {
// //   XFile? image;
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(
// //         child: Container(
// //           color: Colors.teal,
// //       height: 100,
// //       width: MediaQuery.of(context).size.width,
// //       margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
// //       child: Column(
// //         children: [
// //           Text(
// //             'Pilih Foto',
// //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //           ),
// //           SizedBox(
// //             height: 20,
// //           ),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               InkWell(
// //                 child: Container(
// //                   child: Column(
// //                     children: [
// //                       Icon(
// //                         Icons.image,
// //                         size: 40,
// //                       ),
// //                       Text('Galery')
// //                     ],
// //                   ),
// //                 ),
//               //   onTap: () async {
//               //     image =
//               //         await PickImage().pickImage(source: ImageSource.gallery);
//               //     setState(() {});
//               //   },
//               // ),
// //               SizedBox(
// //                 width: 30,
// //               ),
// //               InkWell(
// //                 child: Container(
// //                   color: Colors.indigo,
// //                   child: Column(
// //                     children: [
// //                       Icon(
// //                         Icons.camera,
// //                         size: 40,
// //                       ),
// //                       Text('Camera')
// //                     ],
// //                   ),
// //                 ),
// //                 onTap: () async {
// //                   image =
// //                       await PickImage().pickImage(source: ImageSource.camera);
// //                   setState(() {});
// //                 },
// //               )
// //             ],
// //           ),
//           // ElevatedButton(
//           //     onPressed: () async {
//           //       image = await PickImage()
//           //           .pickImage(source: ImageSource.gallery);
//           //       setState(() {});
//           //     },
//           //     child: Container()),
//           // ElevatedButton(
//           //     onPressed: () async {
//           //       image =
//           //           await PickImage().pickImage(source: ImageSource.camera);
//           //       setState(() {});
//           //     },
//           //     child: Container()),
//           // SizedBox(
//           //   height: 200,
//           // ),
//           // image != null
//           //     ? Container(
//           //         width: 200,
//           //         height: 200,
//           //         child: Image.file(
//           //           File(image!.path),
//           //           width: 200,
//           //           height: 200,
//           //         ))
//           //     : Text("Tidak Ada Image")
//     //     ],
//     //   ),
//     // )
//         // ),
//         // ),
// //         );
// //   }
// // }
