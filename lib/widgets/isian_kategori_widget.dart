import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class IsianKategori extends StatelessWidget {
  // static const DecorationImage

  final String judul;
  final String harga;
  final String tipe;
  final String lokasi;
  final Image gambar;
  const IsianKategori(
      {super.key,
      required this.gambar,
      required this.judul,
      required this.harga,
      required this.tipe,
      required this.lokasi});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 309,
        height: 119,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  width: 102,
                  height: 85,
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
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.47,
              // color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: 19,
                  // ),
                  Text(
                    judul,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    harga,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    tipe,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 2,
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
            )
          ],
        ),
      ),
    );
  }
}
