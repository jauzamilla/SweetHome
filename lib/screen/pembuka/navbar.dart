import 'package:flutter/material.dart';
import '../halamanuser/halamanakun.dart';
import '../halamanuser/halamansimpan.dart';
import '../halamanuser/halamantoko.dart';
import '../halamanuser/halamanhome.dart';

class NavBar extends StatelessWidget {
    

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
    HalamanHome(),
    HalamanSimpan(),
    HalamanToko(),
    HalamanAkun()
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
            icon: Icon(Icons.bookmark),
            label: 'Simpan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Tokomu',
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
