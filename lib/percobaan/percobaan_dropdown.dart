import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweethome/percobaan/halaman_lanjutan.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  final controller = TextEditingController();
  final controllerJudul = TextEditingController();
  final controllerLuasTanah = TextEditingController();
  final controllerAlamatLokasi = TextEditingController();
  final controllerSertifikat = TextEditingController();

  final items = ['SHM', 'AJB'];

  String? value;
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('categoris');
    return Scaffold(
      appBar: AppBar(title: Text('tambah')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Column(
            children: [
              TextField(
                controller: controllerJudul,
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
              Container(
                width: 300,
                child: Row(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Sertifikat',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.straighten,
                          color: Color(0xff5A5A5A),
                        ),
                      ),
                    ),
                    DropdownButton<String>(
                        value: value,
                        items: items.map(buildMenuItem).toList(),
                        onChanged: (value) =>
                            setState(() => this.value = value))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  users.add({
                    'judul': controllerJudul.text,
                    'luasTanah': int.tryParse(controllerLuasTanah.text),
                    'alamatLokasi': controllerAlamatLokasi.text,
                  });

                  controllerJudul.text = '';
                  controllerLuasTanah.text = '';
                  controllerAlamatLokasi.text = '';

                  //   final user = User(
                  //     judul: controllerJudul.text,
                  //     luasTanah: int.parse(controllerLuasTanah.text),
                  //     alamatLokasi: controllerAlamatLokasi.text,
                  //   );

                  //   createUser(user);
                  //   Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (halamanLanjutan())));
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
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
}
