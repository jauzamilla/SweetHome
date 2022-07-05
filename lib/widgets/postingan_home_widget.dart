import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../screen/halamanuser/detail_tanah.dart';

class PostinganAwal extends StatefulWidget {
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
  State<PostinganAwal> createState() => _PostinganAwalState();
}

class _PostinganAwalState extends State<PostinganAwal> {
  // final CollectionReference _categories =
  //     FirebaseFirestore.instance.collection('categories');
  // @override
  // DocumentSnapshot? doc;
  @override
  Widget build(BuildContext context) {
    // return StreamBuilder(
    //     stream: _categories.limit(3).snapshots(),
    //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: widget.gambar,
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
                                    widget.judul,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.6,
                                  ),
                                  Text(
                                    widget.harga,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.6,
                                  ),
                                  Text(
                                    widget.type,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 1.6,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.place,
                                        size: 14,
                                        color:
                                            Color.fromARGB(255, 86, 111, 159),
                                      ),
                                      Text(
                                        widget.lokasi,
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 86, 111, 159),
                                            fontSize: 16),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                ));
        //       });
        // });
  }
}
