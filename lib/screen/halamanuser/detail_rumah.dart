import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweethome/services/auth_services.dart';
import 'package:sweethome/widgets/body_detail_widget.dart';

  
class DetailRumah extends StatefulWidget {
  @override
  State<DetailRumah> createState() => _DetailRumahState();
}

class _DetailRumahState extends State<DetailRumah> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final List<Widget> myImage = [
    Container(
       width: 700, child: Image.asset('image/index.jpeg', fit: BoxFit.cover,)),
    Container(
       width: 700, child: Image.asset('image/image3.jpeg', fit: BoxFit.cover)),
    Container(
       width: 700, child: Image.asset( 'image/images4.jpeg', fit: BoxFit.cover, )),
  ];

  final CollectionReference _categories =
      FirebaseFirestore.instance.collection('categories');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Detail'),
        backgroundColor: Color(0xff141228),
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.bookmark)),
        
        ],
      ),
      backgroundColor: const Color(0xff141228),
      body:
      //  StreamBuilder(
      //     stream: _categories.snapshots(),
      //     builder:
      //         (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //       if (snapshot.hasError) {
      //         return Text('Something is error');
      //       }
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return Center(
      //           child: CircularProgressIndicator(color: Color(0xff141228)),
      //         );
      //       }
      //       return ListView.builder(
      //           itemCount: snapshot.data!.docs.length,
      //           itemBuilder: (context, index) {
      //             final DocumentSnapshot documentSnapshot =
      //                 snapshot.data!.docs[index];
      // return 
      ListView(
        children: [
          Container(
          
            // color: Colors.deepOrange,
            width: 400,
            // height: MediaQuery.of(context).size.height* 0.2,
            child: Stack(
              children:[ 
                    CarouselSlider(
                items: myImage,
                carouselController: _controller,
                options: CarouselOptions(
                    // autoPlay: true,
                    // enlargeCenterPage: true,
                    // aspectRatio: 1.0,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              // SizedBox(height: MediaQuery.of(context).size.height,),
              Container(
                margin: EdgeInsets.only(top: 180),
                child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: myImage.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        margin:
                            EdgeInsets.symmetric(vertical: 3.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.black)
                                .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
              ),
                 
               ] ),
          ),
          // ignore: prefer_const_constructors
          // SizedBox(
          //   height: 10.0,
          // ),

          Expanded(
            flex: 1,
            child: Container(
              // width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height * 0.90,
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
                      SizedBox(height: 10,),
                      BodyDetailTanah(
                          judul:'hahaha',
                          //  snapshot.data!.docs[index]
                          //             .get('title'),
                          harga:'19999',
                          //  'Rp. ' +
                          //             snapshot.data!.docs[index]
                          //                 .get('price')
                          //                 .toString(),
                          tipeProperti: 'hfdbf',
                          // snapshot.data!.docs[index]
                          //                   .get('tipeKategori'),
                          luas: '630',
                          sertifikat: 'SHM',
                          deskripsi:
                              'Turun Harga!\nHarga Investor!! \nTanah Pangauban...\nLT: 630 m\nLebar Muka: 17 m\nBentuk Tanah: Kotak\nHadap: Selatan\nHarga: Rp 4.750.000/m ',
                          alamat:'djdjdjdjdjdj'
                              // snapshot.data!.docs[index]
                              //               .get('alamatLokasi')
                                            )
                    ]),
              ),
            ),
          ),
        ],
      )
              //   });
              // })
    );
  }
}
