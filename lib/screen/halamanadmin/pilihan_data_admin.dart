import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweethome/screen/halamanadmin/halaman_data_pennguna_admin.dart';
import 'package:sweethome/screen/halamanadmin/pembeli.dart';
import 'package:sweethome/screen/halamanuser/iklan-perumahan.dart';
import 'package:sweethome/screen/halamanuser/iklan-rumah.dart';
import 'package:sweethome/screen/halamanuser/iklan-tanah.dart';
import 'package:sweethome/widgets/pilihan_data_admin_widget.dart';
import 'package:sweethome/widgets/tambah_postingan_widget.dart';

class PilihanDataPengguna extends StatelessWidget {
  const PilihanDataPengguna({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff141228),
        title: Text(
          'Data Pengguna',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Center(
        child: Column( 
          children: [
            SizedBox(height: 30,),
          InkWell(
              child: PilihanAdmin(
                  icon:
                      Icon(Icons.people_alt, color: Color(0xff566F9F), size: 18),
                  judul: 'Pembeli'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DataPembeliAdmin()));
              }),
          InkWell(
              child: PilihanAdmin(
                  icon:
                      Icon(Icons.people_alt, color: Color(0xff566F9F), size: 18),
                  judul: 'Penjual'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DataPenggunaAdmin()));
              })
        ]),
      ),
    );
  }
}
