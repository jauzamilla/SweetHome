// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class CobaEditPostingan extends StatefulWidget {
//   // static const DecorationImage
//   const CobaEditPostingan({super.key});

//   @override
//   State<CobaEditPostingan> createState() => _CobaEditPostinganState();
// }

// class _CobaEditPostinganState extends State<CobaEditPostingan> {
//   @override
//   Widget build(BuildContext context) {
//     final CollectionReference _tanah =
//         FirebaseFirestore.instance.collection('categories');
//     return StreamBuilder(
//         stream: _tanah.snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text('Something is error');
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(color: Colors.amberAccent),
//             );
//           }
//           return ListView.builder(
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (context, index) {
//                 final DocumentSnapshot documentSnapshot =
//                     snapshot.data!.docs[index];
//                 return InkWell(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 119,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 1,
//                             blurRadius: 7,
//                             offset: Offset(0, 3),
//                           )
//                         ]),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Center(
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Container(
//                               width: 102,
//                               height: 85,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.grey,
//                               ),
//                               child: Container(
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(20),
//                                   child: Container(),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           width: MediaQuery.of(context).size.width * 0.43,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               // SizedBox(
//                               //   height: 19,
//                               // ),
//                               Text(
//                                 snapshot.data!.docs[index]
//                                         .get('tanah')['title'],
//                                 style: TextStyle(
//                                     fontSize: 16, fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(
//                                 height: 2,
//                               ),
//                               Text(
//                                 snapshot.data!.docs[index]
//                                         .get('tanah')['price'].toString(),
//                                 style: TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(
//                                 height: 2,
//                               ),
//                               Text(
//                                 snapshot.data!.docs[index]
//                                         .get('tanah')['typeProperty'],
//                                 style:
//                                     TextStyle(fontSize: 14, color: Colors.grey),
//                               ),
//                               SizedBox(
//                                 height: 2,
//                               ),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.place,
//                                     size: 14,
//                                     color: Color.fromARGB(255, 86, 111, 159),
//                                   ),
//                                   Text(
//                                     snapshot.data!.docs[index]
//                                         .get('tanah')['city'],
//                                     style: TextStyle(
//                                         color:
//                                             Color.fromARGB(255, 86, 111, 159),
//                                         fontSize: 16),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 0),
//                           child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 InkWell(
//                                   child: Icon(
//                                     Icons.delete_outline,
//                                     color: Color(0xff566F9F),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 InkWell(
//                                   child: Icon(
//                                     Icons.mode_edit_outline,
//                                     color: Color(0xff566F9F),
//                                   ),
//                                 ),
//                               ]),
//                         )
//                       ],
//                     ),
//                     // ),
//                   ),
//                 );
//               });
//         });
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweethome/percobaan/coba_Halaman_edit.dart';
import 'package:sweethome/percobaan/coba_iklan_tanah.dart';
import 'package:sweethome/percobaan/coba_menampilkakn_postingan.dart';
import 'package:sweethome/percobaan/edit.dart';
import 'package:sweethome/screen/halamanuser/iklan-tanah.dart';

class CobaEditPostingan extends StatefulWidget {
  DocumentSnapshot docid;
  // editnote({required this.docid});
  CobaEditPostingan({required this.docid});

  @override
  State<CobaEditPostingan> createState() => _CobaEditPostinganState();
}

class _CobaEditPostinganState extends State<CobaEditPostingan> {
  TextEditingController controllerJudul = TextEditingController();
  TextEditingController controllerLuasTanah = TextEditingController();
  TextEditingController controllerAlamatLokasi = TextEditingController();
  TextEditingController controllerHarga = TextEditingController();
  TextEditingController controllerSertifikat = TextEditingController();
  TextEditingController controllerDeskripsi = TextEditingController();

  // Future<void> update([DocumentSnapshot? documentSnapshot]) async {
  //   if (documentSnapshot != null) {
  //      controllerJudul.text = documentSnapshot['title'];
  //      controllerLuasTanah.text = documentSnapshot['luasTanah'].toString();
  //      controllerAlamatLokasi.text = documentSnapshot['alamatLokasi'];
  //      controllerHarga.text = documentSnapshot['price'].toString();
  //      controllerSertifikat.text = documentSnapshot['sertifikat'];
  //      controllerDeskripsi.text = documentSnapshot['deskripsi'];
  //   }
  // }

  @override
  void initState() {
    controllerJudul = TextEditingController(text: widget.docid.get('title'));
    controllerHarga =
        TextEditingController(text: widget.docid.get('price').toString());
    controllerAlamatLokasi =
        TextEditingController(text: widget.docid.get('alamatLokasi'));
    controllerLuasTanah =
        TextEditingController(text: widget.docid.get('luasTanah').toString());
    controllerHarga =
        TextEditingController(text: widget.docid.get('price').toString());
    controllerSertifikat =
        TextEditingController(text: widget.docid.get('sertifikat'));
    controllerDeskripsi =
        TextEditingController(text: widget.docid.get('deskripsi'));
    // controllerSertifikat.text = TextEditingController(text: widget.docid.get('sertifikat'));
    // controllerDeskripsi.text = TextEditingController(text: widget.docid.get('deskripsi'));
    super.initState();
  }

  Future<void> delete(String docid) async {
    await _categories.doc(docid).delete();

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Postingan telah dihapus...')));
  }

  final CollectionReference _categories =
      FirebaseFirestore.instance.collection('categories');
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff141228),
        title: Text('Postingan'),
        actions: [
          IconButton(
              onPressed: () => {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => (TambahPostingan())))
                  },
              icon: Icon(Icons.add))
        ],
      ),
      body: StreamBuilder(
          stream: _categories.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something is error');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: Colors.amberAccent),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      snapshot.data!.docs[index];
                  return InkWell(
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 119,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                width: 102,
                                height: 85,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey,
                                ),
                                child: Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.43,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SizedBox(
                                //   height: 19,
                                // ),
                                Text(
                                  snapshot.data!.docs[index]
                                      .get('tanah')['title'],
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  'Rp. ' +
                                      snapshot.data!.docs[index]
                                          .get('tanah')['price']
                                          .toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  'Tipe Properti : Tanah',
                                  // +
                                  //     snapshot.data!.docs[index]
                                  //         .get('perumahan')['typeProperty'],
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.place,
                                      size: 14,
                                      color: Color.fromARGB(255, 86, 111, 159),
                                    ),
                                    Container(
                                      width: 140,
                                      child: Text(
                                        snapshot.data!.docs[index]
                                            .get('tanah')['alamatLokasi'],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 86, 111, 159),
                                            fontSize: 16),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    child: Container(
                                      child: Icon(
                                        Icons.delete_outline,
                                        color: Color(0xff566F9F),
                                      ),
                                    ),
                                    onTap: () => delete(documentSnapshot.id),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    child: Container(
                                      // color: Colors.amber,
                                      child: Icon(
                                        Icons.mode_edit_outline,
                                        color: Color(0xff566F9F),
                                      ),
                                    ),
                                    onTap: () {
                                      widget.docid.reference.update({
                                        'title': controllerJudul.text,
                                        'price':int.parse(controllerHarga.text),
                                        'alamatLokasi':controllerAlamatLokasi.text,
                                        // 'price': price.text,
                                        'luasTanah': int.parse(controllerLuasTanah.text),
                                        'sertifikat': controllerSertifikat.text,
                                        'deskripsi': controllerDeskripsi.text
                                            
                                            
                                      }).whenComplete(() {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => Menampilkan()));
                                      });

                                      // final docUser = FirebaseFirestore.instance.collection('categories').doc('nUMjVamMTd45JxZ8esiy');

                                      // docUser.update({

                                      //   'tanah.title' : 'TANAH DAERAH PANGAUBAN'

                                      // // });
                                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => (EditDulu())));
                                    },
                                  ),
                                ]),
                          )
                        ],
                      ),
                      // ),
                    ),
                  );
                });
          }),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class CobaEditPostingan extends StatefulWidget {
//   const CobaEditPostingan({super.key});

//   @override
//   State<CobaEditPostingan> createState() => _CobaEditPostinganState();
// }

// class _CobaEditPostinganState extends State<CobaEditPostingan> {
//   final CollectionReference _tanah =
//       FirebaseFirestore.instance.collection('categories');
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Menampilkan data'),
//       ),
//       body: StreamBuilder(
//           stream: _tanah.snapshots(),
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.hasError) {
//               return Text('Something is error');
//             }
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: CircularProgressIndicator(color: Colors.amberAccent),
//               );
//             }
//             return ListView.builder(
//                 itemCount: snapshot.data!.docs.length,
//                 itemBuilder: (context, index) {
//                   final DocumentSnapshot documentSnapshot =
//                       snapshot.data!.docs[index];
//                   // return Container(
//                   //               child: Text(
//                   //                 snapshot.data!.docs[index]
//                   //                     .get('tanah')['title'],
//                   //                 style: const TextStyle(
//                   //                   fontSize: 17,
//                   //                   fontWeight: FontWeight.bold,
//                   //                 ),
//                   //               ),
//                   //             );
//                   return Center(
//                     child: InkWell(
//                         child: Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Container(
//                           width: 309,
//                           height: 198,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.withOpacity(0.5),
//                                   spreadRadius: 1,
//                                   blurRadius: 7,
//                                   offset: Offset(0, 3),
//                                 )
//                               ]),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 width: 309,
//                                 height: 102,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: Colors.grey,
//                                 ),
//                                 child: Container(
//                                   color: Colors.amber,
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(20),
//                                     child: Container(),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 19),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       SizedBox(
//                                         height: 12,
//                                       ),
//                                       Text(
//                                         snapshot.data!.docs[index]
//                                         .get('tanah')['title'],
//                                         style: TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       SizedBox(
//                                         height: 1.6,
//                                       ),
//                                       Text(
//                                         snapshot.data!.docs[index]
//                                         .get('tanah')['price'].toString(),
//                                         style: TextStyle(
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       SizedBox(
//                                         height: 1.6,
//                                       ),
//                                       Text(
//                                         snapshot.data!.docs[index]
//                                         .get('tanah')['typeProperty'],
//                                         style: TextStyle(
//                                             fontSize: 15, color: Colors.grey),
//                                       ),
//                                       SizedBox(
//                                         height: 1.6,
//                                       ),
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons.place,
//                                             size: 14,
//                                             color:
//                                                 Color.fromARGB(255, 86, 111, 159),
//                                           ),
//                                           Text(
//                                             snapshot.data!.docs[index]
//                                         .get('tanah')['city'],
//                                             style: TextStyle(
//                                                 color: Color.fromARGB(
//                                                     255, 86, 111, 159),
//                                                 fontSize: 16),
//                                           ),
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             ],
//                           )),
//                     )),
//                   );
//                 });
//           }),
//     );
//   }
// }
