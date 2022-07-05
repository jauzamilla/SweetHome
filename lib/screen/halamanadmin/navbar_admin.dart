import 'package:flutter/material.dart';
import 'package:sweethome/screen/halamanadmin/halaman_akun_admin.dart';
import 'package:sweethome/screen/halamanadmin/halaman_data_pennguna_admin.dart';
import 'package:sweethome/screen/halamanadmin/list_kategori_admin.dart';
import 'package:sweethome/screen/halamanadmin/homeadmin.dart';
import 'package:sweethome/screen/halamanadmin/pilihan_data_admin.dart';


class NavBarAdmin extends StatelessWidget {
  const NavBarAdmin({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _pilihanBottom = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _children =[
    HalamanHomeAdmin(),
    PilihanDataPengguna(),
    ListKategoriAdmin(),
    HalamanAkunAdmin()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _pilihanBottom = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _children.elementAt(_pilihanBottom),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Data Pengguna',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'List Kategori',
          ),BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Akun',
          ),
          
          
        ],
        currentIndex: _pilihanBottom,
        selectedItemColor: Color(0xff566F9F),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
