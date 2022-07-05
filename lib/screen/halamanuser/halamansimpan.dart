import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweethome/widgets/edit_postingan_widget.dart';
import 'package:sweethome/widgets/hapus_tersimpan_widget.dart';
import 'package:sweethome/widgets/isian_kategori_widget.dart';

class HalamanSimpan extends StatelessWidget {
  const HalamanSimpan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff141228),
          title: Text('Tersimpan'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              InkWell(
                child: HapusTersimpan(gambar: Image.asset('image/images4.jpeg', fit: BoxFit.cover,),
                judul: 'PERUM CITRAMUTIA',
                harga: 'RP 500.000.000',
                tipe: 'Tipe Properti: Perumahan',
                lokasi: 'Kab Bandung')
              )
            ],
          ),
          )
    );
  }
}


