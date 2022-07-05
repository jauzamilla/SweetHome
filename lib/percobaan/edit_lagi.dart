// // import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'tokomu.dart';

// class IklanTanah extends StatelessWidget {
//   const IklanTanah({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Iklan Perumahan'),
//           backgroundColor: Color(0xff141228),
//         ),
//         body: ListView(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(24.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   TextField(decoration: InputDecoration(
//                     hintText: 'Judul',
//                     hintStyle: TextStyle(color: Colors.grey),
//                           prefixIcon: Icon(
//                             Icons.subtitles,
//                             color: Color(0xff5A5A5A),
//                   ),
//                   ),),
//                     SizedBox(
//                     height: 10,
//                   ),
//                   TextField(decoration: InputDecoration(
//                     hintText: 'Luas Tanah',
//                     hintStyle: TextStyle(color: Colors.grey),
//                           prefixIcon: Icon(
//                             Icons.straighten,
//                             color: Color(0xff5A5A5A),
//                   ),
//                   ),),
//                     SizedBox(
//                     height: 10,
//                   ),
//                   TextField(decoration: InputDecoration(
//                     hintText: 'Alamat Lokasi',
//                     hintStyle: TextStyle(color: Colors.grey),
//                           prefixIcon: Icon(
//                             Icons.place,
//                             color: Color(0xff5A5A5A),
//                   ),
//                   ),),
//                     SizedBox(
//                     height: 10,
//                   ),
//                   TextField(decoration: InputDecoration(
//                     hintText: 'Harga',
//                     hintStyle: TextStyle(color: Colors.grey),
//                           prefixIcon: Icon(
//                             Icons.attach_money,
//                             color: Color(0xff5A5A5A),
//                   ),
//                   ),),
//                     SizedBox(
//                     height: 10,
//                   ),
//                   TextField(decoration: InputDecoration(
//                     hintText: 'Sertifikat',
//                     hintStyle: TextStyle(color: Colors.grey),
//                           prefixIcon: Icon(
//                             Icons.straighten,
//                             color: Color(0xff5A5A5A),
//                   ),
//                   ),),
//                     SizedBox(
//                     height: 10,
//                   ),
//                   TextField(decoration: InputDecoration(
//                     hintText: 'Deskripsi',
//                     hintStyle: TextStyle(color: Colors.grey),
//                           prefixIcon: Icon(
//                             Icons.description,
//                             color: Color(0xff5A5A5A),
//                   ),
//                   ),),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   ElevatedButton(
//                       onPressed: () {
//                        Navigator.push(context, MaterialPageRoute(builder: (context) => (TokoMu())));
//                       },
//                       child: const Text('Lanjut'),
//                       style: ElevatedButton.styleFrom(
//                           primary: Color(0xff141228),
//                           fixedSize: const Size(240, 44),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(50))),
//                     ),
                  
//                 ],
//               ),
//             )
//           ],
//         ));
//   }
// }
