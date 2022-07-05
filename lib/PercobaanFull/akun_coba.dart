// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sweethome/percobaan/coba_Halaman_edit.dart';
// import 'package:sweethome/percobaan/coba_iklan_tanah.dart';
// import 'package:sweethome/percobaan/edit.dart';
// import 'package:sweethome/screen/halamanuser/edit-akun.dart';
// import 'package:sweethome/screen/halamanuser/iklan-tanah.dart';
// import 'package:sweethome/screen/halamanuser/tambah_postingan.dart';
// import 'package:sweethome/screen/halamanuser/ubah_iklan-perumahan.dart';
// import 'package:sweethome/screen/halamanuser/ubah_iklan-rumah.dart';
// import 'package:sweethome/screen/halamanuser/ubah_iklan-tanah.dart';
// import 'package:sweethome/services/auth_coba.dart';
// import 'package:url_launcher/url_launcher.dart';

// class HalamanAkunCoba extends StatefulWidget {
//   const HalamanAkunCoba({super.key});

//   @override
//   State<HalamanAkunCoba> createState() => _HalamanAkunCobaState();
// }

// class _HalamanAkunCobaState extends State<HalamanAkunCoba> {
//   final controllerJudul = TextEditingController();
//   final controllerLuasTanah = TextEditingController();
//   final controllerAlamatLokasi = TextEditingController();
//   final controllerHarga = TextEditingController();
//   final controllerSertifikat = TextEditingController();
//   final controllerDeskripsi = TextEditingController();
//   final controllerTipeProperti = TextEditingController();

//   bool loading = false;

//  String? uid;

//   @override
//   void initState() {
//     getUserId();
//     super.initState();
//   }

//   getUserId() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     uid = prefs.getString('userId');
//   }

//   final DocumentReference users =
//       FirebaseFirestore.instance.collection('users').doc();
//   @override
//   DocumentSnapshot? doc;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xff141228),
//         title: Text('Akun saya'),
//         elevation: 0,
        
//       ),
//       body: StreamBuilder(
//           stream: users.snapshots(),
//           builder:
//               (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//             if (!snapshot.hasData) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             else if (!snapshot.data!.exists) {
//               return Center(
//                 child: Text('Data tidak ada'),
//               );
//             }else{
//              return Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Center(
//                             child: CircleAvatar(
//                                 radius: 68,
//                                 backgroundImage:
//                                     AssetImage('image/index.png'))),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Expanded(
//                           flex: 1,
//                           child: Container(
//                             width: MediaQuery.of(context).size.width,
//                             height: MediaQuery.of(context).size.height * 0.58,
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(40),
//                                     topRight: Radius.circular(40))),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 InkWell(
//                                     child: Text(
//                                       'Edit Profil',
//                                       style: TextStyle(fontSize: 16),
//                                     ),
//                                     onTap: () {
//                                       Navigator.of(context).push(
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   EditAkun()));
//                                     }),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Text(
//                                   'Jauza Kamila Hadi',
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 SizedBox(
//                                   height: 2,
//                                 ),
//                                 Text(
//                                   'jauza@email.com',
//                                   style: TextStyle(
//                                       fontSize: 15, color: Color(0xff566F9F)),
//                                 ),
//                                 // Padding(padding: EdgeInsets.all(15)),
//                                 SizedBox(
//                                   height: 8,
//                                 ),
//                                 // Padding(
//                                 //   padding: const EdgeInsets.only(left: 20.0, right: 20),
//                                 //   child: Divider(
//                                 //     thickness: 1,
//                                 //     color: Colors.grey,
//                                 //   ),
//                                 // ),
//                                 SizedBox(
//                                   height: 2,
//                                 ),
//                                 InkWell(
//                                     child: Container(
//                                       height: 30,
//                                       width: 90,
//                                       // color: Colors.lime,
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Icon(
//                                             Icons.whatsapp,
//                                             color: Colors.grey,
//                                             size: 20,
//                                           ),
//                                           Text(
//                                             'Bantuan',
//                                             style: TextStyle(
//                                                 fontSize: 15,
//                                                 color: Colors.grey),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     onTap: _launchUrl),
//                                 SizedBox(
//                                   height: 2,
//                                 ),
//                                 // Padding(
//                                 //   padding: const EdgeInsets.only(left: 20.0, right: 20),
//                                 //   child: Divider(
//                                 //     thickness: 0.2,
//                                 //     color: Colors.black,
//                                 //   ),
//                                 // ),
//                                 SizedBox(
//                                   height: 2,
//                                 ),
//                                 InkWell(
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Icon(
//                                           Icons.exit_to_app,
//                                           color: Colors.grey,
//                                           size: 20,
//                                         ),
//                                         Text(
//                                           'Keluar',
//                                           style: TextStyle(
//                                               fontSize: 15, color: Colors.grey),
//                                         )
//                                       ],
//                                     ),
//                                     onTap: () async {
//                                       await AuthService().signOut();
//                                     })
//                               ],
//                             ),
//                         )
                     
//              )]);
//             }
            
//           }),
//     );
//   }
//     void _launchUrl(
//       // {
//       // // required int phone, required String message
//       // }
//       ) async {
//     String phone = '6289525560021';
//     String message = 'Apakah Masih Ada?';
//     final Uri _url =
//         Uri.parse('whatsapp://send?phone=$phone&text=${Uri.parse(message)}');
//     if (!await launchUrl(_url)) throw 'Could not launch $_url';
//   }
// }
