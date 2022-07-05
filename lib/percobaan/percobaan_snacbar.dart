import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweethome/percobaan/halaman_lanjutan.dart';

class SnacBar extends StatefulWidget {
  const SnacBar({super.key});

  @override
  State<SnacBar> createState() => _SnacBarState();
}

class _SnacBarState extends State<SnacBar> {
  bool loading = false;

  final controller = TextEditingController();
  final controllerJudul = TextEditingController();
  final controllerLuasTanah = TextEditingController();
  final controllerAlamatLokasi = TextEditingController();
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Scaffold(
      appBar: AppBar(title: Text('tambah')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Column(
            children: [
              TextField(
                inputFormatters: [UpperCaseTextFormatter()],
                maxLength: 20,
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
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    loading = true;
                  });
                  users.add({
                    'judul': controllerJudul.text,
                    'luasTanah': int.tryParse(controllerLuasTanah.text),
                    'alamatLokasi': controllerAlamatLokasi.text,
                  });

                  controllerJudul.text = '';
                  controllerLuasTanah.text = '';
                  controllerAlamatLokasi.text = '';

                  setState(() {
                    loading =false;
                  });

                  // if(controllerJudul.text == ""|| controllerLuasTanah.text == "" || controllerAlamatLokasi.text == ""){
                  //   ScaffoldMessenger.of(context)
                  //                     .showSnackBar(SnackBar(
                  //                   content: Text("Wajib Diisi !"),
                  //                   backgroundColor: Colors.red,
                  //                 ));
                  // }else{

                  // }

                  // onPressed: () async {
                  //               setState(() {
                  //                 loading = true;
                  //               });
                  //               if (emailController.text == "" ||
                  //                   passwordController.text == "") {
                  //                 ScaffoldMessenger.of(context)
                  //                     .showSnackBar(SnackBar(
                  //                   content: Text("Wajib Diisi !"),
                  //                   backgroundColor: Colors.red,
                  //                 ));
                  //               } else if (passwordController.text !=
                  //                   confirmPasswordController.text) {
                  //                 ScaffoldMessenger.of(context).showSnackBar(
                  //                     SnackBar(
                  //                         content:
                  //                             Text("Password Tidak Cocok !"),
                  //                         backgroundColor: Colors.red));
                  //               } else {
                  //                 User? result = await AuthServices().register(
                  //                     emailController.text,
                  //                     passwordController.text,context);
                  //                 if (result != null) {
                  //                   print("Sukses");
                  //                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoginPage()), (route) => false);
                  //                 }
                  //               }
                  //               setState(() {
                  //                 loading = false;
                  //               });
                  //             },

                  //   final user = User(
                  //     judul: controllerJudul.text,
                  //     luasTanah: int.parse(controllerLuasTanah.text),
                  //     alamatLokasi: controllerAlamatLokasi.text,
                  //   );

                  //   createUser(user);
                  //   Navigator.pop(context);
                  //  Navigator.push(context, MaterialPageRoute(builder: (context) => (halamanLanjutan() )));
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
