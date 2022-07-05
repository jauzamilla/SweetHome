import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweethome/screen/halamanuser/tokomu.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sweethome/widgets/filebari.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'halaman_postingan.dart';

class UbahIklanPerumahan extends StatefulWidget {
  DocumentSnapshot docid;
  // String imageUrl;
  UbahIklanPerumahan({required this.docid, 
  // required this.imageUrl
  });

  @override
  State<UbahIklanPerumahan> createState() => _UbahIklanPerumahanState();
}

class _UbahIklanPerumahanState extends State<UbahIklanPerumahan> {
  TextEditingController judul = TextEditingController();
  TextEditingController luasTanah = TextEditingController();
  TextEditingController luasBangunan = TextEditingController();
  TextEditingController kamarMandi = TextEditingController();
  TextEditingController kamarTidur = TextEditingController();
  TextEditingController alamatLokasi = TextEditingController();
  TextEditingController harga = TextEditingController();
  TextEditingController controllerSertifikat = TextEditingController();
  TextEditingController deskripsi = TextEditingController();
  TextEditingController tipe = TextEditingController();
  TextEditingController sumberAir = TextEditingController();
  TextEditingController listrik = TextEditingController();

  final kamarmandi = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  final sertifikat = ['SHM', 'AJB'];
  final kamartidur = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

  String? value;
  String? value1;
  String? value2;
  String? image;
  XFile? imageFile;

