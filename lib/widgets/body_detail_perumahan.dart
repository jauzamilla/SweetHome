import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:sweethome/satulagi/editnote.dart';
import 'package:url_launcher/url_launcher.dart';

class BodyDetailPerumahan extends StatelessWidget {
  final String judul;
  final String harga;
  final String kamarMandi;
  final String kamarTidur;
  final String tipeProperti;
  final String luasTanah;
  final String luasBangunan;
  final String sertifikat;
  final String deskripsi;
  final String alamat;
  final String tipe;
  final String sumberAir;
  final String listrik;
  // final String namaToko;
  // final Image foto;
  const BodyDetailPerumahan({
    super.key,
    required this.judul,
    required this.harga,
    required this.kamarMandi,
    required this.kamarTidur,
    required this.tipeProperti,
    required this.luasTanah,
    required this.luasBangunan,
    required this.sertifikat,
    required this.deskripsi,
    required this.alamat,
    required this.tipe,
    required this.sumberAir,
    required this.listrik,
    // required this.namaToko,
    // required this.foto
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text(
                  judul,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(harga,
                    style: TextStyle(
                      fontSize: 18,
                    )),
              ],
            ),
          ),
          Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Text(
                  'Tipe Properti',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 99,
                  height: 36,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.terrain,
                        color: Color(0xff566F9F),
                      ),
                      Text(tipeProperti),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Detail',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Row(
                  children: [
                    Icon(
                      Icons.bathtub_outlined,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4,),
                    Text(
                      'Kamar Mandi ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(kamarMandi, style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.bed_outlined,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4,),
                    Text(
                      'Kamar Tidur ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(kamarTidur, style: TextStyle(color: Colors.grey)),
                  ],
                ),        
                Row(
                  children: [
                    Icon(
                      Icons.straighten,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4,),
                    Text(
                      'Luas Tanah ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(luasTanah, style: TextStyle(color: Colors.grey)),
                  ],
                ),
                 Row(
                  children: [
                    Icon(
                      Icons.straighten,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4,),
                    Text(
                      'Luas Bangunan ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(luasBangunan, style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Info Properti',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Color(0xff566F9F),
                    ),
                    Text(
                      'Sertifikat ',
                      style: TextStyle(color: Color(0xff566F9F)),
                    ),
                    Text(sertifikat,  style: TextStyle(color: Color(0xff566F9F))),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Color(0xff566F9F),
                    ),
                    Text(
                      'Sumber Air : ',
                      style: TextStyle(color: Color(0xff566F9F)),
                    ),
                    Text(sumberAir,  style: TextStyle(color: Color(0xff566F9F))),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Color(0xff566F9F),
                    ),
                    Text(
                      'Listrik : ',
                      style: TextStyle(color: Color(0xff566F9F)),
                    ),
                    Text(listrik,  style: TextStyle(color: Color(0xff566F9F))),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Color(0xff566F9F),
                    ),
                    Text(
                      'Tipe : ',
                      style: TextStyle(color: Color(0xff566F9F)),
                    ),
                    Text(tipe,  style: TextStyle(color: Color(0xff566F9F))),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
         Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Deskripsi',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text(deskripsi),
              ],
            ),
          ),
        // Container(
        //               padding: const EdgeInsets.all(11),
        //               // height: MediaQuery.of(context).size.height,
        //               // width: MediaQuery.of(context).size.width,
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(5),
        //                 color: const Color(0xffD7E9F7),
        //               ),
        //               child: Text(
        //                 deskripsi,
        //                 style: const TextStyle(
        //                   fontSize: 15,
        //                 ),
        //               ),
        //             ),
          Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Lokasi',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: Color(0xff566F9F),
                    ),
                    Container(
                      // color: Colors.blue,
                      width: 270,
                      // color: Colors.blueGrey,
                      child: Text(alamat)
                      ),
                  ],
                )
              ],
            ),
          ),
          Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Container(
                  child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('image/index.png'))),
                      SizedBox(
                width: 10,
              ),
              Container(
                
                width: 190,
                child: Text('Jauza Kamila Hadi', style: TextStyle(fontSize: 16),)),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width* 0.1,
              // ),
              // InkWell(
              //   child: Container(
              //     height: 40,
              //     width: 40,
              //     decoration: BoxDecoration(
              //         border: Border.all(width: 1, color: Colors.black),
              //         borderRadius: BorderRadius.circular(20)),
              //     child: Icon(Icons.phone),
              //   ),
              //   // onTap: (){
              //   //   Navigator.push(context, MaterialPageRoute(builder: ((context) => editnote1(docid: ''));
              //   // },
              // ),
              SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: _launchUrl,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(Icons.whatsapp, size: 27,),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}


void _launchUrl(
  // {
  // // required int phone, required String message
  // }
  ) async {
    String phone = '6289525560021';
    String message = 'Apakah Masih Ada?';
    final  Uri _url = Uri.parse(
    'whatsapp://send?phone=$phone&text=${Uri.parse(message)}');
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}