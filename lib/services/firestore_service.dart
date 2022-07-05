

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class FirestoreService{
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future addDataTanah(
    // String userId,
    String judul, int harga, int luasTanah, String alamatLokasi, String sertifikat, String deskripsi,) async{
    try {
      await firestore.collection('categories').add({
        
        // "userId": userId,
        "title": judul,
        "harga": harga,
        "luasTanah": luasTanah,
        "alamatLokasi": alamatLokasi,
        "sertifikat": sertifikat,
        "deskripsi": deskripsi
      });
    } catch (e) {
      
    }
  }




  Future insertNote(String title, String deskripsi, String userId) async{
    try {
      await firestore.collection('examples').add({
        
        "userId": userId,
        "title": title,
        "deskripsi": deskripsi
      });
    } catch (e) {
      
    }
  }
}