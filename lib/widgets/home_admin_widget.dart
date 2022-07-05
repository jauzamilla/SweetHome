import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../screen/halamanuser/detail_tanah.dart';

class PostinganAwal extends StatelessWidget {
  final String judul;
  final String harga;
  final String type;
  final Image gambar;
  final String lokasi;
  const PostinganAwal({
    super.key,
    required this.judul,
    required this.harga,
    required this.type,
    required this.lokasi,
    required this.gambar,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            width: 309,
            height: 198,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 309,
                  height: 102,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  
                  child: Container(
                    child: ClipRRect(borderRadius: BorderRadius.circular(20),
                    child: gambar,
                    ),
                  ),
                  
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 19),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          judul,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 1.6,
                        ),
                        Text(
                          harga,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 1.6,
                        ),
                        Text(
                          type,
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 1.6,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.place,
                              size: 14,
                              color: Color.fromARGB(255, 86, 111, 159),
                            ),
                            Text(
                              lokasi,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 86, 111, 159),
                                  fontSize: 16),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
        ),
      )
    
      
    
      
      );
  }
}
