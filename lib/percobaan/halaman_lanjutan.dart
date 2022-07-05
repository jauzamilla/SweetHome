import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class halamanLanjutan extends StatelessWidget {
  const halamanLanjutan({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Scaffold(
      body: Center(
        child: Text('halaman lanjutan'),
      ),
    );
  }
  
}