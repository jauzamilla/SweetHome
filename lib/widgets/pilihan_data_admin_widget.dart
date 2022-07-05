import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class PilihanAdmin extends StatelessWidget {
  // static const DecorationImage

  final String judul;
  final Icon icon;
  const PilihanAdmin({
    super.key,
    required this.icon,
    required this.judul,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        InkWell(
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
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
         SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
