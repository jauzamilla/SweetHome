// import 'dart:ui';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sweethome/satulagi/barusatulagi.dart';
// import 'package:sweethome/satulagi/homeScreen.dart';
// import 'package:sweethome/screen/halamanuser/halaman_postingan.dart';


// // class TokoPage extends StatelessWidget {
// //   const TokoPage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: HalamanToko(),

// //     );
// //   }
// // }

// class HalamanToko1 extends StatefulWidget {
//   const HalamanToko1({super.key});

//   @override
//   State<HalamanToko1> createState() => _HalamanToko1State();
// }

// class _HalamanToko1State extends State<HalamanToko1> {
//   String? uid;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   getUserId() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     uid = prefs.getString('userId');
//   }

//   final CollectionReference stores =
//       FirebaseFirestore.instance.collection('stores');
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
          
//           backgroundColor: Color(0xff141228),
//           title: Text(
//             'Tokomu',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         body: StreamBuilder(
//             stream: FirebaseFirestore.instance
//                 .collection('stores')
//                 .where('userId', isEqualTo: uid)
//                 .snapshots(),
//             builder: (context, AsyncSnapshot snapshots) {
//                if (!snapshots.hasData) {
                
//                 return Center(
//                   child: 

//                   CircularProgressIndicator());
//                   }
//               if (snapshots.hasData) {
                
//                 return Center(
//                   child: 

//                   // CircularProgressIndicator(),
//                   Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: SafeArea(
//                     child: Center(
//                       child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               height: 60,
//                             ),
//                             Text(
//                               'Ciptakan Peluangmu!',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 24,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'Buka toko tanpa biaya dan dapatkan pengalaman mengelola usaha semudah update status',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.bold),
//                               textAlign: TextAlign.center,
//                             ),
//                             SizedBox(
//                               height: 40,
//                             ),
//                             ElevatedButton(
//                               onPressed: () {
//                                 print(snapshots);
//                                 //  Navigator.push(context, MaterialPageRoute(builder: (context) => (TokoScreen(docid: snapshot.data!.docs[index],))));
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => (TokoScreen1())));
//                               },
//                               child: const Text('Buka Tokomu'),
//                               style: ElevatedButton.styleFrom(
//                                   primary: Color(0xff141228),
//                                   fixedSize: const Size(240, 44),
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(50))),
//                             ),
//                           ]),
//                     ),
//                   ),
//                 )
//                 );
//               // } else if (snapshots.data.docs.length.isEmpty) {
//               //   return Padding(
//               //     padding: const EdgeInsets.all(20.0),
//               //     child: SafeArea(
//               //       child: Center(
//               //         child: Column(
//               //             mainAxisAlignment: MainAxisAlignment.start,
//               //             children: [
//               //               SizedBox(
//               //                 height: 60,
//               //               ),
//               //               Text(
//               //                 'Ciptakan Peluangmu!',
//               //                 style: TextStyle(
//               //                   fontWeight: FontWeight.bold,
//               //                   fontSize: 24,
//               //                 ),
//               //               ),
//               //               SizedBox(
//               //                 height: 20,
//               //               ),
//               //               Text(
//               //                 'Buka toko tanpa biaya dan dapatkan pengalaman mengelola usaha semudah update status',
//               //                 style: TextStyle(
//               //                     fontSize: 18, fontWeight: FontWeight.bold),
//               //                 textAlign: TextAlign.center,
//               //               ),
//               //               SizedBox(
//               //                 height: 40,
//               //               ),
//               //               ElevatedButton(
//               //                 onPressed: () {
//               //                   //  Navigator.push(context, MaterialPageRoute(builder: (context) => (TokoScreen(docid: snapshot.data!.docs[index],))));
//               //                   Navigator.push(
//               //                       context,
//               //                       MaterialPageRoute(
//               //                           builder: (context) => (TokoScreen())));
//               //                 },
//               //                 child: const Text('Buka Tokomu'),
//               //                 style: ElevatedButton.styleFrom(
//               //                     primary: Color(0xff141228),
//               //                     fixedSize: const Size(240, 44),
//               //                     shape: RoundedRectangleBorder(
//               //                         borderRadius: BorderRadius.circular(50))),
//               //               ),
//               //             ]),
//               //       ),
//               //     ),
//               //   );
//               } else {
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                               child: CircleAvatar(
//                                   radius: 40,
//                                   backgroundImage:
//                                       AssetImage('image/index.png'))),
//                           Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 15),
//                                 child: Text(
//                                   'Jauza Kamila Hadi',
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 15, top: 2),
//                                 child: Row(
//                                   children: [
//                                     Icon(
//                                       Icons.mail_outline,
//                                       size: 16,
//                                       color: Color(0xff566F9F),
//                                     ),
//                                     Text(' jauza@email.com',
//                                         style: TextStyle(
//                                             fontSize: 15,
//                                             color: Color(0xff566F9F)))
//                                   ],
//                                 ),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(left: 30, right: 30),
//                       child: Divider(
//                         thickness: 1,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Container(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SizedBox(
//                                 // width: 40,
//                                 height: 6,
//                               ),
//                               Icon(
//                                 Icons.info,
//                                 color: Colors.grey,
//                               ),
//                               Text(
//                                 'Info',
//                                 style: TextStyle(
//                                     fontSize: 20, fontWeight: FontWeight.bold),
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: 2,
//                           ),
//                           // Padding(
//                           //   padding: const EdgeInsets.only(left: 40),
//                           // child:
//                           Text(
//                             'No Telp : 0812345678',
//                             style: TextStyle(color: Colors.grey, fontSize: 15),
//                           ),
//                           // ),
//                           SizedBox(
//                             height: 2,
//                           ),
//                           // Padding(
//                           //   padding: const EdgeInsets.only(left: 40),
//                           // child:
//                           Container(
//                             child: Text('No Whatsapp : 0812345678',
//                                 style: TextStyle(
//                                     color: Colors.grey, fontSize: 15)),
//                           ),
//                           // ),
//                           Divider(
//                             thickness: 0.2,
//                             color: Colors.black,
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),

//                           Center(
//                             child: InkWell(
//                                 child: Container(
//                                   height: 80,
//                                   width: 280,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(15),
//                                       color: Color(0xffEBE9E9)),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(18.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Container(
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   Icon(
//                                                     Icons.image,
//                                                     color: Colors.grey,
//                                                   ),
//                                                   Text(
//                                                     'Postingan',
//                                                     style: TextStyle(
//                                                       fontSize: 18,
//                                                     ),
//                                                   )
//                                                 ],
//                                               ),
//                                               Text(
//                                                 'Lihat daftar postingan',
//                                                 style: TextStyle(
//                                                     fontSize: 15,
//                                                     color: Colors.grey),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                         Icon(Icons.navigate_next)
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 onTap: () {
//                                   Navigator.of(context).push(MaterialPageRoute(
//                                       builder: (context) =>
//                                           HalamanPostingan()));
//                                 }),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 );
//               }
//             }));
//   }
// }
