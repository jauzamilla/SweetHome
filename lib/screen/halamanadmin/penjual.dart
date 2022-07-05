import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweethome/widgets/data_pengguna_admin_widget.dart';

class DataPenjualAdmin extends StatelessWidget {
  const DataPenjualAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Data Penjual'),
        backgroundColor: Color(0xff141228),
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'siapa aja lahh dlu'),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'siapa '),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'siapa aja lahh dlu'),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'siapa aja lahh dlu'),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'siapa aja lahh dlu'),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'siapa aja lahh dlu'),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'siapa aja lahh dlu'),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'siapa aja lahh dlu'),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'siapa aja lahh dlu'),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'siapa aja lahh dlu'),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'siapa aja lahh dlu'),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'siapa aja lahh dlu'),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'siapa aja lahh dlu'),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'siapa aja lahh dlu'),
            
          ],
        ),
      ),
    );
  }
}