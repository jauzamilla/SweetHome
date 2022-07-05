import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweethome/screen/halamanadmin/body_Admin.dart';
import 'package:sweethome/screen/halamanadmin/kategori_perumahan_admin.dart';
import 'package:sweethome/screen/halamanadmin/kategori_rumah._admin.dart';
import 'package:sweethome/screen/halamanadmin/kategori_tanah_admin.dart';
import 'package:sweethome/screen/halamanadmin/search_admin.dart';
import 'package:sweethome/widgets/kategori_widget.dart';


class HalamanHomeAdmin extends StatelessWidget {
  const HalamanHomeAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff141228),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.filter_list_outlined)),
          IconButton(
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => (SearchPageAdmin())))
                  },
              icon: Icon(Icons.search))
        ],
        elevation: 1,
        shadowColor: Colors.white,
        title: Container(
          child: Row(
            children: [Image.asset('image/logosh.png')],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(50, 80),
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tipe Properti",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          child: KategoriWidget(
                            icon: Icons.home,
                            text: "Rumah",
                            width: MediaQuery.of(context).size.width * 0.24,
                            height: 35,
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => KategoriRumahAdmin()));
                          }),
                      InkWell(
                          child: KategoriWidget(
                            icon: Icons.home_work,
                            text: "Perumahan",
                            width: MediaQuery.of(context).size.width * 0.34,
                            height: 35,
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => KategoriPeumahanAdmin()));
                          }),
                      InkWell(
                          child: KategoriWidget(
                            icon: Icons.terrain,
                            text: "Tanah",
                            width: MediaQuery.of(context).size.width * 0.24,
                            height: 35,
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => KategoriTanahAdmin()));
                          }),
                    ],
                  )
                ],
              ),
              // ),
            ),
          ),
        ),
      ),
      body: BodyAdmin(),
    );
  }
}
