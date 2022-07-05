import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sweethome/PercobaanFull/homeScreen.dart';
import 'package:sweethome/widgets/filebari.dart';
import 'package:sweethome/satulagi/homeScreen.dart';

class addnote extends StatefulWidget {
  @override
  State<addnote> createState() => _addnoteState();
}

class _addnoteState extends State<addnote> {
  TextEditingController title = TextEditingController();

  TextEditingController price = TextEditingController();

  TextEditingController alamatLokasi = TextEditingController();

  String? value;
  XFile? image;

  final items = ['SHM', 'AJB'];

  // CollectionReference ref = FirebaseFirestore.instance.collection('notes1');
  @override
  Widget build(BuildContext context) {
    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference ref = FirebaseFirestore.instance.collection('notes1');
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              FirebaseStorage.instance
                                    .ref("${title.text}.png")
                                    .putFile(File(image!.path))
                                    .then((image) async {
                                  String imageUrl =
                                      await image.ref.getDownloadURL();
                                       ref.add({
                'title': title.text,
                'price': int.parse(price.text),
                // 'price': price.text,
                'alamatLokasi': alamatLokasi.text,
                'sertifikat': value,
                'fieldGambar': imageUrl,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));
              });
            });
                                      },
             
            child: Text(
              "save",
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              // inputFormatters: [UpperCaseTextFormatter()],
              cursorColor: Color(0xff566F9F),

              maxLength: 50,
              controller: title,
              decoration: InputDecoration(
                hintText: 'Juls',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff141228)),
                ),
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(
                  Icons.subtitles,
                  color: Color(0xff5A5A5A),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: price,
                decoration: InputDecoration(
                  hintText: 'Price',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: alamatLokasi,
                decoration: InputDecoration(
                  hintText: 'Alamat Lokasi',
                ),
              ),
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
                    
            // Container(
            //           child: Row(
            //             children: [
            //               SizedBox(
            //                 width: 15,
            //               ),
            //               Icon(
            //                 Icons.straighten,
            //                 color: Color(0xff5A5A5A),
            //               ),
            //               SizedBox(
            //                 width: 10,
            //               ),
            //               Text('Sertifikat',
            //                   style:
            //                       TextStyle(fontSize: 16, color: Colors.grey)),
            //               SizedBox(
            //                 width: MediaQuery.of(context).size.width * 0.4,
            //               ),
            //               DropdownButton<String>(
            //                   value: value,
            //                   items: ref.map(buildMenuItem).toList(),
            //                   onChanged: (value) =>
            //                       setState(() => this.value = value)),
            //             ],
            //           ),
            //         ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontSize: 14),
        ),
      );
}