    void initState() {
    judul = TextEditingController(text: widget.docid.get('title'));
    harga = TextEditingController(text: widget.docid.get('price'));
    luasTanah =
        TextEditingController(text: widget.docid.get('luasTanah').toString());
    alamatLokasi =
        TextEditingController(text: widget.docid.get('alamatLokasi'));
    deskripsi =
        TextEditingController(text: widget.docid.get('deskripsi'));
    controllerSertifikat =
        TextEditingController(text: widget.docid.get('sertifikat'));
    luasBangunan = TextEditingController(text: widget.docid.get('luasBangunan').toString());
    listrik = TextEditingController(text: widget.docid.get('listrik').toString());
    kamarMandi = TextEditingController(text: widget.docid.get('kamarMandi'));
    // kamarTidur = TextEditingController(text: widget.docid.get('kamarTidur'));
    tipe = TextEditingController(text: widget.docid.get('typeProperti'));
    sumberAir = TextEditingController(text: widget.docid.get('sumberAir'));
     value2 = widget.docid.get('kamarTidur');
    value1 = widget.docid.get('kamarMandi');
    value = widget.docid.get('sertifikat');
    image = widget.docid.get('fieldGambar');
    setState(() {
      
    });
    // fieldGambar = TextEditingController(text: widget.docid.get('fieldGambar'));
    super.initState();
  }

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final users = firestore.collection('categories').where('tipeKategori', isEqualTo: 'Perumahan');
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Iklan Perumahan'),
          backgroundColor: Color(0xff141228),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: 10,
                  // ),
                   TextField(
                    inputFormatters: [UpperCaseTextFormatter()],
                    maxLength: 50,
                    controller: judul,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff141228)),
                            ),
                            labelStyle: TextStyle(color: Color(0xff5A5A5A)),
                            labelText: 'Judul ',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.subtitles,
                        color: Color(0xff5A5A5A),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                   TextField(
                    controller: luasTanah,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff141228)),
                            ),
                            labelStyle: TextStyle(color: Color(0xff5A5A5A)),
                            labelText: 'Luas Tanah ',
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
                    controller: luasBangunan,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff141228)),
                            ),
                            labelStyle: TextStyle(color: Color(0xff5A5A5A)),
                            labelText: 'Luas Bangunan ',
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
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.bed,
                                color: Color(0xff5A5A5A),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Kamar Tidur',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ],
                          ),
                        ),
                        DropdownButton<String>(
                            value: value1,
                            items: kamartidur.map(buildMenuItem).toList(),
                            onChanged: (value1) =>
                                setState(() => this.value1 = value1)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.bathtub,
                                color: Color(0xff5A5A5A),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Kamar Mandi',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ],
                          ),
                        ),
                        DropdownButton<String>(
                            value: value2,
                            items: kamarmandi.map(buildMenuItem).toList(),
                            onChanged: (value2) =>
                                setState(() => this.value2 = value2)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: tipe,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff141228)),
                            ),
                            labelStyle: TextStyle(color: Color(0xff5A5A5A)),
                            labelText: 'Tipe ',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.home_work,
                        color: Color(0xff5A5A5A),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: alamatLokasi,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff141228)),
                            ),
                            labelStyle: TextStyle(color: Color(0xff5A5A5A)),
                            labelText: 'Alamat Lokasi ',
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
                    controller: harga,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff141228)),
                            ),
                            labelStyle: TextStyle(color: Color(0xff5A5A5A)),
                            labelText: 'Harga ',
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
                  TextField(
                    controller: sumberAir,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff141228)),
                            ),
                            labelStyle: TextStyle(color: Color(0xff5A5A5A)),
                            labelText: 'Sumber Air ',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.water,
                        color: Color(0xff5A5A5A),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: listrik,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff141228)),
                            ),
                            labelStyle: TextStyle(color: Color(0xff5A5A5A)),
                            labelText: 'Listrik ',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.electric_bolt,
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
                        Text('Sertifikasi',
                            style: TextStyle(fontSize: 16, color: Colors.grey)),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                        DropdownButton<String>(
                            value: value,
                            items: sertifikat.map(buildMenuItem).toList(),
                            onChanged: (value) =>
                                setState(() => this.value = value)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                      maxLength: null,
                    maxLines: null,
                    controller: deskripsi,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff141228)),
                        ),
                        labelStyle: TextStyle(color: Color(0xff5A5A5A)),
                        labelText: 'Deskripsi',
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
                      imageFile != null
                          ?Container(
                              width: 120,
                              height: 120,
                              child: Image.file(
                                File(imageFile!.path),
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                              )):image != null? Container(
                              width: 120,
                              height: 120,
                              child: Image.network(
                                image!,
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
                                              imageFile = await PickImage()
                                                  .pickImage(
                                                      source:
                                                          ImageSource.gallery);
                                              setState(() {});
                                              Navigator.pop(context);
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
                                              imageFile = await PickImage()
                                                  .pickImage(
                                                      source:
                                                          ImageSource.camera);
                                              setState(() {});
                                              Navigator.pop(context);
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
                      onPressed: (){
                        FirebaseStorage.instance
                                    .ref("${judul.text}.png")
                                    .putFile(File(imageFile!.path))
                                    .then((image) async {
                                  String imageUrl =
                                      await image.ref.getDownloadURL();
                                  widget.docid.reference.update({
                                    'tipeKategori': 'Perumahan',
                                    'title': judul.text,
                                    'price': harga.text,
                                    'luasTanah':int.parse(luasTanah.text),
                                    'luasBangunan': int.parse(luasBangunan.text),
                                    'kamarMandi': value2,
                                    'kamarTidur': value1,                            
                                    'alamatLokasi': alamatLokasi.text,
                                    'sumberAir':sumberAir.text,
                                    'tipe': tipe.text,
                                    'listrik': int.parse(listrik.text),
                                    'sertifikat': value,
                                    'deskripsi': deskripsi.text,
                                    'fieldGambar': imageUrl,
                                    'typeProperti': tipe.text
                                  }).then((value) {
                                    Navigator.of(context)
                                      ..pop()
                                      ;
                                    //
                                  });

                                  judul.text = '';
                                luasTanah.text = '';
                                luasBangunan.text= '';
                                kamarTidur.text = '';
                                kamarMandi.text = '';
                                tipe.text = '';
                                alamatLokasi.text = '';
                                sumberAir.text = '';
                                listrik.text = '';
                                harga.text = '';
                                deskripsi.text = '';
                                controllerSertifikat.text = '';
                                value = '';
                                value1 = '';
                                value2 = '';
                                });
                              },
                        //         users.add({
                            
                        //       'title': judul.text,
                        //       'price': int.parse(harga.text),
                        //       'luasTanah': int.parse(luasTanah.text),
                        //       'luasBangunan': int.parse(luasBangunan.text),
                        //       'kamarMandi': value2,
                        //       'kamarTidur': value1,
                        //       'tipe': tipe.text,
                        //       'alamatLokasi': alamatLokasi.text,
                        //       'sumberAir':sumberAir.text,
                        //       'listrik': listrik.text,
                        //       'sertifikat': value,
                        //       'deskripsi': deskripsi.text,


                        //       // 'sertifikat': value,
                            
                        //        });
                        //         judul.text = '';
                        //         luasTanah.text = '';
                        //         luasBangunan.text= '';
                        //         kamarTidur.text = '';
                        //         kamarMandi.text = '';
                        //         tipe.text = '';
                        //         alamatLokasi.text = '';
                        //         sumberAir.text = '';
                        //         listrik.text = '';
                        //         harga.text = '';
                        //         deskripsi.text = '';
                        //         controllerSertifikat.text = '';
                        //         value = '';
                        //         value1 = '';
                        //         value2 = '';
                     
                        //  Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //                 builder: (context) =>
                        //                     (HalamanPostingan())));
                        //       },
                              child: const Text('Lanjut'),
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xff141228),
                                  fixedSize: const Size(240, 44),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                  ),
                  ),
                ],
              ),
            )
          ],
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
