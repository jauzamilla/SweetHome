

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweethome/screen/halamanuser/halaman_postingan.dart';
import 'package:sweethome/screen/halamanuser/tokomu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sweethome/services/firestore_service.dart';
import 'package:sweethome/widgets/bottom_sheet_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sweethome/widgets/filebari.dart';

class CobaEditHalaman extends StatefulWidget {
  DocumentSnapshot docid;
  CobaEditHalaman({required this.docid});

  @override
  State<CobaEditHalaman> createState() => _CobaEditHalamanState();
}

class _CobaEditHalamanState extends State<CobaEditHalaman> {
  

  TextEditingController controllerJudul = TextEditingController();
  TextEditingController controllerLuasTanah = TextEditingController();
  TextEditingController controllerAlamatLokasi = TextEditingController();
  TextEditingController controllerHarga = TextEditingController();
  TextEditingController controllerSertifikat = TextEditingController();
  TextEditingController controllerDeskripsi = TextEditingController();

    final items = ['SHM', 'AJB'];

  String? value;
  XFile? image;

  bool loading = false;

  @override
  void initState() {
    controllerJudul = TextEditingController(text: widget.docid.get('title'));
    controllerHarga = TextEditingController(text: widget.docid.get('price'));
    controllerLuasTanah = TextEditingController(text: widget.docid.get('luasTanah'));
    controllerAlamatLokasi = TextEditingController(text: widget.docid.get('alamatLokasi'));
    controllerDeskripsi = TextEditingController(text: widget.docid.get('deskripsi'));
    controllerSertifikat = TextEditingController(text: widget.docid.get('sertifikat'));
    super.initState();
  }

  // Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
  //   if (documentSnapshot != null) {
  //      controllerJudul.text = documentSnapshot['title'];
  //      controllerLuasTanah.text = documentSnapshot['luasTanah'].toString();
  //      controllerAlamatLokasi.text = documentSnapshot['alamatLokasi'];
  //      controllerHarga.text = documentSnapshot['price'].toString();
  //      controllerSertifikat.text = documentSnapshot['sertifikat'];
  //      controllerDeskripsi.text = documentSnapshot['deskripsi'];
  //   }
  // }

  CollectionReference _tanah =FirebaseFirestore.instance.collection('new');
      
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('edit data'),
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
                  return Center(
          child: 
          ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      inputFormatters: [UpperCaseTextFormatter()],
                      maxLength: 50,
                      controller: controllerJudul,
                      decoration: InputDecoration(
                        hintText:'Judul',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.subtitles,
                          color: Color(0xff5A5A5A),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    TextField(
                      controller: controllerLuasTanah,
                      decoration: InputDecoration(
                        hintText: 'Luas Tanah',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.straighten,
                          color: Color(0xff5A5A5A),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: controllerAlamatLokasi,
                      decoration: InputDecoration(
                        hintText: 'Alamat Lokasi',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.place,
                          color: Color(0xff5A5A5A),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: controllerHarga,
                      decoration: InputDecoration(
                        hintText: 'Harga',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.attach_money,
                          color: Color(0xff5A5A5A),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.straighten,
                            color: Color(0xff5A5A5A),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Sertifikat',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey)),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                          DropdownButton<String>(
                              value: value,
                              items: items.map(buildMenuItem).toList(),
                              onChanged: (value) =>
                                  setState(() => this.value = value)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: controllerDeskripsi,
                      decoration: InputDecoration(
                        hintText: 'Deskripsi',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.description,
                          color: Color(0xff5A5A5A),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        image != null
                            ? Container(
                                width: 120,
                                height: 120,
                                child: Image.file(
                                  File(image!.path),
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ))
                            : Container(
                                width: 120,
                                height: 120,
                                decoration:
                                    BoxDecoration(border: Border.all(width: 1)),
                                child: Center(
                                  child: Text('Masukan Foto'),
                                ),
                              ),
                        SizedBox(
                          width: 5,
                        ),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Choose Photo'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: [
                                            InkWell(
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.image,
                                                    size: 40,
                                                  ),
                                                  Text('Galery')
                                                ],
                                              ),
                                              onTap: () async {
                                                image = await PickImage()
                                                    .pickImage(
                                                        source: ImageSource
                                                            .gallery);
                                                setState(() {});
                                              },
                                            ),
                                            InkWell(
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.camera,
                                                    size: 40,
                                                  ),
                                                  Text('Camera')
                                                ],
                                              ),
                                              onTap: () async {
                                                image = await PickImage()
                                                    .pickImage(
                                                        source:
                                                            ImageSource.camera);
                                                setState(() {});
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            icon: Icon(
                              Icons.add,
                              size: 40,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    loading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Center(
                            child: ElevatedButton(
                              onPressed: () {
                                widget.docid.reference.update({
                                  'tanah': {
                                  'title' : controllerJudul.text,
                                  'price' : int.tryParse(controllerHarga.text) ?? 0,
                                  'alamatLokasi' : controllerAlamatLokasi.text,
                                  'sertifikat' : controllerSertifikat.text,
                                  'luasTanah' : int.tryParse(controllerLuasTanah.text) ?? 0,
                                  'deskripsi' : controllerDeskripsi.text
                                  }   
                                });
                              },
                              // onPressed: () async {
                              //   if (controllerJudul.text == "" ||
                              //       controllerHarga.text == "" ||
                              //       controllerLuasTanah.text == "" ||
                              //       controllerAlamatLokasi.text == "" ||
                              //       controllerDeskripsi.text == "" ||
                              //       value == "") {
                              //     ScaffoldMessenger.of(context).showSnackBar(
                              //         SnackBar(content: Text('Wajib Diisi !')));
                              //   } else {
                              //     setState(() {
                              //       loading = true;
                              //     });

                              //     await FirestoreService().addDataTanah(
                              //         // widget.user.uid,
                              //         controllerJudul.text,
                              //         int.tryParse(controllerHarga.text) ?? 0,
                              //         int.tryParse(controllerLuasTanah.text) ??
                              //             0,
                              //         controllerAlamatLokasi.text,
                              //         value!,
                              //         controllerDeskripsi.text);
                              //   }
                                // users.add({
                                //   'judul': controllerJudul.text,
                                //   'harga': int.parse(controllerHarga.text),
                                //   'luasTanah': int.parse(controllerLuasTanah.text),
                                //   'alamatLokasi': controllerAlamatLokasi.text,
                                //   'deskripsi': controllerDeskripsi.text,
                                //   'sertifikat': value,
                                // });

                                // controllerJudul.text = '';
                                // controllerLuasTanah.text = '';
                                // controllerAlamatLokasi.text = '';
                                // controllerHarga.text = '';
                                // controllerDeskripsi.text = '';
                                // value = '';
                                // final user = User(
                                //   judul: controllerJudul.text,
                                //   luasTanah: int.parse(controllerLuasTanah.text),
                                //   alamatLokasi: controllerAlamatLokasi.text,
                                //   harga: int.parse(controllerHarga.text),
                                //   sertifikat: controllerSertifikat.text,
                                //   deskripsi: controllerDeskripsi.text

                            //     // );
                            //     Navigator.pop(context);
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) =>
                            //                 (HalamanPostingan())));
                            //   },
                              child: const Text('Update'),
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xff141228),
                                  fixedSize: const Size(240, 44),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                            // ),
                          ),
                        )],
                ),
              )
            ],
          ),
                  );
                });
              }
        ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontSize: 14),
        ),
      );
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
