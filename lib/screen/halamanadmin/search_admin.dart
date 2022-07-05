import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchPageAdmin extends StatelessWidget {
  const SearchPageAdmin({super.key});

// Icon customIcon = const Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff141228),
        title: Text('Cari'),
        actions: [
          IconButton(
            onPressed: (){
    //           setState(() {
    // if (customIcon.icon == Icons.search) {
    //  // Perform set of instructions.
    // } else {
    //  customIcon = const Icon(Icons.search);
    //  customSearchBar = const Text('My Personal Journal');
    // }
    // });
  //  },
            }, 
            icon: Icon(Icons.filter_list_outlined)),
        ],
        ),
      body: Center(child: Text('Halaman Search')),
    );
  }
}