import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweethome/screen/halamanuser/halamanakun.dart';
import 'package:sweethome/screen/halamanuser/halamanhome.dart';
import 'package:sweethome/screen/halamanuser/halamansimpan.dart';
import 'edit-akun.dart';
import 'halaman_postingan.dart';

class TokoMu extends StatefulWidget {
  const TokoMu({super.key});

  @override
  State<TokoMu> createState() => _TokoMuState();
}

class _TokoMuState extends State<TokoMu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff141228),
        title: Text('Tokomuhh'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('image/index.png'))),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Jauza Kamila Hadi',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 2),
                      child: Row(
                        children: [
                          Icon(
                            Icons.mail_outline,
                            size: 16,
                            color: Color(0xff566F9F),
                          ),
                          Text(' jauza@email.com',
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xff566F9F)))
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            child: Divider(
              thickness: 1,
              color: Colors.black,
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      // width: 40,
                      height: 6,
                    ),
                    Icon(
                      Icons.info,
                      color: Colors.grey,
                    ),
                    Text(
                      'Info',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 40),
                // child:
                Text(
                  'No Telp : 08123456722',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                // ),
                SizedBox(
                  height: 2,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 40),
                // child:
                Container(
                  child: Text('No Whatsapp : 0812345678',
                      style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),
                // ),
                Divider(
                  thickness: 0.2,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 10,
                ),
              
                Center(
                  child: InkWell(
                      child: Container(
                        height: 80,
                        width: 280,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xffEBE9E9)),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.image,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          'Postingan',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        )
                                      ],
                                    ),
                                    Text(
                                      'Lihat daftar postingan',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                              Icon(Icons.navigate_next)
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HalamanPostingan(uid: '',)));
                      }),
                ),
                
      
              ],
            ),
          )
        ],
      ),
    );
  }
}
