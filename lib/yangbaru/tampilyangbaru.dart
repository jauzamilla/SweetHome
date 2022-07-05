// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:sweethome/yangbaru/edityangbaru.dart';

// class TampilYangBaru extends StatefulWidget {
//   DocumentSnapshot docid;
//   TampilYangBaru({required this.docid});

//   @override
//   State<TampilYangBaru> createState() => _TampilYangBaruState();
// }


// class _TampilYangBaruState extends State<TampilYangBaru> {
//   // Future<void> delete(String docid) async {
//   //   await _usersStream.docid.delete();

//   //   ScaffoldMessenger.of(context)
//   //       .showSnackBar(SnackBar(content: Text('Postingan telah dihapus...')));
//   // }

//   final Stream<QuerySnapshot> _usersStream =
//       FirebaseFirestore.instance.collection('new').snapshots();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tampil'),
//       ),
//       body: Center(
//         child: StreamBuilder(
//         stream: _usersStream,
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text("something is wrong");
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           return Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: ListView.builder(
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (_, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) =>
//                             EditYangBaru(docid: snapshot.data!.docs[index]),
//                       ),
//                     );
//                   },
//                    child: InkWell(
//                     child: Container(
//                       margin: EdgeInsets.only(left: 20, right: 20, top: 20),
//                       width: MediaQuery.of(context).size.width,
//                       height: 119,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               spreadRadius: 1,
//                               blurRadius: 7,
//                               offset: Offset(0, 3),
//                             )
//                           ]),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Center(
//                             child: Padding(
//                               padding: const EdgeInsets.all(16.0),
//                               child: Container(
//                                 width: 102,
//                                 height: 85,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: Colors.grey,
//                                 ),
//                                 child: Container(
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(20),
//                                     child: Container(),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: MediaQuery.of(context).size.width * 0.43,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 // SizedBox(
//                                 //   height: 19,
//                                 // ),
//                                 Text(
//                                   'ksk',
//                                   style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 SizedBox(
//                                   height: 2,
//                                 ),
//                                 Text(
//                                   'Rp. ',
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 SizedBox(
//                                   height: 2,
//                                 ),
//                                 Text(
//                                   'Tipe Properti : Tanah',
//                                   // +
//                                   //     snapshot.data!.docs[index]
//                                   //         .get('perumahan')['typeProperty'],
//                                   style: TextStyle(
//                                       fontSize: 14, color: Colors.grey),
//                                 ),
//                                 SizedBox(
//                                   height: 2,
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.place,
//                                       size: 14,
//                                       color: Color.fromARGB(255, 86, 111, 159),
//                                     ),
//                                     Container(
//                                       width: 140,
//                                       child: Text(
//                                         'kdo',
//                                         overflow: TextOverflow.ellipsis,
//                                         style: TextStyle(
//                                             color: Color.fromARGB(
//                                                 255, 86, 111, 159),
//                                             fontSize: 16),
//                                       ),
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 0),
//                             child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   InkWell(
//                                     child: Container(
//                                       child: Icon(
//                                         Icons.delete_outline,
//                                         color: Color(0xff566F9F),
//                                       ),
//                                     ),
//                                     onTap: () {
//                                       widget.docid.reference.delete().whenComplete(() {
//                 Navigator.pushReplacement(
//                     context, MaterialPageRoute(builder: (_) => Home()));
//               });
//                                     }
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   InkWell(
//                                     child: Container(
//                                       color: Colors.amber,
//                                       child: Icon(
//                                         Icons.mode_edit_outline,
//                                         color: Color(0xff566F9F),
//                                       ),
//                                     ),
//                                     // onTap: () async {
//                                     //   bool? result = await Navigator.push(
//                                     //       context,
//                                     //       MaterialPageRoute(
//                                     //           builder: (context) => EditDulu1(
//                                     //                 doc: doc!,
//                                                   // )));
//                                       // final docUser = FirebaseFirestore.instance.collection('categories').doc('nUMjVamMTd45JxZ8esiy');

//                                       // docUser.update({

//                                       //   'tanah.title' : 'TANAH DAERAH PANGAUBAN'

//                                       // // });
//                                       // Navigator.of(context).push(MaterialPageRoute(builder: (context) => (EditDulu1(doc: documentSnapshot,))));
//                                     // },
//                                   ),
//                                 ]),
//                           )
//                         ],
//                       ),
//                       // ),
//                     ),
//                   )
//       );
//               }));})));
//   }
// }