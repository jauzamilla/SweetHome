import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../screen/halamanuser/detail_tanah.dart';

class PostinganAwalAdmin extends StatelessWidget {
  final String judul;
  final Image gambar;
  const PostinganAwalAdmin({
    super.key,
    required this.judul,
    required this.gambar,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Container(
          width: 148,
          height: 180,
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
                width: 148,
                height: 105,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: gambar,
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        judul,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 55,
                            height: 25,
                            decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xff566F9F)),
                      borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.visibility,
                        color: Color(0xff566F9F),
                        size: 18,
                      ),
                      Text(' 310', style: TextStyle(fontSize: 12),),
                      ]
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 55,
                            height: 25,
                            decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xff566F9F)),
                      borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.bookmark,
                        color: Color(0xff566F9F),
                        size: 18,
                      ),
                      Text('310', style: TextStyle(fontSize: 12)),
                      ]
                            ),
                          )
                        ],
                      )
                      
                      
                    ],
                  ),
                ),
              )
            ],
          )),
    ));
  }
}
