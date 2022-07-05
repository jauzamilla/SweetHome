import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweethome/percobaan/coba_Halaman_edit.dart';
import 'package:sweethome/percobaan/coba_iklan_tanah.dart';
import 'package:sweethome/percobaan/edit.dart';
import 'package:sweethome/screen/halamanuser/iklan-tanah.dart';
import 'package:sweethome/screen/halamanuser/tambah_postingan.dart';
import 'package:sweethome/screen/halamanuser/ubah_iklan-perumahan.dart';
import 'package:sweethome/screen/halamanuser/ubah_iklan-rumah.dart';
import 'package:sweethome/screen/halamanuser/ubah_iklan-tanah.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  final controllerJudul = TextEditingController();
  final controllerLuasTanah = TextEditingController();
  final controllerAlamatLokasi = TextEditingController();
  final controllerHarga = TextEditingController();
  final controllerSertifikat = TextEditingController();
  final controllerDeskripsi = TextEditingController();
  final controllerTipeProperti = TextEditingController();

  bool loading = false;

  Future<void> delete(String docid) async {
    await _categories.doc(docid).delete();

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Postingan telah dihapus...')));
  }

  final CollectionReference _categories =
      FirebaseFirestore.instance.collection('categories');
  @override
  DocumentSnapshot? doc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff141228),
        title: Text('Postingan'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (TambahPostingan())))
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
                child: CircularProgressIndicator(color: Color(0xff141228)),
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
                                              snapshot.data!.docs[index].get(
                                                'fieldGambar',
                                              ),
                                            ),
                                          ),
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
                                  snapshot.data!.docs[index].get('title'),
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
                                          .get('price')
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
                                      snapshot.data!.docs[index]
                                          .get('tipeKategori'),
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
                                      child: Icon(
                                        Icons.mode_edit_outline,
                                        color: Color(0xff566F9F),
                                      ),
                                    ),
                                    onTap: () {
                                      if(snapshot.data!.docs[index]
                                          .get('tipeKategori') == 'Tanah'){
                                            Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => UbahIklanTanah(
                                                  docid: snapshot
                                                      .data!.docs[index])));
                                          }if(snapshot.data!.docs[index]
                                          .get('tipeKategori') == 'Rumah'){
                                            Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => UbahIklanRumah(
                                                  docid: snapshot
                                                      .data!.docs[index]
                                                  )
                                                  ));
                                          }else{snapshot.data!.docs[index]
                                          .get('tipeKategori') == 'Perumahan';
                                          Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>UbahIklanPerumahan(
                                                  docid: snapshot
                                                      .data!.docs[index]
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
                });
          }),
    );
  }
}
