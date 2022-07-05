
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sweethome/widgets/body_detail_widget.dart';

class DetailTanah extends StatefulWidget {
   DocumentSnapshot docid;
  DetailTanah({Key? key, required this.docid}) : super(key: key);

  @override
  State<DetailTanah> createState() => _DetailTanahState();
}

class _DetailTanahState extends State<DetailTanah> {
    final controllerJudul = TextEditingController();
  final controllerLuasTanah = TextEditingController();
  final controllerAlamatLokasi = TextEditingController();
  final controllerHarga = TextEditingController();
  final controllerSertifikat = TextEditingController();
  final controllerDeskripsi = TextEditingController();

  final items = ['SHM', 'AJB'];

  String? value;
  XFile? image;

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
  }
  final deskripsi = TextEditingController();
  Future<void> update([DocumentSnapshot? snapshot]) async {
    if (snapshot != null) {
      deskripsi.text = snapshot['title'];
    }
  }


  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('tersimpan');
    return Scaffold(
       appBar: AppBar(
        title: Text('Detail'),
        backgroundColor: Color(0xff141228),
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            setState(() {
                                    loading = true;
                                  });
                                FirebaseStorage.instance
                                    .ref("${controllerJudul.text}.png")
                                    .putFile(File(image!.path))
                                    .then((image) async {
                                  String imageUrl =
                                      await image.ref.getDownloadURL();
                                  users.add({
                                    'tipeKategori': 'Tanah',
                                    'title': controllerJudul.text,
                                    'price': controllerHarga.text,
                                    'luasTanah':
                                        int.parse(controllerLuasTanah.text),
                                    'alamatLokasi': controllerAlamatLokasi.text,
                                    'sertifikat': value,
                                    'deskripsi': controllerDeskripsi.text,
                                    'fieldGambar': imageUrl,
                                    'userId': uid
                                  }).then((value) {
                                    Navigator.of(context)
                                      ..pop()
                                      ..pop();
                                      // print(users);
                                    //
                                  });

                                  // controllerJudul.text = '';
                                  // controllerLuasTanah.text = '';
                                  // controllerAlamatLokasi.text = '';
                                  // controllerHarga.text = '';
                                  // controllerDeskripsi.text = '';
                                  // value = '';
                                });
                                setState(() {
                                    loading = false;
                                  });
                              },
        icon: Icon(Icons.bookmark)),
        
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('categories').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Tunggu sebentar, ada yang salah");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xff142D4C),
              ),
            );
          }
          return Container(

            child: ListView(
              children:[ Column(
                children: [
                   Container(
                     width: MediaQuery.of(context).size.width,
                     height: 280,
                     child: loading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            :Container(
                              
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(0),
                                        child: Image(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          widget.docid.get(
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
                                
                              
                            
                  BodyDetailTanah(
                                judul:
                                 widget.docid.get('title'),
                                 // 'hbcdhbc'
                                harga:'Rp.'+
                                widget.docid.get('price').toString(),
                                // 'hbcdhbc',
                                tipeProperti: 
                                widget.docid.get('tipeKategori'),
                                // 'hbcdhbc',
                                
                                luas:
                                widget.docid.get('luasTanah').toString()+ 'm',
                                // 'hdbfshdjfb',
                                sertifikat:  
                                widget.docid.get('sertifikat'),
                                // 'uudhfusdhf',
                                deskripsi: 
                                widget.docid.get('deskripsi'),
                                // 'jdjhfh',
                                    
                                alamat:
                                // 'djdjdjdjdjdj'
                                    widget.docid.get('alamatLokasi'),
                                                  ),
                ],
              ),
              ]),
          );
        },
      ),
    );
  }
}
