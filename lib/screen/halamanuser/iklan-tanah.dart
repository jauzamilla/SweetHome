import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sweethome/widgets/filebari.dart';

class TambahIklanTanah extends StatefulWidget {
  // User user;
  // TambahIklanTanah(this.user);

  @override
  State<TambahIklanTanah> createState() => _TambahIklanTanahState();
}

class _TambahIklanTanahState extends State<TambahIklanTanah> {
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

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('categories');
    return Scaffold(
        appBar: AppBar(
          title: Text('Iklan Tanah'),
          elevation: 0,
          backgroundColor: Color(0xff141228),
        ),
        body: Center(
          child: ListView(
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
                    // SizedBox(
                    //   height: 10,
                    // ),
                    TextField(
                      controller: controllerLuasTanah,
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
                      controller: controllerAlamatLokasi,
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
                      controller: controllerHarga,
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
                    TextField(
                      maxLength: null,
                      maxLines: null,
                      controller: controllerDeskripsi,
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
                      height: 10,
                    ),
                    //   TextFormField(
                    //   maxLength: null,
                    //   maxLines: null,
                    //   controller: controllerDeskripsi,
                    //   decoration: InputDecoration(

                    //     filled: true,
                    //     contentPadding: const EdgeInsets.all(20),
                    //     hintText: 'Deskripsi',
                    //     border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10)),
                    //     focusedBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //         borderSide:
                    //             const BorderSide(color: Color(0xff142D4C))),
                    //   ),
                    // ),
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
                              // Navigator.pop(context);
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
                                                image = await PickImage()
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
                              onPressed: () {
                                if (controllerJudul.text == "" ||
                                    controllerHarga == "" ||
                                    controllerLuasTanah.text == "" ||
                                    controllerAlamatLokasi.text == "" ||
                                    controllerDeskripsi.text == ""|| value == "" || image == "") {
                                  
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text("Semua kolom wajib di isi!"),
                                      backgroundColor: Colors.grey,
                                    ),
                                  );
                                } else {
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
                                      'alamatLokasi':
                                          controllerAlamatLokasi.text,
                                      'sertifikat': value,
                                      'deskripsi': controllerDeskripsi.text,
                                      'fieldGambar': imageUrl,
                                      'userId': uid
                                    }).then((value) {
                                      Navigator.of(context)
                                        ..pop()
                                        ..pop();
                                      print(users);
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
                                }
                              },
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
          ),
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
