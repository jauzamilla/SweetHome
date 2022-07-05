import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sweethome/percobaan/coba_Halaman_edit.dart';
import 'package:sweethome/percobaan/coba_iklan_tanah.dart';
import 'package:sweethome/percobaan/edit.dart';
import 'package:sweethome/screen/halamanuser/edit-akun.dart';
import 'package:sweethome/screen/halamanuser/iklan-tanah.dart';
import 'package:sweethome/screen/halamanuser/tambah_postingan.dart';
import 'package:sweethome/screen/halamanuser/ubah_iklan-perumahan.dart';
import 'package:sweethome/screen/halamanuser/ubah_iklan-rumah.dart';
import 'package:sweethome/screen/halamanuser/ubah_iklan-tanah.dart';
import 'package:sweethome/services/auth_coba.dart';
import 'package:url_launcher/url_launcher.dart';

class HalamanAkun extends StatefulWidget {
  const HalamanAkun({super.key});

  @override
  State<HalamanAkun> createState() => _HalamanAkunState();
}

class _HalamanAkunState extends State<HalamanAkun> {
  final controllerJudul = TextEditingController();
  final controllerLuasTanah = TextEditingController();
  final controllerAlamatLokasi = TextEditingController();
  final controllerHarga = TextEditingController();
  final controllerSertifikat = TextEditingController();
  final controllerDeskripsi = TextEditingController();
  final controllerTipeProperti = TextEditingController();

  bool loading = false;

  String? uid;

  @override
  void initState() {
    getUserId();
    super.initState();
  }

  getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString('userId');
    setState(() {});
  }

  @override
  DocumentSnapshot? doc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141228),
      appBar: AppBar(
        backgroundColor: Color(0xff141228),
        title: Text('Akun saya'),
        elevation: 0,
      ),
      body: uid == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(uid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.data!.exists) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10,),
                        Center(
                            child: CircleAvatar(
                                radius: 68,
                                backgroundImage:
                                    AssetImage('image/index.png'))),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.58,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                      child: Text(
                                        'Edit Profil',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      onTap: () {
                                        // Navigator.of(context).push(
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             EditProfil( docid: snapshot.data!,)));
                                      }
                                      ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                   snapshot.data!.get('username'),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    snapshot.data!.get('email'),
                                    style: TextStyle(
                                        fontSize: 15, color: Color(0xff566F9F)),
                                  ),
                                  // Padding(padding: EdgeInsets.all(15)),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(left: 20.0, right: 20),
                                  //   child: Divider(
                                  //     thickness: 1,
                                  //     color: Colors.grey,
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  InkWell(
                                      child: Container(
                                        height: 30,
                                        width: 90,
                                        // color: Colors.lime,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.whatsapp,
                                              color: Colors.grey,
                                              size: 20,
                                            ),
                                            Text(
                                              'Bantuan',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey),
                                            )
                                          ],
                                        ),
                                      ),
                                      onTap: _launchUrl),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(left: 20.0, right: 20),
                                  //   child: Divider(
                                  //     thickness: 0.2,
                                  //     color: Colors.black,
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  InkWell(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.exit_to_app,
                                            color: Colors.grey,
                                            size: 20,
                                          ),
                                          Text(
                                            'Keluar',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                      onTap: () async {
                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        prefs.clear();
                                        await AuthService().signOut(context);
                                      })
                                ],
                              ),
                            ))
                      ]);
                } else {
                  return Center(
                    child: Text('Data tidak ada'),
                  );
                }
              }),
    );
  }

  void _launchUrl(
      // {
      // // required int phone, required String message
      // }
      ) async {
    String phone = '6289512892742';
    String message = '';
    final Uri _url =
        Uri.parse('whatsapp://send?phone=$phone&text=${Uri.parse(message)}');
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }
}

// import 'dart:io';



// import 'package:flutter/material.dart';


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sweethome/services/auth_coba.dart';
// // import 'package:video_thumbnail/video_thumbnail.dart';

// enum MediaType {
//   image,
//   video,
// }

// class ProfilAdmin extends StatefulWidget {
//   const ProfilAdmin({Key? key}) : super(key: key);

//   @override
//   State<ProfilAdmin> createState() => _ProfilAdminState();
// }

// class _ProfilAdminState extends State<ProfilAdmin> {
//   final nama = TextEditingController();
//   final deskripsi = TextEditingController();
//   final MediaType _mediaType = MediaType.image;
//   String? imagePath;

//   Future<void> update([DocumentSnapshot? snapshot]) async {
//     if (snapshot != null) {
//       nama.text = snapshot['nama'];
//       deskripsi.text = snapshot['deskripsi'];
//     }
//   }

//   // Future<void> delete(String docid) async {
//   //   await _usersStream.delete();

