import 'package:flutter/material.dart';

class KategoriWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final double width;
  final double height;
  const KategoriWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: Color.fromARGB(255, 86, 111, 159),
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              text,
              style: TextStyle(
                color: Color.fromARGB(255, 86, 111, 159),
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ), 
          ],
        ),
      ),
    );
  }
}
