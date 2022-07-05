import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweethome/widgets/data_pengguna_admin_widget.dart';

class DataPenggunaAdmin extends StatelessWidget {
  const DataPenggunaAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Data Pengguna'),
        backgroundColor: Color(0xff141228),
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'Nama pengguna'),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'Nama pengguna '),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'Nama pengguna'),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'Nama pengguna'),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'Nama pengguna'),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'Nama pengguna'),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'Nama pengguna'),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'Nama pengguna'),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'Nama pengguna'),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'Nama pengguna'),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'Nama pengguna'),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'Nama pengguna'),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'Nama pengguna'),
            SizedBox(
              height: 10,
            ),
            DataPenggunaAdminWidget(gambar: Image.asset('index.png'), namapengguna: 'Nama pengguna'),
            
          ],
        ),
      ),
    );
  }
}