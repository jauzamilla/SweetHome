import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweethome/services/auth_services.dart';
import 'package:sweethome/widgets/body_detail_perumahan.dart';
import 'package:sweethome/widgets/body_detail_rumah.dart';
import 'package:sweethome/widgets/body_detail_widget.dart';

class DetailRumah1 extends StatefulWidget {
  DocumentSnapshot docid;
  DetailRumah1({Key? key, required this.docid}) : super(key: key);
  @override
  State<DetailRumah1> createState() => _DetailRumah1State();
}

class _DetailRumah1State extends State<DetailRumah1> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  bool loading = false;

  final List<Widget> myImage = [
    Container(height: 600, width: 600, child: Image.asset('image/index.jpeg')),
    Container(height: 600, width: 600, child: Image.asset('image/image3.jpeg')),
    Container(
        height: 600,
        width: 600,
        child: Image.asset(
          'image/images4.jpeg',
        )),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.bookmark)),
        ],
      ),
      backgroundColor: const Color(0xff141228),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                       width: MediaQuery.of(context).size.width,
                       height: MediaQuery.of(context).size.height * 0.90,
                       child: loading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              :Container(
                                
                                        // child:
                                        //  ClipRRect(
                                        //   borderRadius: BorderRadius.circular(20),
                                          child:Image(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          widget.docid.get(
                                            'fieldGambar',
                                          ),
                                        ),
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return Center(
                                            child: CircularProgressIndicator(
                                              color: const Color(0xff142D4C),
                                              value: loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                  : null,
                                            ),
                                          );
                                        }),
                                        ),
                                      ),
            ],
          ),
        
          // ignore: prefer_const_constructors
          // SizedBox(
          //   height: 10.0,
          // ),

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.90,
            decoration: BoxDecoration(
              color: Colors.white,
              // borderRadius: const BorderRadius.only(
              //     topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BodyDetailRumah(
                        judul: widget.docid.get('title'),
                        harga: widget.docid.get('price'),
                        kamarMandi: widget.docid.get('kamarMandi'),
                        kamarTidur: widget.docid.get('kamarTidur'),
                        tipeProperti: widget.docid.get('tipeKategori'),
                        luasTanah: widget.docid.get('luasTanah').toString(),
                        luasBangunan: widget.docid.get('luasBangunan').toString(),
                        sertifikat: widget.docid.get('sertifikat'),
                        deskripsi: widget.docid.get('deskripsi'),
                        alamat: widget.docid.get('alamatLokasi'),
                        
                        sumberAir: widget.docid.get('sumberAir'),
                        listrik: widget.docid.get('listrik').toString())
                  ]),
            ),
          ),
        
        ])
    );
  }
}
