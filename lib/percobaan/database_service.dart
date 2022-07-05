import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweethome/percobaan/halaman_lanjutan.dart';

class DropDown1 extends StatefulWidget {
  const DropDown1({super.key});

  @override
  State<DropDown1> createState() => _DropDown1State();
}

class _DropDown1State extends State<DropDown1> {
  final controller = TextEditingController();
  final controllerJudul = TextEditingController();
  final controllerLuasTanah = TextEditingController();
  final controllerAlamatLokasi = TextEditingController();

  final items = ['SHM', 'AJB'];

  String? value;
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Scaffold(
      appBar: AppBar(title: Text('Tambah')),
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
                child: Row(
                  children: [
                    SizedBox(width: 15,),
                    Icon(Icons.straighten,color: Color(0xff5A5A5A),),
                    SizedBox(width: 10,),
                    Text('Sertifikat',style: TextStyle(fontSize: 16, color: Colors.grey)),
                    SizedBox(width: MediaQuery.of(context).size.width* 0.4,),
                    DropdownButton<String>(
                        value: value,
                        items: items.map(buildMenuItem).toList(),
                        onChanged: (value) =>
                            setState(() => this.value = value)),
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
                    'sertifikat': value
                  });

                  controllerJudul.text = '';
                  controllerLuasTanah.text = '';
                  controllerAlamatLokasi.text = '';
                  value ='';

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
        child: Text(item, style: TextStyle(fontSize: 14),),
      );
}
