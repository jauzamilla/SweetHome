import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

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
      ),
      body: Center(child: Text('Halaman Search')),
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

