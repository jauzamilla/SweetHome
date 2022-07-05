import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweethome/screen/halamanuser/iklan-perumahan.dart';
import 'package:sweethome/screen/halamanuser/iklan-rumah.dart';
import 'package:sweethome/screen/halamanuser/iklan-tanah.dart';
import 'package:sweethome/widgets/tambah_postingan_widget.dart';


class TambahPostingan extends StatelessWidget {
  const TambahPostingan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff141228),
        title: Text('Tambah Postingan'),
        elevation: 0,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        InkWell(
            child: BodyTambahPostingan(
                icon: Icon(
                  Icons.house,
                  color: Color(0xff566F9F),
                  size: 28,
                ),
                judul: 'Rumah'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => TambahIklanRumah()));
            }),
        InkWell(
            child: BodyTambahPostingan(
                icon: Icon(Icons.home_work, color: Color(0xff566F9F), size: 27),
                judul: 'Perumahan'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TambahIklanPerumahan()));
            }),
        InkWell(
            child: BodyTambahPostingan(
                icon: Icon(Icons.terrain, color: Color(0xff566F9F), size: 32),
                judul: 'Tanah'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => TambahIklanTanah()));
            })
      ]),
    );
  }
}
