import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  String title;
  String price;
  String alamatLokasi;
  String luasTanah;
  String deskripsi;
  String sertifikat;
  DocumentReference docRef;

  NoteModel(
      {required this.title,
      required this.price,
      required this.alamatLokasi,
      required this.luasTanah,
      required this.deskripsi,
      required this.sertifikat,
      required this.docRef,
      });

  factory NoteModel.fromJson(DocumentSnapshot snapshot) {
    return NoteModel(
        title: snapshot['title'],
        price: snapshot['price'],
        alamatLokasi: snapshot['alamatLokasi'],
        luasTanah: snapshot['luasTanah'],
        deskripsi: snapshot['deskripsi'],
        sertifikat: snapshot['sertifikat'],
        docRef: snapshot.reference,
        );
  }
}
