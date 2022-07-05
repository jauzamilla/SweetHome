// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/widgets.dart';
// import 'package:sweethome/PercobaanFull/addNote.dart';
// import 'package:sweethome/PercobaanFull/editnote.dart';

// class Home1 extends StatefulWidget {

//   @override
//   State<Home1> createState() => _Home1State();
// }

// class _Home1State extends State<Home1> {
//   final Stream<QuerySnapshot> _usersStream =
//       FirebaseFirestore.instance.collection('notes').snapshots();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //  floatingActionButton: FloatingActionButton(
//       //   onPressed: () {
//       //     Navigator.pushReplacement(
//       //         context, MaterialPageRoute(builder: (_) => AddNote()));
//       //   },
//       //   child: Icon(
//       //     Icons.add,
//       //   ),
//       // ),
//       appBar: AppBar(
//         title: Text('Home Screen'),
//       ),
//        body: StreamBuilder(
//         stream: _usersStream,
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text("something is wrong");
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           return Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: ListView.builder(
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (_, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) =>
//                             editnote(docid: snapshot.data!.docs[index]),
//                       ),
//                     );
//                   },
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 4,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                           left: 3,
//                           right: 3,
//                         ),
//                         child: Column(children: [
//                            Text(
//                             snapshot.data!.docChanges[index].doc['title'],
//                             style: TextStyle(
//                               fontSize: 20,
//                             ),
//                         ),
//                         Text(
//                             snapshot.data!.docChanges[index].doc['price'],
//                             style: TextStyle(
//                               fontSize: 15,
//                             ),
//                           ),
//                           Text(
//                             snapshot.data!.docChanges[index].doc['luasTanah'],
//                             style: TextStyle(
//                               fontSize: 15,
//                             ),
//                           ),
//                           Text(
//                             snapshot.data!.docChanges[index].doc['alamatLokasi'],
//                             style: TextStyle(
//                               fontSize: 15,
//                             ),
//                           ),
//                           Text(
//                             snapshot.data!.docChanges[index].doc['deskripsi'],
//                             style: TextStyle(
//                               fontSize: 15,
//                             ),
//                           ),
//                           Text(
//                             snapshot.data!.docChanges[index].doc['sertifikat'],
//                             style: TextStyle(
//                               fontSize: 15,
//                             ),
//                           ),
//                         ]),
//                         // child: ListTile(
//                         //   shape: RoundedRectangleBorder(
//                         //     borderRadius: BorderRadius.circular(10),
//                         //     side: BorderSide(
//                         //       color: Colors.black,
//                         //     ),
//                         //   ),
//                         //   title: Text(
//                         //     snapshot.data!.docChanges[index].doc['title'],
//                         //     style: TextStyle(
//                         //       fontSize: 20,
//                         //     ),
//                         //   ),
//                         //   subtitle: Text(
//                         //     snapshot.data!.docChanges[index].doc['price'],
//                         //     style: TextStyle(
//                         //       fontSize: 15,
//                         //     ),
//                         //   ),
//                         //   contentPadding: EdgeInsets.symmetric(
//                         //     vertical: 12,
//                         //     horizontal: 16,
//                         //   ),
//                         // ),
//                       ),
//                       // IconButton(onPressed: (){
//                       //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddNote(user)));
//                       // }, icon: Icon(Icons.add))
//                     ],

//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:sweethome/PercobaanFull/addNote.dart';
import 'package:sweethome/PercobaanFull/editnote.dart';
import 'package:sweethome/satulagi/addNote.dart';

class Home1 extends StatefulWidget {
  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('notes').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => addnote1()));
        },
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: StreamBuilder(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            editnote(docid: snapshot.data!.docs[index], imageUrl: '',),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 3,
                          right: 3,
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          title: Text(
                            snapshot.data!.docChanges[index].doc['title'],
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                            snapshot.data!.docChanges[index].doc['content'],
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                        ),
                      ),
                      // IconButton(onPressed: (){
                      //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddNote(user)));
                      // }, icon: Icon(Icons.add))
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
