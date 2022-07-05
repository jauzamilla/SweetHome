
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../widgets/postingan_home_admin_widget.dart';

class KategoriRumahAdmin extends StatelessWidget {
  const KategoriRumahAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff141228),
        title: Text('Rumah'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                      child: Row(
                        children: [
                          PostinganAwalAdmin(judul: 'RUMAH SUPER NYAMAN KIANGROKE', gambar: Image.asset('image/image3.jpeg', fit: BoxFit.cover,)),
                          PostinganAwalAdmin(judul: 'RUMAH SUPER NYAMAN KIANGROKE', gambar: Image.asset('image/image3.jpeg', fit: BoxFit.cover,)),
                        ]),
                    ),
                Container(
                      child: Row(
                        children: [
                          PostinganAwalAdmin(judul: 'RUMAH SUPER NYAMAN KIANGROKE', gambar: Image.asset('image/image3.jpeg', fit: BoxFit.cover,)),
                          PostinganAwalAdmin(judul: 'RUMAH SUPER NYAMAN KIANGROKE', gambar: Image.asset('image/image3.jpeg', fit: BoxFit.cover,)),
                        ]),
                    ),
                Container(
                      child: Row(
                        children: [
                          PostinganAwalAdmin(judul: 'RUMAH SUPER NYAMAN KIANGROKE', gambar: Image.asset('image/image3.jpeg', fit: BoxFit.cover,)),
                          PostinganAwalAdmin(judul: 'RUMAH SUPER NYAMAN KIANGROKE', gambar: Image.asset('image/image3.jpeg', fit: BoxFit.cover,)),
                        ]),
                    ),
                Container(
                      child: Row(
                        children: [
                          PostinganAwalAdmin(judul: 'RUMAH SUPER NYAMAN KIANGROKE', gambar: Image.asset('image/image3.jpeg', fit: BoxFit.cover,)),
                          PostinganAwalAdmin(judul: 'RUMAH SUPER NYAMAN KIANGROKE', gambar: Image.asset('image/image3.jpeg', fit: BoxFit.cover,)),
                        ]),
                    ),
                Container(
                      child: Row(
                        children: [
                          PostinganAwalAdmin(judul: 'RUMAH SUPER NYAMAN KIANGROKE', gambar: Image.asset('image/image3.jpeg', fit: BoxFit.cover,)),
                          PostinganAwalAdmin(judul: 'RUMAH SUPER NYAMAN KIANGROKE', gambar: Image.asset('image/image3.jpeg', fit: BoxFit.cover,)),
                        ]),
                    ),
                Container(
                      child: Row(
                        children: [
                          PostinganAwalAdmin(judul: 'RUMAH SUPER NYAMAN KIANGROKE', gambar: Image.asset('image/image3.jpeg', fit: BoxFit.cover,)),
                          PostinganAwalAdmin(judul: 'RUMAH SUPER NYAMAN KIANGROKE', gambar: Image.asset('image/image3.jpeg', fit: BoxFit.cover,)),
                        ]),
                    ),
                Container(
                      child: Row(
                        children: [
                          PostinganAwalAdmin(judul: 'RUMAH SUPER NYAMAN KIANGROKE', gambar: Image.asset('image/image3.jpeg', fit: BoxFit.cover,)),
                          PostinganAwalAdmin(judul: 'RUMAH SUPER NYAMAN KIANGROKE', gambar: Image.asset('image/image3.jpeg', fit: BoxFit.cover,)),
                        ]),
                    ),
                Container(
                      child: Row(
                        children: [
                          PostinganAwalAdmin(judul: 'RUMAH SUPER NYAMAN KIANGROKE', gambar: Image.asset('image/image3.jpeg', fit: BoxFit.cover,)),
                          PostinganAwalAdmin(judul: 'RUMAH SUPER NYAMAN KIANGROKE', gambar: Image.asset('image/image3.jpeg', fit: BoxFit.cover,)),
                        ]),
                    ),                
              ],
            ),
          )
        ],
      ),
      
    );
  }
}