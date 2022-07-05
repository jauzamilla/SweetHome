// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:sweethome/models/note.dart';

// class Menampilkan extends StatefulWidget {
//   const Menampilkan({super.key});

//   @override
//   State<Menampilkan> createState() => _MenampilkanState();
// }

// class _MenampilkanState extends State<Menampilkan> {
//   @override
//   Widget build(BuildContext context) {
//       FirebaseFirestore firestore = FirebaseFirestore.instance;
//       CollectionReference users = firestore.collection('tanah');
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Menampilkan data'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('tanah').snapshots(),
//         builder: (context,AsyncSnapshot snapshot){
//           if(snapshot.hasData){
//             if(snapshot.data.docs.length > 0){
//               return ListView.builder(
//                 itemCount: streamSnapshot.data!.docs.length,
//                 itemBuilder: (context, index){
//                   NoteModel note = NoteModel.fromJson(snapshot.data!.docs.[index]);
//                   return InkWell(
//         child: Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Container(
//           width: 309,
//           height: 198,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 1,
//                   blurRadius: 7,
//                   offset: Offset(0, 3),
//                 )
//               ]),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: 309,
//                 height: 102,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Colors.grey,
//                 ),
//                 child: Container(
//                   color: Colors.amber,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: Container(),
//                   ),
//                 ),
//               ),
//               Container(
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 19),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: 12,
//                       ),
//                       Text(
//                         note.title,
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 1.6,
//                       ),
//                       Text(
//                         note.harga,
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 1.6,
//                       ),
//                       Text(
//                         note.tipeProperti,
//                         style: TextStyle(fontSize: 15, color: Colors.grey),
//                       ),
//                       SizedBox(
//                         height: 1.6,
//                       ),
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.place,
//                             size: 14,
//                             color: Color.fromARGB(255, 86, 111, 159),
//                           ),
//                           Text(
//                             note.kota,
//                             style: TextStyle(
//                                 color: Color.fromARGB(255, 86, 111, 159),
//                                 fontSize: 16),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           )),
//     ));
//                 },
//               );
//             }
//           }
//         }
//         ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Menampilkan extends StatefulWidget {
  const Menampilkan({super.key});

  @override
  State<Menampilkan> createState() => _MenampilkanState();
}

class _MenampilkanState extends State<Menampilkan> {
  final CollectionReference _tanah =
      FirebaseFirestore.instance.collection('new');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menampilkan data'),
      ),
      body: StreamBuilder(
          stream: _tanah.snapshots(),
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
                  // return Container(
                  //               child: Text(
                  //                 snapshot.data!.docs[index]
                  //                     .get('tanah')['title'],
                  //                 style: const TextStyle(
                  //                   fontSize: 17,
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //             );
                  return Center(
                    child: InkWell(
                        child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          width: 309,
                          height: 198,
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
                                width: 309,
                                height: 102,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey,
                                ),
                                child: Container(
                                  color: Colors.amber,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 19),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        snapshot.data!.docs[index]
                                        .get('tanah')['title'],
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 1.6,
                                      ),
                                      Text(
                                        snapshot.data!.docs[index]
                                        .get('tanah')['price'].toString(),
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 1.6,
                                      ),
                                      Text(
                                        snapshot.data!.docs[index]
                                        .get('tanah')['typeProperty'],
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.grey),
                                      ),
                                      SizedBox(
                                        height: 1.6,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.place,
                                            size: 14,
                                            color:
                                                Color.fromARGB(255, 86, 111, 159),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                        .get('tanah')['city'],
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 86, 111, 159),
                                                fontSize: 16),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )),
                    )),
                  );
                });
          }),
    );
  }
}
