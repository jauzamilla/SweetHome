import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'tokomu.dart';

class UbahToko extends StatelessWidget {
  const UbahToko({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Ubah Profil Toko'),
          backgroundColor: Color(0xff141228),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  TextField(decoration: InputDecoration(
                    hintText: 'Nama Toko',
                    hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                            Icons.store,
                            color: Color(0xff5A5A5A),
                  ),
                  ),),
                    SizedBox(
                    height: 10,
                  ),
                  TextField(decoration: InputDecoration(
                    hintText: 'No Telephone',
                    hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Color(0xff5A5A5A),
                  ),
                  ),),
                    SizedBox(
                    height: 10,
                  ),
                  TextField(decoration: InputDecoration(
                    hintText: 'No Whatsapp',
                    hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                            Icons.whatsapp,
                            color: Color(0xff5A5A5A),
                  ),
                  ),),
                  SizedBox(
                    height: 190,
                  ),
                  ElevatedButton(
                      onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => (TokoMu())));
                      },
                      child: const Text('Lanjut'),
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff141228),
                          fixedSize: const Size(240, 44),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                    ),
                  
                ],
              ),
            )
          ],
        ));
  }
}
