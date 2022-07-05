import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'search.dart';
import 'body.dart';
import 'package:sweethome/widgets/kategori_widget.dart';
import 'kategori_perumahan.dart';
import 'kategori_rumah.dart';
import 'kategori_tanah.dart';

class HalamanHome extends StatelessWidget {
  const HalamanHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff141228),
        
        actions: [
          
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MySearchDelegate());
              },
              icon: Icon(Icons.search))
        ],
        elevation: 0,
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
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: 40,
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => KategoriRumah()));
                          }),
                      InkWell(
                          child: KategoriWidget(
                            icon: Icons.home_work,
                            text: "Perumahan",
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: 40,
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => KategoriPerumahan()));
                          }),
                      InkWell(
                          child: KategoriWidget(
                            icon: Icons.terrain,
                            text: "Tanah",
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: 40,
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => KategoriTanah()));
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
      body: Body(),
    );
  }
}




class MySearchDelegate extends SearchDelegate {
  get suggestions => null; 
    List<String> searchResults = [
      'Bandung',
      'Jakarta',
      'Padang',
      'Aceh'
    ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null),
        icon: Icon(Icons.arrow_back),
      );
  @override
  List<Widget>? buildActions(BuildContext context) =>[
    IconButton(onPressed: (){
      if(query.isEmpty){
        close(context, null);
      }else{
        query= '';
      }
    }, icon: Icon(Icons.clear))
  ];
  
  @override
  Widget buildResults(BuildContext context) => Center(
    child: Text(query,
    style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold),),
  );
    
  
  
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();
  

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
      final suggestion = suggestions[index];

      return ListTile(
        title: Text(suggestion),
        onTap: (){
          query = suggestion;

          showResults(context);
        }
        
      );
    });
    
  }
}
