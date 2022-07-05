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

class HalamanAkunCoba extends StatefulWidget {
  const HalamanAkunCoba({super.key});

  @override
  State<HalamanAkunCoba> createState() => _HalamanAkunCobaState();
}

class _HalamanAkunCobaState extends State<HalamanAkunCoba> {
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
                              color: Colors.grey.withOpacity(0.3),
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
                                child: loading
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : Container(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                               snapshot.data!.get('fieldGambar')
                                            ),
                                            loadingBuilder:
                                                            (BuildContext
                                                                    context,
                                                                Widget child,
                                                                ImageChunkEvent?
                                                                    loadingProgress) {
                                                          if (loadingProgress ==
                                                              null) {
                                                            return child;
                                                          }
                                                          return Center(
                                                            child:
                                                                CircularProgressIndicator(
                                                              color: const Color(
                                                                  0xff142D4C),
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
                                   snapshot.data!.get('title'),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  'Rp. ' +
                                       snapshot.data!.get('price')
                                          .toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  'Tipe Properti : ' +
                                       snapshot.data!.get('tipeKategori'),
                                  // +
                                  //     snapshot.data!.docs[index]
                                  //         .get('perumahan')['typeProperty'],
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 4,
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
                                         snapshot.data!.get('alamatLokasi'),
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
                                    // onTap: () => delete(documentSnapshot.id),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    child: Container(
                                      child: Icon(
                                        Icons.mode_edit_outline,
                                        color: Color(0xff566F9F),
                                      ),
                                    ),
                                    onTap: () {
                                      if( snapshot.data!
                                          .get('tipeKategori') == 'Tanah'){
                                            Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => UbahIklanTanah(
                                                  docid: snapshot
                                                      .data!)));
                                          }if(snapshot.data!
                                          .get('tipeKategori') == 'Rumah'){
                                            Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => UbahIklanRumah(
                                                  docid: snapshot
                                                      .data!
                                                  )
                                                  ));
                                          }else{snapshot.data!
                                          .get('tipeKategori') == 'Perumahan';
                                          Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>UbahIklanPerumahan(
                                                  docid: snapshot
                                                      .data!
                                          )));
                                          }
                                      
                                      // bool? result = await Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => EditDulu1(
                                      //               doc: doc!,
                                      //             )));
                                      // final docUser = FirebaseFirestore.instance.collection('categories').doc('nUMjVamMTd45JxZ8esiy');

                                      // docUser.update({

                                      //   'tanah.title' : 'TANAH DAERAH PANGAUBAN'

                                      // // });
                                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => (EditDulu1(doc: documentSnapshot,))));
                                    },
                                  ),
                                ]),
                          )
                        ],
                      ),
                      // ),
                    ),
                  );
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
    String phone = '628';
    String message = 'Apakah Masih Ada?';
    final Uri _url =
        Uri.parse('whatsapp://send?phone=$phone&text=${Uri.parse(message)}');
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }
}
