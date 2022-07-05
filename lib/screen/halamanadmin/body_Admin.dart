import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:sweethome/widgets/postingan_home_admin_widget.dart';
import 'package:sweethome/widgets/postingan_home_widget.dart';


class BodyAdmin extends StatelessWidget {
  const BodyAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [ Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                'Semua',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        PostinganAwalAdmin(judul: 'PERUM CITRAMUTIA', gambar: Image.asset('image/images4.jpeg', fit: BoxFit.cover,)),
                        PostinganAwalAdmin(judul: 'PERUM CITRAMUTIA', gambar: Image.asset('image/images4.jpeg', fit: BoxFit.cover,)),
                      ]),
                  ),
                  Container(
                    child: Row(
                      children: [
                        PostinganAwalAdmin(judul: 'PERUM CITRAMUTIA', gambar: Image.asset('image/images4.jpeg', fit: BoxFit.cover,)),
                        PostinganAwalAdmin(judul: 'PERUM CITRAMUTIA', gambar: Image.asset('image/images4.jpeg', fit: BoxFit.cover,)),
                      ]),
                  ),
                  Container(
                    child: Row(
                      children: [
                        PostinganAwalAdmin(judul: 'PERUM CITRAMUTIA', gambar: Image.asset('image/images4.jpeg', fit: BoxFit.cover,)),
                        PostinganAwalAdmin(judul: 'PERUM CITRAMUTIA', gambar: Image.asset('image/images4.jpeg', fit: BoxFit.cover,)),
                      ]),
                  ),
                  Container(
                    child: Row(
                      children: [
                        PostinganAwalAdmin(judul: 'PERUM CITRAMUTIA', gambar: Image.asset('image/images4.jpeg', fit: BoxFit.cover,)),
                        PostinganAwalAdmin(judul: 'PERUM CITRAMUTIA', gambar: Image.asset('image/images4.jpeg', fit: BoxFit.cover,)),
                      ]),
                  ),
                  Container(
                    child: Row(
                      children: [
                        PostinganAwalAdmin(judul: 'PERUM CITRAMUTIA', gambar: Image.asset('image/images4.jpeg', fit: BoxFit.cover,)),
                        PostinganAwalAdmin(judul: 'PERUM CITRAMUTIA', gambar: Image.asset('image/images4.jpeg', fit: BoxFit.cover,)),
                      ]),
                  ),
                  Container(
                    child: Row(
                      children: [
                        PostinganAwalAdmin(judul: 'PERUM CITRAMUTIA', gambar: Image.asset('image/images4.jpeg', fit: BoxFit.cover,)),
                        PostinganAwalAdmin(judul: 'PERUM CITRAMUTIA', gambar: Image.asset('image/images4.jpeg', fit: BoxFit.cover,)),
                      ]),
                  ),
                  Container(
                    child: Row(
                      children: [
                        PostinganAwalAdmin(judul: 'PERUM CITRAMUTIA', gambar: Image.asset('image/images4.jpeg', fit: BoxFit.cover,)),
                        PostinganAwalAdmin(judul: 'PERUM CITRAMUTIA', gambar: Image.asset('image/images4.jpeg', fit: BoxFit.cover,)),
                      ]),
                  ),
                  
                ],
              ),
            ],
          ),
        ),
        ]),
    );
  }
}
