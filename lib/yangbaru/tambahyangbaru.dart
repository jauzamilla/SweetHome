import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class TambahYangBaru extends StatefulWidget {
  const TambahYangBaru({super.key});

  @override
  State<TambahYangBaru> createState() => _TambahYangBaruState();
}

class _TambahYangBaruState extends State<TambahYangBaru> {
  TextEditingController judul = TextEditingController();
  TextEditingController harga = TextEditingController();
  TextEditingController luasTanah = TextEditingController();
  TextEditingController sertifikat = TextEditingController();
  TextEditingController deskripsi = TextEditingController();
  TextEditingController alamatLokasi= TextEditingController();
  String? value;
  XFile? image;
  final items = ['SHM', 'AJB'];

  @override
  Widget build(BuildContext context) {
    CollectionReference ref = FirebaseFirestore.instance.collection('new');
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: judul,
              decoration: InputDecoration(
                hintText: 'Judul',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(
                  Icons.subtitles,
                  color: Color(0xff5A5A5A),
                ),
              ),
            ),
            //  SizedBox(height: 20,),
            TextField(
              controller: harga,
              decoration: InputDecoration(
                hintText: 'Harga',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(
                  Icons.attach_money,
                  color: Color(0xff5A5A5A),
                ),
              ),
            ),
            TextField(
              controller: luasTanah,
              decoration: InputDecoration(
                hintText: 'Luas Tanah',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(
                  Icons.subtitles,
                  color: Color(0xff5A5A5A),
                ),
              ),
            ),
            TextField(
              controller: alamatLokasi,
              decoration: InputDecoration(
                hintText: 'Alamat Lokasi',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(
                  Icons.subtitles,
                  color: Color(0xff5A5A5A),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.straighten,
                          color: Color(0xff5A5A5A),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Sertifikat',
                            style: TextStyle(fontSize: 16, color: Colors.grey)),
                      ],
                    ),
                  ),
                  DropdownButton<String>(
                      value: value,
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() => this.value = value)),
                ],
              ),
            ),
            TextField(
              controller: deskripsi,
              decoration: InputDecoration(
                hintText: 'Deskripsi',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(
                  Icons.subtitles,
                  color: Color(0xff5A5A5A),
                ),
              ),
            ),
            SizedBox(height: 40,),
            ElevatedButton(
              onPressed: () {
                ref.add({
                'judul': judul.text,
                'deskripsi' : deskripsi.text,
                'harga': int.parse(harga.text),
                'luasTanah' : int.parse(luasTanah.text),
                'alamatLokasi': alamatLokasi.text,
                'sertifikat': value,
                
              }).whenComplete(() {
                Navigator.pop(context);
                    
              });
              },
              child: Text('Lanjut'),
              style: ElevatedButton.styleFrom(
                  primary: Color(0xff141228),
                  fixedSize: const Size(240, 44),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
            )
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
