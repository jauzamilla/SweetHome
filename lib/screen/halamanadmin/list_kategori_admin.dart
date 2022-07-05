import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../widgets/tambah_postingan_widget.dart';

class ListKategoriAdmin extends StatelessWidget {
  const ListKategoriAdmin({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     
     appBar: AppBar(
       
       title: Text('List Kategori'),
       actions: [
         IconButton(onPressed: (){
      
         }, icon: Icon(Icons.add))
       ],
       backgroundColor: Color(0xff141228),
     ),
     body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            child: BodyTambahPostingan(
                icon: Icon(
                  Icons.house,
                  color: Color(0xff566F9F),
                  size: 28,
                ),
                judul: 'Rumah', ),
            ),
        Container(
            child: BodyTambahPostingan(
                icon: Icon(Icons.home_work, color: Color(0xff566F9F), size: 27),
                judul: 'Perumahan'),
           ),
        Container(
            child: BodyTambahPostingan(
                icon: Icon(Icons.terrain, color: Color(0xff566F9F), size: 32),
                judul: 'Tanah'),
            )
      ]),
   ); 
  }
}





// @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> searchResults = [
//       'Bandung',
//       'Jakarta',
//       'Padang',
//       'Aceh'
//     ];