//   //   ScaffoldMessenger.of(context)
//   //       .showSnackBar(SnackBar(content: Text('sudah dihapus')));
//   // }
//   // final CollectionReference _profilAdmin =
//   final Stream<QuerySnapshot> _usersStream =
//       FirebaseFirestore.instance.collection('profilAdmin').snapshots();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: StreamBuilder(
//         stream: _usersStream,
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return const Text("Tunggu sebentar, ada yang salah:(");
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(
//                 color: Color(0xff142D4C),
//               ),
//             );
//           }

//           return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (_, index) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Stack(
//                     children: [
//                       Container(
//                         height: 300,
//                         decoration: const BoxDecoration(
//                           boxShadow: [
//                             BoxShadow(
//                               spreadRadius: 0,
//                               color: Colors.grey,
//                               blurRadius: 2.7,
//                               offset: Offset(0, 2),
//                             ),
//                           ],
//                           borderRadius: BorderRadius.only(
//                               bottomLeft: Radius.circular(30),
//                               bottomRight: Radius.circular(30)),
//                           color: Colors.white,
//                         ),
//                       ),
//                       Column(
//                         children: [
//                           // InkWell(
//                           //   onTap: () => {
//                           //     Navigator.push(
//                           //       context,
//                           //       MaterialPageRoute(
//                           //         builder: (context) => ed(
//                           //             docid: snapshot.data!.docs[index]),
//                           //       ),
//                           //     ),
//                           //   },
//                           //   child: SizedBox(
//                           //     width: 135,
//                           //     height: 135,
//                           //     child: (imagePath != null)
//                           //         ? CircleAvatar(
//                           //             backgroundImage:
//                           //                 FileImage(File(imagePath!)))
//                           //         : Container(
//                           //             width: 300,
//                           //             height: 300,
//                           //             child: ClipRRect(
//                           //               borderRadius:
//                           //                   BorderRadius.circular(500),
//                           //               child: Image.network(
//                           //                 snapshot.data!.docs[index]
//                           //                     .get('fotoProfil'),
//                           //                 fit: BoxFit.cover,
//                           //                 loadingBuilder: (BuildContext context,
//                           //                     Widget child,
//                           //                     ImageChunkEvent?
//                           //                         loadingProgress) {
//                           //                   if (loadingProgress == null)
//                           //                     return child;
//                           //                   return Center(
//                           //                     child: CircularProgressIndicator(
//                           //                       color: const Color(0xff142D4C),
//                           //                       value: loadingProgress
//                           //                                   .expectedTotalBytes !=
//                           //                               null
//                           //                           ? loadingProgress
//                           //                                   .cumulativeBytesLoaded /
//                           //                               loadingProgress
//                           //                                   .expectedTotalBytes!
//                           //                           : null,
//                           //                     ),
//                           //                   );
//                           //                 },
//                           //               ),
//                           //             ),
//                           //           ),
//                           //   ),
//                           // ),
//                           ListTile(
//                             title: Center(
//                                 child: Text(
//                               snapshot.data!.docChanges[index].doc['nama'],
//                             )),
//                             subtitle: Center(
//                                 child: Text(snapshot
//                                     .data!.docChanges[index].doc['deskripsi'])),
//                           ),
//                           // TextButton(
//                           //   style: ElevatedButton.styleFrom(
//                           //     primary: Colors.white,
//                           //     onPrimary: Colors.grey,
//                           //   ),
//                           //   onPressed: () => {
//                           //     Navigator.push(
//                           //       context,
//                           //       MaterialPageRoute(
//                           //         builder: (context) => EditProfil(
//                           //             docid: snapshot.data!.docs[index]),
//                           //       ),
//                           //     ),
//                           //   },
//                           //   child: const Text(
//                           //     'Edit Profil',
//                           //     style: TextStyle(color: Colors.black),
//                           //   ),
//                           // ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Container(
//                     padding: const EdgeInsets.all(20.0),
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(350, 38),
//                         textStyle: const TextStyle(
//                             fontSize: 13, fontWeight: FontWeight.bold),
//                         primary: const Color(0xff142D4C),
//                         onPrimary: Colors.white,
//                       ),
//                       onPressed: () async {
//                          SharedPreferences prefs =
//                                             await SharedPreferences
//                                                 .getInstance();
//                                         prefs.clear();
//                                         await AuthService().signOut(context);
//                       },
//                       child: const Text('Keluar'),
//                     ),
//                   ),
//                   // Container(
//                   //     padding: EdgeInsets.all(20),
//                   //     child: InkWell(
//                   //         child: Row(
//                   //           mainAxisAlignment: MainAxisAlignment.center,
//                   //           children: [
//                   //             Icon(
//                   //               Icons.exit_to_app,
//                   //               color: Colors.black,
//                   //               size: 20,
//                   //             ),
//                   //             Text(
//                   //               'Keluar',
//                   //               style: TextStyle(
//                   //                   fontSize: 15, color: Colors.black),
//                   //             )
//                   //           ],
//                   //         ),
//                   //         onTap: () async {
//                   //           await AuthService().signOut(context);
//                   //         })),
//                 ],
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

//   // void pickMedia(ImageSource source) async {
//   //   XFile? file;
//   //   if (_mediaType == MediaType.image) {
//   //     file = await ImagePicker().pickImage(source: source);
//   //   } else {
//   //     file = await ImagePicker().pickVideo(source: source);
//   //   }
//   //   if (file != null) {
//   //     imagePath = file.path;
//   //     if (_mediaType == MediaType.video) {
//   //       imagePath = await VideoThumbnail.thumbnailFile(
//   //           video: file.path,
//   //           imageFormat: ImageFormat.PNG,
//   //           quality: 100,
//   //           maxWidth: 300,
//   //           maxHeight: 300);
//   //     }
//   //     setState(() {});
//   //   }
//   // }
// }