// import 'dart:ui';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/widgets.dart';
// import 'package:sweethome/widgets/kategori_widget.dart';
// import 'package:sweethome/widgets/postingan_home_widget.dart';

// class Body extends StatefulWidget {
//   const Body({super.key});

//   @override
//   State<Body> createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   final CollectionReference _categories =
//       FirebaseFirestore.instance.collection('categories');
//   @override

//   DocumentSnapshot? doc;
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: StreamBuilder(
//           stream: _categories.limit(3).snapshots(),
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.hasError) {
//               return Text('Something is error');
//             }
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: CircularProgressIndicator(color: Color(0xff141228)),
//               );
//             }
//             return ListView.builder(
//                 itemCount: snapshot.data!.docs.length,
//                 itemBuilder: (context, index) {
//                   final DocumentSnapshot documentSnapshot =
//                       snapshot.data!.docs[index];
//       return ListView(
//         children: [ Padding(
//           padding: const EdgeInsets.only(left: 15, right: 15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 8,
//               ),
//               Text(
//                 'Semua',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
//               ),
//               Column(
//                 children: [
//                   Container(
//                       child: PostinganAwal(
//                           judul: snapshot.data!.docs[index]
//                                       .get('title'),
//                           harga: 'Rp. ' +
//                                       snapshot.data!.docs[index]
//                                           .get('price')
//                                           .toString(),
//                           type: 'Tipe Properti : ' + snapshot.data!.docs[index]
//                                             .get('tipeKategori'),
//                           gambar: Image(
//                                       fit: BoxFit.cover,
//                                 image: NetworkImage(
//                                   snapshot.data!.docs[index]
//                                       .get('fieldGambar',))),
//                           lokasi: snapshot.data!.docs[index]
//                                             .get('alamatLokasi'))),

//                 ],
//               ),
//             ],
//           ),
//         ),
//         ]);
//       });
//         }),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweethome/screen/halamanuser/detail_perumahan.dart';
import 'package:sweethome/screen/halamanuser/detail_rumah_coba.dart';
import 'package:sweethome/screen/halamanuser/detail_tanah.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  CollectionReference _categories =
      FirebaseFirestore.instance.collection('categories');
  @override
  DocumentSnapshot? doc;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _categories.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something is error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Color(0xff141228)),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    snapshot.data!.docs[index];
                return InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10),
                      child: Container(
                          width: 309,
                          height: 210,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey,
                                ),
                                child: Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          snapshot.data!.docs[index].get(
                                            'fieldGambar',
                                          ),
                                        ),
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return Center(
                                            child: CircularProgressIndicator(
                                              color: const Color(0xff142D4C),
                                              value: loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                  : null,
                                            ),
                                          );
                                        }),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 19),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        snapshot.data!.docs[index].get('title'),
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 1.6,
                                      ),
                                      Text(
                                        'Rp. ' +
                                            snapshot.data!.docs[index]
                                                .get('price'),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 1.6,
                                      ),
                                      Text(
                                        'Tipe Properti : ' +
                                            snapshot.data!.docs[index]
                                                .get('tipeKategori'),
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.grey),
                                      ),
                                      SizedBox(
                                        height: 1.6,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.place,
                                            size: 14,
                                            color: Color.fromARGB(
                                                255, 86, 111, 159),
                                          ),
                                          Container(
                                            // color: Colors.amber,
                                            width: 250,
                                            child: Text(
                                              snapshot.data!.docs[index]
                                                  .get('alamatLokasi'),
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 86, 111, 159),
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                    onTap: () {
                      if (snapshot.data!.docs[index].get('tipeKategori') ==
                          'Tanah') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => DetailTanah(
                                      docid: snapshot.data!.docs[index],
                                    ))));
                      } else if (snapshot.data!.docs[index]
                              .get('tipeKategori') ==
                          'Rumah') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DetailRumah1(
                                    docid: snapshot.data!.docs[index])));
                      } else {
                        snapshot.data!.docs[index].get('tipeKategori') ==
                            'Perumahan';
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DetailPerumahan(
                                    docid: snapshot.data!.docs[index])));
                      }
                      ;
                    });
              });
        });
  }
}
