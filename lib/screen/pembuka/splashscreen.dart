import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sweethome/PercobaanFull/adalagi.dart';
import 'package:sweethome/PercobaanFull/akun_coba.dart';
import 'package:sweethome/PercobaanFull/baru.dart';
import 'package:sweethome/PercobaanFull/editnote.dart';
import 'package:sweethome/PercobaanFull/homeScreen.dart';
import 'package:sweethome/PercobaanFull/register.dart';
import 'package:sweethome/satulagi/addNote.dart';
import 'package:sweethome/satulagi/baru.dart';
import 'package:sweethome/satulagi/register.dart';
import 'package:sweethome/screen/halamanuser/halaman_postingan.dart';
import 'package:sweethome/screen/halamanuser/halamantoko.dart';
import 'package:sweethome/screen/halamanuser/toko.dart';
import 'package:sweethome/screen/pembuka/mulai.dart';
import 'package:sweethome/screen/pembuka/navbar.dart';
import 'package:sweethome/screen/pembuka/registrasi.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ToMyApp()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141228),
      body: Center(
        child: Image.asset('image/Group 152.png',),
      ),
    );
  }
}
