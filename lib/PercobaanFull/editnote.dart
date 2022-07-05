import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sweethome/PercobaanFull/homeScreen.dart';
import 'package:sweethome/widgets/filebari.dart';

class editnote extends StatefulWidget {
  DocumentSnapshot docid;
  String? imageUrl;
  editnote({required this.docid, required this.imageUrl});

  @override
  _editnoteState createState() => _editnoteState();
}

class _editnoteState extends State<editnote> {
  TextEditingController title = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController alamatLokasi = TextEditingController();
  TextEditingController sertifikat = TextEditingController();

  // String? value = 'sertifikat';
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  String? value;
  XFile? image;
  File? imageUrl;
  
  final items = ['SHM', 'AJB'];

  @override
  void initState() {
    title = TextEditingController(text: widget.docid.get('title'));
    price = TextEditingController(
      text: widget.docid.get('price').toString(),
    );
    alamatLokasi =
        TextEditingController(text: widget.docid.get('alamatLokasi'));
    sertifikat = TextEditingController(text: widget.docid.get('sertifikat'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () async {
              if (image == null && widget.imageUrl == "") {
                return;
              }
              if (image != null) {
                File imageFile = File(image!.path);
                print('path : ' + image!.path);
                try {
                  final firebaseStorageRef = await firebaseStorage
                      .ref("timFutsal")
                      .child('tim1_' + widget.docid.id)
                      .putFile(imageFile);
                  final fileUrl = await firebaseStorageRef.ref.getDownloadURL();
                  print(fileUrl);
                  widget.docid.reference.update({
                    'title': title.text,
                    'price': int.parse(price.text),
                    // 'price': price.text,
                    'alamatLokasi': alamatLokasi.text,
                    'fotoPemain': fileUrl,
                  });
                } on FirebaseException catch (e) {
                  print(e);
                } catch (error) {
                  print(error);
                }

                // .whenComplete(() {

                setState(() {});
                Navigator.pop(
                  context,
                );
                // });
              } else {
                widget.docid.reference.update({
                  'title': title.text,
                  'price': int.parse(price.text),
                  // 'price': price.text,
                  'alamatLokasi': alamatLokasi.text,
                  'fotoPemain': widget.imageUrl,
                });
              }
            },
            // onPressed: () {
            //   widget.docid.reference.update({
            //     'title': title.text,
            //     'price': int.parse(price.text),
            //     // 'price': price.text,
            //     'alamatLokasi' : alamatLokasi.text
            //   }).whenComplete(() {
            //     Navigator.pushReplacement(
            //         context, MaterialPageRoute(builder: (_) => Home()));
            //   });
            // },
            child: Text("save"),
          ),
          MaterialButton(
            onPressed: () {
              widget.docid.reference.delete().whenComplete(() {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Postingan telah dihapus...')));
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));
              });
            },
            child: Text("delete"),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              // inputFormatters: [UpperCaseTextFormatter()],
              maxLength: 50,
              controller: title,
              decoration: InputDecoration(
                hintText: 'Judul',
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
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                  DropdownButton<String>(
                      value: value,
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() => this.value = value)),
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
                        decoration: BoxDecoration(border: Border.all(width: 1)),
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
                                        image = await PickImage().pickImage(
                                            source: ImageSource.gallery);
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
                                        image = await PickImage().pickImage(
                                            source: ImageSource.camera);
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
