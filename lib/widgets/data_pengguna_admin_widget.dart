import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class DataPenggunaAdminWidget extends StatelessWidget {
  // static const DecorationImage

  final Image gambar;
  final String namapengguna;
  const DataPenggunaAdminWidget({
    super.key,
    required this.gambar,
    required this.namapengguna,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        child: Container(
          
          width: 80,
          height: 65,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 20, ),
              Container(
                  child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('image/index.png'))),
              SizedBox(
                width: 10,
              ),
              Container(
                child: Text(namapengguna, style: TextStyle(fontSize: 15),)),
            ],
          ),
        ),
      ),
    );
  }
}
