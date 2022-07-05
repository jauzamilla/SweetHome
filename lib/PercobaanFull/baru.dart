import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sweethome/satulagi/homeScreen.dart';
import 'package:sweethome/screen/halamanuser/tokomu.dart';

class Baru extends StatelessWidget {
  TextEditingController toko = TextEditingController();
  TextEditingController whatsapp = TextEditingController();
  TextEditingController telephone = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('stores');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BARU'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Konfirmasi akun toko mu',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: toko,
                    decoration: InputDecoration(
                      hintText: 'Nama Toko',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.store,
                        color: Color(0xff5A5A5A),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: telephone,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'No Telephone',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Color(0xff5A5A5A),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: whatsapp,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'No Whatsapp',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.whatsapp,
                        color: Color(0xff5A5A5A),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 320,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ref.add({
                        'toko': toko.text,
                        'whatsapp': whatsapp.text,
                        'telephone': telephone.text
                      }).whenComplete(() {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => Home1()));
                      });
                    },
                    child: const Text('Lanjut'),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff141228),
                        fixedSize: const Size(240, 44),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
