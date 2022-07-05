import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sweethome/screen/pembuka/navbar.dart';
import 'package:sweethome/services/auth_coba.dart';
import 'package:sweethome/services/auth_services.dart';

import 'login.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isObsecure = true;
  bool _isObsecure1 = true;
  bool _isHidePassword = true;
  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141228),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 80,
              left: 20,
            ),
            child: SafeArea(
              // ignore: prefer_const_literals_to_create_immutables
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'Selamat Datang',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins-Medium'),
                    ),
                    const Text(
                      'Silahkan isi terlebih dahulu sebelum melihat-lihat',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                  ]),
            ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 140.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      controller: namaController,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff141228)),
                          ),
                          labelStyle: TextStyle(color: Color(0xff5A5A5A)),
                          labelText: 'Nama ',
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                            Icons.account_box_outlined,
                            color: Color(0xff5A5A5A),
                          )),
                    ),
                    const SizedBox(
                      height: 26.0,
                    ),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff141228)),
                          ),
                          labelStyle: TextStyle(color: Color(0xff5A5A5A)),
                          labelText: 'Email ',
                          // hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: Color(0xff5A5A5A),
                          )),
                    ),
                    const SizedBox(
                      height: 26.0,
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: _isObsecure,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff141228)),
                          ),
                          labelStyle: TextStyle(color: Color(0xff5A5A5A)),
                          labelText: 'Password ',
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                            Icons.key_outlined,
                            color: Color(0xff5A5A5A),
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObsecure = !_isObsecure;
                                });
                              },
                              icon: Icon(
                                _isObsecure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Color(0xff141228),
                              ))),
                    ),
                    SizedBox(
                      height: 26.0,
                    ),
                    TextField(
                      controller: confirmPasswordController,
                      obscureText: _isObsecure1,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff141228)),
                          ),
                          labelStyle: TextStyle(color: Color(0xff5A5A5A)),
                          labelText: 'Konfirmasi Password ',
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                            Icons.key_outlined,
                            color: Color(0xff5A5A5A),
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObsecure1 = !_isObsecure1;
                                });
                              },
                              icon: Icon(
                                _isObsecure1
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Color(0xff141228),
                              ))),
                    ),
                    const SizedBox(
                      height: 14.0,
                    ),
                    Text(
                      'Lupa kata sandi?',
                      style: TextStyle(
                        color: Color(0xff949494),
                      ),
                    ),
                    const SizedBox(
                      height: 14.0,
                    ),

                    Center(
                      child: loading
                          ? CircularProgressIndicator()
                          : Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    setState(() {
                                      loading = true;
                                    });
                                    if (emailController.text == "" ||
                                        passwordController == "") {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text("Semua kolom wajib di isi!"),
                                          backgroundColor: Colors.grey,
                                        ),
                                      );
                                    } else {
                                      User? result = await AuthService().signUp(
                                          emailController.text,
                                          passwordController.text,
                                          context);

                                      if (result != null) {
                                        print("Berhasil");
                                        // TODO: simpan data user baru ke koleksi user dengan dokumen id ambil dari result.uid
                                        await FirebaseFirestore.instance
                                            .collection('users')
                                            .doc(result.uid)
                                            .set({
                                          'username': namaController.text,
                                          'email': emailController.text,
                                          'password': passwordController.text,
                                        });

                                        SharedPreferences shared =
                                            await SharedPreferences
                                                .getInstance();
                                        shared.setString('uid', result.uid);
                                        print(result.uid);

                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => NavBar()),
                                        );
                                      } else {
                                        print('email sudah terdaftar');
                                      }
                                    }
                                    setState(() {
                                      loading = false;
                                    });
                                  },
                                  child: const Text(
                                    'Daftar',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(0xff141228),
                                      // fixedSize: const Size(240, 44),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)))),
                            ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Sudah punya akun?',
                            style: TextStyle(color: Colors.grey)),
                        InkWell(
                          child: Text(
                            ' Masuk',
                            style: TextStyle(color: Color(0xff566F9F)),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginPage()));
                          },
                        )
                      ],
                    )
                    // InkWell(
                    //   child: Container(
                    //     // color: Colors.indigoAccent,
                    //     height: 25,
                    //     width: 190,
                    //     // color: Colors.blue,
                    //     child: Center(
                    //       child: Text(
                    //         'Sudah punya akun? Masuk',
                    //         style: TextStyle(color: Color(0xff566F9F)),
                    //       ),
                    //     ),
                    //   ),
                    //   onTap: () {
                    //     Navigator.of(context).push(MaterialPageRoute(
                    //         builder: (context) => LoginPage()));
                    //   },
                    // )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
