import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweethome/screen/halamanadmin/halaman_data_pennguna_admin.dart';
import 'package:sweethome/screen/halamanadmin/pembeli.dart';
import 'package:sweethome/widgets/pilihan_data_admin_widget.dart';

class BodyTambahPostingan extends StatelessWidget {
  // static const DecorationImage

  
  final Icon icon;
  final String judul;
  const BodyTambahPostingan({
    super.key,
    required this.icon,
    required this.judul,
    
  });

  @override
  Widget build(BuildContext context) {
    return 
     Center(
        child: Column( 
          children: [
            SizedBox(height: 10,),
          Container(
            child:InkWell(
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    // spreadRadius: 0.1,
                    // blurRadius: 0.1,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon,
                Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      judul,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
         
        
        
        )])  
    );
  }
}
